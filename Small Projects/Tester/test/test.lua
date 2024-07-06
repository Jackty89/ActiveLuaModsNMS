ModName = "test"
Author = "Jackty89"

DefaultRealityPath = "METADATA/REALITY/DEFAULTREALITY.MBIN"

NMS_MOD_DEFINITION_CONTAINER =
{
    ["MOD_FILENAME"] = ModName .. ".pak",
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
                            -- ["PRECEDING_FIRST"] = "TRUE",
                            ["PRECEDING_KEY_WORDS"] = {"NeverSellableItems"},
                            ["SPECIAL_KEY_WORDS"] ={"Value","HYPERFUEL1" },
                            ["REMOVE"] = "SECTION"
                        }
                    }
                }
            }
        }
    }
}
