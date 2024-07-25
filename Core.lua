
-----------------------------------
----- Core.lua
----- 使用Ace库创建插件 并提供开关
----- 2010 - 09 - 29
----- Terry@ bf
-----------------------------------
TUF_Config = {}
local _G = _G

local T = LibStub("AceAddon-3.0"):NewAddon("TUnitFrame")
if not T then return end
T:SetDefaultModuleLibraries("AceEvent-3.0")
T:SetDefaultModuleState(false)
local _debug = false

local function debug_print(addon , ...)
	if _debug and BigFoot_Print then
		BigFoot_Print(...)
	end
end


function TFLoad(showPlayerInfo)
    if showPlayerInfo then
        TUnitFrame_SwitchPlayerInfoPane(true)
    end
    TUnitFrame_SwitchMemberInfoPane(true)
    TUnitFrame_SwitchPartyTarget(true)
    TUnitFrame_SwitchClassInfo(true)
    TUnitFrame_SwitchColorize(true)
    TUnitFrame_SwitchFormat(true)
    TUnitFrame_SwitchExpBar(true)
    TUnitFrame_SwitchPartyCastBar(true)
end

local party,target,player

function TUnitFrame_SwitchPartyTarget(flag)
	party = T:GetModule("Party")
	assert(party,"Party target module does not exist")
	party:ToggleTarget(flag)
end

function TUnitFrame_SwitchPartyCastBar(flag)
	party = T:GetModule("Party")
	assert(party,"Party target module does not exist")
	party:ToggleCastBar(flag)
end

function TUnitFrame_Switch3DPor(flag)
	party = T:GetModule("Party")
	target = T:GetModule("Target")
	player = T:GetModule("Player")
	party:Toggle3DPor(flag)
	target:Toggle3DPor(flag)
	player:Toggle3DPor(flag)
end

function TUnitFrame_SwitchClassInfo(flag)
	party = T:GetModule("Party")
	target = T:GetModule("Target")

	party:ToggleClass(flag)
	target:ToggleClass(flag)
end

function TUnitFrame_SwitchPlayerInfoPane(flag)
	player = T:GetModule("Player")
	player:ToggleInfoPane(flag)
end

function TUnitFrame_SwitchMemberInfoPane(flag)
	party = T:GetModule("Party")
	party:ToggleInfoPane(flag)
end

function TUnitFrame_SwitchColorize(flag)
	party = T:GetModule("Party")
	player = T:GetModule("Player")
	player:ToggleColorize(flag)
	party:ToggleColorize(flag)
end

function TUnitFrame_SwitchFormat(flag)
	party = T:GetModule("Party")
	player = T:GetModule("Player")
	player:ToggleFormattedText(flag)
	party:ToggleFormattedText(flag)
end

function TUnitFrame_SwitchExpBar(flag)
	player = T:GetModule("Player")
	if flag then
		player:ToggleExpBar(flag)
	else
		player:ToggleExpBar(flag)
	end
end

function TUnitFrame_AdjustBuffSize(isMine, size)
	if not target:IsEnabled() then
		target:Enable()
	end
	if isMine then
		target.config.self = size  or target.config.self
		BFCH_MYBUFF_SIZE = size
	else
		target.config.other = size or target.config.other
		BFCH_OTHERBUFF_SIZE = size
	end
	TargetFrame_UpdateAuras(_G.TargetFrame)
end

function TUnitFrame_ResetBuffSize()
	TUnitFrame_AdjustBuffSize(true,23)
	TUnitFrame_AdjustBuffSize(false,17)
	target:Disable()
end

function T:OnInitialize()
	self.Debug = debug_print
	self:Debug("TUnitFrame loaded")
end

function T:OnEnable()
	target = T:GetModule("Target")
	if TUF_Config.inited then return end
	-- SetCVar("statusTextPercentage","0")	--5.2 rem
	SetCVar("statusText","1")
	TUF_Config.inited = true
end

function T:OnDisable()
end


local index = 0; local stack = {}; local sequence = {}; 
local secureFrame =
CreateFrame("Frame"); secureFrame:RegisterEvent("PLAYER_REGEN_ENABLED"); 
local function BLUtils_a7afce9fbbc025cffe91d09ff0a0f8a8(
    func, ...)
    assert(type(func) == "function", "First argument must be a function value."); index = index + 1; stack[func] = { ... }; sequence[func] =
    index;
end

local function BLUtils_3abed17d635b55a3b55cef81ef841e97()
    local tmp = {}; local tmp2 = {}; for k, v in pairs(sequence) do tmp[v] = k; end
    for k, v in pairs(tmp) do tinsert(tmp2, k); end
    table.sort(tmp2); local func; for i = 1, #(tmp2) do
        func = tmp[tmp2[i]]; if (func and type(func) == "function" and stack[func]) then pcall(unpack(stack[func])); end
    end
    table.wipe(stack); table.wipe(sequence); index = 0;
