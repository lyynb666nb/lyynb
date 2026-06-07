local ps=game:GetService("Players")
local pl=ps.LocalPlayer
local pg=pl:WaitForChild("PlayerGui")
local ln="https://www.qianxun1688.com/links/94C6D8AB"

if _G.AUTH_SUCCESS then
    local sk=""
    loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/8b7511ff44a633e757c34ad7525e7289.lua"))()
    return
end

local sg=Instance.new("ScreenGui")
sg.Name="AuthGate"
sg.ResetOnSpawn=false
sg.Parent=pg

local fm=Instance.new("Frame")
fm.Size=UDim2.new(0,340,0,210)
fm.Position=UDim2.new(0.5,-170,0.5,-105)
fm.BackgroundColor3=Color3.fromRGB(18,18,26)
fm.BorderSizePixel=0
fm.Active=true
fm.Draggable=true
fm.Parent=fm.Parent or sg
Instance.new("UICorner",fm).CornerRadius=UDim.new(0,12)

local tb=Instance.new("TextLabel")
tb.Size=UDim2.new(1,0,0,45)
tb.Position=UDim2.new(0,0,0,10)
tb.BackgroundTransparency=1
tb.Text="RayZen付费版卡密系统"
tb.TextColor3=Color3.new(1,1,1)
tb.Font=Enum.Font.GothamBold
tb.TextSize=22
tb.Parent=fm

local tx=Instance.new("TextBox")
tx.Size=UDim2.new(0.85,0,0,42)
tx.Position=UDim2.new(0.5,-145,0.5,-25)
tx.PlaceholderText="请输入卡密"
tx.Text=""
tx.TextColor3=Color3.new(1,1,1)
tx.BackgroundColor3=Color3.fromRGB(32,32,42)
tx.Font=Enum.Font.GothamSemibold
tx.TextSize=16
tx.Parent=fm
Instance.new("UICorner",tx).CornerRadius=UDim.new(0,8)

local tp=Instance.new("TextLabel")
tp.Size=UDim2.new(1,0,0,25)
tp.Position=UDim2.new(0,0,0.6,0)
tp.BackgroundTransparency=1
tp.Text=""
tp.TextColor3=Color3.fromRGB(255,100,100)
tp.Font=Enum.Font.Gotham
tp.TextSize=13
tp.Parent=fm

local bx=Instance.new("Frame")
bx.Size=UDim2.new(0.9,0,0,40)
bx.Position=UDim2.new(0.5,-153,0.75,0)
bx.BackgroundTransparency=1
bx.Parent=fm

local bt1=Instance.new("TextButton")
bt1.Size=UDim2.new(0.47,0,1,0)
bt1.Position=UDim2.new(0,0,0,0)
bt1.Text="确认"
bt1.BackgroundColor3=Color3.fromRGB(12,110,170)
bt1.TextColor3=Color3.new(1,1,1)
bt1.Font=Enum.Font.GothamBold
bt1.TextSize=16
bt1.Parent=bx
Instance.new("UICorner",bt1).CornerRadius=UDim.new(0,8)

local bt2=Instance.new("TextButton")
bt2.Size=UDim2.new(0.47,0,1,0)
bt2.Position=UDim2.new(0.53,0,0,0)
bt2.Text="复制卡网"
bt2.BackgroundColor3=Color3.fromRGB(40,40,55)
bt2.TextColor3=Color3.new(1,1,1)
bt2.Font=Enum.Font.GothamBold
bt2.TextSize=14
bt2.Parent=bx
Instance.new("UICorner",bt2).CornerRadius=UDim.new(0,8)

local function ck()
    local sk=tx.Text
    if sk=="" then
        tp.Text="请填写卡密！"
        return
    end
    sg:Destroy()
    _G.AUTH_SUCCESS=true
    local ok,err=pcall(function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/8b7511ff44a633e757c34ad7525e7289.lua"))()
    end)
    if not ok then warn("加载失败："..err) end
end

bt1.MouseButton1Click:Connect(ck)
tx.FocusLost:Connect(function(e)if e then ck()end end)

bt2.MouseButton1Click:Connect(function()
    local st=pcall(setclipboard,ln)
    if st then
        tp.Text="✅ 卡网链接已复制"
        tp.TextColor3=Color3.fromRGB(100,255,100)
        task.delay(2,function()
            tp.Text=""
            tp.TextColor3=Color3.fromRGB(255,100,100)
        end)
    else
        tp.Text="❌ 复制失败："..ln
    end
end)

wait(0.2)
tx:CaptureFocus()
