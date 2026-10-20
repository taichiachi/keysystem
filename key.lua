--[[
    ================================================================
    [ OYB OFFICIAL | ROBLOX DEVELOPER ]
    Website: https://oybofficial.com/
    Builder: https://oybofficial.com/keysystem
    YouTube: https://youtube.com/@OYBOfficial
    Discord: https://discord.gg/kT55J724BK
    ================================================================
    BLAIR HUB - V2 UI
]]
local Config = {
    -- [1] PlatoBoost Settings
    ServiceId       = 35396, -- Your PlatoBoost Service ID
    PlatoSecret     = "b27343d8-40da-4d73-9f94-ebd6663da622", -- Your PlatoBoost Secret Key

    -- [2] Anti-Bypass / Global Secret Variable
    Secret          = "1234", -- This makes the script ONLY run from the key script. Even if they copy the original obfuscated script to bypass the key, they won't be able to!
    
    -- [3] Scripts & Links
    MainScriptURL   = "https://raw.githubusercontent.com/taichiachi/keysystem/refs/heads/main/script.lua", -- The raw URL of your main script
    
    -- [4] Social Media Settings (Set to true to show, false to hide)
    ShowDiscord     = false,
    DiscordURL      = "https://discord.gg/kT55J724B",
    
    ShowInstagram   = false,
    InstagramURL    = "https://www.instagram.com/oy0i/",
    
    ShowYoutube     = false,
    YoutubeURL      = "https://www.youtube.com/channel/UCAlXXV1Hbvf7WbXARuVtiQ",

    -- [5] File System
    KeyFileName     = "BlairKey.txt", -- The name of the file where the valid key will be saved for auto-login

    -- [6] GUI Management
    OldGuiName      = "anything", -- Name of the old GUI to destroy if it's already open
    MainGuiName     = "anything", -- Name of the main script's GUI to check if it's already executing

    -- [7] Hub Information & UI Text
    HubName         = "Blair Hub", -- The main title shown at the top of the GUI
    HubDescription  = "Premium Script Hub", -- The text shown below the title

    -- [8] Keyless Whitelist (hindi na kailangan ng key ang mga nandito)
    KeylessUsers    = {
        8769059708,
        121,
        131,
    },
    KeylessUserIds  = {
        -- 12345678, -- mas secure ito kaysa username (hindi nagbabago ang UserId)
    },
}