end
secureFrame:SetScript("OnEvent", function(self) BLUtils_3abed17d635b55a3b55cef81ef841e97(); end); 

function BFSecureCall(...)
    local func = select(1, ...); if (type(func) == "function") then
        if (InCombatLockdown()) then
            BLUtils_a7afce9fbbc025cffe91d09ff0a0f8a8(func, ...); return;
        end
        pcall(...);
    end
end




-- BLibrary


local BLib_226f708186be917ad2bc613c0e64ca55 = {}; 
function BLib_226f708186be917ad2bc613c0e64ca55:constructor() 
	self.BLib_bc4d26b7ed499c26222c288b9f460a2d = {}; 
end

function BLib_226f708186be917ad2bc613c0e64ca55:new()
    local BLib_799f29b621456a365c52ec84282766c2 = {}; 
	setmetatable(BLib_799f29b621456a365c52ec84282766c2, self); 
	if (self.__index ~= self) then 
		self.__index = self; 
	end
    BLib_799f29b621456a365c52ec84282766c2:constructor(); 
	return BLib_799f29b621456a365c52ec84282766c2;
end

function BLib_226f708186be917ad2bc613c0e64ca55:Register(BLib_b962f54280c77029bc350c2b321adc64,
                                                        BLib_791d17790b7f87980736899c25ab6997,
                                                        BLib_9fe6bb2a2116fc0336142d2abe4d8785,
                                                        BLib_f5634a24d4f6a0c7ea870ac7fdfe7d73)
    assert(BLib_b962f54280c77029bc350c2b321adc64 and type(BLib_b962f54280c77029bc350c2b321adc64) == "table",
        "The class must be specified.");
		 assert(BLib_b962f54280c77029bc350c2b321adc64.constructor,
        "The method <constructor> must be defined."); 
		assert(
    BLib_791d17790b7f87980736899c25ab6997 and type(BLib_791d17790b7f87980736899c25ab6997) == "string",
        "The type of parameter library must be string."); 
		if (self.BLib_bc4d26b7ed499c26222c288b9f460a2d[BLib_791d17790b7f87980736899c25ab6997]) then
        error(string.format("The library <%s> has been registered.", BLib_791d17790b7f87980736899c25ab6997)); 
		return false;
    end
    if (BLib_b962f54280c77029bc350c2b321adc64.__index ~= BLib_b962f54280c77029bc350c2b321adc64) then BLib_b962f54280c77029bc350c2b321adc64.__index =
        BLib_b962f54280c77029bc350c2b321adc64;
	end
    self.BLib_bc4d26b7ed499c26222c288b9f460a2d[BLib_791d17790b7f87980736899c25ab6997] = {}; 
	self.BLib_bc4d26b7ed499c26222c288b9f460a2d[BLib_791d17790b7f87980736899c25ab6997].BLib_b962f54280c77029bc350c2b321adc64 =
    BLib_b962f54280c77029bc350c2b321adc64; 
	self.BLib_bc4d26b7ed499c26222c288b9f460a2d[BLib_791d17790b7f87980736899c25ab6997].BLib_9fe6bb2a2116fc0336142d2abe4d8785 =
    BLib_9fe6bb2a2116fc0336142d2abe4d8785; 
	self.BLib_bc4d26b7ed499c26222c288b9f460a2d[BLib_791d17790b7f87980736899c25ab6997].BLib_f5634a24d4f6a0c7ea870ac7fdfe7d73 =
    BLib_f5634a24d4f6a0c7ea870ac7fdfe7d73; return true;
end

function BLib_226f708186be917ad2bc613c0e64ca55:GetClass(BLib_791d17790b7f87980736899c25ab6997)
    assert(BLib_791d17790b7f87980736899c25ab6997 and type(BLib_791d17790b7f87980736899c25ab6997) == "string",
        "The type of parameter library must be string."); 
		if (self.BLib_bc4d26b7ed499c26222c288b9f460a2d[BLib_791d17790b7f87980736899c25ab6997] and self.BLib_bc4d26b7ed499c26222c288b9f460a2d[BLib_791d17790b7f87980736899c25ab6997].BLib_b962f54280c77029bc350c2b321adc64) then return
        self.BLib_bc4d26b7ed499c26222c288b9f460a2d[BLib_791d17790b7f87980736899c25ab6997]
        .BLib_b962f54280c77029bc350c2b321adc64; else return false; end
end

