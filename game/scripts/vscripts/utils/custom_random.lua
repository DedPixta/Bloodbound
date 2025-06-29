
if CustomRandom == nil then
    CustomRandom = class({})
end


function CustomRandom.generateSeed()
	-- Change random seed for math.random function
	local timeTxt = string.gsub(string.gsub(GetSystemTime(), ':', ''), '0', '')
	local timeNumber = tonumber(timeTxt)
	if timeNumber then
		math.randomseed(timeNumber) -- use 'RandomInt' or 'RandomFloat' instead of math.random
	end
end