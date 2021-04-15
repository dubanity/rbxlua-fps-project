local InputModule = {}

InputModule.GetActionHandlerTypes = function()
	return {
		[1] = "Run",
		[2] = "Jump",
		[3] = "Idle"
	}
end

InputModule.GetActionHandlerStates = function()
	return {
		[1] = Enum.UserInputState.Begin,
		[2] = Enum.UserInputState.End
	}
end

return InputModule
