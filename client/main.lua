local config = require 'config.client'

-----------------------
------- Events --------
-----------------------

lib.onCache('vehicle', function(vehicle)
    setupVehicleMenu(vehicle ~= false)
end)


-----------------------
------ Functions ------
-----------------------

local function convert(tbl)
    if tbl.items then
        local items = {}
        for _, v in pairs(tbl.items) do
            items[#items + 1] = convert(v)
        end

        lib.registerRadial({
            id = tbl.id .. 'Menu',
            items = items
        })

        return {
            id = tbl.id,
            label = tbl.label,
            icon = tbl.icon,
            menu = tbl.id .. 'Menu'
        }
    end

    local action
    if tbl.event then
        action = function()
            TriggerEvent(tbl.event, tbl.args or nil)
        end
    elseif tbl.serverEvent then
        action = function()
            TriggerServerEvent(tbl.serverEvent, tbl.args or nil)
        end
    elseif tbl.action then
        action = tbl.action(tbl.arg)
    elseif tbl.command then
        action = function()
            ExecuteCommand(tbl.command .. ' ' .. tbl.args)
        end
    end

    return {
        id = tbl.id,
        label = tbl.label,
        icon = tbl.icon,
        onSelect = tbl.onSelect or function()
            if action then
                action()
            end
        end,
        keepOpen = tbl.keepOpen
    }
end

function setupVehicleMenu(isInVehicle)
    if isInVehicle then
        -- "Veículo" abre diretamente o vehcontrol (portas, janelas, extras, plotagens, assentos são gerenciados lá)
        lib.addRadialItem({
            id = 'vehicle',
            label = locale('options.vehicle'),
            icon = 'car',
            onSelect = function()
                TriggerEvent('vehcontrol:openExternal')
                lib.hideRadial()
            end,
        })
    else
        lib.removeRadialItem('vehicle')
    end

    -- Submenu "Ações" com virar veículo
    local actionsItems = {
        {
            id = 'action-flip',
            label = locale('options.flip'),
            icon = 'car-burst',
            onSelect = function()
                TriggerEvent('radialmenu:flipVehicle')
                lib.hideRadial()
            end,
        },
    }

    lib.registerRadial({
        id = 'actionsMenu',
        items = actionsItems,
    })

    lib.addRadialItem({
        id = 'actions',
        label = 'Ações',
        icon = 'hand',
        menu = 'actionsMenu',
    })
end

local function setupRadialMenu()
    setupVehicleMenu()

    for _, v in pairs(config.menuItems) do
        lib.addRadialItem(convert(v))
    end

    if config.gangItems[QBX.PlayerData.gang.name] then
        lib.addRadialItem(convert({
            id = 'gangInteractions',
            label = locale('general.gang_radial'),
            icon = 'skull-crossbones',
            items = config.gangItems[QBX.PlayerData.gang.name]
        }))
    end

    if not config.jobItems[QBX.PlayerData.job.name] or not QBX.PlayerData.job.onduty then
        return
    end

    lib.addRadialItem(convert({
        id = 'jobInteractions',
        label = locale('general.job_radial'),
        icon = 'briefcase',
        items = config.jobItems[QBX.PlayerData.job.name]
    }))
end

local function isPolice()
    return QBX.PlayerData.job.type == 'leo' and QBX.PlayerData.job.onduty
end

local function isEMS()
    return QBX.PlayerData.job.type == 'ems' and QBX.PlayerData.job.onduty
end

-- Events
RegisterNetEvent('radialmenu:client:deadradial', function(isDead)
    if isDead then
        local ispolice, isems = isPolice(), isEMS()
        if not ispolice or isems then
            return lib.disableRadial(true)
        end
        lib.clearRadialItems()
        lib.addRadialItem({
            id = 'emergencybutton2',
            label = locale('options.emergency_button'),
            icon = 'circle-exclamation',
            onSelect = function()
                if ispolice then
                    TriggerEvent('police:client:SendPoliceEmergencyAlert')
                elseif isems then
                    TriggerServerEvent('hospital:server:emergencyAlert')
                end
                lib.hideRadial()
            end
        })
    else
        lib.clearRadialItems()
        setupRadialMenu()
        lib.disableRadial(false)
    end
end)

RegisterNetEvent('radialmenu:client:ChangeSeat', function(id, label)
    local isSeatFree = IsVehicleSeatFree(cache.vehicle, id - 2)
    local speed = GetEntitySpeed(cache.vehicle)
    local hasHarness = exports.qbx_seatbelt:HasHarness()
    if hasHarness then
        return exports.qbx_core:Notify(locale('error.race_harness_on'), 'error')
    end

    if not isSeatFree then
        return exports.qbx_core:Notify(locale('error.seat_occupied'), 'error')
    end

    local kmh = speed * 3.6

    if kmh > 100.0 then
        return exports.qbx_core:Notify(locale('error.vehicle_driving_fast'), 'error')
    end

    SetPedIntoVehicle(cache.ped, cache.vehicle, id - 2)
    exports.qbx_core:Notify(locale('info.switched_seats', label))
end)

RegisterNetEvent('qb-radialmenu:trunk:client:Door', function(plate, door, open)
    if not cache.vehicle then
        return
    end

    local pl = qbx.getVehiclePlate(cache.vehicle)
    if pl ~= plate then
        return
    end

    if open then
        SetVehicleDoorOpen(cache.vehicle, door, false, false)
    else
        SetVehicleDoorShut(cache.vehicle, door, false)
    end
end)

RegisterNetEvent('qb-radialmenu:client:noPlayers', function()
    exports.qbx_core:Notify(locale('error.no_people_nearby'), 'error', 2500)
end)

RegisterNetEvent('qb-radialmenu:client:openDoor', function(id)
    local door = id
    local coords = GetEntityCoords(cache.ped)
    local closestVehicle = cache.vehicle or lib.getClosestVehicle(coords, 5.0, false)
    if closestVehicle and closestVehicle ~= 0 then
        if closestVehicle ~= cache.vehicle then
            local plate = qbx.getVehiclePlate(closestVehicle)
            if GetVehicleDoorAngleRatio(closestVehicle, door) > 0.0 then
                if not IsVehicleSeatFree(closestVehicle, -1) then
                    TriggerServerEvent('qb-radialmenu:trunk:server:Door', false, plate, door)
                else
                    SetVehicleDoorShut(closestVehicle, door, false)
                end
            else
                if not IsVehicleSeatFree(closestVehicle, -1) then
                    TriggerServerEvent('qb-radialmenu:trunk:server:Door', true, plate, door)
                else
                    SetVehicleDoorOpen(closestVehicle, door, false, false)
                end
            end
        else
            if GetVehicleDoorAngleRatio(closestVehicle, door) > 0.0 then
                SetVehicleDoorShut(closestVehicle, door, false)
            else
                SetVehicleDoorOpen(closestVehicle, door, false, false)
            end
        end
    else
        exports.qbx_core:Notify(locale('error.no_vehicle_found'), 'error', 2500)
    end
end)

RegisterNetEvent('qbx_radialmenu:client:toggleWindows', function(id)
    local window = id
    local vehicle = cache.vehicle

    if vehicle ~= false then
        if IsVehicleWindowIntact(vehicle, window) then
            RollDownWindow(vehicle, window)
        else
            RollUpWindow(vehicle, window)
        end
    else
        exports.qbx_core:Notify(locale('error.no_vehicle_found'), 'error', 2500)
    end
end)

-- NOTA: Extras e Plotagens agora são gerenciados pelo mri_Qvehcontrol
-- Os handlers abaixo foram removidos pois o vehcontrol já cuida dessas funcionalidades
-- via sua NUI (ExtrasPanel e LiveriesPanel).

RegisterNetEvent('radialmenu:flipVehicle', function()
    if cache.vehicle then
        return
    end
    local coords = GetEntityCoords(cache.ped)
    local vehicle = lib.getClosestVehicle(coords)
    if not vehicle then
        return exports.qbx_core:Notify(locale('error.no_vehicle_nearby'), 'error')
    end
    if lib.progressBar({
        label = locale('progress.flipping_car'),
        duration = config.flipTime,
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            mouse = false,
            combat = true
        },
        anim = {
            dict = 'mini@repair',
            clip = 'fixing_a_ped'
        }
    }) then
        SetVehicleOnGroundProperly(vehicle)
        exports.qbx_core:Notify(locale('success.flipped_car'), 'success')
    else
        exports.qbx_core:Notify(locale('error.cancel_task'), 'error')
    end
end)

