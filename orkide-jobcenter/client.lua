RegisterNetEvent('jobApp:openMenu', function()
    local elements = {}
    for k, v in pairs(Config.Jobbplasser) do
        table.insert(elements, {
            label = v.label,
            value = k
        })
    end

    local input = lib.inputDialog(Locales.menu.title, {
        { type = 'select', label = Locales.menu.workplace, options = elements, required = true },
        { type = 'input', label = Locales.menu.fullname, required = true },
        { type = 'input', label = Locales.menu.phone, required = true },
        { type = 'number', label = Locales.menu.age, min = 0, max = 100, required = true },
        { type = 'textarea', label = Locales.menu.application, required = true }
    })

    if input then
        TriggerServerEvent('jobApp:sendApplication', input)
        lib.notify({
            title = Locales.notify.sent.title,
            description = Locales.notify.sent.desc,
            type = Locales.notify.sent.type
        })
    else
        lib.notify({
            title = Locales.notify.cancelled.title,
            description = Locales.notify.cancelled.desc,
            type = Locales.notify.cancelled.type
        })
    end
end)

CreateThread(function()
    local pedData = Config.Ped
    RequestModel(pedData.model)
    while not HasModelLoaded(pedData.model) do Wait(0) end

    local ped = CreatePed(4, pedData.model, pedData.coords.x, pedData.coords.y, pedData.coords.z - 1.0, pedData.coords.w, false, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    exports.ox_target:addLocalEntity(ped, {
        {
            label = Locales.target.label,
            icon = Locales.target.icon,
            onSelect = function()
                TriggerEvent('jobApp:openMenu')
            end
        }
    })
end)

local function showMessages()

    print("orkides-verden loaded in jobcenter")

end

showMessages()
