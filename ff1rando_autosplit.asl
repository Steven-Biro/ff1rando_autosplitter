state("fceux")
{//3f4c6c,43512c,436cfc, possible offsets fceux 2.2.3
	byte earth_orb: "fceux.exe", 0x436cfc, 0x032;
	byte fire_orb: "fceux.exe", 0x436cfc, 0x033;
	byte water_orb: "fceux.exe", 0x436cfc, 0x034;
	byte air_orb: "fceux.exe", 0x436cfc, 0x035;
	byte canoe: "fceux.exe", 0x436cfc, 0x012;
	byte lute: "fceux.exe", 0x436cfc, 0x021;
	byte ship: "fceux.exe", 0x436cfc, 0x000;
	byte tnt: "fceux.exe", 0x436cfc, 0x026;
	byte canal:"fceux.exe", 0x436cfc, 0x00C;
	byte btl_result: "fceux.exe", 0x436cfc, 0xB86;
	byte char_name_1: "fceux.exe", 0x436cfc, 0x102;
}


split
{
	// split on goal line
	if(settings["lute"] && current.lute != old.lute && current.lute != 00)
	{   
   return(true);
}
	else if(settings["tnt"] && current.tnt!=old.tnt && current.tnt!=00)
	{
		return(true);
	}
	else if(settings["ship"] && current.ship!=old.ship && current.ship!=00)
	{
		return(true);
	}
	else if(settings["canoe"] && current.canoe!=old.canoe && current.canoe!=00)
	{
		return(true);
	}
	else if(settings["orbs"] && ((current.earth_orb!=old.earth_orb && current.earth_orb!=0)||(current.fire_orb!=old.fire_orb && current.fire_orb!=0)||(current.water_orb!=old.water_orb && current.water_orb!=0)||(current.air_orb!=old.air_orb && current.air_orb!=0)))
	{
		return(true);
	}
	else if(settings["chaos"] && current.btl_result==255 && current.btl_result!=old.btl_result)
	{
		return(true);
	}
	else {
	   return(false);
	}
}

start
	{
	return(settings["start"] &&current.char_name_1!=0 && current.char_name_1!=old.char_name_1);
	}

reset {
	return(settings["reset"] && current.char_name_1==0);
}

startup
{
	settings.Add("start", true, "Start");
	settings.SetToolTip("start", "Start timer automactically");
	settings.Add("reset", false, " - CAUTION -Reset");
	settings.SetToolTip("reset", "Resets timer automactically - CAUTION - resets timer on resets and power cycles - useful for debugging, not racing");
	settings.Add("orbs", true, "Orbs");
	settings.SetToolTip("orbs", "Split on getting an orb");
	settings.Add("canoe", true, "Canoe");
	settings.SetToolTip("canoe", "Split on getting the canoe");
	settings.Add("tnt",false,"TNT");
	settings.SetToolTip("tnt", "Split on getting the TNT");
	settings.Add("canal",true,"Canal","tnt");
	settings.SetToolTip("canal", "Split on handing in the TNT");	settings.Add("ship", true, "Ship");
	settings.SetToolTip("ship", "Split on getting the ship");
	settings.Add("lute", true, "Lute");
	settings.SetToolTip("lute", "Split on getting the lute");
	settings.Add("chaos", true, "Chaos");
	settings.SetToolTip("chaos", "Split on beating chaos");
}