
ModName = "SlotMaster"
Author = "Jackty89"

InventoryTablePath = "METADATA/REALITY/TABLES/INVENTORYTABLE.MBIN"
DefaultRealityPath = "METADATA/REALITY/DEFAULTREALITY.MBIN"
DefaultSaveDatePath = "METADATA/GAMESTATE/DEFAULTSAVEDATA.MBIN"

NMS_MOD_DEFINITION_CONTAINER =
{
    ["MOD_FILENAME"]    = ModName.. ".pak",
    ["MOD_DESCRIPTION"] = ModName,
    ["MOD_AUTHOR"]      = Author,
    ["MODIFICATIONS"]   =
    {
        {
            ["MBIN_CHANGE_TABLE"] =
            {
                {
                    ["MBIN_FILE_SOURCE"] = InventoryTablePath,
                    ["EXML_CHANGE_TABLE"] =
                    {
                    }
                },
                {
                    ["MBIN_FILE_SOURCE"] = DefaultRealityPath,
                    ["EXML_CHANGE_TABLE"] =
                    {
                    }
                }
                ,
                {
                    ["MBIN_FILE_SOURCE"] = DefaultSaveDatePath
                }
            }
        }
    }
}


local ChangesToDefaultSaveData = NMS_MOD_DEFINITION_CONTAINER["MODIFICATIONS"][1]["MBIN_CHANGE_TABLE"][3]

ChangesToDefaultSaveData["EXML_CHANGE_TABLE"] = {}

ChangesToDefaultSaveData["EXML_CHANGE_TABLE"][#ChangesToDefaultSaveData + 1] =
    {
        ["PRECEDING_KEY_WORDS"] = {"Inventory_TechOnly", "SpecialSlots"},
        ["ADD"]	= "table.concat(specialTechEntries)"
    }

    ChangesToDefaultSaveData["EXML_CHANGE_TABLE"][#ChangesToDefaultSaveData["EXML_CHANGE_TABLE"] + 1] =
    {
        ["PRECEDING_KEY_WORDS"] = {"Inventory_TechOnly", "SpecialSlots"},
        ["ADD"]	= "table.concat(specialTechEntries2)"
    }

print(ChangesToDefaultSaveData["EXML_CHANGE_TABLE"])