-- TO DO
-- For each shipe type
--     create a for each class
--         and for each weapontype a master that only need seed + slots as edit during the 10k loop
-- Sec-save that to SHIP master (use  list for the math rand with sec-names)
-- Reduce pricing (done) price are slashed

-- 00:10:18 for 1k seeds VS 00:01:49 for 1k on V3
-- : : for 10k VS +5hs for 10k OnV3
local Total_Seeds_Per_Class = 10000
local Input_Total_Seeds_Per_Class = {Total_Seeds_Per_Class,
[[
    How many seeds do you wish to generate per Class-Type?
    Default = ]]..Total_Seeds_Per_Class..[[ = >> ]].. Total_Seeds_Per_Class ..[[ <<
]]}
Total_Seeds_Per_Class = GUIF(Input_Total_Seeds_Per_Class, 10)

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
        CL_BFREIGH =
        {
            NAME = 'H.G. Corp. Freighter',
            DESCRIPTION = 'H.G. Corp. Spacecraft Dynamics Freighter',
            SUBTITLE = 'H.G. Corp. Freighter'
        },
        CL_BHAUL =
        {
            NAME = 'H.G. Corp. Hauler',
            DESCRIPTION = 'H.G. Corp. Spacecraft Dynamics Hauler',
            SUBTITLE = 'H.G. Corp. Hauler'
        },
        CL_BEXPLO =
        {
            NAME = 'H.G. Corp. Explorer',
            DESCRIPTION = 'H.G. Corp. Spacecraft Dynamics Explorer',
            SUBTITLE = 'H.G. Corp. Explorer'
        },
        CL_BSOLAR =
        {
            NAME = 'H.G. Corp. Solar',
            DESCRIPTION = 'H.G. Corp. Spacecraft Dynamics Solar',
            SUBTITLE = 'H.G. Corp. Solar'
        },
        CL_BFIGHT =
        {
            NAME = 'H.G. Corp. Fighter',
            DESCRIPTION = 'H.G. Corp. Spacecraft Dynamics Fighter',
            SUBTITLE = 'H.G. Corp. Fighter'
        },
        CL_BSHUT =
        {
            NAME = 'H.G. Corp. Shuttle',
            DESCRIPTION = 'H.G. Corp. Spacecraft Dynamics Shuttle',
            SUBTITLE = 'H.G. Corp. Shuttle'
        },
        CL_BROYAL =
        {
            NAME = 'H.G. Corp. Exotic',
            DESCRIPTION = 'H.G. Corp. Spacecraft Dynamics Exotic',
            SUBTITLE = 'H.G. Corp. Exotic'
        },
        CL_BALIEN =
        {
            NAME = 'H.G. Corp. Bioship',
            DESCRIPTION = 'H.G. Corp. Spacecraft Dynamics Bioship',
            SUBTITLE = 'H.G. Corp. Bioship'
        },
        CL_BROBOT =
        {
            NAME = 'H.G. Corp. Sentinel Ship',
            DESCRIPTION = 'H.G. Corp. Spacecraft Dynamics Sentinel Ship',
            SUBTITLE = 'H.G. Corp. Sentinel Ship'
        },
        CL_STORE =
        {
            NAME = 'H.G. Corp. Spacecraft Dynamics',
            DESCRIPTION = 'Spacecraft constucted by H.G. Corp.',
            SUBTITLE = 'H.G. Corp. Spacecraft Dynamics'
        }
    }
}

local Classes = {'C', 'B', 'A', 'S'}
local Price_Multiplier = 1

local Price_Multiplier_Per_Class =
{
    C = 1,
    B = 2,
    A = 4,
    S = 8
}

