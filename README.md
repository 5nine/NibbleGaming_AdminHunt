# NibbleGaming AdminHunt for Arma 3: Epoch

Epochmod forum post: http://epochmod.com/forum/index.php?/topic/33020-release-admin-hunt/

## Install Instructions:

1. Copy folder `Scripts` to your mission folder (or inside your mission.pbo).
2. Follow the instructions below.
3. Make sure you change the PlayerGUID of your admins inside `init.sqf`.


Add this to the bottom of your `init.sqf`:

```sqf
//Start of NibbleGaming AdminHunt:
debug_adminhunt = true;

if (isDedicated) then {
	[] execVM "scripts\AdminHunt\adminhunt_server_init.sqf";
};

if (!isDedicated) then {
	marker_refreshtime = 5; //Edit this to set how often the marker should refresh
	adminlist = [
	/*-------specify your admins PlayerGUID below -----*/
	"XXXXXXXXXXXXXXXXX",
	"XXXXXXXXXXXXXXXXX",
	"XXXXXXXXXXXXXXXXX" //no comma at last entry
	];
	[] execVM "scripts\AdminHunt\adminhunt_client_init.sqf";

	"NibbleHint" addPublicVariableEventHandler { private "_sound";
		_sound = (_this select 1) select 0;
		switch(_sound)do{
			case 0:{playSound "UAV_05"}; //Mission started
			case 1:{playSound "UAV_01"}; //admin stopped mission
			case 2:{playsound "UAV_03"}; //Admin dead
		};
		hint parseText format["%1", (_this select 1) select 1]
	};
};
// End of NibbleGaming AdminHunt
```

## Infistar:

If you run infistar, make sure these config options are set as followed in `run.sqf`:

```sqf
/*  Remove Action Plrs   */ _OAP = false;
/*  Check Global Markers */ _CGM = false;
_UVC = false;
```

## BattleEye:

<pre><code>
<b>In publicvariable.txt:</b>
line 1:
!"NibbleHint" !"reinforceme" !"iamdead" !"stopreinforceme"

<b>scripts.txt:</b>
line 22: 
!"execVM \"scripts\AdminHunt"

line 41:
!="deletemarker _markeradmin;"

line 42:
!"_markeradmin"

line 43:
!"_markeradmin"

<b>publicvariableval.txt:</b>
remove the last line (1 ""), otherwise, your publicvariable.log will get spammed!
</code></pre>