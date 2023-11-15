ModName = "AddExpeditionTech"
Author = "Jackty89"

UnlockableItemTrees = "METADATA/REALITY/TABLES/UNLOCKABLEITEMTREES.MBIN"
TechnologyTablePath = "METADATA/REALITY/TABLES/NMS_REALITY_GCTECHNOLOGYTABLE.MBIN"

Ids =  {"LAUNCHER_SPEC", "SHIPJUMP_SPEC", "HYPERDRIVE_SPEC"}

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
                    ["MBIN_FILE_SOURCE"] = UnlockableItemTrees,
                    ["EXML_CHANGE_TABLE"] =
                    {
                    }
                },
                {
                    ["MBIN_FILE_SOURCE"] = TechnologyTablePath,
                    ["EXML_CHANGE_TABLE"] =
                    {
                    }
                }
            }
        }
    }
}

TechTable  = NMS_MOD_DEFINITION_CONTAINER["MODIFICATIONS"][1]["MBIN_CHANGE_TABLE"][2]["EXML_CHANGE_TABLE"]
UnlockItemTree  = NMS_MOD_DEFINITION_CONTAINER["MODIFICATIONS"][1]["MBIN_CHANGE_TABLE"][1]["EXML_CHANGE_TABLE"]


function AddTech(id)
    TechTable[#TechTable + 1] =
    {
        ["SPECIAL_KEY_WORDS"] = {"ID", id},
        ["VALUE_CHANGE_TABLE"] =
        {
            {"WikiEnabled", "True"},
            {"FragmentCost", "2500"},
        }
    }
end

function AddTechToTree(id)
    UnlockItemTree[#UnlockItemTree + 1] =
    {
        ["SPECIAL_KEY_WORDS"] = {"Unlockable", "T_WALL_H"},
        ["PRECEDING_KEY_WORDS"] = {"GcUnlockableItemTreeNode.xml"},
        ["SEC_SAVE_TO"] = "UnlockableItemTreeNode"
    }
    UnlockItemTree[#UnlockItemTree + 1] =
    {
        ["SEC_EDIT"] = "UnlockableItemTreeNode",
        ["VALUE_CHANGE_TABLE"] =
        {
            {"Unlockable", id},
        }
    }
    UnlockItemTree[#UnlockItemTree + 1] =
    {
        ["SPECIAL_KEY_WORDS"] = {"Title", "UI_SHIP_TECH_TREE", "Title", "UI_TECH_TREE_SUB","Unlockable", "SHIPJUMP1"},
        ["LINE_OFFSET"] = "+1",
        ["SEC_ADD_NAMED"] = "UnlockableItemTreeNode"
    }
end

for _key, id in pairs(Ids) do
    AddTech(id)
    AddTechToTree(id)
end
