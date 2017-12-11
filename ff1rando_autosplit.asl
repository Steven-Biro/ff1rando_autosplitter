state("fceux")
{
	byte earth_orb: "fceux.exe", 0x40f01C, 0x32;
	byte fire_orb: "fceux.exe", 0x40f01c, 0x033;
	byte water_orb: "fceux.exe", 0x40f01c, 0x034;
	byte air_orb: "fceux.exe", 0x40f01c, 0x035;
	byte canoe: "fceux.exe", 0x40f01c, 0x012;
	byte lute: "fceux.exe", 0x40f01c, 0x021;
	byte ship: "fceux.exe", 0x40f01c, 0x000;
	byte btl_result: "fceux.exe", 0x40f01c, 0xB86;
	byte char_name_1: "fceux.exe", 0x40f01c, 0x102;
}	


split
{
	// split on goal line
	if(settings["lute"] && current.lute != old.lute && current.lute != 00)
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
	else if(settings["orbs"] && current.earth_orb!=old.earth_orb||current.fire_orb!=old.fire_orb||current.water_orb!=old.water_orb||current.air_orb!=old.air_orb)
	{
		return(true);
	}
	else if(settings["chaos"] && current.btl_result==255)
	{
		return(true);
	}
	else {
	   return(false);
	}
}

start
	{
	return(current.char_name_1!=0);
	}


startup
{
	settings.Add("start", true, "Start");
	settings.SetToolTip("start", "Start timer automactically");
	settings.Add("orbs", true, "Orbs");
	settings.SetToolTip("orbs", "Split on getting an orb");
	settings.Add("canoe", true, "Canoe");
	settings.SetToolTip("canoe", "Split on getting the canoe");
	settings.Add("ship", true, "Ship");
	settings.SetToolTip("ship", "Split on getting the ship");
	settings.Add("lute", true, "Lute");
	settings.SetToolTip("lute", "Split on getting the lute");
	settings.Add("chaos", true, "Chaos");
	settings.SetToolTip("chaos", "Split on beating chaos");
}