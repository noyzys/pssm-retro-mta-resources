--[[
     # resource module directory: io.github.noyzys/pssm-auth/backend/client/auth_ui_component_client.lua
     # resource author: noyzys
     # resource create: 10.02.2021, 11:58
     # resource for: Polski Serwer Służb Mundurowych, RETRO
    <p>
    >=  Informacje PL:
    > Zakaz używania bądź edycji kodu bez wcześniejszej zgody ze strony autorów struktury zasobu.
    > Zakazuje wykorzystywania całego lub fragmentu kodu & Zakazuje podpisywanie się pod autora kodu, czyli (noyzys)
    > W przypadku złamania powyższych zasad zostaną wyciągniete konsekwencje.
    > W przypadku wycieku zasobu zostaną wyciągniete konsekwencje prawne oraz odszkodowanie.
    > Dostęp do zasobu mają tylko @vanezza, @.myDev.
    </p>
    Copyright © Polski Serwer Służb Mundurowych, RETRO 2019-2021
]]--

screen = Vector2(guiGetScreenSize());

local zoom = 1;
local fullHd = 1920;
local mathMin = math.min
if screen.x < fullHd then zoom = mathMin(2, fullHd/screen.x); end

scale = function(x, y, w, h)
    return {(x/1920) * screen.x, (y/1080) * screen.y,
            (w/1920) * screen.x, (h/1080) * screen.y};
end

function module:loadComponent()
    self.scaleImagesPosition =
    {
        ["welcome-background"] = scale(0/zoom, 0/zoom, 1920/zoom, 1080/zoom),
        ["board-filling"] = scale(1310/zoom, 320/zoom, 523/zoom, 337/zoom),
        ["dark-editbox"] = scale(1310/zoom, 579/zoom, 523/zoom, 90/zoom),
        ["main-editbox"] = scale(1310/zoom, 490/zoom, 523/zoom, 90/zoom),
        ["second-editbox"] = scale(1310/zoom, 394/zoom, 523/zoom, 90/zoom),
        ["range-line"] = scale(1310/zoom, 484/zoom, 523/zoom, 6/zoom),
        ["main-rectangle"] = scale(1317/zoom, 332/zoom, 6/zoom, 50/zoom),
    };

    self.createTextures =
    {
        ["welcome-background"] = dxCreateTexture("resources/images/background/background.png", "dxt5", false, "clamp"),
        ["board-filling"] = dxCreateTexture("resources/images/ui/interface/board-filling.png", "dxt5", false, "clamp"),
        ["dark-editbox"] = dxCreateTexture("resources/images/ui/interface/dark-editbox.png", "dxt5", false, "clamp"),
        ["main-editbox"] = dxCreateTexture("resources/images/ui/interface/main-editbox.png", "dxt5", false, "clamp"),
        ["second-editbox"] = dxCreateTexture("resources/images/ui/interface/main-editbox.png", "dxt5", false, "clamp"),
        ["range-line"] = dxCreateTexture("resources/images/ui/interface/line-for-editbox.png", "dxt5", false, "clamp"),
        ["main-rectangle"] = dxCreateTexture("resources/images/ui/interface/main-rectangle.png", "dxt5", false, "clamp"),
    };

    self.repositories =
    {
        interpolateService =
        {

        },
    };

    self.dxRenderInitialize= function() self:dxRender(); end
    addEventHandler("onClientRender", root, self.dxRenderInitialize);
end

function module:dxRender()
    local scalePositions = self.scaleImagesPosition;
    local renderTextures = self.createTextures;

    -- Wszystko co znajduje się poniżej ulegnie zmianie, testy na produkcji jak wygląda template wyprodykowany w grze.
    dxDrawImage(scalePositions["welcome-background"][1], scalePositions["welcome-background"][2], scalePositions["welcome-background"][3], scalePositions["welcome-background"][4], renderTextures["welcome-background"]);

    local nowAlpha = getTickCount();
    self.tickAlpha = getTickCount();
    self.mainAlpha = interpolateBetween(255, 0, 0, 0, 0, 0, nowAlpha - self.tickAlpha / 620, "OutQuad");


    dxDrawImage(scalePositions["dark-editbox"][1], scalePositions["dark-editbox"][2], scalePositions["dark-editbox"][3], scalePositions["dark-editbox"][4], renderTextures["dark-editbox"]);
    dxDrawImage(scalePositions["board-filling"][1], scalePositions["board-filling"][2], scalePositions["board-filling"][3], scalePositions["board-filling"][4], renderTextures["board-filling"]);
    dxDrawImage(scalePositions["main-editbox"][1], scalePositions["main-editbox"][2], scalePositions["main-editbox"][3], scalePositions["main-editbox"][4], renderTextures["main-editbox"]);
    dxDrawImage(scalePositions["second-editbox"][1], scalePositions["second-editbox"][2], scalePositions["second-editbox"][3], scalePositions["second-editbox"][4], renderTextures["second-editbox"]);
    dxDrawImage(scalePositions["range-line"][1], scalePositions["range-line"][2], scalePositions["range-line"][3], scalePositions["range-line"][4], renderTextures["range-line"]);
    dxDrawImage(scalePositions["main-rectangle"][1], scalePositions["main-rectangle"][2], scalePositions["main-rectangle"][3], scalePositions["main-rectangle"][4], renderTextures["main-rectangle"]);

    --print(scalePositions["welcome-background"][1], scalePositions["welcome-background"][2], scalePositions["welcome-background"][3], scalePositions["welcome-background"][4])
end

module:loadComponent();