local Technologies =
{
    SOLAR_SAIL = {ID = 'SOLAR_SAIL', AMOUNT = 200, MAXAMOUNT = 200},
    SHIPJUMP1 = {ID = 'SHIPJUMP1', AMOUNT = 200, MAXAMOUNT = 200},
    SHIPSHIELD = {ID = 'SHIPSHIELD', AMOUNT = 200, MAXAMOUNT = 200},
    LAUNCHER = {ID = 'LAUNCHER', AMOUNT = 200, MAXAMOUNT = 200},
    HYPERDRIVE = {ID = 'HYPERDRIVE', AMOUNT = 100, MAXAMOUNT = 100},
    SHIPGUN1 = {ID = 'SHIPGUN1', AMOUNT = 200, MAXAMOUNT = 200},
    SHIPLAS1 = {ID = 'SHIPLAS1', AMOUNT = 200, MAXAMOUNT = 200},
    SHIPMINIGUN = {ID = 'SHIPMINIGUN', AMOUNT = 200, MAXAMOUNT = 200},
    SHIPPLASMA = {ID = 'SHIPPLASMA', AMOUNT = 200, MAXAMOUNT = 200},
    SHIPROCKETS = {ID = 'SHIPROCKETS', AMOUNT = 200, MAXAMOUNT = 200},
    SHIPSHOTGUN = {ID = 'SHIPSHOTGUN', AMOUNT = 200, MAXAMOUNT = 200},
    SHIPJUMP_ALIEN = {ID = 'SHIPJUMP_ALIEN', AMOUNT = 200, MAXAMOUNT = 200},
    SHIPGUN_ALIEN = {ID = 'SHIPGUN_ALIEN', AMOUNT = 100, MAXAMOUNT = 100},
    SHIELD_ALIEN = {ID = 'SHIELD_ALIEN', AMOUNT = 200, MAXAMOUNT = 200},
    SHIPLAS_ALIEN = {ID = 'SHIPLAS_ALIEN', AMOUNT = 100, MAXAMOUNT = 100},
    LAUNCHER_ALIEN = {ID = 'LAUNCHER_ALIEN', AMOUNT = 200, MAXAMOUNT = 200},
    WARP_ALIEN = {ID = 'WARP_ALIEN', AMOUNT = 120, MAXAMOUNT = 120},
    SHIPJUMP_ROBO = {ID = 'SHIPJUMP_ROBO', AMOUNT = 200, MAXAMOUNT = 200},
    SHIPSHIELD_ROBO = {ID = 'SHIPSHIELD_ROBO', AMOUNT = 200, MAXAMOUNT = 200},
    LAUNCHER_ROBO = {ID = 'LAUNCHER_ROBO', AMOUNT = 200, MAXAMOUNT = 200},
    HYPERDRIVE_ROBO = {ID = 'HYPERDRIVE_ROBO', AMOUNT = 200, MAXAMOUNT = 200},
    LIFESUP_ROBO = {ID = 'LIFESUP_ROBO', AMOUNT = 100, MAXAMOUNT = 100},
    SHIPGUN_ROBO = {ID = 'SHIPGUN_ROBO', AMOUNT = 200, MAXAMOUNT = 200},
    F_HYPERDRIVE = {ID = 'F_HYPERDRIVE', AMOUNT = 200, MAXAMOUNT = 200},
}

