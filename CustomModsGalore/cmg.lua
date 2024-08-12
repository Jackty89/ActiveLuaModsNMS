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

-- LANGUAGE DATA
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
        MOD_NAME2 =
        {
            NAME = 'ModName2',
            DESCRIPTION = 'Description2',
            SUBTITLE = 'Subtitle2'
        },
    }
}

-- CUSTOM TEMPLATES
local Custom_Templates =
{
    TC_SHIPROCKETS =
    {
        Template_Copy_ID = 'T_SHIPGUN',
        Required_Tech = 'SHIPROCKETS',
        Icon_File_Name = 'TEXTURES/UI/FRONTEND/ICONS/TECHNOLOGY/RENDER.ROCKETMOD.DDS',
        Group = 'SHIP_ROCKETS_NAME_L',
        Stats_Type = 'Ship_Weapons_Rockets'
    },
    TC_FLAME =
    {
        Template_Copy_ID = 'T_BOLT',
        Required_Tech = 'FLAME',
        Icon_File_Name = 'TEXTURES/UI/FRONTEND/ICONS/TECHNOLOGY/RENDER.FLAMETHROWER.DDS',
        Group = 'FLAMETHROW_NAME_L',
        Stats_Type = 'Weapon_Flame'
    },
    TC_HAZ =
    {
        Template_Copy_ID = 'T_HAZ',
        Required_Tech = '',
        Icon_File_Name = 'TEXTURES/UI/FRONTEND/ICONS/TECHNOLOGY/RENDER.PROTECTGENERICMOD.DDS',
        Group = 'UI_HAZARD_NAME_CORE_L',
        Stats_Type = 'Suit_Protection'
    }
}