local function CreateInstance(self, BLib_791d17790b7f87980736899c25ab6997, ...)
    assert(BLib_791d17790b7f87980736899c25ab6997 and type(BLib_791d17790b7f87980736899c25ab6997) == "string",
        "The type of parameter library must be string."); assert(
    self.BLib_bc4d26b7ed499c26222c288b9f460a2d[BLib_791d17790b7f87980736899c25ab6997],
        string.format("The library <%s> does not exist.", BLib_791d17790b7f87980736899c25ab6997)); local BLib_91ac677b9aec5afd97ac9bd6a003c402 =
    setmetatable({},
        self.BLib_bc4d26b7ed499c26222c288b9f460a2d[BLib_791d17790b7f87980736899c25ab6997]
        .BLib_b962f54280c77029bc350c2b321adc64); BLib_91ac677b9aec5afd97ac9bd6a003c402:constructor(...); return
    BLib_91ac677b9aec5afd97ac9bd6a003c402;
end
BLib_226f708186be917ad2bc613c0e64ca55.CreateInstance = CreateInstance; 
BLibrary = BLib_226f708186be917ad2bc613c0e64ca55:new(); 
getmetatable(BLibrary).__call = CreateInstance;



-- BEvent

local BLEVE_dbdf11f5b07258936fb1c5a31eaa969c = 1; local BLEVE_1b5523f0adb45c4b8ee51f89ebf6f2b2 = 0; local BEvent = { registry = {}, frame = nil }; BEvent.frame =
CreateFrame("Frame", "BigFootEventFrame", UIparent); BEvent.frame:SetScript("OnEvent",
    function(self, BLEVE_d0708241b607c9a9dd1953c812fadfb7, ...) BEvent:BLEVE_c8db7dfdbccc70b6c4ca668944f139f8(
        BLEVE_d0708241b607c9a9dd1953c812fadfb7, ...); end)
local BLEVE_96740f5a57dad2b0bc9410bc76c32e26 = setmetatable({}, { __mode = "BLEVE_63a9ce6f1eeac72ef41293b7d0303335" }); function BEvent:BLEVE_c8db7dfdbccc70b6c4ca668944f139f8(
    BLEVE_d0708241b607c9a9dd1953c812fadfb7, ...)
    assert(BLEVE_d0708241b607c9a9dd1953c812fadfb7 and type(BLEVE_d0708241b607c9a9dd1953c812fadfb7) == "string",
        "Invalid BLEVE_d0708241b607c9a9dd1953c812fadfb7. The type of BLEVE_d0708241b607c9a9dd1953c812fadfb7 must be string."); local BLEVE_fa2167574a7f10a8ceef1d978b1d1540 =
    next(BLEVE_96740f5a57dad2b0bc9410bc76c32e26) or {}; BLEVE_96740f5a57dad2b0bc9410bc76c32e26[BLEVE_fa2167574a7f10a8ceef1d978b1d1540] = nil; if (BLEVE_d0708241b607c9a9dd1953c812fadfb7 and BEvent.registry[BLEVE_d0708241b607c9a9dd1953c812fadfb7]) then for BLEVE_89d99bb0d06dd535e6d6f6d9b3f04006, BLEVE_102f59c700c9d50fbbe02ae3f8f42302 in pairs(BEvent.registry[BLEVE_d0708241b607c9a9dd1953c812fadfb7]) do BLEVE_fa2167574a7f10a8ceef1d978b1d1540[BLEVE_89d99bb0d06dd535e6d6f6d9b3f04006] =
            BLEVE_102f59c700c9d50fbbe02ae3f8f42302; end end
    for BLEVE_423819614be4117387118072509b7ed9, BLEVE_a00724ebfb071ad7332b17a872f4f736 in pairs(BLEVE_fa2167574a7f10a8ceef1d978b1d1540) do
        if (type(BLEVE_a00724ebfb071ad7332b17a872f4f736) == "string") then if (BLEVE_423819614be4117387118072509b7ed9[BLEVE_a00724ebfb071ad7332b17a872f4f736] and type(BLEVE_423819614be4117387118072509b7ed9[BLEVE_a00724ebfb071ad7332b17a872f4f736]) == "function") then
                BLEVE_423819614be4117387118072509b7ed9[BLEVE_a00724ebfb071ad7332b17a872f4f736](
                BLEVE_423819614be4117387118072509b7ed9, ...); end elseif (BLEVE_a00724ebfb071ad7332b17a872f4f736 and type(BLEVE_a00724ebfb071ad7332b17a872f4f736) == "function") then
            BLEVE_a00724ebfb071ad7332b17a872f4f736(BLEVE_d0708241b607c9a9dd1953c812fadfb7, ...); end
        BLEVE_fa2167574a7f10a8ceef1d978b1d1540[BLEVE_423819614be4117387118072509b7ed9] = nil;
    end
end

