ModeName = "EqualsPlantTimerAndProduction"
Author = "Jackty89"

PlantList =
{
    "FARMALBUMEN",
    "FARMBARREN",
    "FARMDEADCREATURE",
    "FARMGRAVITINO",
    "FARMLUSH",
    "FARMNIP",
    "FARMPOOP",
    "FARMRADIOACTIVE",
    "FARMSCORCHED",
    "FARMSNOW",
    "FARMTOXIC",
    "FARMVENOMSAC"
}
Time = 3600

NMS_MOD_DEFINITION_CONTAINER =
{
    ["MOD_FILENAME"] = ModeName..".pak",
    ["MOD_DESCRIPTION"] = ModeName,
    ["MOD_AUTHOR"] = Author,
    ["MODIFICATIONS"] =
    {
        {
            ["MBIN_CHANGE_TABLE"] =
            {
            }
        }
    }
}




local ChangesToPlant = NMS_MOD_DEFINITION_CONTAINER["MODIFICATIONS"][1]["MBIN_CHANGE_TABLE"]
for i = 1, #PlantList do
    local plantName = PlantList[i]
    local source = "MODELS/PLANETS/BIOMES/COMMON/INTERACTIVEFLORA/"..plantName.."/ENTITIES/PLANTINTERACTION.ENTITY.MBIN"

    ChangesToPlant[#ChangesToPlant + 1] =
    {
        ["MBIN_FILE_SOURCE"] = source,
        ["EXML_CHANGE_TABLE"] =
        {
            {
                ["SPECIAL_KEY_WORDS"] = {"TriggerAction","STEP1_ENTER"},
                ["REPLACE_TYPE"] = "ALL",
                ["VALUE_CHANGE_TABLE"] =
                {
                    {"Time", Time},
                }
            },
            {
                ["SPECIAL_KEY_WORDS"] = {"TriggerAction","STEP1"},
                ["REPLACE_TYPE"] = "ALL",
                ["VALUE_CHANGE_TABLE"] =
                {
                    {"Time", Time}, 
                }
            },
            {
                ["SPECIAL_KEY_WORDS"] = {"TriggerAction","STEP2_ENTER"},
                ["REPLACE_TYPE"] = "ALL",
                ["VALUE_CHANGE_TABLE"]=
                {
                    {"Time", Time},
                }
            },
            {
                ["SPECIAL_KEY_WORDS"] = {"TriggerAction","STEP2"},
                ["REPLACE_TYPE"] = "ALL",
                ["VALUE_CHANGE_TABLE"] =
                {
                    {"Time", Time},
                }
            }
        }
    }
end