local Ship_Type_Data =
{
    Scientific = {
        TECHNOLOGIES = {
            Technologies.SHIPJUMP1,
            Technologies.SHIPSHIELD,
            Technologies.LAUNCHER,
            Technologies.HYPERDRIVE,
        },
        WEAPONS = {
            Technologies.SHIPGUN1,
            Technologies.SHIPLAS1,
            Technologies.SHIPMINIGUN,
            Technologies.SHIPPLASMA,
            Technologies.SHIPROCKETS,
            Technologies.SHIPSHOTGUN,
        },
        BASEPRICE = 100000,
        SHIP_MODEL = 'MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SCIENTIFIC_PROC.SCENE.MBIN',
        LANGUAGE_STRING = 'CL_BEXPLO',
    },
    Dropship = {
        TECHNOLOGIES = {
            Technologies.SHIPJUMP1,
            Technologies.SHIPSHIELD,
            Technologies.LAUNCHER,
            Technologies.HYPERDRIVE,
        },
        WEAPONS = {
            Technologies.SHIPGUN1,
            Technologies.SHIPLAS1,
            Technologies.SHIPMINIGUN,
            Technologies.SHIPPLASMA,
            Technologies.SHIPROCKETS,
            Technologies.SHIPSHOTGUN,
        },
        BASEPRICE = 150000,
        SHIP_MODEL = 'MODELS/COMMON/SPACECRAFT/DROPSHIPS/DROPSHIP_PROC.SCENE.MBIN',
        LANGUAGE_STRING = 'CL_BHAUL',
    },
    Fighter = {
        TECHNOLOGIES = {
            Technologies.SHIPJUMP1,
            Technologies.SHIPSHIELD,
            Technologies.LAUNCHER,
            Technologies.HYPERDRIVE,
        },
        WEAPONS = {
            Technologies.SHIPGUN1,
            Technologies.SHIPLAS1,
            Technologies.SHIPMINIGUN,
            Technologies.SHIPPLASMA,
            Technologies.SHIPROCKETS,
            Technologies.SHIPSHOTGUN,
        },
        BASEPRICE = 150000,
        SHIP_MODEL = 'MODELS/COMMON/SPACECRAFT/FIGHTERS/FIGHTER_PROC.SCENE.MBIN',
        LANGUAGE_STRING = 'CL_BFIGHT',
    },
    Shuttle = {
        TECHNOLOGIES = {
            Technologies.SHIPJUMP1,
            Technologies.SHIPSHIELD,
            Technologies.LAUNCHER,
            Technologies.HYPERDRIVE,
        },
        WEAPONS = {
            Technologies.SHIPGUN1,
            Technologies.SHIPLAS1,
            Technologies.SHIPMINIGUN,
            Technologies.SHIPPLASMA,
            Technologies.SHIPROCKETS,
            Technologies.SHIPSHOTGUN,
        },
        BASEPRICE = 100000,
        SHIP_MODEL = 'MODELS/COMMON/SPACECRAFT/SHUTTLE/SHUTTLE_PROC.SCENE.MBIN',
        LANGUAGE_STRING = 'CL_BSHUT',
    },
    Sail = {
        TECHNOLOGIES = {
            Technologies.SHIPJUMP1,
            Technologies.SHIPSHIELD,
            Technologies.LAUNCHER,
            Technologies.HYPERDRIVE,
            Technologies.SOLAR_SAIL
        },
        WEAPONS = {
            Technologies.SHIPGUN1,
            Technologies.SHIPLAS1,
            Technologies.SHIPMINIGUN,
            Technologies.SHIPPLASMA,
            Technologies.SHIPROCKETS,
            Technologies.SHIPSHOTGUN,
        },
        BASEPRICE = 150000,
        SHIP_MODEL = 'MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIP_PROC.SCENE.MBIN',
        LANGUAGE_STRING = 'CL_BSHUT',
    },
    Royal = {
        TECHNOLOGIES = {
            Technologies.SHIPJUMP1,
            Technologies.SHIPSHIELD,
            Technologies.LAUNCHER,
            Technologies.HYPERDRIVE,
        },
        WEAPONS = {
            Technologies.SHIPGUN1,
            Technologies.SHIPLAS1,
            Technologies.SHIPMINIGUN,
            Technologies.SHIPPLASMA,
            Technologies.SHIPROCKETS,
            Technologies.SHIPSHOTGUN,
        },
        BASEPRICE = 250000,
        SHIP_MODEL = 'MODELS/COMMON/SPACECRAFT/S-CLASS/S-CLASS_PROC.SCENE.MBIN',
        LANGUAGE_STRING = 'CL_BROYAL',
    },
    Robot = {
        TECHNOLOGIES = {
            Technologies.LIFESUP_ROBO,
            Technologies.SHIPSHIELD_ROBO,
            Technologies.LAUNCHER_ROBO,
            Technologies.SHIPJUMP_ROBO,
            Technologies.HYPERDRIVE_ROBO
        },
        WEAPONS = {
            Technologies.SHIPGUN_ROBO,
        },
        BASEPRICE = 150000,
        SHIP_MODEL = 'MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELSHIP_PROC.SCENE.MBIN',
        LANGUAGE_STRING = 'CL_BROBOT',
    },
    Alien = {
        TECHNOLOGIES = {
            Technologies.SHIPJUMP_ALIEN,
            Technologies.SHIELD_ALIEN,
            Technologies.LAUNCHER_ALIEN,
            Technologies.WARP_ALIEN,
        },
        WEAPONS = {
            Technologies.SHIPGUN_ALIEN,
            Technologies.SHIPLAS_ALIEN,
        },
        BASEPRICE = 200000,
        SHIP_MODEL = 'MODELS/COMMON/SPACECRAFT/S-CLASS/BIOPARTS/BIOSHIP_PROC.SCENE.MBIN',
        LANGUAGE_STRING = 'CL_BALIEN',
    }
}

local Ship_Type_Reward_Entries = {}
--TODO
-- Freighter_Type_Data = {
--     MODELCAPITAL = {
--         TECHNOLOGIES = {
--             Technologies.F_HYPERDRIVE
--         }
--     }
-- }
-- Frigate_Type_Data = {
--     FRIGATETYPE = {
--         TECHNOLOGIES = {
--             Technologies.F_HYPERDRIVE
--         }
--     }
-- }


for Key, _Value in pairs(Ship_Type_Data) do
    local Choice = true
    Input_Choice = {Choice,
    [[
        Would you like add ]]..Key..[[?
        Default = Y | Current = >> ]].. (Choice and "Y" or "N") ..[[ <<
    ]]}
    Choice = GUIF(Input_Choice, 10)

    if Choice == false then
        Ship_Type_Data[Key] = nil
    end
end

