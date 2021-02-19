--[[
     # resource module directory: io.github.noyzys/pssm-auth/backend/auth_module.lua
     # resource author: noyzys
     # resource create: 10.02.2021, 11:55
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

module = {};
module.__index = module;

function module:loadModule(...)
    local metatable = { __index = self };
    local mutableObject = setmetatable({}, metatable);

    if mutableObject.constructor then
        mutableObject:constructor(...);
    end

    return mutableObject;
end

function module:constructor()
    print("Loading global module...");

    print("Global module has been loaded.");
end

moduleMetatableLoader = module:loadModule();
