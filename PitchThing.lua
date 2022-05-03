timeInterval = 1
local floor = math.floor
local futureTime = floor(globals.RealTime() + timeInterval)
local getPitch = gui.GetValue("Anti Aim - Pitch")
local pitch = "Up"
local pitch = {
    "Up",
    "Fake Center",
    "Down",
    "Fake Center"
}

local function turnOff() 
    gui.SetValue("Anti Aim - Pitch", "Off")
end

local id = 1
local function changePitch()
    local currentTime = floor(globals.RealTime())
        if currentTime == futureTime then
            if id == 5 then id = 1 end
            gui.SetValue("Anti Aim - Pitch", pitch[id])
        futureTime = futureTime + timeInterval
        id = id + 1
        end
end

local function changeTimeInterval(stringCmd) 

    if stringCmd:Get() == "psi" then
        timeInterval = timeInterval + 1
        stringCmd:Set("echo Time Interval Increased by 1! Interval is now " ..timeInterval.. "")       
    end
    if stringCmd:Get() == "psd" then
        if timeInterval > 1 then
        timeInterval = timeInterval - 1
        stringCmd:Set("echo Time Interval Decreased by 1! Interval is now " ..timeInterval.. "")    end   
        if timeInterval == 1 then stringCmd:Set("echo Time Interval cannot be less than 0!")  end
        end
    end

callbacks.Register("Draw", changePitch)
callbacks.Register("SendStringCmd", changeTimeInterval)
callbacks.Register("Unload", turnOff)
