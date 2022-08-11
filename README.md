# Mechanic Job

- 0.0 - 0.1 ms when not in use
- Prop system with animations
- F6 Menu
- Configurable from Config.lua
- EUP system (Touch if you know what you are doing)

Preview: https://i.imgur.com/EXdlhlJ.png
Discord:  https://discord.gg/Vh2Pjan9rf

# Requirements

You must put the following in your es_extended for it to work

```

/es_extended/client/functions.lua

ESX.ShowFloatingHelpNotification = function(msg, coords)
	AddTextEntry('esxFloatingHelpNotification', msg)
	SetFloatingHelpTextWorldPosition(1, coords)
	SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
	BeginTextCommandDisplayHelp('esxFloatingHelpNotification')
	EndTextCommandDisplayHelp(2, false, false, -1)
end