if next(Ship_Type_Data) == nil then
    print("[WARNING][ShipStore]: Table is empty adding royal!")
    Ship_Type_Data =
    {
        Royal = {
            TECHNOLOGIES = {
                Technologies.SHIPJUMP1,
                Technologies.SHIPSHIELD,
                Technologies.LAUNCHER,
                Technologies.HYPERDRIVE,
            },
            WEAPONS = {
                Technologies.SHIPGUN1,
                Technologies.SHIPLAS1,
                Technologies.SHIPMINIGUN,
                Technologies.SHIPPLASMA,
                Technologies.SHIPROCKETS,
                Technologies.SHIPSHOTGUN,
            },
            BASEPRICE = 250000,
            SHIP_MODEL = 'MODELS/COMMON/SPACECRAFT/S-CLASS/S-CLASS_PROC.SCENE.MBIN',
            LANGUAGE_STRING = 'CL_BROYAL',
        }
    }
end

print("[ShipStore]: Chosen Shiptypes")
for Key, _Value in pairs(Ship_Type_Data) do
    print("Ship type: ", Key)
end

Class_Choice = 1

Input_Class_Choice = {Class_Choice,
[[
    What class index do upu start at wish?
    * 1 = C -> S
    * 2 = B -> S
    * 3 = A -> S
    * 4 = S
    Default = ]].. Class_Choice ..[[ = >> ]].. Class_Choice ..[[ <<
]]}
Class_Choice = GUIF(Input_Class_Choice, 10)


Input_Price_Multiplier = {Price_Multiplier,
[[
    Do you wish to change the Price multiplier?
    Default = ]].. Price_Multiplier ..[[=>> ]: 
]]}

Price_Multiplier = GUIF(Input_Price_Multiplier, 10)


----------------------------------------------------------------------------------------------
-------------------------------     CODE LOGIC START      ------------------------------------
----------------------------------------------------------------------------------------------
local ModName = "ShipStore"
local Author = "jackty89"
local Custom_Language_Tag = "ShipStore"

NMS_MOD_DEFINITION_CONTAINER =
{
    MOD_FILENAME = ModName..".pak",
    MOD_AUTHOR = Author,
    ADD_FILES = {},
    MODIFICATIONS =
    {
        {
            MBIN_CHANGE_TABLE =
            {
                {
                    MBIN_FILE_SOURCE = "METADATA/REALITY/TABLES/NMS_REALITY_GCPRODUCTTABLE.MBIN",
                    MXML_CHANGE_TABLE =
                    {
                    }
                },
                {
                    MBIN_FILE_SOURCE = "METADATA/REALITY/TABLES/CONSUMABLEITEMTABLE.MBIN",
                    MXML_CHANGE_TABLE =
                    {
                    }
                },
                {
                    MBIN_FILE_SOURCE = "METADATA/REALITY/TABLES/REWARDTABLE.MBIN",
                    MXML_CHANGE_TABLE =
                    {
                    }
                },
                {
                    MBIN_FILE_SOURCE = "METADATA/REALITY/DEFAULTREALITY.MBIN",
                    MXML_CHANGE_TABLE =
                    {
                    }
                },
                {
                    MBIN_FILE_SOURCE = 'LANGUAGE/NMS_LOC8_ENGLISH.MBIN',
                    MXML_CHANGE_TABLE = {}
                },
                {
                    MBIN_FILE_SOURCE = "GCDEBUGOPTIONS.GLOBAL.MBIN",
                    MXML_CHANGE_TABLE =
                    {
                        {
                            PRECEDING_KEY_WORDS = {"LocTableList"},
                            ADD =
                            [[
                                <Property value="NMSString0x20.xml">
                                    <Property name="Value" value="NMS_]]..Custom_Language_Tag..[[" />
                                </Property>
                            ]]
                        }
                    }
                }
            }
        }
    }
}


local Changes_To_Product_Table = NMS_MOD_DEFINITION_CONTAINER["MODIFICATIONS"][1]["MBIN_CHANGE_TABLE"][1]["MXML_CHANGE_TABLE"]
local Changes_To_Consumable_Item_Table = NMS_MOD_DEFINITION_CONTAINER["MODIFICATIONS"][1]["MBIN_CHANGE_TABLE"][2]["MXML_CHANGE_TABLE"]
local Changes_To_Reward_Table = NMS_MOD_DEFINITION_CONTAINER["MODIFICATIONS"][1]["MBIN_CHANGE_TABLE"][3]["MXML_CHANGE_TABLE"]
local Changes_To_Default_Reality = NMS_MOD_DEFINITION_CONTAINER["MODIFICATIONS"][1]["MBIN_CHANGE_TABLE"][4]["MXML_CHANGE_TABLE"]
local Changes_To_Language = NMS_MOD_DEFINITION_CONTAINER['MODIFICATIONS'][1]['MBIN_CHANGE_TABLE'][5]['MXML_CHANGE_TABLE']

