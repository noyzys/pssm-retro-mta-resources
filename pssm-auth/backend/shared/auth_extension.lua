--[[
     # resource module directory: io.github.noyzys/pssm-auth/backend/shared/auth_extension.lua
     # resource author: noyzys
     # resource create: 10.02.2021, 11:59
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

zoom = 1;
local fullHd = 1920;
local mathMin = math.min
if screen.x < fullHd then zoom = mathMin(2, fullHd/screen.x); end

scale = function(x, y, w, h)
    return {(x/1920) * screen.x, (y/1080) * screen.y,
            (w/1920) * screen.x, (h/1080) * screen.y};
end

