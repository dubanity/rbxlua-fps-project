# About
An unfinished FPS project I was working on back in 2019.
Mainly used for learning the [API Reference](https://developer.roblox.com/en-us/api-reference) in-depth, rather than a legitimate game.

## Anti-Exploit Architecture
The ClientHandler contains an interesting anti-exploitation feature that I will explain
due to the source of it abiding by the well-known philosophy *security by obscurity*.

Entering the game normally evokes no real sense of security due to my not focusing enough on the physics
aspects of the game. The real treasure resides in a special place only accessible to exploiters.

Finding yourself a good exploit that supports newcclosure() and getnamecallmethod() should be enough to follow along. I recommend [Synapse X](https://x.synapse.to/) and will be using this to demonstrate the anti-exploit.

## Introduction
Obviously this game has a remote because the weapon uses raycasts which are able to damage other humanoid entities.
If you try executing a simple remote spy like this one:
```lua
local gmt = getrawmetatable(game)
local o_namecall = gmt.__namecall
setreadonly(gmt, false)

gmt.__namecall = newcclosure(function(self, ...)
    local args = {...}
    local method = getnamecallmethod()


    if method == "FireServer" or method == "InvokeServer" then
        warn("Remote called!")
        warn("Location: ", self:GetFullName())
        warn("Type: ", method)
        warn("Args: ", unpack(args))
    end
    
    return o_namecall(self, unpack(args))
end)
```
You will notice there is a lot of spamming going on. This is the basis for the methodology behind the anti-exploit.
Remotes will start flying across the screen with apparently no name, also being parented to hashed services.
The names of the remotes are at first glance invisible but after around 20 seconds, will have a hashed
name just like the services.

On initial execution:
![e1](https://cdn.discordapp.com/attachments/663664381715808279/751646374671417454/unknown.png)

About 10 or 20 Seconds Later:
![e2](https://cdn.discordapp.com/attachments/663664381715808279/751646536756363315/unknown.png)

Logically the remotes would reside in ReplicatedStorage.
Viewing that in Dex yields the following:
![e3](https://cdn.discordapp.com/attachments/663664381715808279/751646941418618890/unknown.png)

The output starts to make a little more sense now, but you will notice an issue.
Where is the raycast remote being fired when you shoot the weapon?

## Disassembly
When the script is first executed on the client, there is actually a small window where you
can find something useful in the output.
Here is what that looks like:
![e4](https://cdn.discordapp.com/attachments/663664381715808279/751648068624973884/unknown.png)

A bunch of hashes fired to the server using a remote function; seamingly useless, but this is actually
the initializer remote.
Diving into the code you will notice all the names of the "Security Section" portion of code are obfuscated.
This is not a great way of going about it, but it still follows the philosophy in the way I want to portray it:
* Service names and initializer key arguments are hashed using `GUID`.
* Functions, variables, and tables in the script are hashed using `MD5`.
* And finally, one of the table indicies use hexadecimal for encoding in a specific way.

The first piece of code is your classic "Network" table initialization.
```lua
shared.Key_eec89088ee408b80387155272b113256 = {}

setmetatable(shared.Key_eec89088ee408b80387155272b113256, {
	__call = function(tb1, ...)
		return HT_90d64eeba8247d656ef6b4800ec0f52f[IDX_6a992d5529f459a44fee58c733255e86[math.random(1, #IDX_6a992d5529f459a44fee58c733255e86)]]
	end
})
```
The `Key_eec89088ee408b80387155272b113256` is used as a function to return a random hash value 
from the `HT_90d64eeba8247d656ef6b4800ec0f52f` table.
```lua
local Key_0fea6a13c52b4d4725368f24b045ca84 = {}

for i = 1, 100, 1 do
    local hash = shared.Key_eec89088ee408b80387155272b113256()
    table.insert(Key_0fea6a13c52b4d4725368f24b045ca84, #Key_0fea6a13c52b4d4725368f24b045ca84+1, hash)
end

function shared.Key_eec89088ee408b80387155272b113256:InvokeServer(Key_cf51066f49e517f274b8173cc265c60b, ...)
    return Key_cf51066f49e517f274b8173cc265c60b:InvokeServer(...)
end

function shared.Key_eec89088ee408b80387155272b113256:FireServer(Key_cf51066f49e517f274b8173cc265c60b, ...)
    Key_cf51066f49e517f274b8173cc265c60b:FireServer(...)
end
```
The next table `Key_0fea6a13c52b4d4725368f24b045ca84` is a container for exactly 100 of the remotes generated from the previous table.
This table is then used as the initializer remote arguments which you can see by executing the
remote spy before entering the game.
The reason for the `IDX_6a992d5529f459a44fee58c733255e86` table having hexadecimal indexes is because
when the exploiter tries to view the source using DEX, it evaluates to what the hex is converted to... Which
provides the definition for *obscurity*.
The true calls to the server are embedded into a function with the remote being the first argument.
This prevents the exploiter from using namecall hijacking to call the remote automatically.

```lua
spawn(function()
    while wait(math.random(0.5, 1.5)) do
        for idx, val in pairs(ReplicatedStorage.Remotes:GetChildren()) do
            if val.ClassName == "RemoteFunction" then
                shared.Key_eec89088ee408b80387155272b113256:InvokeServer(val)
            end
        end
    end
end)

spawn(function()
    while wait(math.random(0.5, 1.5)) do
        for idx, val in pairs(ReplicatedStorage.Remotes:GetChildren()) do
            if val.ClassName == "RemoteEvent" then
                shared.Key_eec89088ee408b80387155272b113256:FireServer(val)
            end
        end
    end
end)
```

All of those remotes you saw before being spammed in the output come from this code.
Its not that great performance-wise, but it definitely hides the initializer remote
and any other remotes being fired.

```lua
getfenv(1).Key_c55582518cba2c464f29f5bae1c68def = function()
    return function()
        for idx, val in pairs(ReplicatedStorage.Remotes:GetChildren()) do
            if val.ClassName == "RemoteFunction" then
                local Key_fef3f7bf6d921b1dcbd24b6a57061af6 = shared.Key_eec89088ee408b80387155272b113256:InvokeServer(val, unpack(Key_0fea6a13c52b4d4725368f24b045ca84))
                CollectionService:AddTag(Key_fef3f7bf6d921b1dcbd24b6a57061af6, string.upper("fef3f7bf6d921b1dcbd24b6a57061af6")) --> Raycast [RemoteEvent MD5 Hash]
                return Key_fef3f7bf6d921b1dcbd24b6a57061af6
            end
        end
    end
end

for idx, val in pairs(getfenv(1)) do
    if type(val) == "function" then
        local rGet = val()
        local Key_117e624bbbd5afc75a3150ba85d3cb93 = rGet()
        shared.Key_eec89088ee408b80387155272b113256:FireServer(Key_117e624bbbd5afc75a3150ba85d3cb93)
    end
end
```
The server is listening for any type of remote functions being invoked, but once the arguments list
of one of the calls is exactly 100 in length, it invokes the client with a newly generated remote
event on the server.
This remote gets stored inside the `Key_fef3f7bf6d921b1dcbd24b6a57061af6` variable, and this remote
is also the raycast remote.
I use the CollectionService to add a tag so I cant lose track of it.
Going down to about line 413, this is where the raycast remote is retrieved and then called for game
development usage.

## Conclusion
All in all, the ideology behind this showcase is great but the execution is terrible.
Here is a [link](https://www.roblox.com/games/9484903668) to a demo game in which I 
provide a better version excluding the usage of the depreacted raycast system, has a
more performant style, and does not obfuscate everything so it is more readable.

### Credits
Here is a list of people that have helped contribute ideas to this project along the way:
* Uctron for some fun hidden API functions
* CleverSource for the original head-follow-mouse method using R15
* Headstackk & vastqud for similar methods
* Anubiantic for the original models and idea planning
* isayiah for helpful welding tips and general math and physics concepts
* Depr1 for original gun sway method and lots of error handling solutions