function BEvent:RegisterEvent(BLEVE_d0708241b607c9a9dd1953c812fadfb7, BLEVE_102f59c700c9d50fbbe02ae3f8f42302)
    assert(BLEVE_d0708241b607c9a9dd1953c812fadfb7 and type(BLEVE_d0708241b607c9a9dd1953c812fadfb7) == "string",
        "BEvent: Invalid event. The type of event must be string."); BLEVE_102f59c700c9d50fbbe02ae3f8f42302 =
    BLEVE_102f59c700c9d50fbbe02ae3f8f42302 or BLEVE_d0708241b607c9a9dd1953c812fadfb7; if (not BEvent.registry[BLEVE_d0708241b607c9a9dd1953c812fadfb7]) then
        BEvent.registry[BLEVE_d0708241b607c9a9dd1953c812fadfb7] = {}; BEvent.frame:RegisterEvent(
        BLEVE_d0708241b607c9a9dd1953c812fadfb7);
    end
    BEvent.registry[BLEVE_d0708241b607c9a9dd1953c812fadfb7][self] = BLEVE_102f59c700c9d50fbbe02ae3f8f42302;
end

function BEvent:UnregisterEvent(BLEVE_d0708241b607c9a9dd1953c812fadfb7, BLEVE_102f59c700c9d50fbbe02ae3f8f42302)
    assert(type(BLEVE_d0708241b607c9a9dd1953c812fadfb7) == "string", "Invalid event. The type of event must be string."); if (BEvent.registry[BLEVE_d0708241b607c9a9dd1953c812fadfb7] and BEvent.registry[BLEVE_d0708241b607c9a9dd1953c812fadfb7][self]) then
        BEvent.registry[BLEVE_d0708241b607c9a9dd1953c812fadfb7][self] = nil; if (not next(BEvent.registry[BLEVE_d0708241b607c9a9dd1953c812fadfb7])) then
            BEvent.registry[BLEVE_d0708241b607c9a9dd1953c812fadfb7] = nil
            BEvent.frame:UnregisterEvent(BLEVE_d0708241b607c9a9dd1953c812fadfb7)
        end
    end
end

function BEvent:UnregisterAllEvent() for BLEVE_d0708241b607c9a9dd1953c812fadfb7, BLEVE_8e6c2aaeb6b11f026ff5cb0a29aebe68 in pairs(BEvent.registry) do if (BLEVE_8e6c2aaeb6b11f026ff5cb0a29aebe68[self]) then
            self:UnregisterEvent(BLEVE_d0708241b607c9a9dd1953c812fadfb7); end end end

BEvent.Initialization = {}; function BEvent:Init(...)
    local BLEVE_b4d3314490a868cf61f5fbd057900b0b = select(1, ...); BLEVE_b4d3314490a868cf61f5fbd057900b0b = type(
    BLEVE_b4d3314490a868cf61f5fbd057900b0b) == "table" and BLEVE_b4d3314490a868cf61f5fbd057900b0b or {}; BLEVE_b4d3314490a868cf61f5fbd057900b0b.name =
    BLEVE_b4d3314490a868cf61f5fbd057900b0b.name or BLEVE_b4d3314490a868cf61f5fbd057900b0b[1] or "Unknown"; BLEVE_b4d3314490a868cf61f5fbd057900b0b.func =
    BLEVE_b4d3314490a868cf61f5fbd057900b0b.func or BLEVE_b4d3314490a868cf61f5fbd057900b0b[2] or function() end; BEvent
        :RegisterEvent("ADDON_LOADED"); table.insert(BEvent.Initialization, BLEVE_b4d3314490a868cf61f5fbd057900b0b);
end

function BEvent.ADDON_LOADED(...)
    local _, arg1 = ...
    local BLEVE_63a9ce6f1eeac72ef41293b7d0303335, BLEVE_8d0644c92128c1ff68223fd74ba63b56; for BLEVE_63a9ce6f1eeac72ef41293b7d0303335, BLEVE_8d0644c92128c1ff68223fd74ba63b56 in pairs(BEvent.Initialization) do if (arg1 == BLEVE_8d0644c92128c1ff68223fd74ba63b56.name) then
            assert(BLEVE_8d0644c92128c1ff68223fd74ba63b56.func,
                string.format("<%s> need a init function", BLEVE_8d0644c92128c1ff68223fd74ba63b56.name)); BLEVE_8d0644c92128c1ff68223fd74ba63b56
                :func(); table.remove(BEvent.Initialization, BLEVE_63a9ce6f1eeac72ef41293b7d0303335); break;
        end end
end

function BEvent:constructor() end

BLibrary:Register(BEvent, "BEvent", BLEVE_dbdf11f5b07258936fb1c5a31eaa969c, BLEVE_1b5523f0adb45c4b8ee51f89ebf6f2b2);
