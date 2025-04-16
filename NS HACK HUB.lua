-- NS HACK Hub By Nicolasp_476

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local guiName = "NS_Hack_GUI"

if not _G.ns_ball_position then
    _G.ns_ball_position = UDim2.new(0.4, 0, 0, 100)
end

local function createGUI()
    if player.PlayerGui:FindFirstChild(guiName) then
        player.PlayerGui:FindFirstChild(guiName):Destroy()
    end

    local gui = Instance.new("ScreenGui", player.PlayerGui)
    gui.Name = guiName

    local ball = Instance.new("TextButton")
    ball.Size = UDim2.new(0, 60, 0, 60)
    ball.Position = _G.ns_ball_position
    ball.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    ball.Text = "NS"
    ball.TextColor3 = Color3.fromRGB(255, 255, 0)
    ball.TextScaled = true
    ball.Font = Enum.Font.GothamBold
    ball.Name = "NS_Ball"
    ball.Parent = gui
    ball.Draggable = true
    ball.Active = true

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = ball

    ball:GetPropertyChangedSignal("Position"):Connect(function()
        _G.ns_ball_position = ball.Position
    end)

    local menu = Instance.new("Frame")
    menu.Size = UDim2.new(0, 300, 0, 200)
    menu.Position = UDim2.new(0.5, -150, 0.5, -100)
    menu.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    menu.Visible = false
    menu.Name = "NS_Menu"
    menu.Parent = gui

    -- Cantos arredondados no menu
    local menuCorner = Instance.new("UICorner")
    menuCorner.CornerRadius = UDim.new(0, 15)
    menuCorner.Parent = menu

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    title.Text = "NS"
    title.TextColor3 = Color3.fromRGB(255, 255, 0)
    title.TextScaled = true
    title.Font = Enum.Font.GothamBold
    title.Parent = menu

    -- Cantos arredondados no topo
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 15)
    titleCorner.Parent = title

    local teleportBtn = Instance.new("TextButton")
    teleportBtn.Size = UDim2.new(0.8, 0, 0, 50)
    teleportBtn.Position = UDim2.new(0.1, 0, 0.5, -25)
    teleportBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    teleportBtn.Text = "IR AO BAÚ"
    teleportBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    teleportBtn.TextScaled = true
    teleportBtn.Font = Enum.Font.GothamBold
    teleportBtn.Parent = menu

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 12)
    btnCorner.Parent = teleportBtn

    ball.MouseButton1Click:Connect(function()
        menu.Visible = not menu.Visible
    end)

    teleportBtn.MouseButton1Click:Connect(function()
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(
                919.742126, 35.9924469, -0.483202308,
                0.010693302, 8.3676639e-08, -0.999942839,
                7.59421148e-09, 1, 8.37626359e-08,
                0.999942839, -8.3201295e-09, 0.010693302
            )
        end
    end)
end

local function toggleMenuWithN()
    local uis = game:GetService("UserInputService")
    uis.InputBegan:Connect(function(input, gameProcessedEvent)
        if gameProcessedEvent then return end
        if input.KeyCode == Enum.KeyCode.N then
            local menu = player.PlayerGui:FindFirstChild(guiName)
            if menu then
                local nsMenu = menu:FindFirstChild("NS_Menu")
                if nsMenu then
                    nsMenu.Visible = not nsMenu.Visible
                end
            end
        end
    end)
end

createGUI()
toggleMenuWithN()

player.CharacterAdded:Connect(function()
    wait(1)
    createGUI()
    toggleMenuWithN()
end)
