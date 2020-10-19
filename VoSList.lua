local frame = CreateFrame("Frame", nil, UIParent, BackdropTemplateMixin and "BackdropTemplate")
local text = CreateFrame("Frame", nil, UIParent, BackdropTemplateMixin and "BackdropTemplate")
frame:SetPoint("LEFT", 0, 0)
frame:SetSize(200, 230)
frame:SetBackdrop({
    bgFile = "Interface\\ACHIEVEMENTFRAME\\UI-ACHIEVEMENT-PARCHMENT",
    edgeFile = "",
    edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 },
})
frame:SetBackdropColor(0, 0, 0, .5)
t = frame:CreateFontString(frame, "OVERLAY", "GameFontNormal")
t:SetFont("Fonts\\2002.TTF", 16)
t:SetPoint("TOP", 0, -15)



frame:RegisterEvent('PLAYER_LOGIN')
frame:SetScript("OnEvent", function(self, event, ...)

    if (event == 'PLAYER_LOGIN') then
        VoS = GetItemCount(65891)
        Vc = GetItemCount(65892)
        SoT = GetItemCount(65893)
        gold = GetItemCount(58480)
        fWind = GetItemCount(58087)
        Azshara = GetItemCount(52985)
        fTitan = GetItemCount(58088)
        cendrelle = GetItemCount(52983)
        vieVola = GetItemCount(52329)
        fouett = GetItemCount(52988)
        f2c = GetItemCount(3371)
        huile = GetItemCount(56850)

        afficher_List(VoS, Vc, SoT, gold , fWind , Azshara , fTitan, cendrelle , vieVola, fouett, f2c, huile)

    end
end)

local TimeSinceLastUpdate = 0
local ONUPDATE_INTERVAL = 0.5
frame:SetScript("OnUpdate", function(self, elapsed)
	TimeSinceLastUpdate = TimeSinceLastUpdate + elapsed
	if TimeSinceLastUpdate >= ONUPDATE_INTERVAL then
		TimeSinceLastUpdate = 0
		
		VoS = GetItemCount(65891)
        Vc = GetItemCount(65892)
        SoT = GetItemCount(65893)
        gold = GetItemCount(58480)
        fWind = GetItemCount(58087)
        Azshara = GetItemCount(52985)
        fTitan = GetItemCount(58088)
        cendrelle = GetItemCount(52983)
        vieVola = GetItemCount(52329)
        fouett = GetItemCount(52988)
        f2c = GetItemCount(3371)
        huile = GetItemCount(56850)

        afficher_List(VoS, Vc, SoT, gold , fWind , Azshara , fTitan, cendrelle , vieVola, fouett, f2c, huile)
	end
end)

function afficher_List(VoS, Vc, SoT, gold , fWind , Azshara , fTitan, cendrelle , vieVola, fouett, f2c, huile)

    if (VoS >= 1) then
        str1 = "Fiole des sables: " ..VoS.. "/1\124r"
        str1 = color_Green(str1)
    else
        str1 =  "Fiole des sables: " ..VoS.. "/1\124r"
        str1 = color_Red(str1)
    end
    if (Vc >= 1) then
        str2 = "|cFF00FF00" .."Fiole cristalline: " ..Vc.. "/1\124r"
        str2 = color_Green(str2)
    else
        str2 = "Fiole cristalline: " ..Vc.. "/1\124r"
        str2 = color_Red(str2)
    end
    if (SoT >= 8) then
        str3 = "Sable du temps: " ..SoT.. "/8\124r"
        str3 = color_Green(str3)
    else
        str3 = "Sable du temps: " ..SoT.. "/8\124r"
        str3 = color_Red(str3)
    end
    if (gold >= 12) then
        str4 = "Vrai or: " ..gold.. "/12\124r"
        str4 = color_Green(str4)
    else
        str4 = "Vrai or: " ..gold.. "/12\124r"
        str4 = color_Red(str4)
    end
    if ( fWind >= 8) then
        str5 = "Flacon des vents: " ..fWind.. "/8\124r"
        str5 = color_Green(str5)
    else
        str5 = "Flacon des vents: " ..fWind.. "/8\124r"
        str5 = color_Red(str5)
    end
    if (Azshara >= 64) then
        str6 = "Voile d'Azshara: " ..Azshara.. "/64\124r"
        str6 = color_Green(str6)
    else
        str6 = "Voile d'Azshara: " ..Azshara.. "/64\124r"
        str6 = color_Red(str6)
    end
    if (fTitan >= 8) then
        str7 = "Flacon des Titans: " ..fTitan.. "/8\124r"
        str7 = color_Green(str7)
    else
        str7 = "Flacon des Titans: " ..fTitan.. "/8\124r"
        str7 = color_Red(str7)
    end
    if (cendrelle >= 64) then
        str8 = "Cendrelle: " ..cendrelle.. "/64\124r"
        str8 = color_Green(str8)
    else
        str8 = "Cendrelle: " ..cendrelle.. "/64\124r"
        str8 = color_Red(str8)
    end
    if (vieVola >= 128) then
        str9 = "Vie volatille: " ..vieVola.. "/128\124r"
        str9 = color_Green(str9)
    else
        str9 = "Vie volatille: " ..vieVola.. "/128\124r"
        str9 = color_Red(str9)
    end
    if (fouett >= 128) then
        str10 = "Fouettine: " ..fouett.. "/128\124r"
        str10 = color_Green(str10)
    else
        str10 = "Fouettine: " ..fouett.. "/128\124r"
        str10 = color_Red(str10)
    end
    if (f2c >= 2) then
        str11 = "Fiole de cristal: " ..f2c.. "/2\124r"
        str11 = color_Green(str11)
    else
        str11 = "Fiole de cristal: " ..f2c.. "/2\124r"
        str11 = color_Red(str11)
    end
    if (huile >= 8) then
        str12 = "Huile de pierre: " ..huile.. "/8\124r"
        str12 = color_Green(str12)
    else
        str12 = "Huile de pierre: " ..huile.. "/8\124r"
        str12 = color_Red(str12)
    end
    
    str = str1 .. " \n" .. str2 .. " \n" .. str3 .. " \n" .. str4 .. " \n" .. str5 .. " \n" .. str6 .. " \n" .. str7 .. " \n" .. str8  .. " \n" .. str9 .. "\n" .. str10 .. " \n" .. str11 .. " \n" .. str12
    t:SetText(str)

    
end

function color_Green(str)
    str = "\124cFF00FF00" .. str
    return str
end
function color_Red(str)
    str = "\124cFFFF0000" .. str
    return str
end