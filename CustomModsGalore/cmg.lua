local Mode_Name = 'CustomModsGalore'
local Author = 'Jackty89'
local Custom_Language_Tag = 'CMG'

-- PATHS
local Product_Table_Path = 'METADATA/REALITY/TABLES/NMS_REALITY_GCPRODUCTTABLE.MBIN'
local Technology_Table_Path = 'METADATA/REALITY/TABLES/NMS_REALITY_GCTECHNOLOGYTABLE.MBIN'
local Procedural_Technology_Table_Path = 'METADATA/REALITY/TABLES/NMS_REALITY_GCPROCEDURALTECHNOLOGYTABLE.MBIN'
local Consumable_Item_Table_Path = 'METADATA/REALITY/TABLES/CONSUMABLEITEMTABLE.MBIN'
local Default_Reality_Path = 'METADATA/REALITY/DEFAULTREALITY.MBIN'
local Unlockable_Item_Trees_Path = 'METADATA/REALITY/TABLES/UNLOCKABLEITEMTREES.MBIN'
local English_Path = 'LANGUAGE/NMS_LOC8_ENGLISH.MBIN'

-- Langauge Stuff
local Languages =
{
    EN = 'English',
    FR = 'French',
    IT = 'Italian',
    DE = 'German',
    ES = 'Spanish',
    RU = 'Russian',
    PL = 'Polish',
    NL = 'Dutch',
    PT = 'Portuguese',
    LA = 'LatinAmericanSpanish',
    BR = 'BrazilianPortuguese',
    Z1 = 'SimplifiedChinese',
    ZH = 'TraditionalChinese',
    Z2 = 'TencentChinese',
    KO = 'Korean',
    JA = 'Japanese',
    US = 'USEnglish'
}

local Language_Data =
{
    [Languages.EN] =
    {
        MOD_NAME =
        {
            NAME = 'ModName',
            DESCRIPTION = 'Description',
            SUBTITLE = 'Subtitle'
        },
    }
}

----------------------------------------------------------------------------------------------
-------------------------------     CODE LOGIC START      ------------------------------------
----------------------------------------------------------------------------------------------
NMS_MOD_DEFINITION_CONTAINER =
{
    MOD_FILENAME = Mode_Name..'.pak',
    MOD_DESCRIPTION = 'Custom mods',
    MOD_AUTHOR = Author,
    ADD_FILES = {},
    MODIFICATIONS =
    {
        {
            MBIN_CHANGE_TABLE =
            {
                {
                    MBIN_FILE_SOURCE = Product_Table_Path,
                    EXML_CHANGE_TABLE = {}
                },
                {
                    MBIN_FILE_SOURCE = Technology_Table_Path,
                    EXML_CHANGE_TABLE = {}
                },
                {
                    MBIN_FILE_SOURCE = Procedural_Technology_Table_Path,
                    EXML_CHANGE_TABLE = {}
                },
                {
                    MBIN_FILE_SOURCE = Consumable_Item_Table_Path,
                    EXML_CHANGE_TABLE = {}
                },
                {
                    MBIN_FILE_SOURCE = Default_Reality_Path,
                    EXML_CHANGE_TABLE = {}
                },
                {
                    MBIN_FILE_SOURCE = Unlockable_Item_Trees_Path,
                    EXML_CHANGE_TABLE = {}
                },
                {
                    MBIN_FILE_SOURCE = English_Path,
                    EXML_CHANGE_TABLE = {}
                },
                {
                    MBIN_FILE_SOURCE = 'GCDEBUGOPTIONS.GLOBAL.MBIN',
                    EXML_CHANGE_TABLE =
                    {
                        {
                            PRECEDING_KEY_WORDS = {'LocTableList'},
                            ADD =
                            [[
                                <Property value='NMSString0x20.xml'>
                                    <Property name='Value' value='NMS_]]..Custom_Language_Tag..[[' />
                                </Property>
                            ]]
                        }
                    }
                }
            }
        }
    }
}
local Changes_To_Product_Table = NMS_MOD_DEFINITION_CONTAINER['MODIFICATIONS'][1]['MBIN_CHANGE_TABLE'][1]['EXML_CHANGE_TABLE']
local Changes_To_Technology_Table = NMS_MOD_DEFINITION_CONTAINER['MODIFICATIONS'][1]['MBIN_CHANGE_TABLE'][2]['EXML_CHANGE_TABLE']
local Changes_To_Procedural_Technology_Table = NMS_MOD_DEFINITION_CONTAINER['MODIFICATIONS'][1]['MBIN_CHANGE_TABLE'][3]['EXML_CHANGE_TABLE']
local Changes_To_Consumable_Item_Table = NMS_MOD_DEFINITION_CONTAINER['MODIFICATIONS'][1]['MBIN_CHANGE_TABLE'][4]['EXML_CHANGE_TABLE']
local Changes_To_Default_Reality = NMS_MOD_DEFINITION_CONTAINER['MODIFICATIONS'][1]['MBIN_CHANGE_TABLE'][5]['EXML_CHANGE_TABLE']
local Changes_To_Unlockable_Item_Trees = NMS_MOD_DEFINITION_CONTAINER['MODIFICATIONS'][1]['MBIN_CHANGE_TABLE'][6]['EXML_CHANGE_TABLE']
local Changes_To_Language = NMS_MOD_DEFINITION_CONTAINER['MODIFICATIONS'][1]['MBIN_CHANGE_TABLE'][7]['EXML_CHANGE_TABLE']

