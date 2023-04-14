WORDS_LEARN = 15

CODE_TO_INCLUDE = [[
          <Property value="GcRewardTableItem.xml">
              <Property name="PercentageChance" value="100" />
              <Property name="Reward" value="GcRewardTeachWord.xml">
              <Property name="Race" value="GcAlienRace.xml">
                  <Property name="AlienRace" value="None" />
              </Property>
              <Property name="UseCategory" value="False" />
              <Property name="Category" value="GcWordCategoryTableEnum.xml">
                  <Property name="gcwordcategorytableEnum" value="MISC" />
              </Property>
              <Property name="AmountMin" value="1" />
              <Property name="AmountMax" value="1" />
              </Property>
              <Property name="LabelID" value="" />
          </Property>
]]

CODE_TO_INCLUDE = string.rep(CODE_TO_INCLUDE, WORDS_LEARN -1)

NMS_MOD_DEFINITION_CONTAINER =
{
    ["MOD_FILENAME"] = "LearnMoreWords10.pak",
    ["MOD_AUTHOR"] = "TheJollyDuck with help from AMUMSS and Nexus lua scripts",
    ["MOD_DESCRIPTION"] = "Increases the number of words learned from different sources",
    ["MODIFICATIONS"] =
    {
        {
            ["MBIN_CHANGE_TABLE"] =
            {
                {
                    ["MBIN_FILE_SOURCE"] = "METADATA/REALITY/TABLES/REWARDTABLE.MBIN",
                    ["EXML_CHANGE_TABLE"] =
                    {
                        {
                            ["SPECIAL_KEY_WORDS"] = {"Id", "WORD", "PercentageChance", "IGNORE"},
                            ["REPLACE_TYPE"] = "ADDAFTERSECTION",
                            ["ADD"] = CODE_TO_INCLUDE
                        }
                    }
                }
            }
        }
    }
}