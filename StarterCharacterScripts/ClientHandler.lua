-------------------------
--| Services |-----------
-------------------------

local UIS                   = game:FindService('UserInputService')
local Players               = game:FindService('Players')
local RunService            = game:FindService('RunService')
local HttpService           = game:FindService('HttpService')
local ContentProvider       = game:FindService('ContentProvider')
local StarterGui            = game:FindService('StarterGui')
local StarterPlayer         = game:FindService('StarterPlayer')
local ReplicatedStorage     = game:FindService('ReplicatedStorage')
local ReplicatedFirst       = game:FindService('ReplicatedFirst')
local ContextActionService  = game:FindService('ContextActionService')
local AssetService          = game:FindService('AssetService')
local InsertService         = game:FindService('InsertService')
local CollectionService     = game:FindService('CollectionService')
local PhysicsService        = game:FindService('PhysicsService')
local NetworkClient         = game:FindService('NetworkClient')
local UserService           = game:FindService('UserService')
local DataStoreService      = game:FindService('DataStoreService')
local SoundService          = game:FindService('SoundService')
local LocalizationService   = game:FindService('LocalizationService')
local MarketplaceService    = game:FindService('MarketplaceService') 
local PathfindingService    = game:FindService('PathfindingService')
local PolicyService         = game:FindService('PolicyService')
local TextService           = game:FindService('TextService')
local TeleportService       = game:FindService('TeleportService')
local ChatService           = game:FindService('Chat')
local TweenService          = game:FindService('TweenService')
local Debris                = game:FindService('Debris')
local Stats                 = game:FindService('Stats')
local VirtualUser           = game:FindService('VirtualUser')
local FriendService         = game:FindService('FriendService')
local AdService             = game:FindService('AdService')
local AvatarEditor          = game:FindService('AvatarEditorService')
local ChangeHistory         = game:FindService('ChangeHistoryService')

-------------------------
--| Modules |------------
-------------------------

local Input         = script:WaitForChild("Input", 5)
local InputModule   = require(Input)

local RbxGui        = require(ReplicatedStorage.Modules.LoadLibrary.RbxGui)
local RbxStamper    = require(ReplicatedStorage.Modules.LoadLibrary.RbxStamper)
local RbxUtility    = require(ReplicatedStorage.Modules.LoadLibrary.RbxUtility)

-------------------------
--| Settings |-----------
-------------------------

local CoreSettings = {
    ["Internal"] = {
        ["Render"]  = game:FindService('RenderSettings'),
        ["Network"] = game:FindService('NetworkSettings'),
        ["Lua"]     = game:FindService('LuaSettings'),
        ["Game"]    = game:FindService('GameSettings'),
        ["Debug"]   = game:FindService('DebugSettings'),
        ["Physics"] = game:FindService('PhysicsSettings')
    },
    ["External"] = {
        ["CorePackages"]        = game:FindService('CorePackages'),
        ["HttpRbxApiService"] 	= game:FindService('HttpRbxApiService'),
        ["CoreGui"]             = game:FindService('CoreGui'),
        ["GuiService"] 	        = game:FindService('GuiService'),
        ["TestService"]         = game:FindService('TestService'),
        ["ScriptContext"]       = game:FindService('ScriptContext'),
        ["ABTest"]              = game:FindService('ABTestService'),
        ["Messaging"]           = game:FindService('MessagingService'),
        ["Studio"]              = game:FindService('StudioService'), --> Debugging
        ["Log"]                 = game:FindService('LogService'),
        ["Notification"]        = game:FindService('NotificationService'),
        ["Selection"]           = game:FindService('Selection'),
        ["TaskScheduler"]       = game:FindService('TaskScheduler')
    },
    ["Misc"] = {
        ["UserSettings"]    = UserSettings,
        ["GlobalSettings"]  = settings
    }
}

-------------------------
--| Analytics |----------
-------------------------

--> Discord Webhooks

