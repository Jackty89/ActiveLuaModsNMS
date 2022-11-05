ModeName = "NoShuttles"
Author = "Jackty89"


NMS_MOD_DEFINITION_CONTAINER =
{
["MOD_FILENAME"] 			= ModeName..".pak",
["MOD_DESCRIPTION"]			= "Rework of all Spaceships and their bonuses and price",   
["MOD_AUTHOR"]				= Author,
["MODIFICATIONS"] 			=
	{
		{
			["MBIN_CHANGE_TABLE"] 	=
			{
				{
					["MBIN_FILE_SOURCE"] 	= "GCSOLARGENERATIONGLOBALS.GLOBAL.MBIN",
					["EXML_CHANGE_TABLE"] 	=
					{
						{
							["REPLACE_TYPE"] 		= "ALL",
							["VALUE_CHANGE_TABLE"] 	=
							{
								{"Shuttle",	"1"},
								{"Royal", "10"}
							}
						}
					}

				}
			}
		}
	}
}