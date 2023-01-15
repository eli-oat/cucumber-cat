import "CoreLibs/animation"

local pd <const> = playdate
local gfx <const> = pd.graphics

class("Player").extends(gfx.sprite)

function Player:init(x, y, c)
	local playerImage = gfx.image.new("imgs/cat3")
	local scaleFactor <const> = 2
	self:setImage(playerImage)
	self:moveTo(x, y)
	self:setScale(scaleFactor)
	self:add()
	self.speed = 3
	self.offset = scaleFactor * 16
end


function Player:update()
	if pd.buttonIsPressed(pd.kButtonUp) then
		if self.y > 0+self.offset then
			self:moveBy(0, -self.speed)
		end
	elseif pd.buttonIsPressed(pd.kButtonDown) then
		if self.y < 240-self.offset then
			self:moveBy(0, self.speed)
		end
	elseif pd.buttonIsPressed(pd.kButtonLeft) then
		if self.x > 0+self.offset then
			self:moveBy(-self.speed, 0)
			self:setImageFlip(0)
		end
	elseif pd.buttonIsPressed(pd.kButtonRight) then
		if self.x < 400-self.offset then
			self:moveBy(self.speed, 0)
			self:setImageFlip(1)
		end
	end
end