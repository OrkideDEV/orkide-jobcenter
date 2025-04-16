RegisterServerEvent('jobApp:sendApplication', function(data)
    local src = source
    local workplaceKey = data[1]
    local fullName = data[2]
    local phone = data[3]
    local age = data[4]
    local appText = data[5]

    local jobData = Config.Jobbplasser[workplaceKey]
    if not jobData then return end

    local embed = {
        embeds = {{
            title = Locales.discord.title(jobData.label),
            color = 3447003,
            fields = {
                { name = Locales.discord.fields.name, value = fullName, inline = true },
                { name = Locales.discord.fields.phone, value = phone, inline = true },
                { name = Locales.discord.fields.age, value = tostring(age), inline = true },
                { name = Locales.discord.fields.application, value = appText }
            }
        }}
    }

    PerformHttpRequest(jobData.webhook, function(err, text, headers) end, 'POST', json.encode(embed), {
        ['Content-Type'] = 'application/json'
    })
end)



