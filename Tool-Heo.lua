-- Thiết lập các biến toàn cục để kiểm soát việc chạy script
getgenv().scripts = {
    CPUReducer = true,
    WaitForGameLoad = true,
    AntiAFK = true,
    AntiStaff = true,
    ServerHop = false,
    DayCare = true,
    Fishing = true,
    Notification = false,
    Mailbox_Huge = false,
}

-- Hàm để tải và chạy script nếu biến toàn cục tương ứng là true
local function loadAndRunScript(scriptName, url)
    if getgenv().scripts[scriptName] then
        loadstring(game:HttpGet(url))()
		print(scriptName .. " đã được chạy.")
    end
end
-- Lấy đối tượng Network từ ReplicatedStorage để sử dụng cho các hoạt động mạng sau này.
local Network = game:GetService("ReplicatedStorage"):WaitForChild("Network")

-- Vô hiệu hóa theo dõi idle trong script "Idle Tracking" để ngăn người chơi bị đăng xuất tự động.
game:GetService("Players").LocalPlayer.PlayerScripts.Scripts.Core["Idle Tracking"].Enabled = false

-- Nếu hàm getconnections tồn tại, vô hiệu hóa tất cả các kết nối đến sự kiện Idled của người chơi.
if getconnections then
    for _, v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
        v:Disable()
    end
else
    -- Nếu không, thiết lập một sự kiện để giả mạo hoạt động của người dùng khi idle.
    game.Players.LocalPlayer.Idled:Connect(function()
        -- Giả mạo một hành động nhấn chuột phải để tránh bị coi là không hoạt động.
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        task.wait(1) -- Đợi một giây.
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end
-- WaitForGameLoad Kiểm tra xem trò chơi đã tải xong chưa.
loadAndRunScript("WaitForGameLoad", "https://raw.githubusercontent.com/Hoith95/Pet-99/main/WaitForGameLoad")

-- Anti AFK ngăn người chơi bị đăng xuất tự động
loadAndRunScript("AntiAFK", "https://raw.githubusercontent.com/Hoith95/Pet-99/main/AntiAFK")

-- AntiStaff kiểm tra nhân viên BIG Games
loadAndRunScript("AntiStaff", "https://raw.githubusercontent.com/Hoith95/Pet-99/main/AntiStaff")

-- CPUReducer Tối ưu hóa trò chơi giảm tải CPU
loadAndRunScript("CPUReducer", "https://raw.githubusercontent.com/Hoith95/Pet-99/main/CPUReducer")

-- ServerHop chuyển người chơi đến máy chủ mới
loadAndRunScript("ServerHop", "https://raw.githubusercontent.com/Hoith95/Pet-99/main/ServerHop")

-- DayCare Tự động chăm sóc thú cưng
loadAndRunScript("DayCare", "https://raw.githubusercontent.com/Hoith95/Pet-99/main/DayCare")

-- Fishing Tự động Câu Cá
loadAndRunScript("Fishing", "https://raw.githubusercontent.com/Hoith95/Pet-99/main/Fishing")

-- Notification cập nhật thông báo thời gian còn lại Daycare, số lượng Huge, Gems hiện có
loadAndRunScript("Notification", "https://raw.githubusercontent.com/Hoith95/Pet-99/main/Notification")

-- Mailbox Huge gửi toàn bộ Huge hiện có sang một acc ngẫu nhiên
loadAndRunScript("Mailbox_Huge", "https://raw.githubusercontent.com/Hoith95/Pet-99/main/Mailbox-Huge")