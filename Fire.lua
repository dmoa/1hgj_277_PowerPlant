local Fire = {
    images = {lg.newImage("fire1.png"), lg.newImage("fire2.png"), lg.newImage("fire3.png")},
    current_image_index = 1,
    animation_speed = 0.3,
    timer = 0.3
}

function Fire:Draw()
    lg.draw(self.images[self.current_image_index], 100 - (6 * score/5), 0, 0, 3 + score / 20, 3 + score / 20)
end

function Fire:Update(dt)
    self.timer = self.timer - dt
    if self.timer < 0 then
        self.timer = self.animation_speed
        self.current_image_index = self.current_image_index % 3 + 1
    end
end

return Fire