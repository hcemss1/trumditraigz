-- [[ GZ HUB SUPREME - VELOCITY OPTIMIZED ]]
-- AUTHOR: trumditraigz

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
    Name = "GZ HUB | trumditraigz", 
    HidePremium = false, 
    SaveConfig = false, 
    IntroText = "GZ TikTok"
})

-- BIẾN HỆ THỐNG
_G.Aim = false
_G.Speed = 16
_G.Fast = false

-- TAB CHÍNH (VÀNG)
local Combat = Window:MakeTab({Name = "Combat", Icon = "rbxassetid://4483345998"})

Combat:AddToggle({
    Name = "Aimlock Chính Xác",
    Default = false,
    Callback = function(v) _G.Aim = v end
})

Combat:AddToggle({
    Name = "Fast Attack",
    Default = false,
    Callback = function(v)
        _G.Fast = v
        task.spawn(function()
            while _G.Fast do
                pcall(function()
                    local vim = game:GetService("VirtualInputManager")
                    vim:SendMouseButtonEvent(0,0,0,true,game,0)
                    vim:SendMouseButtonEvent(0,0,0,false,game,0)
                end)
                task.wait(0.01)
            end
        end)
    end
})

-- TAB TIỆN ÍCH (XANH)
local Misc = Window:MakeTab({Name = "Tiện Ích", Icon = "rbxassetid://4483345998"})

Misc:AddSlider({
    Name = "Speed",
    Min = 16, Max = 300, Default = 16,
    Callback = function(v) _G.Speed = v end
})

-- LOGIC CHẠY NGẦM
game:GetService("RunService").RenderStepped:Connect(function()
    -- Xử lý Speed
    pcall(function()
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.Speed
        end
    end)
    
    -- Xử lý Aimlock
    if _G.Aim then
        local target = nil
        local dist = 300
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
                local pos = workspace.CurrentCamera:WorldToViewportPoint(v.Character.Head.Position)
                local mag = (Vector2.new(pos.X, pos.Y) - Vector2.new(workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y/2)).Magnitude
                if mag < dist then target = v dist = mag end
            end
        end
        if target then 
            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, target.Character.Head.Position) 
        end
    end
end)

OrionLib:Init()
