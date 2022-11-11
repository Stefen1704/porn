_G.Toggle_Key = "e"; 
_G.ServerHop = true;
 

task.spawn(function()
        game:GetService("RunService").Heartbeat:connect(function()
            local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
        hrp.CFrame = hrp.CFrame * CFrame.Angles(0,math.rad(10),0)
        wait(0.01)
game.Players.LocalPlayer.Character['Right Leg']:remove()
game.Players.LocalPlayer.Character['Left Leg']:remove()
game.Players.LocalPlayer.Character['Left Arm']:remove()
        end)
    end)
repeat task.wait() until game:GetService("Players").LocalPlayer.Character;
local Plrs = game:GetService("Players");
local Plr = Plrs.LocalPlayer;
local RunService = game:GetService("RunService");
 
task.spawn(function()
    for i,v in next, getconnections(Plr.Idled) do
        v:Disable()
    end
end)
 
if _G.ServerHop == true then
    _G.Enabled = true
else
    _G.Enabled = false
end
 
task.spawn(function()
    Plr:GetMouse().KeyDown:Connect(function(key)
        if key == string.lower(_G.Toggle_Key)then
            _G.Enabled = not _G.Enabled;
			game.StarterGui:SetCore("SendNotification", {
                Title = "Autokill Status";
                Text = _G.Enabled;
                Duration = 5;
            })
        end
    end)
end)
 
local function MyTarget()
    if Plr.PlayerGui:WaitForChild("ScreenGui").UI.Target.TargetText.Text ~= "prisman389023" and Plr.PlayerGui:WaitForChild("ScreenGui").UI.Target.TargetText.Text ~= tostring(Plr.Name) then
        return Plr.PlayerGui:WaitForChild("ScreenGui").UI.Target.TargetText.Text;
    else
        return nil 
    end
end
 
task.spawn(function()
    RunService.Stepped:Connect(function()
        if MyTarget() ~= nil then
            if _G.Enabled == true then
                local Tool = Plr.Backpack:FindFirstChildOfClass("Tool") or Plr.Character:FindFirstChildOfClass("Tool")
                if Tool and not workspace[MyTarget()]:FindFirstChild("ForceField") then
                    if Plr.PlayerGui:WaitForChild("ScreenGui").UI.Target.Visible == true then
                        Plr.Character:WaitForChild("HumanoidRootPart").CFrame = workspace[MyTarget()]:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(math.random(-1, 1), 0, 1.5)
                    end
                end
            end
        end
    end)
end)
 
task.spawn(function()
    while task.wait(.05) do
        if _G.Enabled == true then
            if Plr.PlayerGui:WaitForChild("ScreenGui").UI.Target.Visible == true then
                if Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart") and workspace[MyTarget()]:FindFirstChild("HumanoidRootPart") then
                    if MyTarget() ~= nil then
                        if (Plr.Character.Head.Position - workspace[MyTarget()]:WaitForChild("HumanoidRootPart").Position).Magnitude <= 7.5 then
                            local Tool = Plr.Backpack:FindFirstChildOfClass("Tool") or Plr.Character:FindFirstChildOfClass("Tool")
                            Plr.Character:WaitForChild("Humanoid"):EquipTool(Tool)
                            game.ReplicatedStorage.Remotes.ThrowKnife:FireServer(
                                workspace:WaitForChild(MyTarget()):WaitForChild("baseHitbox").Position,
                                0,
                                CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                            )
                        end
                    end
                end
            else
                Plr.Character:WaitForChild("Humanoid"):UnequipTools()
            end
        end
    end
end)
 
task.spawn(function()
    RunService.Stepped:Connect(function()
        if _G.Enabled == true then
            if Plr.PlayerGui:WaitForChild("ScreenGui").UI.Target.Visible == true then
            end
        end
    end)
end)
 
