# Mechanic Job

- 0.0 - 0.1 ms cuando no esta en uso 
- Sistema de Props con animaciones
- Menú F6
- Configurable desde el Config.lua
- Sistema de EUP (Tocad si sabeis lo que estais haciendo)

Preview: https://i.imgur.com/EXdlhlJ.png
Discord:  https://discord.gg/Vh2Pjan9rf

# Requerimientos

Deben de poner lo siguiente en su es_extended para que funcione

```

/es_extended/client/functions.lua

ESX.ShowFloatingHelpNotification = function(msg, coords)
	AddTextEntry('esxFloatingHelpNotification', msg)
	SetFloatingHelpTextWorldPosition(1, coords)
	SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
	BeginTextCommandDisplayHelp('esxFloatingHelpNotification')
	EndTextCommandDisplayHelp(2, false, false, -1)
end