-- CUSTOM UPGRADE TECHNOLOGY
local Custom_Upgrade_Technology = {
    UT_ROCKETS_MISS =
    {
        Technology_Copy_ID = "UT_ROCKETS",
        Required_Tech = "SHIPROCKETS",
        Langauge_Base = "ROCK_TECH1",
        Fragment_Cost = 400,
        Technology_Rarity = 'VeryRare',
        Technology_Category = 'AllShipsExceptAlien',
        File_Name = "TEXTURES/UI/FRONTEND/ICONS/TECHNOLOGY/RENDER.ROCKET.DDS",
        Stat_Bonuses =
        {
            {Stats_Type = 'Ship_Weapons_Guns_BulletsPerShot', Bonus = 3, Level = 2},
            {Stats_Type = 'Ship_Weapons_Guns_Dispersion', Bonus = 7, Level = 1}
        },
        Requirements =
        {
            TECH_COMP = {Type = 'Product', Amount = 5},
            RED2 = {Type = 'Substance', Amount = 100},
            GRENFUEL1 = {Type = 'Product', Amount = 10}
        }
    },
    UT_ROCKETS_COOL =
    {
        Technology_Copy_ID = "UT_ROCKETS",
        Required_Tech = "SHIPROCKETS",
        Langauge_Base = "ROCK_TECH2",
        Fragment_Cost = 600,
        Technology_Rarity = 'VeryRare',
        Technology_Category = 'AllShipsExceptAlien',
        File_Name = "TEXTURES/UI/FRONTEND/ICONS/TECHNOLOGY/RENDER.ROCKET.DDS",
        Stat_Bonuses =
        {
            {Stats_Type = 'Ship_Weapons_Guns_HeatTime', Bonus = 1.5, Level = 3},
            {Stats_Type = 'Ship_Weapons_Guns_CoolTime', Bonus = 1.3, Level = 3},
            {Stats_Type = 'Ship_Weapons_Guns_Rate', Bonus = 1.25, Level = 3}
        },
        Requirements =
        {
            TECH_COMP = {Type = 'Product', Amount = 5},
            GREEN2 = {Type = 'Substance', Amount = 100},
            GRENFUEL1 = {Type = 'Product', Amount = 10}
        }
    },
    UT_ROCKETS_BLAS =
    {
        Technology_Copy_ID = "UT_ROCKETS",
        Required_Tech = "SHIPROCKETS",
        Langauge_Base = "ROCK_TECH3",
        Fragment_Cost = 800,
        Technology_Rarity = 'VeryRare',
        Technology_Category = 'AllShipsExceptAlien',
        File_Name = "TEXTURES/UI/FRONTEND/ICONS/TECHNOLOGY/RENDER.ROCKET.DDS",
        Stat_Bonuses =
        {
            {Stats_Type = 'Ship_Weapons_Guns_Damage_Radius', Bonus = 5, Level = 4}
        },
        Requirements =
        {
            TECH_COMP = {Type = 'Product', Amount = 5},
            BLUE2 = {Type = 'Substance ', Amount = 100},
            GRENFUEL1 = {Type = 'Product', Amount = 10}
        }
    },
    UT_INFRA_BLAS =
    {
        Technology_Copy_ID = "UT_SHIPMINI",
        Required_Tech = "SHIPMINIGUN",
        Langauge_Base = "MINI_TECH1",
        Fragment_Cost = 500,
        Technology_Rarity = 'VeryRare',
        Technology_Category = 'AllShipsExceptAlien',
        File_Name = "TEXTURES/UI/FRONTEND/ICONS/TECHNOLOGY/RENDER.PHOTONACCELMOD.DDS",
        Stat_Bonuses =
        {
            {Stats_Type = 'Ship_Weapons_Guns_Damage_Radius', Bonus = 10, Level = 3}
        },
        Requirements =
        {
            TECH_COMP = {Type = 'Product', Amount = 5},
            BLUE2 = {Type = 'Substance ', Amount = 100},
            GRENFUEL1 = {Type = 'Product', Amount = 10}
        }
    },
    UT_HYPER_BEYOND =
    {
        Technology_Copy_ID = "UT_QUICKWARP",
        Required_Tech = "HYPERDRIVE",
        Langauge_Base = "HYPER_BEYOND",
        Fragment_Cost = 25000,
        Technology_Rarity = 'VeryRare',
        Technology_Category = 'AllShipsExceptAlien',
        File_Name = "TEXTURES/UI/FRONTEND/ICONS/TECHNOLOGY/RENDER.HYPERDRIVEMOD.DDS",
        Stat_Bonuses =
        {
            {Stats_Type = 'Ship_Hyperdrive_JumpDistance', Bonus = 100000, Level = 4}
        },
        Requirements =
        {
            TECH_COMP = {Type = 'Product', Amount = 5},
            BLUE2 = {Type = 'Substance ', Amount = 100},
            HYPERFUEL2 = {Type = 'Product', Amount = 100}
        }
    },
    UT_FATSGUN =
    {
        Technology_Copy_ID = "UT_SHIPGUN",
        Required_Tech = "SHIPGUN1",
        Langauge_Base = "FATSGUN",
        Fragment_Cost = 500,
        Technology_Rarity = 'VeryRare',
        Technology_Category = 'AllShipsExceptAlien',
        File_Name = "TEXTURES/UI/FRONTEND/ICONS/TECHNOLOGY/RENDER.SHIPPROJECTILE1MOD.DDS",
        Stat_Bonuses =
        {
            {Stats_Type = 'Ship_Weapons_Guns_Scale', Bonus = 2.5, Level = 4},
            {Stats_Type = 'Ship_Weapons_Guns_Damage_Radius', Bonus = 2.5, Level = 4}
        },
        Requirements =
        {
            TECH_COMP = {Type = 'Product', Amount = 5},
            BLUE2 = {Type = 'Substance ', Amount = 100},
            JELLY = {Type = 'Product', Amount = 100}
        }
    },
    UT_HEAT_SGUN =
    {
        Technology_Copy_ID = "UT_SHIPGUN",
        Required_Tech = "SHIPGUN1",
        Langauge_Base = "HEATSGUN",
        Fragment_Cost = 1000,
        Technology_Rarity = 'VeryRare',
        Technology_Category = 'AllShipsExceptAlien',
        File_Name = "TEXTURES/UI/FRONTEND/ICONS/TECHNOLOGY/RENDER.SHIPBLOB.DDS",
        Stat_Bonuses =
        {
            {Stats_Type = 'Ship_Weapons_Guns_HeatTime', Bonus = 0.8, Level = 4}
        },
        Requirements =
        {
            TECH_COMP = {Type = 'Product', Amount = 5},
            COMPOUND3 = {Type = 'Product', Amount = 10},
            COMPOUND6 = {Type = 'Product', Amount = 10}
        }
    },
    UT_HEAT_SLASER =
    {
        Technology_Copy_ID = "UT_SHIPLAS",
        Required_Tech = "SHIPLASER",
        Langauge_Base = "HEATSLASER",
        Fragment_Cost = 1000,
        Technology_Rarity = 'VeryRare',
        Technology_Category = 'AllShipsExceptAlien',
        File_Name = "TEXTURES/UI/FRONTEND/ICONS/TECHNOLOGY/RENDER.SOULLASER.DDS",
        Stat_Bonuses =
        {
            {Stats_Type = 'Ship_Weapons_Lasers_HeatTime', Bonus = 0.8, Level = 4}
        },
        Requirements =
        {
            TECH_COMP = {Type = 'Product', Amount = 5},
            COMPOUND3 = {Type = 'Product', Amount = 10},
            COMPOUND6 = {Type = 'Product', Amount = 10}
        }
    },
    UT_HEAT_SHOT =
    {
        Technology_Copy_ID = "UT_SHIPSHOT",
        Required_Tech = "SHIPSHOTGUN",
        Langauge_Base = "HEATSHOT",
        Fragment_Cost = 1000,
        Technology_Rarity = 'VeryRare',
        Technology_Category = 'AllShipsExceptAlien',
        File_Name = "TEXTURES/UI/FRONTEND/ICONS/TECHNOLOGY/RENDER.PHOTONBLASTMOD.DDS",
        Stat_Bonuses =
        {
            {Stats_Type = 'Ship_Weapons_Guns_HeatTime', Bonus = 0.8, Level = 4},
            {Stats_Type = 'Ship_Weapons_Guns_CoolTime', Bonus = 0.8, Level = 4}
        },
        Requirements =
        {
            TECH_COMP = {Type = 'Product', Amount = 5},
            COMPOUND3 = {Type = 'Product', Amount = 10},
            COMPOUND6 = {Type = 'Product', Amount = 10}
        }
    },
    UT_SUPER_SHOT =
    {
        Technology_Copy_ID = "UT_SHIPSHOT",
        Required_Tech = "SHIPSHOTGUN",
        Langauge_Base = "SUPERSHOT",
        Fragment_Cost = 25000,
        Technology_Rarity = 'VeryRare',
        Technology_Category = 'AllShipsExceptAlien',
        File_Name = "TEXTURES/UI/FRONTEND/ICONS/TECHNOLOGY/RENDER.PHOTONBLASTMOD.DDS",
        Stat_Bonuses =
        {
            {Stats_Type = 'Ship_Weapons_Guns_BulletsPerShot', Bonus = 50, Level = 4},
            {Stats_Type = 'Ship_Weapons_Guns_Range', Bonus = 0, Level = 4},
            {Stats_Type = 'Ship_Weapons_Guns_Dispersion', Bonus = 1.5, Level = 4}
        },
        Requirements =
        {
            TECH_COMP = {Type = 'Product', Amount = 5},
            BLUE2 = {Type = 'Substance ', Amount = 500},
            COMPOUND4 = {Type = 'Product', Amount = 10}
        }
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
-- local Changes_To_Default_Reality = NMS_MOD_DEFINITION_CONTAINER['MODIFICATIONS'][1]['MBIN_CHANGE_TABLE'][4]['EXML_CHANGE_TABLE']
-- local Changes_To_Unlockable_Item_Trees = NMS_MOD_DEFINITION_CONTAINER['MODIFICATIONS'][1]['MBIN_CHANGE_TABLE'][5]['EXML_CHANGE_TABLE']
local Changes_To_Language = NMS_MOD_DEFINITION_CONTAINER['MODIFICATIONS'][1]['MBIN_CHANGE_TABLE'][6]['EXML_CHANGE_TABLE']

----------------------------------------------------------------------------------------------
-------------------------------     Creating Matsers and Templates     -----------------------
----------------------------------------------------------------------------------------------
function Create_Masters_Sec()
    Changes_To_Product_Table[#Changes_To_Product_Table + 1] =
    {
        SEC_EMPTY = 'PRODUCT_SEC_MASTER'
    }
    Changes_To_Technology_Table[#Changes_To_Technology_Table + 1] =
    {
        SEC_EMPTY = 'TECHNOLOGY_SEC_MASTER'
    }
    Changes_To_Procedural_Technology_Table[#Changes_To_Procedural_Technology_Table + 1] =
    {
        SEC_EMPTY = 'PROCEDURAL_SEC_MASTER'
    }
end

function Add_Masters_Sec()
    Changes_To_Product_Table[#Changes_To_Product_Table + 1] =
    {
        PRECEDING_KEY_WORDS = {'Table'},
        SEC_ADD_NAMED = 'PRODUCT_SEC_MASTER'
    }
    Changes_To_Technology_Table[#Changes_To_Technology_Table + 1] =
    {
        PRECEDING_KEY_WORDS = {'Table'},
        SEC_ADD_NAMED = 'TECHNOLOGY_SEC_MASTER'
    }
    Changes_To_Procedural_Technology_Table[#Changes_To_Procedural_Technology_Table + 1] =
    {
        PRECEDING_KEY_WORDS = {'Table'},
        SEC_ADD_NAMED = 'PROCEDURAL_SEC_MASTER'
    }
end
----------------------------------------------------------------------------------------------
-------------------------------     Creating Requirements     --------------------------------
----------------------------------------------------------------------------------------------
function Create_Requirement(Requirement_ID, Requirement_Inventory_Type, Requirement_Amount)
    Changes_To_Product_Table[#Changes_To_Product_Table + 1] =
    {
        SPECIAL_KEY_WORDS = {"ID", "CASING"},
        PRECEDING_KEY_WORDS = {"GcTechnologyRequirement.xml"},
        SEC_SAVE_TO = "SINGLE_REQ"
    }
    Changes_To_Product_Table[#Changes_To_Product_Table + 1] =
    {
        SEC_EDIT = "SINGLE_REQ",
        VALUE_CHANGE_TABLE =
        {
            {"ID", Requirement_ID},
            {"InventoryType", Requirement_Inventory_Type},
            {"Amount", Requirement_Amount}
        }
    }
    Changes_To_Product_Table[#Changes_To_Product_Table + 1] =
    {
        SEC_EDIT = "REQUIREMENTS_MASTER",
        ADD_OPTION = "ADDafterSECTION",
        SEC_ADD_NAMED = "SINGLE_REQ"
    }
end

function Create_Requirement_Sections(Requirements)
    Changes_To_Product_Table[#Changes_To_Product_Table + 1] =
    {
        SEC_EMPTY = "REQUIREMENTS_MASTER"
    }

    for requirement_id, requirement_values in pairs(Requirements) do
        Create_Requirement(requirement_id, requirement_values.Type, requirement_values.Amount)
    end
end
----------------------------------------------------------------------------------------------
-------------------------------     Creating Stat Bonuses     --------------------------------
----------------------------------------------------------------------------------------------
function Create_Stat_Bonus(stat_bonus)
    Changes_To_Technology_Table[#Changes_To_Technology_Table + 1] =
    {
        SPECIAL_KEY_WORDS = {"ID", "UT_SHIPLAS"},
        PRECEDING_KEY_WORDS = {"GcStatsBonus.xml"},
        SEC_SAVE_TO = "SINGLE_STATBONUS"
    }
    Changes_To_Technology_Table[#Changes_To_Technology_Table + 1] =
    {
        SEC_EDIT = "SINGLE_STATBONUS",
        VALUE_CHANGE_TABLE =
        {
            {"StatsType", stat_bonus.Stats_Type},
            {"Bonus", stat_bonus.Bonus},
            {"Level", stat_bonus.Level}
        }
    }
    Changes_To_Technology_Table[#Changes_To_Technology_Table + 1] =
    {
        SEC_EDIT = "STATBONUSES_MASTER",
        ADD_OPTION = "ADDafterSECTION",
        SEC_ADD_NAMED = "SINGLE_STATBONUS"
    }
end

function Create_Stat_Bonus_Sections(Stat_Bonuses)
    Changes_To_Technology_Table[#Changes_To_Technology_Table + 1] =
    {
        SEC_EMPTY = "STATBONUSES_MASTER"
    }

    for i = 1, #Stat_Bonuses do
        Create_Stat_Bonus(Stat_Bonuses[i])
    end
end
----------------------------------------------------------------------------------------------
-------------------------------     Creating new Technology Templates     --------------------
----------------------------------------------------------------------------------------------
function Create_New_Technology_Templates()
    for template_id, template_values in pairs(Custom_Templates) do
        Changes_To_Technology_Table[#Changes_To_Technology_Table + 1] =
        {
            SPECIAL_KEY_WORDS = {'ID', template_values.Template_Copy_ID},
            SEC_SAVE_TO = template_id..'_TEMPLATE'
        }
        Changes_To_Technology_Table[#Changes_To_Technology_Table + 1] =
        {
            SEC_EDIT = template_id..'_TEMPLATE',
            VALUE_CHANGE_TABLE =
            {
                {'ID', template_id},
                {'Group', template_values.Group},
                {'Filename', template_values.Icon_File_Name},
                {'RequiredTech', template_values.Required_Tech},
                {'StatsType', template_values.Stats_Type}
            }
        }
        Changes_To_Technology_Table[#Changes_To_Technology_Table + 1] =
        {
            SEC_EDIT = 'TECHNOLOGY_SEC_MASTER',
            SEC_ADD_NAMED = template_id..'_TEMPLATE'
        }
    end
end
----------------------------------------------------------------------------------------------
-------------------------------     Creating new Technologies     ----------------------------
----------------------------------------------------------------------------------------------
function Create_New_Technology()
    for new_technology_id, technology_data in pairs(Custom_Upgrade_Technology) do
        Changes_To_Technology_Table[#Changes_To_Technology_Table + 1] =
        {
            SPECIAL_KEY_WORDS = {'ID', technology_data.Technology_Copy_ID},
            SEC_SAVE_TO = new_technology_id..'_TECHSEC'
        }
        Changes_To_Technology_Table[#Changes_To_Technology_Table + 1] =
        {
            SEC_EDIT = new_technology_id..'_TECHSEC',
            VALUE_CHANGE_TABLE =
            {
                {'ID', new_technology_id},
                {'Name', technology_data.Langauge_Base.."_NAME"},
                {'NameLower', technology_data.Langauge_Base.."_NAME_LC"},
                {'Description', technology_data.Langauge_Base.."_DESC"},
                {'Subtitle', technology_data.Langauge_Base.."_SUB"},
                {'Filename', technology_data.File_Name},
                {'RequiredTech', technology_data.Required_Tech},
            }
        }
        Changes_To_Technology_Table[#Changes_To_Technology_Table + 1] =
        {
            SEC_EDIT = new_technology_id..'_TECHSEC',
            PRECEDING_KEY_WORDS = {"GcTechnologyRequirement.xml"},
            REPLACE_TYPE = "ALL",
            REMOVE = "SECTION"
        }
        Changes_To_Technology_Table[#Changes_To_Technology_Table + 1] =
        {
            SEC_EDIT = new_technology_id..'_TECHSEC',
            PRECEDING_KEY_WORDS = {"GcStatsBonus.xml"},
            REPLACE_TYPE = "ALL",
            REMOVE = "SECTION"
        }

        Create_Requirement_Sections(technology_data.Requirements)
        Changes_To_Technology_Table[#Changes_To_Technology_Table + 1] =
        {
            SEC_EDIT = new_technology_id..'_TECHSEC',
            PRECEDING_KEY_WORDS = {"Requirements"},
            CREATE_HOS = "TRUE",
            SEC_ADD_NAMED = "REQUIREMENTS_MASTER"
        }

        Create_Stat_Bonus_Sections(technology_data.Stat_Bonuses)
        Changes_To_Technology_Table[#Changes_To_Technology_Table + 1] =
        {
            SEC_EDIT = new_technology_id..'_TECHSEC',
            PRECEDING_KEY_WORDS = {"StatBonuses"},
            CREATE_HOS = "TRUE",
            SEC_ADD_NAMED = "STATBONUSES_MASTER"
        }

        Changes_To_Technology_Table[#Changes_To_Technology_Table + 1] =
        {
            SEC_EDIT = 'TECHNOLOGY_SEC_MASTER',
            SEC_ADD_NAMED = new_technology_id..'_TECHSEC'
        }
    end
end
----------------------------------------------------------------------------------------------
-------------------------------     Creating Custom Deplobale Mods     -----------------------
----------------------------------------------------------------------------------------------
--todo
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
                ADD = [[<Property name="Table"></Property>]]
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

Create_Masters_Sec()
-- Create_New_Technology_Templates()

Create_New_Technology()


Add_Masters_Sec()

-- Add_Custom_Language_String()
