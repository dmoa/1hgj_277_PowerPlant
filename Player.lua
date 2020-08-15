local Player = {
    images = {lg.newImage("player_l.png"), lg.newImage("player_r.png"), lg.newImage("player_u.png")},
    x = love.math.random(game_width / 2),
    y = love.math.random(game_height / 2),
    xv = 400,
    yv = 400
}

Player.current_image = Player.images[1]


function Player:Draw()
    lg.draw(self.current_image, self.x, self.y)
end

function Player:Update(dt)
    if input.down() then
        self.y = self.y + self.yv * dt
        self.current_image = Player.images[1]
    end
    if input.up() then
        self.y = self.y - self.yv * dt
        self.current_image = Player.images[3]
    end
    if input.right() then
        self.current_image = Player.images[2]
        self.x = self.x + self.xv * dt
    end
    if input.left() then
        self.x = self.x - self.xv * dt
        self.current_image = Player.images[1]
    end
    if self.x < 0 then self.x = 0 end
    if self.y < 0 then self.y = 0 end
    if self.x + self.current_image:getWidth() > game_width then self.x = game_width - self.current_image:getWidth() end
    if self.y + self.current_image:getHeight() > game_height then self.y = game_height - self.current_image:getHeight() end
end

return Player