AddEventHandler('onResourceStart', function(resource)
    if cache.resource ~= resource then
        return
    end
    if LocalPlayer.state.isLoggedIn then
        setupRadialMenu()
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if cache.resource ~= resource then
        return
    end
    lib.clearRadialItems()
end)

-- Sets the metadata when the player spawns
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    setupRadialMenu()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    lib.removeRadialItem('jobInteractions')
    setupRadialMenu()
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(onDuty)
    lib.removeRadialItem('jobInteractions')
    if onDuty and config.jobItems[QBX.PlayerData.job.name] then
        lib.addRadialItem(convert({
            id = 'jobInteractions',
            label = locale('general.job_radial'),
            icon = 'briefcase',
            items = config.jobItems[QBX.PlayerData.job.name]
        }))
    end
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate', function(gang)
    lib.removeRadialItem('gangInteractions')
    if config.gangItems[gang.name] and next(config.gangItems[gang.name]) then
        lib.addRadialItem(convert({
            id = 'gangInteractions',
            label = locale('general.gang_radial'),
            icon = 'skull-crossbones',
            items = config.gangItems[gang.name]
        }))
    end
end)

local function createQBExport(name, cb)
    AddEventHandler(('__cfx_export_qb-radialmenu_%s'):format(name), function(setCB)
        setCB(cb)
    end)
end

local function addOption(data, id)
    data.id = data.id or id and id
    lib.addRadialItem(convert(data))
    return data.id
end

exports('AddOption', addOption)
createQBExport('AddOption', addOption)

local function removeOption(id)
    lib.removeRadialItem(id)
end

exports('RemoveOption', removeOption)
createQBExport('RemoveOption', removeOption)
