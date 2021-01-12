local userinput = game:GetService("UserInputService")
local plr = game.Players.LocalPlayer
local chr = plr.Character or plr.CharacterAdded:Wait()

local shrieksound = Instance.new("Sound", chr.Torso)
shrieksound.SoundId = "rbxassetid://2776351218"
shrieksound.Pitch = 1.5

local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://2817296952"

local anim2 = Instance.new("Animation")
anim2.AnimationId = "rbxassetid://2817434459"

local anim3 = Instance.new("Animation")
anim3.AnimationId = "rbxassetid://2817327966"
local anim4 = Instance.new("Animation")
anim4.AnimationId = "rbxassetid://2820820920"

local anim5 = Instance.new("Animation")
anim5.AnimationId = "rbxassetid://2817313245"

local track = chr.Humanoid:LoadAnimation(anim) -- walk
track.Looped = true
track.Priority = "Movement"

local track2 = chr.Humanoid:LoadAnimation(anim2) -- sprint
track2.Looped = true
track2.Priority = "Action"

local track3 = chr.Humanoid:LoadAnimation(anim3) -- attack
track3.Looped = false
track3.Priority = "Action"

local track4 = chr.Humanoid:LoadAnimation(anim4) -- eat
track4.Looped = true
track4.Priority = "Action"
track4:AdjustSpeed(0.5)

local track5 = chr.Humanoid:LoadAnimation(anim5) -- shriek
track5.Looped = false
track5.Priority = "Action"

chr.Humanoid.Running:Connect(function(speed)
    if speed > 1 and speed < 22 then
        track2:Stop()
        track:Play()
    elseif speed >= 22 then
        track:Stop()
        track2:Play()
    else
        track:Stop()
        track2:Stop()
    end
end)

userinput.InputBegan:Connect(function(key, gameprocessedevent)
    if gameprocessedevent then return end

    if key.KeyCode == Enum.KeyCode.C then
        track3:Play()
    elseif key.KeyCode == Enum.KeyCode.T then
        track5:Play()
        wait(0.75)
        shrieksound:Play()
    elseif key.KeyCode == Enum.KeyCode.Z then
        track4:Play()
    end
end)

userinput.InputEnded:Connect(function(key, gameprocessedevent)
    if gameprocessedevent then return end

    if key.KeyCode == Enum.KeyCode.Z then
        track4:Stop()
    end
end)

print("Loaded shrieker script")
