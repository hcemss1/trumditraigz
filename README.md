--[[
    GZ HUB - PRO VERSION
    DEVELOPER: trumditraigz
    LOGO: GZ TikTok
    COLORS: Blue, Gold, Red
]]

-- 1. TỐI ƯU HÓA HỆ THỐNG (Giúp script chạy trơn chu)
local task = task or {spawn = spawn, wait = wait}
local function SafeCall(func)
    local success, err = pcall(func)
    if not success then
        warn("[GZ HUB ERROR]: " .. tostring(err))
    end
end

-- 2. KHỞI TẠO THƯ VIỆN UI (Màu Xanh Nước Biển chủ đạo)
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
    Name = "GZ HUB | trumditraigz", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "GZ_Config",
    IntroText = "GZ TikTok - trumditraigz"
})

-- 3. CÁC BIẾN CHỨC NĂNG
_G.AutoFarm = false
_G.AutoStats = false
_G.WalkSpeed = 16

-- 4. TAB CHÍNH (MAIN WORK - Màu Vàng)
local MainTab = Window:MakeTab({
	Name = "Auto Farm (GZ)",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

MainTab:AddToggle({
	Name = "Kích Hoạt Auto Farm (Màu Vàng)",
	Default = false,
	Callback = function(Value)
		_G.AutoFarm = Value
        if Value then
            -- Sử dụng task.spawn để không làm treo Menu
            task.spawn(function()
                while _G.AutoFarm do
                    SafeCall(function()
                        -- Chèn Logic Farm của ông vào đây (ví dụ: đánh quái gần nhất)
                        print("GZ Hub đang thực thi lệnh cho trumditraigz...")
                    end)
                    task.wait(0.5) -- Delay để tránh bị game check (anti-cheat)
                end
            end)
        end
	end    
})

-- 5. TAB TIỆN ÍCH (UTILITY - Màu Xanh)
local MiscTab = Window:MakeTab({
	Name = "Tiện Ích",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

MiscTab:AddSlider({
	Name = "Tốc độ chạy (Custom)",
	Min = 16,
	Max = 500,
	Default = 16,
	Color = Color3.fromRGB(255, 215, 0), -- Màu Vàng rực
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

-- 6. TAB HỆ THỐNG (SYSTEM - Màu Đỏ)
local SettingTab = Window:MakeTab({
	Name = "Hệ Thống",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

SettingTab:AddButton({
	Name = "HỦY SCRIPT (MÀU ĐỎ)",
	Callback = function()
        OrionLib:Destroy()
  	end    
})

-- THÔNG BÁO KHỞI ĐỘNG
OrionLib:MakeNotification({
	Name = "GZ HUB READY",
	Content = "Tác giả: trumditraigz đã sẵn sàng phục vụ!",
	Image = "rbxassetid://4483345998",
	Time = 5
