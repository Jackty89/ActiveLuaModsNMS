ModName = "BuySentinelMap"
Author = "Jackty89"

DefaultRealityPath = "METADATA/REALITY/DEFAULTREALITY.MBIN"

NMS_MOD_DEFINITION_CONTAINER =
{
    ["MOD_FILENAME"] = ModName..".pak",
    ["MOD_DESCRIPTION"] = ModName,
    ["MOD_AUTHOR"] = Author,
    ["MODIFICATIONS"] =
    {
        {
            ["MBIN_CHANGE_TABLE"] =
            {
                {
                    ["MBIN_FILE_SOURCE"] = DefaultRealityPath,
                    ["EXML_CHANGE_TABLE"] =
                    {
                        {
                            ["PRECEDING_KEY_WORDS"] = {"TradeSettings", "MapShop"},
                            ["VALUE_CHANGE_TABLE"] =
                            {
                                {"MinItemsForSale", "6"},
                                {"MaxItemsForSale", "6"}
                            }
                        },
                        {
                            ["SPECIAL_KEY_WORDS"] = {"MapShop", "GcTradeData.xml"},
                            ["PRECEDING_KEY_WORDS"] = {"AlwaysPresentProducts", "NMSString0x10.xml"},
                            ["SEC_SAVE_TO"] = "SHOPENTRY"
                        },
                        {
                            ["SEC_EDIT"] = "SHOPENTRY",
                            ["VALUE_CHANGE_TABLE"] =
                            {
                                {"Value", "CHART_HIVE"},
                            }
                        },
                        {
                            ["SPECIAL_KEY_WORDS"] = {"MapShop", "GcTradeData.xml"},
                            ["PRECEDING_KEY_WORDS"] = {"AlwaysPresentProducts"},
                            ["SEC_ADD_NAMED"] = "SHOPENTRY"
                        }
                    }
                }
            }
        }
    }
}