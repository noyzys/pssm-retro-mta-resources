--[[
     # resource module directory: io.github.noyzys/pssm-auth/backend/client/auth_repository_client.lua
     # resource author: noyzys
     # resource create: 10.02.2021, 12:10
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

function module:isAuthRenderComponent() return self.isAuthRenderState; end

function module:setAuthRenderState(componentState)
    self.isAuthRenderState = componentState;
    if componentState == true then
        -- load hash password
    end
end