task.spawn(function()
    game.RunService.Heartbeat:Connect(function()
        for i,v in pairs(game:GetService('Players'):GetChildren()) do
   AnimationId = "282574440"
   local Anim = Instance.new("Animation")
   Anim.AnimationId = "rbxassetid://"..AnimationId
   local animplay = game:GetService('Players').LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
   animplay:Play()
   animplay:AdjustSpeed(1)
end
end)
 
 
task.spawn(function()
    local Remotes = game:GetService("ReplicatedStorage").Remotes
 
    local Cheat = {
        Remotes:WaitForChild("clientkick"),
        Remotes.ClanRemotes:WaitForChild("KickPlayer"),
        Remotes.ClanRemotes:WaitForChild("LocalKick"),
    }
 
    do
        for i, v in next, Cheat do
            if v ~= nil then
                v:Destroy()
            end
        end
    end
end)
 
task.spawn(function()
    while true do
        if _G.Enabled == true then
            if Plr.PlayerGui:WaitForChild("ScreenGui").UI.Target.Visible == true then
                for _, v in next, Plr.Character:GetDescendants() do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end
 
        game:GetService("RunService").Stepped:wait()
    end
end)
 
task.spawn(function()
    while true do
        if _G.Enabled == true then
            if Plr.PlayerGui:WaitForChild("ScreenGui").UI.Target.Visible == true then
                if workspace:WaitForChild("GameMap") then
                    for i,v in next, workspace.GameMap:GetDescendants() do
                        if v:IsA("BasePart") and v.Size ~= Vector3.new(0,0,0) then
                            v.Size = Vector3.new(0,0,0);
                        end
                    end
                end
            end
        end
 
        task.wait(1)
    end
end)
 
task.spawn(function()
    local Connection;
    local Force;
 
    local function GetMass(Model)
        local Mass = 0;
 
        for i,v in next,Model:GetDescendants() do
            if v:IsA("BasePart") then
                Mass = Mass + v:GetMass();
            end
        end
 
        return Mass;
    end
 
    local function Float(Character)
        if Connection then
            Connection:Disconnect();
            Connection = nil;
        end
 
        if not Force then
            Force = Instance.new("BodyForce");
        end
 
        local Root = Character:WaitForChild("HumanoidRootPart");
 
        Force.Parent = Root;
 
        Connection = RunService.Stepped:Connect(function()
            if (Plr.Character:WaitForChild("HumanoidRootPart").Position - game:GetService("Workspace").FountainKnife.Position).Magnitude > 300 and _G.Enabled == true then
                Root.Velocity = Vector3.new(Root.Velocity.X, 0, Root.Velocity.Z);
                Force.Force = Vector3.new(0, GetMass(Character) * workspace.Gravity, 0);
            else
                Force.Force = Vector3.zero;
            end
        end)
    end
 
    if Plr.Character then
        Float(Plr.Character);
    end
 
    Plr.CharacterAdded:Connect(Float);
end)
 
task.spawn(function()
    local Candies = workspace.EventCurrency;
    local Round_Status = Plr.PlayerGui:WaitForChild("ScreenGui").UI.textD;
    local RunService = game:GetService("RunService");
 
    task.spawn(function()
        RunService.Stepped:Connect(function()
            for i, v in next, Candies:GetDescendants() do
                if v.ClassName == "TouchTransmitter" then
                    firetouchinterest(Plr.Character:WaitForChild("HumanoidRootPart"), v.Parent, 0);
                end
            end
        end)
    end)
end)
 
task.spawn(function()
    if _G.ServerHop == true then
        local Players_In_Your_Lobby = 0
 
        task.spawn(function()
           Plrs.PlayerAdded:Connect(function(player)
                Players_In_Your_Lobby = 1
            end)
 
           Plrs.PlayerRemoving:Connect(function(player)
                Players_In_Your_Lobby = 1
            end)
 
            for i, v in next,Plrs:GetPlayers() do
                Players_In_Your_Lobby = 1
            end
        end)
 
        task.spawn(function()
            while true do
                if Players_In_Your_Lobby < 4 then
                    _G.Place = _G.Servers
                    loadstring(game:HttpGet("https://pastebin.com/raw/QzKkcxcb", true))();
                end
                task.wait(1)
            end
        end)
 
        task.spawn(function()
            while true do
                if game.PlaceId ~= _G.Servers then
                    game:GetService("TeleportService"):Teleport(_G.Servers, Plr);
                end
                task.wait(1)
            end
        end)
 
		task.spawn(function()
		    game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
			    if child.Name == "ErrorPrompt" and child:FindFirstChild("MessageArea") and child.MessageArea:FindFirstChild("ErrorFrame") then
			        _G.Place = _G.Servers
				    loadstring(game:HttpGet("https://pastebin.com/raw/QzKkcxcb", true))();
			    end
		    end)
	    end)
    end
end)
end)