-------------------------
--| Security |-----------
-------------------------

local HT_90d64eeba8247d656ef6b4800ec0f52f = {
    [0x31]      = "31CEB6C0-888A-4CDB-ABD2-1980A1C455E1",
    [0x32]      = "E6493637-8F68-47DA-ACA4-FB604459A07C",
    [0x33]      = "28533C00-DEBB-44F3-91FA-14A088AEF4F0",
    [0x34]      = "728FAB66-2E30-421C-B3D5-746C5F95DA1A",
    [0x35]      = "61654309-F7AE-4666-9C92-5FB0E963C5E9",
    [0x36]      = "B20BE1FB-6490-4972-856F-A9ABEE8F0FA6",
    [0x37]      = "CAE1F5D2-600E-462E-8979-79A08C4574DE",
    [0x38]      = "42337869-8A7D-438F-8516-0BC4A5BC28A1",
    [0x39]      = "9BA1115F-FF64-4E78-8F41-7A28DF30293A",
    [0x3130]    = "521BABBC-70A3-4B35-B03C-A0BF54C8F10B",
    [0x3131]    = "4DBCD948-2755-4264-8ECA-65A81BFD35B8",
    [0x3132]    = "3E5B37FB-2041-4434-B0F3-9BFFBEA46CBC"
}

local IDX_6a992d5529f459a44fee58c733255e86 = {
    [1] = 0x31,
    [2] = 0x32,
    [3] = 0x33,
    [4] = 0x34,
    [5] = 0x35,
    [6] = 0x36,
    [7] = 0x37,
    [8] = 0x38,
    [9] = 0x39,
    [10] = 0x3130,
    [11] = 0x3131,
    [12] = 0x3132
}

shared.Key_eec89088ee408b80387155272b113256 = {}

