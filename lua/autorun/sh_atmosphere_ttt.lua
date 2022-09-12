if (SERVER) or engine.ActiveGamemode() ~= "terrortown" then return end

require( "atmosphere" )

local GetGlobalFloat = GetGlobalFloat
local tostring = tostring
local math_max = math.max
local SysTime = SysTime

local addonName = "Atmosphere TTT"
local function Start()
    timer.Create(addonName, 1, 3, function()
        atmosphere.Run( "discord.rpc.setupRoundTime", tostring( math_max( 0, GetGlobalFloat( "ttt_round_end", 0 ) - SysTime() ) ) )
    end)
end

local function Stop()
    atmosphere.Run( "discord.rpc.clearGameTime" )
    timer.Remove( addonName )
end

local hook_Add = hook.Add

hook_Add("TTTBeginRound", addonName, function()
    Start()
end)

hook_Add("TTTPrepareRound", addonName, function()
    Start()
end)

hook_Add("TTTEndRound", addonName, function()
    Start()
end)

hook_Add("InitPostEntity", addonName, function()
    Stop()
end)