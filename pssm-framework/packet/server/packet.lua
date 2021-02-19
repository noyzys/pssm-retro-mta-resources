--[[
     # resource module directory: io.github.noyzys/pssm-framework/packet/packet.lua
     # resource author: noyzys
     # resource create: 16.01.2021, 18:22
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

server = {};
server.__index = server;
async = { id = false; mainThreads = {}};

function server:new(...)
    local mutableObject = setmetatable({}, { __index = self });
    if mutableObject.constructor then mutableObject:constructor(...); end

    return mutableObject;
end

function server:constructor()
end

function server:sendPacket(pPacketName, pSenderResponse, pForEach, ...)
    local packetProtocolType =
    {
        client = "{} sending packet: "..pPacketName.." to client-side",
        server = "{} sending packet: "..pPacketName.. "to server-side",
        global = "{} sending packet: "..pPacketName.." to "..pSenderResponse.."",
    };

    if packetProtocolType == "server" then
        outputDebugString(packetProtocolType.server);
    end

    packetProtocolType("sending packet to: "..pPacketName.." in %s ms")
    triggerEvent(pPacketName, pForEach, ...);
end

function server:sendPacketToClient(pPacketName, pSenderTo, pForEach, pSourceElement, ...)
    triggerClientEvent(pSenderTo, pPacketName, pForEach, pSourceElement, ...);
    outputDebugString("sending packet "..pPacketName.. " to client-side for"..pSenderTo);
end

function server:sendPacketToServer(pPacketName, pSenderTo, pForEach, pSourceElement, ...)
    triggerServerEvent(pSenderTo, pPacketName, pForEach, pSourceElement, ...);
    outputDebugString("sending packet "..pPacketName.. " to server-side for"..pSenderTo);
end