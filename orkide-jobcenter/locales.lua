Locales = {
    menu = {
        title = "Job Application",
        workplace = "Workplace",
        fullname = "Name",
        phone = "Phone number",
        age = "Age",
        application = "Application"
    },
    notify = {
        sent = {
            title = "Application sent!",
            desc = "You have sent the application.",
            type = "success"
        },
        cancelled = {
            title = "Application stopped",
            desc = "You didnt fill out, looser.",
            type = "error"
        }
    },
    target = {
        label = "Jobcenter",
        icon = "fas fa-briefcase"
    },

    discord = {
        title = function(jobLabel)
            return "New Application - " .. jobLabel
        end,
        fields = {
            name = "👤 Name",
            phone = "📞 Phone number",
            age = "🎂 Age",
            application = "📝 Application"
        }
    }
}

