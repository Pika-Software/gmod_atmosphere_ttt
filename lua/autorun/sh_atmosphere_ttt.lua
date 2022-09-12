if (SERVER) or engine.ActiveGamemode() ~= "terrortown" then return end

local GetGlobalFloat = GetGlobalFloat
local hook_Add = hook.Add
local tostring = tostring
local math_max = math.max
local CurTime = CurTime

require( "atmosphere" )

local addonName = "Atmosphere TTT"
hook_Add("TTTBeginRound", addonName, function()
    atmosphere.Run( "discord.rpc.setupRoundTime", tostring( math_max( 0, GetGlobalFloat( "ttt_round_end", 0 ) - CurTime() ) ) )
end)

hook_Add("TTTPrepareRound", addonName, function()
    atmosphere.Run( "discord.rpc.clearGameTime" )
end)

hook_Add("TTTEndRound", addonName, function()
    atmosphere.Run( "discord.rpc.clearGameTime" )
end)