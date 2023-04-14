
-- 0.5 = faster x 2, 0.1 = faster x 10
-- 2 = would take two times to produce same result
-- don't use 0, refiner won't work
REFINER_TIME_FACTOR = 0.1
REFINER_AMMOUNT_FACTOR = 1

NMS_MOD_DEFINITION_CONTAINER =
{
    ["MOD_FILENAME"] = "SpeedyRefiners.pak",
    ["MOD_AUTHOR"] = "wim95",
    ["MOD_DESCRIPTION"] = "This Mod makes Refiners speed 10 times faster",
    ["MODIFICATIONS"] =
    {
        {
            ["PAK_FILE_SOURCE"] = "NMSARC.515F1D3.pak",
            ["MBIN_CHANGE_TABLE"] =
            {
                {
                    ["MBIN_FILE_SOURCE"] = "METADATA/REALITY/TABLES/NMS_REALITY_GCRECIPETABLE.MBIN",
                    ["EXML_CHANGE_TABLE"] =
                    {
                        {
                            ["PRECEDING_KEY_WORDS"] = "",
                            ["INTEGER_TO_FLOAT"] = "FORCE",
                            ["MATH_OPERATION"] = "*",
                            ["REPLACE_TYPE"] = "ALL",
                            ["VALUE_MATCH"] = "",
                            ["VALUE_CHANGE_TABLE"] =
                            {
                                {"TimeToMake", REFINER_TIME_FACTOR},
                                {"Amount", REFINER_AMMOUNT_FACTOR}
                            }
                        }
                    }
                }
            }
        }
    }
}