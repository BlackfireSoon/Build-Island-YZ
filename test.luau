local playerNumber = game.Players.LocalPlayer:FindFirstChild('playerNumber')
if not playerNumber then
	error('you need rank 1 idiot')
end
playerNumber = playerNumber.Value

local replicatedStorage = game.ReplicatedStorage
local lastplacedBlock
local assets = {
	stamp = replicatedStorage.BuildingBridge.Stamp;
	config = replicatedStorage.BuildingBridge.Config;
    wire = replicatedStorage.BuildingBridge.Wiring;
}
local savedblocks = {}

game.Workspace.BuildingAreas['Area' .. playerNumber].PlayerArea.ChildAdded:Connect(function(child)
	if child:IsA('Model') then
		lastplacedBlock = child
	end
end)

function getblock(str)
	if str:sub(1, 1) == '#' then
		return str:gsub('#', '')
	else
		for _, category in ipairs(replicatedStorage.StamperAssets:GetChildren()) do
			for _, block in ipairs(category:GetChildren()) do
				if block.Name:lower() == str:lower() then
					return block.AssetId.Value
				end
			end
		end
	end
	return str
end

local functions = {
	stamp = function(block, position, rotation)
		position = position:gsub(' ', ''):split(',')
        position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(position[1], position[2], position[3])
        rotation = rotation:gsub(' ', ''):split(',')
        rotation = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(rotation[1], rotation[2], rotation[3])
        local cframe = CFrame.new(position) * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))
        local id = getblock(block)
        assets.stamp:InvokeServer(id, cframe)
	end,

    stampat = function(block, position, rotation)
		position = position:gsub(' ', ''):split(',')
        position = Vector3.new(position[1], position[2], position[3])
        rotation = rotation:gsub(' ', ''):split(',')
        rotation = Vector3.new(rotation[1], rotation[2], rotation[3])
        local cframe = CFrame.new(position) * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))
        local id = getblock(block)
        assets.stamp:InvokeServer(id, cframe)
	end,

	wire = function(outputName, outputId, inputName, inputId)
        local outputBlock = savedblocks[outputId] or lastplacedBlock
        local inputBlock = savedblocks[inputId]

        if outputBlock and inputBlock then
            local output, input
            for _, instance in ipairs(outputBlock:GetDescendants()) do
                if instance.Name == outputName and instance.ClassName == 'CustomEvent' then
                    output = instance
                end
            end
            for _, instance in ipairs(inputBlock:GetDescendants()) do
                if instance.Name == inputName and instance.ClassName == 'CustomEventReceiver' then
                    input = instance
                end
            end
            
            if not (input or output) then print('input or output false') end
            assets.wire:InvokeServer(output, input, true)
        end
	end,

    configure = function(id, property, value)
        local block = savedblocks[id] or lastplacedBlock
        local configuration = block:FindFirstChild('Configuration') or block:FindFirstChild('Model'):FindFirstChild('Configuration')
        assets.config:InvokeServer(configuration:FindFirstChild(property), value)
	end,

	giveid = function(id)
		savedblocks[id] = lastplacedBlock
	end,

    ['wait'] = function(seconds)
        task.wait(seconds or 0)
	end,
}

for _, line in ipairs(build:split('\n')) do
	local command = line:split('(')[1]
	line = line:gsub(command, ''):gsub('%(', '', 1):reverse():gsub('%)', '', 1):reverse()
	if command:gsub(' ', '') ~= '' then
		functions[command](unpack(line:split('/')))
		task.wait()
	end
end
