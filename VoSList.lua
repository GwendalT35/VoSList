print("|cFFFFAA00[VoSList]:|r Addon chargé")

-- Frame principale
local frame = CreateFrame("Frame", "VoSListFrame", UIParent, BackdropTemplateMixin and "BackdropTemplate")
frame:SetSize(250, 100)
frame:SetPoint("CENTER", 0, 0)
frame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    edgeSize = 16,
    insets = { left = 5, right = 5, top = 5, bottom = 5 },
})
frame:SetBackdropColor(0, 0, 0, 0.7)
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)

-- Table des items { nom, id, requis }
local items = {
    { "Fiole des sables",   65891, 1 },
    { "Fiole cristalline",  65892, 1 },
    { "Sable du temps",     65893, 8 },
    { "Vrai or",            58480, 12 },
    { "Flacon des vents",   58087, 8 },
    { "Voile d'Azshara",    52985, 64 },
    { "Flacon des Titans",  58088, 8 },
    { "Cendrelle",          52983, 64 },
    { "Vie volatille",      52329, 128 },
    { "Fouettine",          52988, 128 },
    { "Fiole de cristal",   3371, 2 },
    { "Huile de pierre",    56850, 8 },
}

-- Stocke les FontStrings pour les lignes
local lineFontStrings = {}

-- Fonction pour créer la liste avec deux colonnes
local function afficher_List()
    -- Supprime les anciens FontStrings si déjà créés
    for _, fs in ipairs(lineFontStrings) do
        fs.name:Hide()
        fs.count:Hide()
    end
    lineFontStrings = {}

    local yOffset = -10
    local nameX = 10
    local countX = 150  -- position de la colonne des compteurs

    for _, v in ipairs(items) do
        local name, id, required = unpack(v)
        local count = GetItemCount(id)
        local color = (count >= required) and "|cFF00FF00" or "|cFFFF0000"

        -- FontString pour le nom
        local nameFS = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        nameFS:SetPoint("TOPLEFT", nameX, yOffset)
        nameFS:SetText(color .. name .. "|r")
        nameFS:SetJustifyH("LEFT")

        -- FontString pour le compteur
        local countFS = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        countFS:SetPoint("TOPLEFT", countX, yOffset)
        countFS:SetText(color .. count .. "/" .. required .. "|r")
        countFS:SetJustifyH("LEFT")

        table.insert(lineFontStrings, { name = nameFS, count = countFS })

        yOffset = yOffset - 20  -- espace entre les lignes
    end

    -- Ajuste la hauteur de la frame
    local totalHeight = 20 + (#items * 20)
    frame:SetHeight(totalHeight)
end

-- Event PLAYER_LOGIN
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self, event, ...)
    afficher_List()
end)

-- Mise à jour régulière
local TimeSinceLastUpdate, ONUPDATE_INTERVAL = 0, 0.5
frame:SetScript("OnUpdate", function(_, elapsed)
    TimeSinceLastUpdate = TimeSinceLastUpdate + elapsed
    if TimeSinceLastUpdate >= ONUPDATE_INTERVAL then
        TimeSinceLastUpdate = 0
        afficher_List()
    end
end)