--NEW/EDIT from V3
function Create_Ship_Reward_Entry_Template()
    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        SPECIAL_KEY_WORDS = {"Id", "R_SWIT_SHIP01", "List", "GcRewardTableItem"},
        SEC_SAVE_TO = "COPY_SHIP_ENTRY_SEC"
    }
    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        SEC_EDIT = "COPY_SHIP_ENTRY_SEC",
        VALUE_CHANGE_TABLE =
        {
            {"PercentageChance", "100"}
        }
    }
    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        SEC_EDIT = "COPY_SHIP_ENTRY_SEC",
        SPECIAL_KEY_WORDS = {"Slots", "GcInventoryElement"},
        REPLACE_TYPE = "ALL",
        REMOVE = "SECTION"
    }
    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        SEC_EDIT = "COPY_SHIP_ENTRY_SEC",
        PRECEDING_KEY_WORDS = {"Reward"},
        VALUE_CHANGE_TABLE =
        {
            {"NameOverride", "CL_STORE_DESC"}
        }
    }
end

function Create_Technology_Template(template_name, technology_id, technology_amount, technology_maxamount)
    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        SPECIAL_KEY_WORDS = {"Id", "R_SWIT_SHIP01", "Slots", "GcInventoryElement"},
        SEC_SAVE_TO = template_name
    }
    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        SEC_EDIT = template_name,
        VALUE_CHANGE_TABLE =
        {
            {"Id", technology_id},
            {"Amount", technology_amount},
            {"MaxAmount", technology_maxamount}
        }
    }
end

function Create_Technology_Templates()
    for technology_id, tech_values in pairs(Technologies) do
        local template_name = technology_id..'_TEMPLATE'
        local technology_amount = tech_values.AMOUNT
        local technology_maxamount = tech_values.MAXAMOUNT
        Create_Technology_Template(template_name, technology_id, technology_amount, technology_maxamount)
    end
end

--Bases stats needed to assign Alien/robot property to specific ships
function Create_Ship_Base_Stats(ship_type)
    if ship_type == 'Alien' then
        return [[
            <Property value="GcInventoryBaseStatEntry.xml">
                <Property name="BaseStatID" value="ALIEN_SHIP" />
                <Property name="Value" value="1" />
            </Property>
        ]]
    end

    if ship_type == 'Robot' then
        return [[
            <Property value="GcInventoryBaseStatEntry.xml">
                <Property name="BaseStatID" value="ROBOT_SHIP" />
                <Property name="Value" value="1" />
            </Property>
        ]]
    end

    return [[]]
end

function Create_Ship_Type_Reward_Template(ship_type_template_name, ship_type, ship_class, ship_model, ship_technologies, weapon_id)
    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        SEC_EDIT = "COPY_SHIP_ENTRY_SEC",
        SEC_SAVE_TO = ship_type_template_name
    }
    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        SEC_EDIT = ship_type_template_name,
        SPECIAL_KEY_WORDS = {"ShipResource", "GcResourceElement"},
        VALUE_CHANGE_TABLE =
        {
            {"Filename", ship_model}
        }
    }
    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        SEC_EDIT = ship_type_template_name,
        PRECEDING_KEY_WORDS = {"ShipInventory", "Class"},
        VALUE_CHANGE_TABLE =
        {
            {"InventoryClass", ship_class}
        }
    }
    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        SEC_EDIT = ship_type_template_name,
        PRECEDING_KEY_WORDS = {"ShipType"},
        VALUE_CHANGE_TABLE =
        {
            {"ShipClass", ship_type}
        }
    }

    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        SEC_EDIT = ship_type_template_name,
        PRECEDING_KEY_WORDS = {"ShipInventory", "Slots"},
        SEC_ADD_NAMED = weapon_id..'_TEMPLATE'
    }

    for _ship_tech, ship_tech_data in pairs(ship_technologies) do
        Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
        {
            SEC_EDIT = ship_type_template_name,
            PRECEDING_KEY_WORDS = {"ShipInventory", "Slots"},
            SEC_ADD_NAMED = ship_tech_data.ID..'_TEMPLATE'
        }
    end

    if ship_type == 'Alien' or  ship_type == 'Robot' then
        local ship_base_stats = Create_Ship_Base_Stats(ship_type)
        Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
        {
            SEC_EDIT = ship_type_template_name,
            PRECEDING_KEY_WORDS = {'ShipInventory', 'BaseStatValues'},
            CREATE_HOS = 'TRUE',
            ADD = ship_base_stats
        }
    end
end

