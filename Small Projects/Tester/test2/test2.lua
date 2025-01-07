

-- local types = {
--     EN = 'English',
--     FR = 'French',
--     IT = 'Italian',
--     DE = 'German',
--     ES = 'Spanish',
--     RU = 'Russian',
--     PL = 'Polish',
--     NL = 'Dutch',
--     PT = 'Portuguese',
--     LA = 'LatinAmericanSpanish',
--     BR = 'BrazilianPortuguese',
--     Z1 = 'SimplifiedChinese',
--     ZH = 'TraditionalChinese',
--     Z2 = 'TencentChinese',
--     KO = 'Korean',
--     JA = 'Japanese',
--     US = 'USEnglish'
-- }

-- local Ship_Type_Reward_Entries = {}
-- for key, value in pairs(types) do
--     Ship_Type_Reward_Entries[key] = {}

--     for i = 1, 10, 1 do
--         local name = value..'_'..i
--              Ship_Type_Reward_Entries[key][name] = {LANG = 'LANG', VAL = i}
--     end
    
-- end


-- test = 
-- {
--     fight =
--     {
--         templateC = {price = 1, lang= ''},
--         templateB = {price = 1, lang= ''},
--         templateA = {price = 1, lang= ''}
--     }
-- }

local types = {
    Fight = 'Fight',
    Shut = 'Shut',
    Haul = 'Haul',
}

local Classes = {'C', 'B', 'A', 'S'}
local Ship_Type_Reward_Entries = {}

for type, value in pairs(types) do
    Ship_Type_Reward_Entries[type] ={}
    Ship_Type_Reward_Entries[type]['LANGUAGE_STRING'] = type..'_LANG'
    for i = 1, #Classes do
        Ship_Type_Reward_Entries[type][Classes[i]] = {}
        Ship_Type_Reward_Entries[type][Classes[i]]['PRICE'] = (i * 25)
        Ship_Type_Reward_Entries[type][Classes[i]].TEMPLATES = {}
        for j = 1, 10 do
            local name = value..'_'..j
            table.insert(Ship_Type_Reward_Entries[type][Classes[i]].TEMPLATES, name)
        end
    end
end