----------------------------------------------------------------------------------------------
-------------------------------     Language file creation     -------------------------------
----------------------------------------------------------------------------------------------
local Changes_To_Mbin_Change_Table = NMS_MOD_DEFINITION_CONTAINER.MODIFICATIONS[1].MBIN_CHANGE_TABLE

function Create_Langauge_Masters()
    Changes_To_Language[#Changes_To_Language + 1] =
    {
        PRECEDING_KEY_WORDS = {'TkLocalisationEntry.xml'},
        SEC_SAVE_TO = 'EMPTY_LOCAL_ENTRY_MASTER'
    }
    Changes_To_Language[#Changes_To_Language + 1] =
    {
        SEC_EDIT = 'EMPTY_LOCAL_ENTRY_MASTER',
        VALUE_CHANGE_TABLE =
        {
            {'English', ''}
        }
    }
end

function New_Empty_Language_File(New_Language_File_Name)
    Changes_To_Mbin_Change_Table[#Changes_To_Mbin_Change_Table + 1] =
    {
        MBIN_FILE_SOURCE =
        {
            {'LANGUAGE/NMS_LOC8_ENGLISH.MBIN', New_Language_File_Name}
        }
    }
    Changes_To_Mbin_Change_Table[#Changes_To_Mbin_Change_Table + 1] =
    {
        MBIN_FILE_SOURCE= New_Language_File_Name,
        EXML_CHANGE_TABLE =
        {
            {
                PRECEDING_KEY_WORDS = {'Table'},
                REMOVE = 'SECTION'
            }
        }
    }
    Changes_To_Mbin_Change_Table[#Changes_To_Mbin_Change_Table + 1] =
    {
        MBIN_FILE_SOURCE = New_Language_File_Name,
        EXML_CHANGE_TABLE =
        {
            {
                LINE_OFFSET = {3},
                ADD = [[<Property name='Table'></Property>]]
            }
        }
    }
end

function New_Empty_Langauge_Entries(Language)
    Changes_To_Language[#Changes_To_Language + 1] =
    {
        SEC_EMPTY = Language..'_ENTRIES'
    }
end

function Fill_Custom_Language_File(Language, Language_Values)
    for Language_Base, Language_Texts in pairs(Language_Values) do
        Language_Name_Lc_Id = Language_Base..'_NAME_LC'
        Language_Name_Id = Language_Base..'_NAME'
        Language_Desc_Id = Language_Base..'_DESC'
        Language_Sub_Id = Language_Base..'_SUB'

        Changes_To_Language[#Changes_To_Language + 1] =
        {
            SEC_EDIT = 'EMPTY_LOCAL_ENTRY_MASTER',
            SEC_SAVE_TO = Language_Name_Lc_Id..'_ENTRY'
        }
        Changes_To_Language[#Changes_To_Language + 1] =
        {
            SEC_EDIT = 'EMPTY_LOCAL_ENTRY_MASTER',
            SEC_SAVE_TO = Language_Name_Id..'_ENTRY'
        }
        Changes_To_Language[#Changes_To_Language + 1] =
        {
            SEC_EDIT = 'EMPTY_LOCAL_ENTRY_MASTER',
            SEC_SAVE_TO = Language_Desc_Id..'_ENTRY'
        }
        Changes_To_Language[#Changes_To_Language + 1] =
        {
            SEC_EDIT = 'EMPTY_LOCAL_ENTRY_MASTER',
            SEC_SAVE_TO = Language_Sub_Id..'_ENTRY'
        }
        --change data inside empty tkloc
        Changes_To_Language[#Changes_To_Language + 1] =
        {
            SEC_EDIT = Language_Name_Lc_Id..'_ENTRY',
            VALUE_CHANGE_TABLE =
            {
                {'Id', Language_Name_Lc_Id},
                {Language, Language_Texts.NAME}
            }
        }
        Changes_To_Language[#Changes_To_Language + 1] =
        {
            SEC_EDIT = Language_Name_Id..'_ENTRY',
            VALUE_CHANGE_TABLE =
            {
                {'Id', Language_Name_Id},
                {Language, string.upper(Language_Texts.NAME)}
            }
        }
        Changes_To_Language[#Changes_To_Language + 1] =
        {
            SEC_EDIT = Language_Desc_Id..'_ENTRY',
            VALUE_CHANGE_TABLE = 
            {
                {'Id', Language_Desc_Id},
                {Language, Language_Texts.DESCRIPTION}
            }
        }
        Changes_To_Language[#Changes_To_Language + 1] =
        {
            SEC_EDIT = Language_Sub_Id..'_ENTRY',
            VALUE_CHANGE_TABLE =
            {
                {'Id', Language_Sub_Id},
                {Language, Language_Texts.SUBTITLE}
            }
        }
        -- Add singular entry to entries
        Changes_To_Language[#Changes_To_Language + 1] =
        {
            SEC_EDIT = Language..'_ENTRIES',
            SEC_ADD_NAMED = Language_Name_Lc_Id..'_ENTRY'
        }
        Changes_To_Language[#Changes_To_Language + 1] =
        {
            SEC_EDIT = Language..'_ENTRIES',
            SEC_ADD_NAMED = Language_Name_Id..'_ENTRY'
        }
        Changes_To_Language[#Changes_To_Language + 1] =
        {
            SEC_EDIT = Language..'_ENTRIES',
            SEC_ADD_NAMED = Language_Desc_Id..'_ENTRY'
        }
        Changes_To_Language[#Changes_To_Language + 1] =
        {
            SEC_EDIT = Language..'_ENTRIES',
            SEC_ADD_NAMED = Language_Sub_Id..'_ENTRY'
        }
    end
end

function Add_Custom_Language_String()
    Create_Langauge_Masters()
    for Language , Language_Values in pairs(Language_Data) do
        New_Language_File_Name = 'LANGUAGE/NMS_'..string.upper(Custom_Language_Tag)..'_'..string.upper(Language)..'.MBIN'
        New_Empty_Language_File(New_Language_File_Name)
        New_Empty_Langauge_Entries(Language)
        Fill_Custom_Language_File(Language, Language_Values)

        Changes_To_Mbin_Change_Table[#Changes_To_Mbin_Change_Table + 1] =
        {
            MBIN_FILE_SOURCE = New_Language_File_Name,
            EXML_CHANGE_TABLE =
            {
                {
                    PRECEDING_KEY_WORDS = {'Table'},
                    SEC_ADD_NAMED = Language..'_ENTRIES'
                }
            }
        }
    end
end

Add_Custom_Language_String()
