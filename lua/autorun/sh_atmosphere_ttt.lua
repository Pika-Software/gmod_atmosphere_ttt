if (SERVER) then return end
if engine.ActiveGamemode() == "terrortown" then

    require( "atmosphere" )

    local atmosphere_Menu = atmosphere.Menu
    local GetGlobalFloat = GetGlobalFloat
    local timer_Create = timer.Create
    local math_floor = math.floor
    local math_max = math.max
    local tostring = tostring
    local CurTime = CurTime

    local addonName = "Atmosphere TTT"
    local function Update()
        timer_Create(addonName, 1, 3, function()
            local time = math_max( 0, math_floor( GetGlobalFloat( "ttt_round_end", 0 ) - CurTime() ) )
            if (time > 1) then
                atmosphere_Menu( "discord.rpc.setupRoundTime", tostring( time ) )
            else
                atmosphere_Menu( "discord.rpc.clearGameTime" )
            end
        end)
    end

    local hook_Add = hook.Add
    hook_Add("TTTBeginRound", addonName, function()
        Update()
    end)

    hook_Add("TTTPrepareRound", addonName, function()
        Update()
    end)

    hook_Add("TTTEndRound", addonName, function()
        Update()
    end)

    hook_Add("InitPostEntity", addonName, function()
        Update()
    end)

end