-------------------------------------------------------------------------------
--! LIBRARIES (JSON & CRYPTOGRAPHY) - DO NOT MODIFY
-------------------------------------------------------------------------------
local a=2^32;local b=a-1;local function c(d,e)local f,g=0,1;while d~=0 or e~=0 do local h,i=d%2,e%2;local j=(h+i)%2;f=f+j*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return f%a end;local function k(d,e,l,...)local m;if e then d=d%a;e=e%a;m=c(d,e)if l then m=k(m,l,...)end;return m elseif d then return d%a else return 0 end end;local function n(d,e,l,...)local m;if e then d=d%a;e=e%a;m=(d+e-c(d,e))/2;if l then m=n(m,l,...)end;return m elseif d then return d%a else return b end end;local function o(p)return b-p end;local function q(d,r)if r<0 then return lshift(d,-r)end;return math.floor(d%2^32/2^r)end;local function s(p,r)if r>31 or r<-31 then return 0 end;return q(p%a,r)end;local function lshift(d,r)if r<0 then return s(d,-r)end;return d*2^r%2^32 end;local function t(p,r)p=p%a;r=r%32;local u=n(p,2^r-1)return s(p,r)+lshift(u,32-r)end;local v={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function w(x)return string.gsub(x,".",function(l)return string.format("%02x",string.byte(l))end)end;local function y(z,A)local x=""for B=1,A do local C=z%256;x=string.char(C)..x;z=(z-C)/256 end;return x end;local function D(x,B)local A=0;for B=B,B+3 do A=A*256+string.byte(x,B)end;return A end;local function E(F,G)local H=64-(G+9)%64;G=y(8*G,8)F=F.."\128"..string.rep("\0",H)..G;assert(#F%64==0)return F end;local function I(J)J[1]=0x6a09e667;J[2]=0xbb67ae85;J[3]=0x3c6ef372;J[4]=0xa54ff53a;J[5]=0x510e527f;J[6]=0x9b05688c;J[7]=0x1f83d9ab;J[8]=0x5be0cd19;return J end;local function K(F,B,J)local L={}for M=1,16 do L[M]=D(F,B+(M-1)*4)end;for M=17,64 do local N=L[M-15]local O=k(t(N,7),t(N,18),s(N,3))N=L[M-2]L[M]=(L[M-16]+O+L[M-7]+k(t(N,17),t(N,19),s(N,10)))%a end;local d,e,l,P,Q,R,S,T=J[1],J[2],J[3],J[4],J[5],J[6],J[7],J[8]for B=1,64 do local O=k(t(d,2),t(d,13),t(d,22))local U=k(n(d,e),n(d,l),n(e,l))local V=(O+U)%a;local W=k(t(Q,6),t(Q,11),t(Q,25))local X=k(n(Q,R),n(o(Q),S))local Y=(T+W+X+v[B]+L[B])%a;T=S;S=R;R=Q;Q=(P+Y)%a;P=l;l=e;e=d;d=(Y+V)%a end;J[1]=(J[1]+d)%a;J[2]=(J[2]+e)%a;J[3]=(J[3]+l)%a;J[4]=(J[4]+P)%a;J[5]=(J[5]+Q)%a;J[6]=(J[6]+R)%a;J[7]=(J[7]+S)%a;J[8]=(J[8]+T)%a end;local function Z(F)F=E(F,#F)local J=I({})for B=1,#F,64 do K(F,B,J)end;return w(y(J[1],4)..y(J[2],4)..y(J[3],4)..y(J[4],4)..y(J[5],4)..y(J[6],4)..y(J[7],4)..y(J[8],4))end;local e;local l={["\\"]="\\",["\""]="\"",["\b"]="b",["\f"]="f",["\n"]="n",["\r"]="r",["\t"]="t"}local P={["/"]="/"}for Q,R in pairs(l)do P[R]=Q end;local S=function(T)return"\\"..(l[T]or string.format("u%04x",T:byte()))end;local B=function(M)return"null"end;local v=function(M,z)local _={}z=z or{}if z[M]then error("circular reference")end;z[M]=true;if rawget(M,1)~=nil or next(M)==nil then local A=0;for Q in pairs(M)do if type(Q)~="number"then error("invalid table: mixed or invalid key types")end;A=A+1 end;if A~=#M then error("invalid table: sparse array")end;for a0,R in ipairs(M)do table.insert(_,e(R,z))end;z[M]=nil;return"["..table.concat(_,",").."]"else for Q,R in pairs(M)do if type(Q)~="string"then error("invalid table: mixed or invalid key types")end;table.insert(_,e(Q,z)..":"..e(R,z))end;z[M]=nil;return"{"..table.concat(_,",").."}"end end;local g=function(M)return'"'..M:gsub('[%z\1-\31\\\"]',S)..'"'end;local a1=function(M)if M~=M or M<=-math.huge or M>=math.huge then error("unexpected number value '"..tostring(M).."'")end;return string.format("%.14g",M)end;local j={["nil"]=B,["table"]=v,["string"]=g,["number"]=a1,["boolean"]=tostring}e=function(M,z)local x=type(M)local a2=j[x]if a2 then return a2(M,z)end;error("unexpected type '"..x.."'")end;local a3=function(M)return e(M)end;local a4;local N=function(...)local _={}for a0=1,select("#",...)do _[select(a0,...)]=true end;return _ end;local L=N(" ","\t","\r","\n")local p=N(" ","\t","\r","\n","]","}",",")local a5=N("\\","/",'"',"b","f","n","r","t","u")local m=N("true","false","null")local a6={["true"]=true,["false"]=false,["null"]=nil}local a7=function(a8,a9,aa,ab)for a0=a9,#a8 do if aa[a8:sub(a0,a0)]~=ab then return a0 end end;return#a8+1 end;local ac=function(a8,a9,J)local ad=1;local ae=1;for a0=1,a9-1 do ae=ae+1;if a8:sub(a0,a0)=="\n"then ad=ad+1;ae=1 end end;error(string.format("%s at line %d col %d",J,ad,ae))end;local af=function(A)local a2=math.floor;if A<=0x7f then return string.char(A)elseif A<=0x7ff then return string.char(a2(A/64)+192,A%64+128)elseif A<=0xffff then return string.char(a2(A/4096)+224,a2(A%4096/64)+128,A%64+128)elseif A<=0x10ffff then return string.char(a2(A/262144)+240,a2(A%262144/4096)+128,a2(A%4096/64)+128,A%64+128)end;error(string.format("invalid unicode codepoint '%x'",A))end;local ag=function(ah)local ai=tonumber(ah:sub(1,4),16)local aj=tonumber(ah:sub(7,10),16)if aj then return af((ai-0xd800)*0x400+aj-0xdc00+0x10000)else return af(ai)end end;local ak=function(a8,a0)local _=""local al=a0+1;local Q=al;while al<=#a8 do local am=a8:byte(al)if am<32 then ac(a8,al,"control character in string")elseif am==92 then _=_..a8:sub(Q,al-1)al=al+1;local T=a8:sub(al,al)if T=="u"then local an=a8:match("^[dD][89aAbB]%x%x\\u%x%x%x%x",al+1)or a8:match("^%x%x%x%x",al+1)or ac(a8,al-1,"invalid unicode escape in string")_=_..ag(an)al=al+#an else if not a5[T]then ac(a8,al-1,"invalid escape char '"..T.."' in string")end;_=_..P[T]end;Q=al+1 elseif am==34 then _=_..a8:sub(Q,al-1)return _,al+1 end;al=al+1 end;ac(a8,a0,"expected closing quote for string")end;local ao=function(a8,a0)local am=a7(a8,a0,p)local ah=a8:sub(a0,am-1)local A=tonumber(ah)if not A then ac(a8,a0,"invalid number '"..ah.."'")end;return A,am end;local ap=function(a8,a0)local am=a7(a8,a0,p)local aq=a8:sub(a0,am-1)if not m[aq]then ac(a8,a0,"invalid literal '"..aq.."'")end;return a6[aq],am end;local ar=function(a8,a0)local _={}local A=1;a0=a0+1;while 1 do local am;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="]"then a0=a0+1;break end;am,a0=a4(a8,a0)_[A]=am;A=A+1;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="]"then break end;if as~=","then ac(a8,a0,"expected ']' or ','")end end;return _,a0 end;local at=function(a8,a0)local _={}a0=a0+1;while 1 do local au,M;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="}"then a0=a0+1;break end;if a8:sub(a0,a0)~='"'then ac(a8,a0,"expected string for key")end;au,a0=a4(a8,a0)a0=a7(a8,a0,L,true)if a8:sub(a0,a0)~=":"then ac(a8,a0,"expected ':' after key")end;a0=a7(a8,a0+1,L,true)M,a0=a4(a8,a0)_[au]=M;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="}"then break end;if as~=","then ac(a8,a0,"expected '}' or ','")end end;return _,a0 end;local av={['"']=ak,["0"]=ao,["1"]=ao,["2"]=ao,["3"]=ao,["4"]=ao,["5"]=ao,["6"]=ao,["7"]=ao,["8"]=ao,["9"]=ao,["-"]=ao,["t"]=ap,["f"]=ap,["n"]=ap,["["]=ar,["{"]=at}a4=function(a8,a9)local as=a8:sub(a9,a9)local a2=av[as]if a2 then return a2(a8,a9)end;ac(a8,a9,"unexpected character '"..as.."'")end;local aw=function(a8)if type(a8)~="string"then error("expected argument of type string, got "..type(a8))end;local _,a9=a4(a8,a7(a8,1,L,true))a9=a7(a8,a9,L,true)if a9<=#a8 then ac(a8,a9,"trailing garbage")end;return _ end;
local lEncode, lDecode, lDigest = a3, aw, Z;

-------------------------------------------------------------------------------
--! CORE FUNCTIONS (REQUESTS & VERIFICATION)
-------------------------------------------------------------------------------

local useNonce = true 

local function safeRequest(options)
    local req = request or http_request or syn_request or (http and http.request )
    if not req then return nil, "HTTP requests not supported" end
    local success, response = pcall(function() return req(options) end)
    if success and type(response) == "table" then 
        return response 
    else 
        return nil, "Connection Error: " .. tostring(response or "Unknown") 
    end
end

local fSetClipboard = setclipboard or toclipboard or function() end
local fStringChar, fToString, fOsTime, fMathRandom, fMathFloor = string.char, tostring, os.time, math.random, math.floor
local fGetHwid = gethwid or function() return game:GetService("RbxAnalyticsService"):GetClientId() end

local cachedLink, cachedTime = "", 0
local host = "https://api.platoboost.com"

local function checkConnectivity( )
    local response, err = safeRequest({Url = host .. "/public/connectivity", Method = "GET"})
    if not response or (response.StatusCode ~= 200 and response.StatusCode ~= 429) then
        host = "https://api.platoboost.net"
        local fallbackResponse, fallbackErr = safeRequest({Url = host .. "/public/connectivity", Method = "GET"})
        if not fallbackResponse then
            return false 
        end
    end
    return true
end

local function generateNonce()
    local str = ""
    for _ = 1, 16 do str = str .. fStringChar(fMathFloor(fMathRandom() * (122 - 97 + 1)) + 97) end
    return str
end

local function cacheLink()
    local isConnected = checkConnectivity()
    if not isConnected then
        return false, "Network Error! Use VPN or change Executor."
    end
    
    if cachedTime + (10*60) < fOsTime() then
        local response, err = safeRequest({
            Url = host .. "/public/start",
            Method = "POST",
            Body = lEncode({service = Config.ServiceId, identifier = lDigest(fGetHwid())}),
            Headers = {["Content-Type"] = "application/json"}
        })
        if response and response.StatusCode == 200 then
            local decoded = lDecode(response.Body)
            if decoded.success then
                cachedLink = decoded.data.url
                cachedTime = fOsTime()
                return true, cachedLink
            end
        end
        return false, err or "Server Unreachable"
    end
    return true, cachedLink
end

-- Kapag mali ang key, laging "Invalid Key" ang lalabas.
local function redeemKey(key)
    local nonce = generateNonce()
    local body = {identifier = lDigest(fGetHwid()), key = key}
    if useNonce then body.nonce = nonce end
    
    local response, err = safeRequest({
        Url = host .. "/public/redeem/" .. fToString(Config.ServiceId),
        Method = "POST",
        Body = lEncode(body),
        Headers = {["Content-Type"] = "application/json"}
    })
    
    if response and response.StatusCode == 200 then
        local ok, decoded = pcall(lDecode, response.Body)
        if ok and type(decoded) == "table" and decoded.success and decoded.data and decoded.data.valid then
            if useNonce then
                if decoded.data.hash == lDigest("true" .. "-" .. nonce .. "-" .. Config.PlatoSecret) then 
                    if writefile then writefile(Config.KeyFileName, key) end
                    return true, "Success" 
                end
                return false, "Integrity Check Failed"
            end
            if writefile then writefile(Config.KeyFileName, key) end
            return true, "Success"
        end
        return false, "Invalid Key"
    end
    return false, err or "Server Error"
end

-------------------------------------------------------------------------------
--! GUI & MAIN SCRIPT EXECUTION
-------------------------------------------------------------------------------

local function StartMainScript()
    local player = game:GetService("Players").LocalPlayer
    local pGui = player:WaitForChild("PlayerGui")
    
    if pGui:FindFirstChild(Config.OldGuiName) then 
        pGui[Config.OldGuiName]:Destroy() 
        task.wait(0.1)
    end
    
    _G[Config.Secret] = true 
    
    loadstring(game:HttpGet(Config.MainScriptURL))()
end

-------------------------------------------------------------------------------
--! BLAIR HUB V2 GUI
-------------------------------------------------------------------------------

local function CreateGUI()
    local player = game:GetService("Players").LocalPlayer
    local coreGui = game:GetService("CoreGui")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local targetParent = pcall(function() return coreGui end) and coreGui or player:WaitForChild("PlayerGui")

    if targetParent:FindFirstChild("OYB_KeySystem") then targetParent.OYB_KeySystem:Destroy() end

    -- COLOR PALETTE
    local Theme = {
        Background  = Color3.fromRGB(9, 7, 13),
        Panel       = Color3.fromRGB(19, 14, 27),
        Input       = Color3.fromRGB(24, 17, 34),
        Crimson     = Color3.fromRGB(190, 30, 70),
        Purple      = Color3.fromRGB(125, 60, 195),
        Pink        = Color3.fromRGB(235, 80, 140),
        Text        = Color3.fromRGB(240, 230, 245),
        SubText     = Color3.fromRGB(150, 135, 168),
        Success     = Color3.fromRGB(100, 230, 160),
        Error       = Color3.fromRGB(240, 65, 90),
        Warn        = Color3.fromRGB(245, 175, 80),
    }

    local function Tween(obj, time, props, style, dir)
        local t = TweenService:Create(obj, TweenInfo.new(time, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out), props)
        t:Play()
        return t
    end

    local function Corner(parent, r)
        local c = Instance.new("UICorner", parent)
        c.CornerRadius = UDim.new(0, r)
        return c
    end

    local ScreenGui = Instance.new("ScreenGui", targetParent)
    ScreenGui.Name = "OYB_KeySystem"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    ---------------------------------------------------------------------------
    -- MAIN FRAME
    ---------------------------------------------------------------------------
    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Name = "Main"
    MainFrame.Size = UDim2.new(0, 360, 0, 420)
    MainFrame.Position = UDim2.new(0.5, -180, 0.5, -210)
    MainFrame.BackgroundColor3 = Theme.Background
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    Corner(MainFrame, 16)

    local Scale = Instance.new("UIScale", MainFrame)
    Scale.Scale = 0.6

    local bgGradient = Instance.new("UIGradient", MainFrame)
    bgGradient.Rotation = 90
    bgGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(32, 14, 40)),
        ColorSequenceKeypoint.new(0.5, Theme.Background),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 8, 24)),
    })

    -- Animated rotating neon border
    local mainStroke = Instance.new("UIStroke", MainFrame)
    mainStroke.Thickness = 2.5
    mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    mainStroke.Color = Color3.new(1, 1, 1)
    local strokeGrad = Instance.new("UIGradient", mainStroke)
    strokeGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Theme.Crimson),
        ColorSequenceKeypoint.new(0.35, Theme.Purple),
        ColorSequenceKeypoint.new(0.65, Theme.Pink),
        ColorSequenceKeypoint.new(1, Theme.Crimson),
    })
    task.spawn(function()
        local rot = 0
        while ScreenGui.Parent do
            rot = (rot + 2) % 360
            strokeGrad.Rotation = rot
            task.wait()
        end
    end)

    ---------------------------------------------------------------------------
    -- FLOATING PARTICLES (background)
    ---------------------------------------------------------------------------
    local ParticleLayer = Instance.new("Frame", MainFrame)
    ParticleLayer.Size = UDim2.new(1, 0, 1, 0)
    ParticleLayer.BackgroundTransparency = 1
    ParticleLayer.ClipsDescendants = true
    ParticleLayer.ZIndex = 1

    local function SpawnParticle(initial)
        local size = math.random(2, 5)
        local p = Instance.new("Frame", ParticleLayer)
        p.Size = UDim2.new(0, size, 0, size)
        p.BorderSizePixel = 0
        p.BackgroundColor3 = (math.random() > 0.5) and Theme.Crimson or Theme.Purple
        p.BackgroundTransparency = 0.7
        p.ZIndex = 1
        Corner(p, 10)
        local startX = math.random()
        local startY = initial and math.random() or 1.05
        p.Position = UDim2.new(startX, 0, startY, 0)
        local dur = math.random(40, 90) / 10
        local t = Tween(p, dur * startY, {
            Position = UDim2.new(startX + (math.random() - 0.5) * 0.15, 0, -0.05, 0),
            BackgroundTransparency = 1,
        }, Enum.EasingStyle.Linear)
        t.Completed:Connect(function() p:Destroy() end)
    end
    task.spawn(function()
        for _ = 1, 14 do SpawnParticle(true) end
        while ScreenGui.Parent do
            SpawnParticle(false)
            task.wait(0.35)
        end
    end)

    ---------------------------------------------------------------------------
    -- HEADER
    ---------------------------------------------------------------------------
    local Header = Instance.new("Frame", MainFrame)
    Header.Size = UDim2.new(1, 0, 0, 64)
    Header.BackgroundTransparency = 1
    Header.ZIndex = 3

    -- Logo (circle with spinning gradient ring)
    local Logo = Instance.new("Frame", Header)
    Logo.Size = UDim2.new(0, 40, 0, 40)
    Logo.Position = UDim2.new(0, 16, 0, 12)
    Logo.BackgroundColor3 = Theme.Panel
    Logo.ZIndex = 3
    Corner(Logo, 20)
    local logoStroke = Instance.new("UIStroke", Logo)
    logoStroke.Thickness = 2
    logoStroke.Color = Color3.new(1, 1, 1)
    local logoGrad = Instance.new("UIGradient", logoStroke)
    logoGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Theme.Crimson),
        ColorSequenceKeypoint.new(1, Theme.Purple),
    })
    task.spawn(function()
        local r = 0
        while ScreenGui.Parent do
            r = (r + 4) % 360
            logoGrad.Rotation = r
            task.wait()
        end
    end)
    local LogoText = Instance.new("TextLabel", Logo)
    LogoText.Size = UDim2.new(1, 0, 1, 0)
    LogoText.BackgroundTransparency = 1
    LogoText.Text = string.upper(string.sub(Config.HubName, 1, 1))
    LogoText.TextColor3 = Theme.Text
    LogoText.Font = Enum.Font.GothamBlack
    LogoText.TextSize = 20
    LogoText.ZIndex = 4

    -- Title with shimmer
    local Title = Instance.new("TextLabel", Header)
    Title.Size = UDim2.new(0, 220, 0, 26)
    Title.Position = UDim2.new(0, 66, 0, 10)
    Title.BackgroundTransparency = 1
    Title.Text = string.upper(Config.HubName)
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.Font = Enum.Font.GothamBlack
    Title.TextSize = 20
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.ZIndex = 4
    local titleGrad = Instance.new("UIGradient", Title)
    titleGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Theme.Crimson),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Theme.Purple),
    })
    task.spawn(function()
        while ScreenGui.Parent do
            titleGrad.Offset = Vector2.new(-1, 0)
            local t = Tween(titleGrad, 2.2, {Offset = Vector2.new(1, 0)}, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            t.Completed:Wait()
            task.wait(0.4)
        end
    end)

    local SubTitle = Instance.new("TextLabel", Header)
    SubTitle.Size = UDim2.new(0, 220, 0, 16)
    SubTitle.Position = UDim2.new(0, 66, 0, 36)
    SubTitle.BackgroundTransparency = 1
    SubTitle.Text = Config.HubDescription
    SubTitle.TextColor3 = Theme.SubText
    SubTitle.Font = Enum.Font.GothamMedium
    SubTitle.TextSize = 12
    SubTitle.TextXAlignment = Enum.TextXAlignment.Left
    SubTitle.ZIndex = 4

    -- Window buttons
    local CloseBtn = Instance.new("TextButton", Header)
    CloseBtn.Size = UDim2.new(0, 26, 0, 26)
    CloseBtn.Position = UDim2.new(1, -36, 0, 8)
    CloseBtn.BackgroundColor3 = Theme.Panel
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Theme.Error
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 13
    CloseBtn.AutoButtonColor = false
    CloseBtn.ZIndex = 5
    Corner(CloseBtn, 8)
    CloseBtn.MouseEnter:Connect(function() Tween(CloseBtn, 0.15, {BackgroundColor3 = Theme.Error, TextColor3 = Theme.Text}) end)
    CloseBtn.MouseLeave:Connect(function() Tween(CloseBtn, 0.15, {BackgroundColor3 = Theme.Panel, TextColor3 = Theme.Error}) end)
    CloseBtn.MouseButton1Click:Connect(function()
        Tween(Scale, 0.25, {Scale = 0.01}, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        task.wait(0.28)
        ScreenGui:Destroy()
    end)

    local MinBtn = Instance.new("TextButton", Header)
    MinBtn.Size = UDim2.new(0, 26, 0, 26)
    MinBtn.Position = UDim2.new(1, -68, 0, 8)
    MinBtn.BackgroundColor3 = Theme.Panel
    MinBtn.Text = "-"
    MinBtn.TextColor3 = Theme.Warn
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.TextSize = 18
    MinBtn.AutoButtonColor = false
    MinBtn.ZIndex = 5
    Corner(MinBtn, 8)
    MinBtn.MouseEnter:Connect(function() Tween(MinBtn, 0.15, {BackgroundColor3 = Theme.Warn, TextColor3 = Theme.Background}) end)
    MinBtn.MouseLeave:Connect(function() Tween(MinBtn, 0.15, {BackgroundColor3 = Theme.Panel, TextColor3 = Theme.Warn}) end)

    -- Divider
    local Divider = Instance.new("Frame", MainFrame)
    Divider.Size = UDim2.new(0.9, 0, 0, 2)
    Divider.Position = UDim2.new(0.05, 0, 0, 64)
    Divider.BorderSizePixel = 0
    Divider.BackgroundColor3 = Color3.new(1, 1, 1)
    Divider.ZIndex = 3
    local divGrad = Instance.new("UIGradient", Divider)
    divGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(0.2, Theme.Crimson),
        ColorSequenceKeypoint.new(0.8, Theme.Purple),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
    })

    ---------------------------------------------------------------------------
    -- DRAGGING
    ---------------------------------------------------------------------------
    do
        local dragging, dragStart, startPos
        Header.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = MainFrame.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then dragging = false end
                end)
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - dragStart
                MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
    end

    ---------------------------------------------------------------------------
    -- CONTENT
    ---------------------------------------------------------------------------
    local Content = Instance.new("Frame", MainFrame)
    Content.Size = UDim2.new(1, 0, 1, -72)
    Content.Position = UDim2.new(0, 0, 0, 72)
    Content.BackgroundTransparency = 1
    Content.ZIndex = 3

    local function Stroke(parent, color, thickness, transparency)
        local s = Instance.new("UIStroke", parent)
        s.Thickness = thickness or 1.5
        s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        s.Color = color
        s.Transparency = transparency or 0.4
        return s
    end

    local function HoverEffect(btn, normal, hover)
        btn.MouseEnter:Connect(function() Tween(btn, 0.15, {BackgroundColor3 = hover}) end)
        btn.MouseLeave:Connect(function() Tween(btn, 0.15, {BackgroundColor3 = normal}) end)
    end

    -- Ripple effect on click
    local function Ripple(btn, color)
        task.spawn(function()
            local r = Instance.new("Frame", btn)
            r.AnchorPoint = Vector2.new(0.5, 0.5)
            r.Position = UDim2.new(0.5, 0, 0.5, 0)
            r.Size = UDim2.new(0, 0, 0, 0)
            r.BackgroundColor3 = color or Color3.new(1, 1, 1)
            r.BackgroundTransparency = 0.6
            r.BorderSizePixel = 0
            r.ZIndex = btn.ZIndex + 1
            Corner(r, 200)
            Tween(r, 0.45, {Size = UDim2.new(0, 260, 0, 260), BackgroundTransparency = 1})
            task.wait(0.5)
            r:Destroy()
        end)
    end

    local currentY = 4

    -- Social buttons
    local function AddSocialButton(label, color, iconId, url, copiedText, extra)
        local Btn = Instance.new("TextButton", Content)
        Btn.Size = UDim2.new(0.9, 0, 0, 36)
        Btn.Position = UDim2.new(0.05, 0, 0, currentY)
        Btn.Text = "      " .. label
        Btn.Font = Enum.Font.GothamBold
        Btn.TextSize = 13
        Btn.AutoButtonColor = false
        Btn.BackgroundColor3 = Theme.Panel
        Btn.TextColor3 = Theme.Text
        Btn.ClipsDescendants = true
        Btn.ZIndex = 4
        Corner(Btn, 10)
        Stroke(Btn, color, 1.5, 0.4)
        HoverEffect(Btn, Theme.Panel, color)

        local Icon = Instance.new("ImageLabel", Btn)
        Icon.Size = UDim2.new(0, 20, 0, 20)
        Icon.Position = UDim2.new(0.1, 0, 0.5, -10)
        Icon.BackgroundTransparency = 1
        Icon.Image = iconId
        Icon.ZIndex = 5

        Btn.MouseButton1Click:Connect(function()
            Ripple(Btn)
            fSetClipboard(url)
            if _G.__BlairSetStatus then _G.__BlairSetStatus(copiedText, color) end
            if extra then extra() end
        end)

        currentY = currentY + 44
    end

    if Config.ShowDiscord then
        AddSocialButton("JOIN DISCORD", Theme.Purple, "rbxassetid://18505728201", Config.DiscordURL, "Discord Link Copied!", function()
            local inviteCode = string.match(Config.DiscordURL, "discord%.gg/([%w-]+)")
            if syn and syn.request and inviteCode then
                syn.request({Url = "http://localhost:1111/discord?invite=" .. inviteCode, Method = "GET"})
            end
        end)
    end
    if Config.ShowInstagram then
        AddSocialButton("FOLLOW INSTAGRAM", Theme.Pink, "rbxassetid://18355586382", Config.InstagramURL, "Instagram Link Copied!")
    end
    if Config.ShowYoutube then
        AddSocialButton("SUBSCRIBE YOUTUBE", Theme.Crimson, "rbxassetid://82532989017804", Config.YoutubeURL, "YouTube Link Copied!")
    end

    -- Key label
    local KeyLabel = Instance.new("TextLabel", Content)
    KeyLabel.Size = UDim2.new(0.9, 0, 0, 14)
    KeyLabel.Position = UDim2.new(0.05, 0, 0, currentY + 6)
    KeyLabel.BackgroundTransparency = 1
    KeyLabel.Text = "LICENSE KEY"
    KeyLabel.TextColor3 = Theme.SubText
    KeyLabel.Font = Enum.Font.GothamBold
    KeyLabel.TextSize = 11
    KeyLabel.TextXAlignment = Enum.TextXAlignment.Left
    KeyLabel.ZIndex = 4

    -- Key input
    local KeyInput = Instance.new("TextBox", Content)
    KeyInput.Size = UDim2.new(0.9, 0, 0, 44)
    KeyInput.Position = UDim2.new(0.05, 0, 0, currentY + 24)
    KeyInput.PlaceholderText = "Paste your key here..."
    KeyInput.PlaceholderColor3 = Theme.SubText
    KeyInput.Text = ""
    KeyInput.ClearTextOnFocus = false
    KeyInput.Font = Enum.Font.GothamSemibold
    KeyInput.TextSize = 14
    KeyInput.BackgroundColor3 = Theme.Input
    KeyInput.TextColor3 = Theme.Text
    KeyInput.ZIndex = 4
    Corner(KeyInput, 10)
    local inputStroke = Stroke(KeyInput, Theme.Purple, 1.5, 0.6)
    KeyInput.Focused:Connect(function()
        Tween(inputStroke, 0.2, {Transparency = 0, Color = Theme.Pink})
    end)
    KeyInput.FocusLost:Connect(function()
        Tween(inputStroke, 0.2, {Transparency = 0.6, Color = Theme.Purple})
    end)

    -- Buttons
    local function MakeButton(text, xScale, color, hoverColor)
        local Btn = Instance.new("TextButton", Content)
        Btn.Size = UDim2.new(0.435, 0, 0, 44)
        Btn.Position = UDim2.new(xScale, 0, 0, currentY + 78)
        Btn.Text = text
        Btn.Font = Enum.Font.GothamBlack
        Btn.TextSize = 14
        Btn.AutoButtonColor = false
        Btn.BackgroundColor3 = color
        Btn.TextColor3 = Theme.Text
        Btn.ClipsDescendants = true
        Btn.ZIndex = 4
        Corner(Btn, 10)
        local g = Instance.new("UIGradient", Btn)
        g.Rotation = 90
        g.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(190, 190, 190)),
        })
        HoverEffect(Btn, color, hoverColor)
        return Btn
    end

    local VerifyBtn = MakeButton("VERIFY", 0.05, Theme.Crimson, Color3.fromRGB(220, 50, 95))
    local GetKeyBtn = MakeButton("GET KEY", 0.515, Theme.Purple, Color3.fromRGB(150, 85, 220))

    -- Loading bar
    local BarTrack = Instance.new("Frame", Content)
    BarTrack.Size = UDim2.new(0.9, 0, 0, 3)
    BarTrack.Position = UDim2.new(0.05, 0, 0, currentY + 134)
    BarTrack.BackgroundColor3 = Theme.Panel
    BarTrack.BorderSizePixel = 0
    BarTrack.ClipsDescendants = true
    BarTrack.ZIndex = 4
    Corner(BarTrack, 3)
    local BarFill = Instance.new("Frame", BarTrack)
    BarFill.Size = UDim2.new(0.35, 0, 1, 0)
    BarFill.Position = UDim2.new(-0.4, 0, 0, 0)
    BarFill.BackgroundColor3 = Color3.new(1, 1, 1)
    BarFill.BorderSizePixel = 0
    BarFill.Visible = false
    BarFill.ZIndex = 5
    Corner(BarFill, 3)
    local barGrad = Instance.new("UIGradient", BarFill)
    barGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Theme.Crimson),
        ColorSequenceKeypoint.new(1, Theme.Purple),
    })

    local loading = false
    local function SetLoading(state)
        loading = state
        if state then
            BarFill.Visible = true
            task.spawn(function()
                while loading and ScreenGui.Parent do
                    BarFill.Position = UDim2.new(-0.4, 0, 0, 0)
                    local t = Tween(BarFill, 0.8, {Position = UDim2.new(1.05, 0, 0, 0)}, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                    t.Completed:Wait()
                end
                BarFill.Visible = false
            end)
        end
    end

    -- Status pill
    local StatusPill = Instance.new("Frame", Content)
    StatusPill.Size = UDim2.new(0.9, 0, 0, 28)
    StatusPill.Position = UDim2.new(0.05, 0, 0, currentY + 146)
    StatusPill.BackgroundColor3 = Theme.Panel
    StatusPill.ZIndex = 4
    Corner(StatusPill, 14)
    local pillStroke = Stroke(StatusPill, Theme.SubText, 1, 0.7)

    local StatusDot = Instance.new("Frame", StatusPill)
    StatusDot.Size = UDim2.new(0, 8, 0, 8)
    StatusDot.Position = UDim2.new(0, 12, 0.5, -4)
    StatusDot.BackgroundColor3 = Theme.SubText
    StatusDot.BorderSizePixel = 0
    StatusDot.ZIndex = 5
    Corner(StatusDot, 4)

    local Status = Instance.new("TextLabel", StatusPill)
    Status.Name = "StatusLabel"
    Status.Size = UDim2.new(1, -34, 1, 0)
    Status.Position = UDim2.new(0, 28, 0, 0)
    Status.BackgroundTransparency = 1
    Status.Text = "Waiting for input..."
    Status.TextColor3 = Theme.SubText
    Status.Font = Enum.Font.GothamMedium
    Status.TextSize = 12
    Status.TextXAlignment = Enum.TextXAlignment.Left
    Status.ZIndex = 5

    local function SetStatus(text, color)
        Status.Text = text
        Tween(Status, 0.2, {TextColor3 = color})
        Tween(StatusDot, 0.2, {BackgroundColor3 = color})
        Tween(pillStroke, 0.2, {Color = color, Transparency = 0.3})
    end
    _G.__BlairSetStatus = SetStatus

    -- Shake animation (invalid key)
    local function Shake()
        task.spawn(function()
            local base = MainFrame.Position
            for _, off in ipairs({12, -12, 8, -8, 4, -4, 0}) do
                MainFrame.Position = UDim2.new(base.X.Scale, base.X.Offset + off, base.Y.Scale, base.Y.Offset)
                task.wait(0.035)
            end
            MainFrame.Position = base
        end)
    end

    local function FlashInput(color)
        task.spawn(function()
            inputStroke.Color = color
            inputStroke.Transparency = 0
            Tween(inputStroke, 0.15, {Color = color})
            task.wait(1.2)
            if not KeyInput:IsFocused() then
                Tween(inputStroke, 0.3, {Color = Theme.Purple, Transparency = 0.6})
            end
        end)
    end

    -- Final sizes
    local fullHeight = 72 + currentY + 188
    MainFrame.Size = UDim2.new(0, 360, 0, fullHeight)
    MainFrame.Position = UDim2.new(0.5, -180, 0.5, -fullHeight / 2)

    -- Minimize toggle
    local minimized = false
    MinBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            Content.Visible = false
            Divider.Visible = false
            Tween(MainFrame, 0.25, {Size = UDim2.new(0, 360, 0, 64)}, Enum.EasingStyle.Quint)
            MinBtn.Text = "+"
        else
            Tween(MainFrame, 0.25, {Size = UDim2.new(0, 360, 0, fullHeight)}, Enum.EasingStyle.Quint)
            task.wait(0.2)
            Content.Visible = true
            Divider.Visible = true
            MinBtn.Text = "-"
        end
    end)

    ---------------------------------------------------------------------------
    -- INTRO SPLASH ANIMATION (lalabas pag ine-execute)
    ---------------------------------------------------------------------------
    MainFrame.Visible = false
    ScreenGui.IgnoreGuiInset = true

    local Overlay = Instance.new("Frame", ScreenGui)
    Overlay.Size = UDim2.new(1, 0, 1, 0)
    Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Overlay.BackgroundTransparency = 1
    Overlay.BorderSizePixel = 0
    Overlay.ZIndex = 0
    Tween(Overlay, 0.5, {BackgroundTransparency = 0.45})

    local Splash = Instance.new("Frame", ScreenGui)
    Splash.AnchorPoint = Vector2.new(0.5, 0.5)
    Splash.Position = UDim2.new(0.5, 0, 0.5, 0)
    Splash.Size = UDim2.new(0, 300, 0, 220)
    Splash.BackgroundTransparency = 1
    Splash.ZIndex = 10
    local SplashScale = Instance.new("UIScale", Splash)
    SplashScale.Scale = 1

    -- Logo na lumalaki + umiikot na ring
    local SLogo = Instance.new("Frame", Splash)
    SLogo.AnchorPoint = Vector2.new(0.5, 0.5)
    SLogo.Position = UDim2.new(0.5, 0, 0, 50)
    SLogo.Size = UDim2.new(0, 0, 0, 0)
    SLogo.BackgroundColor3 = Theme.Panel
    SLogo.ZIndex = 11
    Corner(SLogo, 50)
    local sLogoStroke = Instance.new("UIStroke", SLogo)
    sLogoStroke.Thickness = 3
    sLogoStroke.Color = Color3.new(1, 1, 1)
    local sLogoGrad = Instance.new("UIGradient", sLogoStroke)
    sLogoGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Theme.Crimson),
        ColorSequenceKeypoint.new(0.5, Theme.Purple),
        ColorSequenceKeypoint.new(1, Theme.Pink),
    })
    local splashAlive = true
    task.spawn(function()
        local r = 0
        while splashAlive and ScreenGui.Parent do
            r = (r + 6) % 360
            sLogoGrad.Rotation = r
            task.wait()
        end
    end)
    local SLogoText = Instance.new("TextLabel", SLogo)
    SLogoText.Size = UDim2.new(1, 0, 1, 0)
    SLogoText.BackgroundTransparency = 1
    SLogoText.Text = string.upper(string.sub(Config.HubName, 1, 1))
    SLogoText.TextColor3 = Theme.Text
    SLogoText.TextTransparency = 1
    SLogoText.Font = Enum.Font.GothamBlack
    SLogoText.TextSize = 40
    SLogoText.ZIndex = 12

    Tween(SLogo, 0.6, {Size = UDim2.new(0, 84, 0, 84)}, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    task.wait(0.3)
    Tween(SLogoText, 0.4, {TextTransparency = 0})
    task.wait(0.35)

    -- Pangalan ng hub (typewriter)
    local SName = Instance.new("TextLabel", Splash)
    SName.AnchorPoint = Vector2.new(0.5, 0)
    SName.Position = UDim2.new(0.5, 0, 0, 112)
    SName.Size = UDim2.new(1, 0, 0, 34)
    SName.BackgroundTransparency = 1
    SName.Text = ""
    SName.TextColor3 = Color3.new(1, 1, 1)
    SName.Font = Enum.Font.GothamBlack
    SName.TextSize = 28
    SName.ZIndex = 12
    local sNameGrad = Instance.new("UIGradient", SName)
    sNameGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Theme.Crimson),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Theme.Purple),
    })
    local fullName = string.upper(Config.HubName)
    for i = 1, #fullName do
        SName.Text = string.sub(fullName, 1, i)
        task.wait(0.07)
    end

    -- Loading bar + status text
    local STrack = Instance.new("Frame", Splash)
    STrack.AnchorPoint = Vector2.new(0.5, 0)
    STrack.Position = UDim2.new(0.5, 0, 0, 162)
    STrack.Size = UDim2.new(0, 200, 0, 4)
    STrack.BackgroundColor3 = Theme.Panel
    STrack.BorderSizePixel = 0
    STrack.ZIndex = 11
    Corner(STrack, 4)
    local SFill = Instance.new("Frame", STrack)
    SFill.Size = UDim2.new(0, 0, 1, 0)
    SFill.BackgroundColor3 = Color3.new(1, 1, 1)
    SFill.BorderSizePixel = 0
    SFill.ZIndex = 12
    Corner(SFill, 4)
    local sFillGrad = Instance.new("UIGradient", SFill)
    sFillGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Theme.Crimson),
        ColorSequenceKeypoint.new(1, Theme.Purple),
    })

    local SMsg = Instance.new("TextLabel", Splash)
    SMsg.AnchorPoint = Vector2.new(0.5, 0)
    SMsg.Position = UDim2.new(0.5, 0, 0, 174)
    SMsg.Size = UDim2.new(1, 0, 0, 18)
    SMsg.BackgroundTransparency = 1
    SMsg.Text = ""
    SMsg.TextColor3 = Theme.SubText
    SMsg.Font = Enum.Font.GothamMedium
    SMsg.TextSize = 12
    SMsg.ZIndex = 12

    local introSteps = {"Initializing...", "Checking connection...", "Loading interface..."}
    for i, msg in ipairs(introSteps) do
        SMsg.Text = msg
        Tween(SFill, 0.5, {Size = UDim2.new(i / #introSteps, 0, 1, 0)})
        task.wait(0.55)
    end
    task.wait(0.15)

    -- Splash exit -> lalabas yung key GUI
    splashAlive = false
    Tween(SplashScale, 0.3, {Scale = 0.01}, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    Tween(Overlay, 0.4, {BackgroundTransparency = 1})
    task.wait(0.32)
    Splash:Destroy()
    MainFrame.Visible = true
    Tween(Scale, 0.55, {Scale = 1}, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    task.wait(0.4)
    Overlay:Destroy()

    ---------------------------------------------------------------------------
    -- LOGIC
    ---------------------------------------------------------------------------
    local busy = false

    local function OnSuccess(text)
        SetLoading(false)
        SetStatus(text, Theme.Success)
        FlashInput(Theme.Success)
        task.wait(0.8)
        Tween(Scale, 0.3, {Scale = 0.01}, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        task.wait(0.32)
        ScreenGui:Destroy()
        StartMainScript()
    end

    VerifyBtn.MouseButton1Click:Connect(function()
        if busy then return end
        Ripple(VerifyBtn)
        local key = KeyInput.Text:gsub("%s+", "")
        if key == "" then
            SetStatus("Enter a key!", Theme.Warn)
            FlashInput(Theme.Warn)
            Shake()
            return
        end
        busy = true
        SetStatus("Verifying...", Theme.Purple)
        SetLoading(true)
        local success, msg = redeemKey(key)
        if success then
            OnSuccess("Key Valid! Loading hub...")
        else
            SetLoading(false)
            SetStatus(msg, Theme.Error)
            FlashInput(Theme.Error)
            Shake()
            busy = false
        end
    end)

    GetKeyBtn.MouseButton1Click:Connect(function()
        Ripple(GetKeyBtn)
        SetStatus("Getting link...", Theme.Purple)
        SetLoading(true)
        local success, link = cacheLink()
        SetLoading(false)
        if success then
            fSetClipboard(link)
            SetStatus("Key link copied! Open it in your browser.", Theme.Pink)
        else
            SetStatus(tostring(link), Theme.Error)
            Shake()
        end
    end)

    -- Auto-login with saved key
    if isfile and isfile(Config.KeyFileName) then
        local savedKey = readfile(Config.KeyFileName)
        if savedKey ~= "" then
            busy = true
            SetStatus("Found saved key, verifying...", Theme.Purple)
            SetLoading(true)
            task.spawn(function()
                local success = redeemKey(savedKey)
                if success then
                    OnSuccess("Auto-login success!")
                else
                    SetLoading(false)
                    SetStatus("Saved key expired or invalid.", Theme.Warn)
                    busy = false
                end
            end)
        end
    end
end

local player = game:GetService("Players").LocalPlayer
local pGui = player:WaitForChild("PlayerGui")

-- Keyless check: kung nasa whitelist ang player, derecho na sa main script
local function IsKeylessUser()
    local lname = string.lower(player.Name)
    for _, name in ipairs(Config.KeylessUsers or {}) do
        if string.lower(tostring(name)) == lname then return true end
    end
    for _, id in ipairs(Config.KeylessUserIds or {}) do
        if id == player.UserId then return true end
    end
    return false
end

if IsKeylessUser() then
    StartMainScript()
    return
end

if pGui:FindFirstChild(Config.MainGuiName) then
    StartMainScript() 
    return
end

CreateGUI()
