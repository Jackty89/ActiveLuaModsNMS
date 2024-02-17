
REFINER_TIME_FACTOR = 0.1
REFINER_AMOUNT_FACTOR = 1

INPUT_REFINER_TIME_FACTOR =
{
    INPUT_REFINER_TIME_FACTOR,
    [[
        How fast do you want your recipes to be. (Ex. 0.1 == 10% of what vanilla, 2 == 200% of vanilla)
        Default = 0.1 | Current = >> ]] .. REFINER_TIME_FACTOR .. [[ <<
    ]]
}
REFINER_TIME_FACTOR = GUIF(INPUT_REFINER_TIME_FACTOR, 10)

INPUT_REFINER_AMOUNT_FACTOR =
{
    REFINER_AMOUNT_FACTOR,
    [[
        What's the multiplier you want the amount per refiner cycle you wish?
        Default = 1 | Current = >> ]] .. REFINER_AMOUNT_FACTOR .. [[ <<
    ]]
}
REFINER_AMOUNT_FACTOR = GUIF(REFINER_AMOUNT_FACTOR, 10)

NMS_MOD_DEFINITION_CONTAINER =
{
    ["MOD_FILENAME"] = "SpeedyRefiners.pak",
    ["MOD_AUTHOR"] = "Original wim95, edit by Jackty89",
    ["MOD_DESCRIPTION"] = "This Mod makes Refiners speed x times faster",
    ["MODIFICATIONS"] =
    {
        {
            ["MBIN_CHANGE_TABLE"] =
            {
                {
                    ["MBIN_FILE_SOURCE"] = "METADATA/REALITY/TABLES/NMS_REALITY_GCRECIPETABLE.MBIN",
                    ["EXML_CHANGE_TABLE"] =
                    {
                        {
                            ["INTEGER_TO_FLOAT"] = "FORCE",
                            ["MATH_OPERATION"] = "*",
                            ["REPLACE_TYPE"] = "ALL",
                            ["VALUE_CHANGE_TABLE"] =
                            {
                                {"TimeToMake", REFINER_TIME_FACTOR},
                                {"Amount", REFINER_AMOUNT_FACTOR}
                            }
                        }
                    }
                }
            }
        }
    }
}