function Create_Ship_Templates()
    for ship_type, ship_data in pairs(Ship_Type_Data) do
        Ship_Type_Reward_Entries[ship_type] = {}

        local index_start = Class_Choice
        local ship_model = ship_data.SHIP_MODEL
        local ship_base_price = ship_data.BASEPRICE
        local ship_language_string = ship_data.LANGUAGE_STRING
        local ship_technologies = ship_data.TECHNOLOGIES
        local ship_weapons = ship_data.WEAPONS

        if ship_type =='Royal' or ship_type =='Alien' then
            index_start = 4
        end

        Ship_Type_Reward_Entries[ship_type].LANGUAGE_STRING = ship_language_string
        for i = index_start, #Classes do
            local ship_price = (ship_base_price * Price_Multiplier_Per_Class[Classes[i]]) * Price_Multiplier
            Ship_Type_Reward_Entries[ship_type].CLASSDATA = {[Classes[i]] = {}}
            Ship_Type_Reward_Entries[ship_type].CLASSDATA[Classes[i]].PRICE = ship_price
            Ship_Type_Reward_Entries[ship_type].CLASSDATA[Classes[i]].TEMPLATES = {}
            for _weapon_id, weapon_data in pairs(ship_weapons) do
                -- Figher_S_SHIPGUN_TEMPLATE
                local ship_type_template_name = ship_type..'_'..Classes[i]..'_'..weapon_data.ID..'_TEMPLATE'
                Create_Ship_Type_Reward_Template(ship_type_template_name, ship_type, Classes[i], ship_model, ship_technologies, weapon_data.ID)

                -- price and lang_string only need when creating product
                table.insert(Ship_Type_Reward_Entries[ship_type].CLASSDATA[Classes[i]].TEMPLATES, ship_type_template_name)
            end
        end
    end
end

function Template_Creation()
    Create_Ship_Reward_Entry_Template()

    Create_Technology_Templates()

    Create_Ship_Templates()
    -- Create_Freighter_Templates()
    -- Create_Frigate_Templates()

end

