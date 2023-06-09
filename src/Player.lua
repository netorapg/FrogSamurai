local love = require "love"

functon Player(debugging)
    local frog_size = 64
    local view_angle = math.rad(90)

    debugging = debugging or false
    
    return {
        x = love.graphics.getWidth() / 2,
        y = love.graphics.getHeight() / 2,
        readius = frog_size / 2,
        angle = view_angle,
        speed = 3,
    },

    draw = function (self)
        local opacity = 255

        if debugging then
            love.graphics.setColor(255, 0, 0, opacity)

            love.graphics.circle("line", self.x, self.y, self.radius)
            love.graphics.circle("line", self.x, self.y, self.radius / 2)
        end

        love.graphics.setColor(1,1,1,opacity)

        love.graphics.polygon(
            "line",
            self.x, self.y,
            self.x + self.radius * math.cos(self.angle), self.y + self.radius * math.sin(self.angle),
            self.x + self.radius * math.cos(self.angle + math.rad(30)), self.y + self.radius * math.sin(self.angle + math.rad(30)),
            self.x + self.radius * math.cos(self.angle - math.rad(30)), self.y + self.radius * math.sin(self.angle - math.rad(30))

        )
    end,

    movePlayer = function(self)
        local FPS = love.timer.getFPS()