setmetatable(shared.Key_eec89088ee408b80387155272b113256, {
    __call = function(tb1, ...)
        return HT_90d64eeba8247d656ef6b4800ec0f52f[IDX_6a992d5529f459a44fee58c733255e86[math.random(1, #IDX_6a992d5529f459a44fee58c733255e86)]]
    end
})

local Key_0fea6a13c52b4d4725368f24b045ca84 = {}

for i = 1, 100, 1 do
    local hash = shared.Key_eec89088ee408b80387155272b113256()
    table.insert(Key_0fea6a13c52b4d4725368f24b045ca84, #Key_0fea6a13c52b4d4725368f24b045ca84+1, hash)
end

function shared.Key_eec89088ee408b80387155272b113256:InvokeServer(Key_cf51066f49e517f274b8173cc265c60b, ...)
    return Key_cf51066f49e517f274b8173cc265c60b:InvokeServer(...)
end

function shared.Key_eec89088ee408b80387155272b113256:FireServer(Key_cf51066f49e517f274b8173cc265c60b, ...)
    Key_cf51066f49e517f274b8173cc265c60b:FireServer(...)
end

spawn(function()
    while wait(math.random(0.5, 1.5)) do
        for idx, val in pairs(ReplicatedStorage.Remotes:GetChildren()) do
            if val.ClassName == "RemoteFunction" then
                shared.Key_eec89088ee408b80387155272b113256:InvokeServer(val)
            end
        end
    end
end)

spawn(function()
    while wait(math.random(0.5, 1.5)) do
        for idx, val in pairs(ReplicatedStorage.Remotes:GetChildren()) do
            if val.ClassName == "RemoteEvent" then
                shared.Key_eec89088ee408b80387155272b113256:FireServer(val)
            end
        end
    end
end)

getfenv(1).Key_c55582518cba2c464f29f5bae1c68def = function()
    return function()
        for idx, val in pairs(ReplicatedStorage.Remotes:GetChildren()) do
            if val.ClassName == "RemoteFunction" then
                local Key_fef3f7bf6d921b1dcbd24b6a57061af6 = shared.Key_eec89088ee408b80387155272b113256:InvokeServer(val, unpack(Key_0fea6a13c52b4d4725368f24b045ca84))
                CollectionService:AddTag(Key_fef3f7bf6d921b1dcbd24b6a57061af6, string.upper("fef3f7bf6d921b1dcbd24b6a57061af6")) --> Raycast [RemoteEvent MD5 Hash]
                return Key_fef3f7bf6d921b1dcbd24b6a57061af6
            end
        end
    end
end

for idx, val in pairs(getfenv(1)) do
    if type(val) == "function" then
        local rGet = val()
        local Key_117e624bbbd5afc75a3150ba85d3cb93 = rGet()
        shared.Key_eec89088ee408b80387155272b113256:FireServer(Key_117e624bbbd5afc75a3150ba85d3cb93)
    end
end

local Key_e9a23cbc455158951716b440c3d165e0 = {
    __index     = {},
    __newindex  = {},
    __call      = {},
    __concat    = {},
    __unm       = {},
    __add       = {},
    __sub       = {},
    __mul       = {},
    __div       = {},
    __mod       = {},
    __pow       = {},
    __tostring  = {},
    __metatable = {},
    __eq        = {},
    __lt        = {},
    __le        = {},
    __mode      = {},
    __gc        = {},
    __len       = {}
}

-----------------------------
--| Initialization |---------
-----------------------------

local workspace = game:GetService('Workspace') --> Disables any deprecation from Roblox's API.
local pi        = math.pi
local log       = math.log
local log10     = math.log10
local deg       = math.deg
local rad       = math.rad
local fmod      = math.fmod
local modf      = math.modf
local sin       = math.sin
local cos       = math.cos
local tan       = math.tan
local asin      = math.asin
local acos      = math.acos
local atan      = math.atan
local atan2     = math.atan2
local sinh      = math.sinh
local cosh      = math.cosh
local tanh      = math.tanh
local noise     = math.noise
local random    = math.random
local sqrt      = math.sqrt
local abs       = math.abs

ReplicatedFirst:RemoveDefaultLoadingScreen()

repeat
    local success, err = pcall(function()
        StarterGui:SetCore("ResetButtonCallback", false)
    end)
    wait(0.2)
until success

StarterGui:SetCore("TopbarEnabled", false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)

StarterPlayer.DevComputerCameraMovementMode = Enum.DevComputerCameraMovementMode.Classic
StarterPlayer.DevComputerMovementMode       = Enum.DevComputerMovementMode.KeyboardMouse
StarterPlayer.EnableMouseLockOption         = false
StarterPlayer.CameraMinZoomDistance         = -math.huge
StarterPlayer.CameraMaxZoomDistance         = -math.huge
StarterPlayer.CameraMode                    = Enum.CameraMode.LockFirstPerson
StarterPlayer.HealthDisplayDistance         = 0
StarterPlayer.NameDisplayDistance           = 0

RunService:BindToRenderStep("CharacterSniffer", Enum.RenderPriority.Character.Value, function()
    table.foreach(workspace:GetChildren(), function(idx, val)
        if val:IsA("Model") then
            val.Parent = workspace["Characters"]
        end
    end)
end)

local Player                       = Players.LocalPlayer
local PlayerMouse                  = Player:GetMouse()
local Camera                       = workspace.CurrentCamera
local Character                    = Player.Character or Player.CharacterAdded:Wait()
local Head                         = Character:WaitForChild('Head', 7)
local Torso                        = Character:WaitForChild('Torso', 7)
local Neck                         = Torso:WaitForChild('Neck', 7)
local Humanoid                     = Character:WaitForChild('Humanoid', 7)
local HROOT                        = Character:WaitForChild('HumanoidRootPart', 7)
local NeckOriginC0                 = Neck.C0
local nOffsetX, nOffsetY, nOffsetZ = Neck.C0.X, Neck.C0.Y, Neck.C0.Z --> Might be useless for now, but can be implemented later.

local ActionEnabled = false
local ActionBound   = InputModule.GetActionHandlerTypes()[3]

repeat wait() until ContentProvider.RequestQueueSize <= 2

function angleDifference(Angle1, Angle2, radians)
    local Difference = Angle2 - Angle1
     if (Difference > 180) then
        Difference = Difference - 360
    elseif (Difference < -180) then
        Difference = Difference + 360
    end
    return Difference
end

function lookAt(target, eye)
    local forwardVector = (target - eye).Unit
    local upVector      = Vector3.new(0, 1, 0)
    local rightVector   = forwardVector:Cross(upVector)
    local upVector2     = rightVector:Cross(forwardVector)
    
    return CFrame.fromMatrix(eye, rightVector, upVector2)
end

Neck.MaxVelocity             = 1/3
Player.CameraMinZoomDistance = -math.huge
Player.CameraMaxZoomDistance = -math.huge
Player.CameraMode            = Enum.CameraMode.LockFirstPerson

RunService.RenderStepped:Connect(function(step)
    local CameraCF = Camera.CoordinateFrame
    
    if Torso and Head then
        local TorsoLookVector = Torso.CFrame.lookVector
        local HeadPosition    = Head.CFrame.p
        
        if Neck then
            if Camera.CameraSubject:IsDescendantOf(Character) or Camera.Camera.CameraSubject:IsDescendantOf(Player) then
                local Point      = PlayerMouse.Hit.p
                local Distance   = (Head.CFrame.p - Point).Magnitude
                local Difference = (Head.CFrame.Y - Point.Y)
                local aOffset    = -1.12 --> Positive integer will invert the X and Y axis movement scheme.
                local Angle      = -(math.atan(Difference / Distance) * aOffset)
                
                ----------------------------------
                ------| Y-Axis Angle Chart |------
                ----------------------------------
                ---| Angle |----------| Value |---
                ----------------------------------
                ---# Origin              0.01 #---
                ---# Y+ Left            -1.01 #---
                ---# Y- Right           -1.01 #---
                ---# Y+ Right            1.01 #---
                ---# Y- Left             1.01 #---
                ----------------------------------
                ----------------------------------
                
                --> Z = X
                --> X = Y
                --> Y = Z
                
                if ActionEnabled ~= true then
                    Neck.C0 = Neck.C0:Lerp(NeckOriginC0 * CFrame.Angles(Angle, 0, 0), 0.47 / 2) --> Y-Axis: (((HeadPosition - Point).Unit)).Y * 0.01
                end
            end
        end
    end
end)

local ViewModel = workspace:WaitForChild('Assets'):WaitForChild('ViewModel')
local Handle    = ViewModel.PrimaryPart
local WeldA     = Instance.new("Weld", Head)
WeldA.C0        = (Head.CFrame:ToObjectSpace(Head.CFrame):Inverse()) * CFrame.new(1.28, -1.5, -2.6)
WeldA.Part0     = Head
WeldA.Part1     = Handle

local RightArmM = ViewModel:FindFirstChild('RightArm', true)
local LeftArmM  = ViewModel:FindFirstChild('LeftArm', true)
local LeftArm   = LeftArmM.Arm
local RightArm  = RightArmM.Arm

-------------------------
--| User Input |---------
-------------------------

if UIS.VREnabled then Player:Kick("Virtual Reality is not supported for this game.") end
if UIS.GamepadEnabled then Player:Kick("Consoles are not supported for this game.") end

local IH_CacheBlock = 0

function RegisterActionHandler()
    IH_CacheBlock = 1
end

function ActionHandler(fdAction, uInputState, uInputObject)
    print(IH_CacheBlock)
    if fdAction == InputModule.GetActionHandlerTypes()[1] and uInputState == InputModule.GetActionHandlerStates()[1] then
        Humanoid.WalkSpeed = Humanoid.WalkSpeed + 14
        ActionEnabled = false
        ActionBound = InputModule.GetActionHandlerTypes()[1]
    end
    if fdAction == InputModule.GetActionHandlerTypes()[1] and uInputState == InputModule.GetActionHandlerStates()[2] then
        if IH_CacheBlock == 0 then
            RegisterActionHandler()
            return
        end
        if IH_CacheBlock == 1 then
            Humanoid.WalkSpeed = Humanoid.WalkSpeed - 14
            ActionEnabled = false
            ActionBound = InputModule.GetActionHandlerTypes()[3]
        end
    end
end

UIS.InputBegan:Connect(function(uInput, gameProcessed)
    if uInput.UserInputType == Enum.UserInputType.MouseButton1 and not gameProcessed then
        local RaycastArguments = {
            [1] = ViewModel.MainGunM.GunTopM.BarrelM.SightFront.CFrame.p,
            [2] = PlayerMouse.Hit.p
        }
        for idx, val in pairs(CollectionService:GetTagged(string.upper("fef3f7bf6d921b1dcbd24b6a57061af6"))) do
            shared.Key_eec89088ee408b80387155272b113256:FireServer(val, RaycastArguments[1], RaycastArguments[2], unpack(Key_0fea6a13c52b4d4725368f24b045ca84))
            val.OnClientEvent:Connect(function(client, part, position, dist, aimPartp)
                local bullet            = Instance.new("Part")
                bullet.Anchored         = true
                bullet.CanCollide       = false
                bullet.Material         = Enum.Material.Neon
                bullet.Transparency     = math.random(0.43, 0.89)
                bullet.TopSurface       = Enum.SurfaceType.Smooth
                bullet.BottomSurface    = Enum.SurfaceType.Smooth
                bullet.BrickColor       = BrickColor.Red()
                bullet.Size             = Vector3.new(0.4, 0.4, dist)
                bullet.CFrame           = CFrame.new(aimPartp, position) * CFrame.new(0, 0, -dist/2)
                bullet.Parent           = workspace
                Debris:AddItem(bullet, 0.06)
            end)
        end
    end
    if uInput.UserInputType == Enum.UserInputType.Keyboard and not gameProcessed then
        if uInput.KeyCode == Enum.KeyCode.LeftShift then
            ContextActionService:BindAction("Run", ActionHandler, true, Enum.KeyCode.LeftShift)
        end
    end
end)

UIS.InputEnded:Connect(function(uInput, gameProcessed)
    if uInput.UserInputType == Enum.UserInputType.Keyboard and not gameProcessed then
        if uInput.KeyCode == Enum.KeyCode.LeftShift then
            ContextActionService:UnbindAction("Run")
        end
    end
end)

local CurrentJump
local Debounce = true

function JumpRayDown()
    local newRay = Ray.new(Torso.Position, Vector3.new(0, -1, 0).Unit * 4)
    local hitPart, hitPos = workspace:FindPartOnRay(newRay, Character)
    if hitPart ~= nil then
        return true
    end
    return false
end

Humanoid.Changed:Connect(function(property)
    if property == InputModule.GetActionHandlerTypes()[2] and Debounce == true and Humanoid.Sit == false then
        CurrentJump = true
        Debounce = false
        local newConnection = PlayerMouse.KeyDown:Connect(function(key)
            if string.lower(key):byte() == 32 and CurrentJump and Torso.Velocity.Y > -30 then
                CurrentJump = false
                table.foreach(Character:GetChildren(), function(idx, val)
                    if val:IsA("BasePart") then
                        val.Velocity = Vector3.new(val.Velocity.X, 50, val.Velocity.Z)
                    end
                end)
            end
        end)
        spawn(function()
            repeat wait() until JumpRayDown() == true
            Debounce = true
            CurrentJump = false
            if type(newConnection) == "function" then
                newConnection:Disconnect()
            end
        end)
    elseif property == "Jump" and Humanoid.Sit == true then
        Humanoid.Jump = false
    end
end)

--> ContextActionService for binding animations according to humanoid states