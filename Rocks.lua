local Rocks = {
    image = lg.newImage("rock.png"),
    xs = {400},
    ys = {400},
    follow_pos = nil
}

function Rocks:Draw()
    for i = 1, #self.xs do
        lg.draw(self.image, self.xs[i], self.ys[i])
    end
    if self.follow_pos then lg.draw(self.image, self.follow_pos[1], self.follow_pos[2]) end
end

function Rocks:Update()
    for i = 1, #self.xs do
        if AABB(self.xs[i], self.ys[i], self.image:getWidth(), self.image:getHeight(), player.x, player.y, player.current_image:getWidth(), player.current_image:getHeight()) then
            -- print("collision")
            if not self.follow_pos then
                --print("found!")
                self.follow_pos = {self.xs[i], self.ys[i]}
                table.remove(self.xs, i)
                table.remove(self.ys, i)
            end
            break
        end
    end
    if self.follow_pos then
        -- print(self.follow_pos)
        -- for _, v in ipairs(self.follow_pos) do
        --     print("wow")
        -- end
        -- print(player.x + player.current_image:getWidth())
        self.follow_pos[1] = player.x + player.current_image:getWidth()
        self.follow_pos[2] = player.y

        if AABB(self.follow_pos[1], self.follow_pos[2], self.image:getWidth(), self.image:getHeight(), 100, 0, fire.images[1]:getWidth() * 3, fire.images[1]:getHeight() + score / 10) then
            self.follow_pos = nil
            score = score + 1
        end

    end

    if #self.xs == 0 and not self.follow_pos then
        for i = 1, 10 do
            local x = lm.random(0, game_width - self.image:getWidth())
            local y = lm.random(300, game_height - self.image:getHeight())

            table.insert(self.xs, x)
            table.insert(self.ys, y)
        end
    end
end

return Rocks