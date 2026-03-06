return {
    -- MAIN MENU ITEMS
    Main = {
        {
            name = "Universal Aimbot - ESP",
            scriptUrl = "https://tsulnavhfrykjkbqiuaw.supabase.co/functions/v1/raw-script?id=e69521da-3b9b-4e8e-b275-d33b290cdcac",
            icon = "♾️"
        },
        {
            name = "Krypton Game Files",
            scriptUrl = "https://tsulnavhfrykjkbqiuaw.supabase.co/functions/v1/raw-script?id=fe3b5b71-2192-4215-8d89-9f5cc5566abc",
            icon = "📁"
        },
        {
            name = "99 Nights",
            scriptUrl = "https://raw.githubusercontent.com/nouralddin-abdullah/99-night/refs/heads/main/main-en-script.lua",
            icon = "🌙"
        },
        {
            name = "OTHER SCRIPTS", 
            scriptUrl = "OPEN_SUB_GUI",
            icon = "➕"
        },
        {
            name = "TERMINATE ALL",
            scriptUrl = "ACTION_TERMINATE",
            icon = "⚠️"
        }
    },
    
    -- SUB-MENU ITEMS (Add as many as you want here)
    Sub = {
        {name = "Blade Ball", load = "loadstring(game:HttpGet('URL_HERE'))()"},
        {name = "Violence District", load = "loadstring(game:HttpGet('URL_HERE'))()"},
        {name = "Basketball:Zero", load = "loadstring(game:HttpGet('URL_HERE'))()"},
        {name = "Brookhaven", load = "print('Brookhaven Loaded')"},
        {name = "Pet Sim 99", load = "print('PS99 Loaded')"}
    }
}
