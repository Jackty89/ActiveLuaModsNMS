ModName = "CheapPetSlots"
Author = "Jackty89"

CostTablePath = "METADATA/REALITY/TABLES/COSTTABLE.MBIN"
Cost_List = [[
    <Property name="Costs">
        <Property name="Costs" value="25" />
        <Property name="Costs" value="50" />
        <Property name="Costs" value="75" />
        <Property name="Costs" value="100" />
        <Property name="Costs" value="125" />
        <Property name="Costs" value="150" />
    </Property>
]]

NMS_MOD_DEFINITION_CONTAINER =
{
    MOD_FILENAME = ModName,
    MOD_DESCRIPTION = ModName,
    MOD_AUTHOR = Author,
    MODIFICATIONS =
    {
        {
            MBIN_CHANGE_TABLE =
            {
                {
                    MBIN_FILE_SOURCE = CostTablePath,
                    EXML_CHANGE_TABLE =
                    {
                        {
                            PRECEDING_KEY_WORDS = {"Costs"},
                            SPECIAL_KEY_WORDS = {"Id", "C_PET_SLOT"},
                            REMOVE = "SECTION",
                        },
                        {
                            SPECIAL_KEY_WORDS = {"Id", "C_PET_SLOT", "Cost", "GcCostMoneyList"},
                            PRECEDING_KEY_WORDS = {'GcCostMoneyList'},
                            ADD = Cost_List
                        }
                    }
                }
            }
        }
    }
}