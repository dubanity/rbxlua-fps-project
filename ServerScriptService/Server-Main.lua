local Players 			= game:GetService('Players')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local ReplicatedFirst 	= game:GetService('ReplicatedFirst')
local ServerStorage 	= game:GetService('ServerStorage')
local HttpService 		= game:GetService('HttpService')
local NetworkServer 	= game:GetService('NetworkServer')
local Lighting 			= game:GetService('Lighting')
local RunService 		= game:GetService('RunService')
local CollectionService = game:GetService('CollectionService')

spawn(function()
	while wait(1) do
		for i,v in pairs(ReplicatedStorage.Remotes:GetChildren()) do
			if v.ClassName == "RemoteFunction" then
				local randomGUID = HttpService:GenerateGUID(false)
				local sGUID = tostring(randomGUID)
				v.Name = sGUID
			end
		end
	end
end)

local remoteStorage = {}

for i,v in pairs(ReplicatedStorage.Remotes:GetChildren()) do
	local RemoteCount = #ReplicatedStorage.Remotes:GetChildren()
	if v.ClassName == "RemoteFunction" then
		v.OnServerInvoke = function(client, ...)
			local args = {...}
			if (#args == 100) then
				local RemoteEvent = Instance.new("RemoteEvent", ReplicatedStorage.Remotes)
				spawn(function()
					while wait(1) do
						RemoteEvent.Name = HttpService:GenerateGUID(false)
					end
				end)
				table.insert(remoteStorage, #remoteStorage+1, RemoteEvent)
				RemoteEvent.OnServerEvent:Connect(function(client, ...)
					local aimPartp = ({...})[1]
					local mouseHitp = ({...})[2]
					
					if aimPartp ~= nil and mouseHitp ~= nil then
						local ray = Ray.new(aimPartp, (mouseHitp - aimPartp).Unit * 300)
						local part, position = workspace:FindPartOnRay(ray, client.Character, false, true)
						local dist = (aimPartp - mouseHitp).Magnitude
						if part then
							local humanoid = part.Parent:FindFirstChild('Humanoid')
							if humanoid then
								humanoid:TakeDamage(10)
							end
						end
						RemoteEvent:FireAllClients(client, part, position, dist, aimPartp)
					end
				end)
				return RemoteEvent
			end
		end
	end
end

local remoteCache = {}

for i,v in pairs(ReplicatedStorage.Remotes:GetChildren()) do
	if v.ClassName == "RemoteEvent" then
		table.insert(remoteCache, #remoteCache+1, v)
	end
end

spawn(function()
	while wait(1.2) do
		remoteCache[math.random(1, #remoteCache)].Name = HttpService:GenerateGUID(false)
	end
end)

local v1 = game.Workspace
local v2 = game.Players
local v3 = game.ReplicatedStorage
function C1()
	v1.Name = HttpService:GenerateGUID(false)
end
function C2()
	v2.Name = HttpService:GenerateGUID(false)
end
function C3()
	v3.Name = HttpService:GenerateGUID(false)
end
spawn(function()
	while wait(1) do
		C1()
		C2()
		C3()
	end
end)

local ViewModel = ServerStorage:FindFirstChild('ViewModel')

Players.PlayerAdded:Connect(function(Player)
	local ViewModel_Copy = ViewModel:Clone()
	ViewModel_Copy.Parent = workspace["Assets"]
	RunService:BindToRenderStep("CharacterSniffer", Enum.RenderPriority.Character.Value, function()
		table.foreach(workspace:GetChildren(), function(idx, val)
			if val:IsA("Model") then
				val.Parent = workspace["Characters"]
			end
		end)
	end)
end)