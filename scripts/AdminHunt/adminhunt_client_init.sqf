waitUntil{!isNull (uiNameSpace getVariable ["EPOCH_loadingScreen", displayNull])};
waitUntil{isNull (uiNameSpace getVariable "EPOCH_loadingScreen")};

sleep 10;
if (getPlayerUID player in adminlist) then {
	if (debug_adminhunt) then {diag_log "#NibbleGaming AdminHunt: Player is admin";};
	nibblemenu = player addaction [("" + ("Admin menu") +""),"scripts\AdminHunt\adminhunt_client.sqf","",-97,false,false,"",""];

//loop to keep player addaction, method by horbin
while {true} do 
{
    waitUntil {!alive player};
    // uh oh...
    waitUntil {alive player};
	diag_log "#NibbleGaming: Player is admin";
	nibblemenu = player addaction [("" + ("Admin menu") +""),"scripts\AdminHunt\adminhunt_client.sqf","",-97,false,false,"",""];

};     

} else {
if (debug_adminhunt) then {diag_log "#NibbleGaming AdminHunt: Player is not admin";};
};