ModName = "ClaimFreeExpeditionShipsReplace"
Author = "Jackty89"

Reward_Table_Path = "METADATA/REALITY/TABLES/REWARDTABLE.MBIN"

NMS_MOD_DEFINITION_CONTAINER =
{
    ["MOD_FILENAME"] = ModName..".pak",
    ["MOD_DESCRIPTION"] = 'This will affect all reward ships',
    ["MOD_AUTHOR"] = Author,
    ["MODIFICATIONS"] =
    {
        {
            ["MBIN_CHANGE_TABLE"] =
            {
                {
                    ["MBIN_FILE_SOURCE"] = Reward_Table_Path,
                    ["EXML_CHANGE_TABLE"] =
                    {
                        {
                            ["PRECEDING_KEY_WORDS"] = {'GcRewardSpecificShip.xml'},
                            ["REPLACE_TYPE"] = "ALL",
                            ["VALUE_CHANGE_TABLE"] =
                            {
                                {"CostAmount", 0},
                            }
                        }
                    }
                }
            }
        }
    }
}