function Create_New_Product(product_id, product_name, product_name_lc, product_subtitle, product_description,
    product_stack_size, product_value, product_icon)
    Changes_To_Product_Table[#Changes_To_Product_Table + 1] =
    {
        SPECIAL_KEY_WORDS = {"ID", "SENTINEL_LOOT"},
        SEC_SAVE_TO = product_id.."_PRODSEC",
    }
    Changes_To_Product_Table[#Changes_To_Product_Table + 1] =
    {
        SEC_EDIT = product_id.."_PRODSEC",
        VALUE_CHANGE_TABLE =
        {
            {"ID", product_id},
            {"Name", product_name},
            {"NameLower", product_name_lc},
            {"BaseValue", product_value},
            {"StackMultiplier", product_stack_size},
            {"Subtitle", product_subtitle},
            {"Description", product_description},
        }
    }
    Changes_To_Product_Table[#Changes_To_Product_Table + 1] =
    {
        SEC_EDIT = product_id.."_PRODSEC",
        SPECIAL_KEY_WORDS = {"Cost", "GcItemPriceModifiers"},
        VALUE_CHANGE_TABLE =
        {
            {"SpaceStationMarkup", "0"},
            {"LowPriceMod", "0"},
            {"LowPriceMod", "0"},
            {"HighPriceMod", "0"},
            {"BuyBaseMarkup", "0"},
            {"BuyMarkupMod", "0"}
        }
    }
    Changes_To_Product_Table[#Changes_To_Product_Table + 1] =
    {
        SEC_EDIT = product_id.."_PRODSEC",
        SPECIAL_KEY_WORDS = {"Icon", "TkTextureResource"},
        VALUE_CHANGE_TABLE =
        {
            {"Filename", product_icon},
        }
    }
    Changes_To_Product_Table[#Changes_To_Product_Table + 1] =
    {
        SEC_EDIT = product_id.."_PRODSEC",
        SPECIAL_KEY_WORDS = {"HeroIcon", "TkTextureResource"},
        VALUE_CHANGE_TABLE =
        {
            {"Filename", product_icon},
        }
    }

    Changes_To_Product_Table[#Changes_To_Product_Table + 1] =
    {
        SEC_EDIT = "PRODUCT_SEC_MASTER",
        ADD_OPTION = "ADDafterSECTION",
        SEC_ADD_NAMED = product_id.."_PRODSEC"
    }
end

function Create_New_Consumable(consumable_id, reward_id)
    Changes_To_Consumable_Item_Table[#Changes_To_Consumable_Item_Table + 1] =
    {
        SPECIAL_KEY_WORDS = {"ID", "SENTINEL_LOOT"},
        SEC_SAVE_TO = consumable_id.."_CONSSEC"
    }
    Changes_To_Consumable_Item_Table[#Changes_To_Consumable_Item_Table + 1] =
    {
        SEC_EDIT = consumable_id.."_CONSSEC",
        VALUE_CHANGE_TABLE =
        {
            {"ID", consumable_id},
            {"RewardID", reward_id},
        }
    }
    Changes_To_Consumable_Item_Table[#Changes_To_Consumable_Item_Table + 1] =
    {
        SEC_EDIT = "CONSUMABLE_SEC_MASTER",
        ADD_OPTION = "ADDafterSECTION",
        SEC_ADD_NAMED = consumable_id.."_CONSSEC"
    }
end

--This only happens once
function Create_Reward_Table_Entry_Template()
    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        SPECIAL_KEY_WORDS = {"Id", "DE_SENT_LOOT"},
        SEC_SAVE_TO = "REWARD_ENTRY_SEC"
    }
    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        SEC_EDIT = "REWARD_ENTRY_SEC",
        SPECIAL_KEY_WORDS = {"List", "GcRewardTableItem"},
        REPLACE_TYPE = "ALL",
        REMOVE = "SECTION"
    }
end

--This happens for every class of every shiptype (So 4 class and 6 types + 2 Sclass types => 26 times)
function Create_Reward_Table_Entry(reward_id, reward_choice)
    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        SEC_EDIT = "REWARD_ENTRY_SEC",
        SEC_SAVE_TO = reward_id.."_REWARD_SEC"
    }
    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        SEC_EDIT = reward_id.."_REWARD_SEC",
        VALUE_CHANGE_TABLE =
        {
            {"Id", reward_id},
            {"RewardChoice", reward_choice}
        }
    }
    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        SEC_EDIT = reward_id.."_REWARD_SEC",
        PRECEDING_KEY_WORDS = {"List", "List"},
        CREATE_HOS = "TRUE",
        SEC_ADD_NAMED = 'ENTRIES_MASTER'
    }
    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        SEC_EDIT = "REWARD_SEC_MASTER",
        ADD_OPTION = "ADDafterSECTION",
        SEC_ADD_NAMED = reward_id.."_REWARD_SEC"
    }
end

function Create_Shop_Entry(Entry_ID)
    Changes_To_Default_Reality[#Changes_To_Default_Reality + 1] =
    {
        SEC_EDIT = 'SHOP_MASTER_SEC',
        ADD = [[<Property name="AlwaysPresentProducts" value="]]..Entry_ID..[[" />]]
    }
end

function Create_Ship_Reward_Entry(reward_sec, template_name, ship_seed, ship_slots)
    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        SEC_EDIT = template_name,
        SEC_SAVE_TO = reward_sec
    }

    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        SEC_EDIT = reward_sec,
        SPECIAL_KEY_WORDS = {'Reward', 'GcRewardSpecificShip', 'ShipResource', 'GcResourceElement'},
        -- PRECEDING_KEY_WORDS = {'Seed'},
        VALUE_CHANGE_TABLE =
        {
            {'Seed', ship_seed}
        }
    }

    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        SEC_EDIT = reward_sec,
        PRECEDING_KEY_WORDS = {'ShipLayout'},
        VALUE_CHANGE_TABLE =
        {
            {'Slots', ship_slots}
        }
    }

    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        SEC_EDIT = 'ENTRIES_MASTER',
        SEC_ADD_NAMED = reward_sec
    }
end

function Create_Master_Sec()
    Changes_To_Product_Table[#Changes_To_Product_Table + 1] =
    {
        ["SEC_EMPTY"] = "PRODUCT_SEC_MASTER"
    }
    Changes_To_Consumable_Item_Table[#Changes_To_Consumable_Item_Table + 1] =
    {
        ["SEC_EMPTY"] = "CONSUMABLE_SEC_MASTER"
    }
    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        ["SEC_EMPTY"] = "REWARD_SEC_MASTER"
    }
    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        ["SEC_EMPTY"] = "SHOP_MASTER_SEC"
    }
end

