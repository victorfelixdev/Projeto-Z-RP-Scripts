local NumberJump = 4
local enabled = lib.load("config/sh_config").enableBunnyRagdoll
CreateThread(function()
    if enabled then
        local Jump = 0
        while true do
            Wait(1)
            local ped = PlayerPedId()
            if IsPedOnFoot(ped) and not IsPedSwimming(ped) and (IsPedRunning(ped) or IsPedSprinting(ped)) and
                not IsPedClimbing(ped) and IsPedJumping(ped) and not IsPedRagdoll(ped) then
                Jump = Jump + 1
                if Jump == NumberJump then
                    SetPedToRagdoll(ped, 2000, 5000, 2, true, true, true)
                    Jump = 0
                end
                Wait(800)
            else
                Wait(500)
            end
        end
    end
end)