function Add_Master_Sec()
    --Accumilative Add to Product_Table
    Changes_To_Product_Table[#Changes_To_Product_Table + 1] =
    {
        PRECEDING_KEY_WORDS = {"Table"},
        SEC_ADD_NAMED = "PRODUCT_SEC_MASTER"
    }
    --Accumilative Add to Consumable_Item_Table
    Changes_To_Consumable_Item_Table[#Changes_To_Consumable_Item_Table + 1] =
    {
        PRECEDING_KEY_WORDS = {"Table"},
        SEC_ADD_NAMED = "CONSUMABLE_SEC_MASTER"
    }
    --Accumilative Add to Reward_Table
    Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
    {
        PRECEDING_KEY_WORDS = {"GenericTable"},
        SEC_ADD_NAMED = "REWARD_SEC_MASTER"
    }
    --Accumilative Add to Default_Reality
    Changes_To_Default_Reality[#Changes_To_Default_Reality + 1] =
    {
        PRECEDING_KEY_WORDS = {"TradeSettings", "SpaceStation", "AlwaysPresentProducts"},
        SEC_ADD_NAMED = "SHOP_MASTER_SEC"
    }
end

function Start()
    Create_Master_Sec()
    Create_Reward_Table_Entry_Template()
    Template_Creation()
    for ship_type, ship_data in pairs(Ship_Type_Reward_Entries) do

        local name_id = ship_data.LANGUAGE_STRING.."_NAME"
        local name_LC_id = ship_data.LANGUAGE_STRING.."_NAME_LC"
        local description_id = ship_data.LANGUAGE_STRING.."_DESC"

        for class, class_data in pairs(ship_data.CLASSDATA) do

            Changes_To_Reward_Table[#Changes_To_Reward_Table + 1] =
            {
                ["SEC_EMPTY"] = "ENTRIES_MASTER"
            }
            local product_class_price = class_data.PRICE
            local product_icon = "TEXTURES/UI/FRONTEND/ICONS/EXPEDITION/PATCH.SHIPCLASS"..string.upper(class)..".DDS";
            local product_id = string.upper(ship_type).."_"..string.upper(class)
            local reward_id = "R_"..product_id

            Create_New_Product(product_id, name_id, name_LC_id, description_id, description_id, 1, math.floor(product_class_price), product_icon)
            Create_New_Consumable(product_id, reward_id)
            Create_Shop_Entry(product_id)

            for count = 1, Total_Seeds_Per_Class do
                local ship_slots = math.random(1, 100)
                local ship_seed =  math.random(0xFFFFFFFF)
                local template_selected_index = math.random(#class_data.TEMPLATES)
                local reward_sec = ship_type..'_'..count..'_REWARD_SEC'
                local template_name = class_data.TEMPLATES[template_selected_index]
                -- USE FUNC to solve this?
                Create_Ship_Reward_Entry(reward_sec, template_name, ship_seed, ship_slots)
            end
            Create_Reward_Table_Entry(reward_id, "Select")
        end

    end
    Add_Master_Sec()
end

----------------------------------------------------------------------------------------------
-------------------------------     Language file creation     -------------------------------
----------------------------------------------------------------------------------------------
local Changes_To_Mbin_Change_Table = NMS_MOD_DEFINITION_CONTAINER.MODIFICATIONS[1].MBIN_CHANGE_TABLE
function Create_Language_Masters()
    Changes_To_Language[#Changes_To_Language + 1] =
    {
        SPECIAL_KEY_WORDS = {'Table', 'TkLocalisationEntry'},
        SEC_SAVE_TO = 'EMPTY_LOCAL_ENTRY_MASTER'
    }
    Changes_To_Language[#Changes_To_Language + 1] =
    {
        SEC_EDIT = 'EMPTY_LOCAL_ENTRY_MASTER',
        VALUE_CHANGE_TABLE =
        {
            {'English', ''}
        },
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
        MXML_CHANGE_TABLE =
        {
            {
                SPECIAL_KEY_WORDS = {'Table', 'TkLocalisationEntry'},
                REPLACE_TYPE = "ALL",
                REMOVE = 'SECTION',
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
    Create_Language_Masters()
    for Language , Language_Values in pairs(Language_Data) do
        New_Language_File_Name = 'LANGUAGE/NMS_'..string.upper(Custom_Language_Tag)..'_'..string.upper(Language)..'.MBIN'
        New_Empty_Language_File(New_Language_File_Name)
        New_Empty_Langauge_Entries(Language)
        Fill_Custom_Language_File(Language, Language_Values)

        Changes_To_Mbin_Change_Table[#Changes_To_Mbin_Change_Table + 1] =
        {
            MBIN_FILE_SOURCE = New_Language_File_Name,
            MXML_CHANGE_TABLE =
            {
                {
                    PRECEDING_KEY_WORDS = {'Table'},
                    SEC_ADD_NAMED = Language..'_ENTRIES'
                }
            }
        }
    end
end

----------------------------------------------------------------------------------------------
-------------------------------     EXECUTING THE FUNCTIONS     ------------------------------
----------------------------------------------------------------------------------------------
Start()
-- Add_Custom_Language_String()
