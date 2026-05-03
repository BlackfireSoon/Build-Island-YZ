local player = game.Players.LocalPlayer
local banned = {
  'blockdown64';
  'plexitium';
}
local honor = {
  'blockdown64'; --The griefing and exploiting master!
  'MyManOldenTime'; --He is soo good at making exploits for roblox games
  'Subchromatic'; --The leader of IgnationClan X, the maker of this exploiting script
  'jegerrex';
  'fliptherepublics';
}

if game.PlaceId ~= 129337676281349 then
player:Kick('F')
end

for i,v in ipairs(game.Players:GetChildren()) do
  if table.find(honor, v.Name) then
    player.Character.HumanoidRootPart.CFrame = v.Character.Head.CFrame
    task.wait()
    print('Do not exploit in servers owned by HR Ignation affiliates. In this case: @' .. v.Name .. '.')
  end
end

if table.find(banned, player.Name:lower()) then
  
  player:Kick('Ḃ̴̛͎̤̜͙͉̦͖̈́̂Ļ̸̦͎͕̭̳̣̲̳̈́̇̐̓̏̾̾̓ͅA̶̡͔̝̲͉̠̬̠̿̈́̊̏́̓̂ͅͅČ̴̛̞̿̈́̂̔͌͒̄K̸̢̢͖͚̖͉̫̘̱̍̍̔͊͋͋̊̑L̷̗̿͌̈̾̚͠I̸̢̧̧̤̫̗͕̔ͅŠ̵̭̃T̴͚̟̦̭͈̣͛́̏͝E̶̝̭͍͉̾͘D̷̨̹͍͖̙̞̠̂͆ͅ ̸̝̟̘͈͓̟̝̓̌͂̌̅̀̇̋́̕ͅͅU̵̟̱͎̪̞͝Ś̸̬̿͂͂̿̽̿E̶͙̭͂͜R̶̲͍̈͂̿́̇')
  
  for i = 1, math.huge do
    
    print('Ḃ̴̛͎̤̜͙͉̦͖̈́̂Ļ̸̦͎͕̭̳̣̲̳̈́̇̐̓̏̾̾̓ͅA̶̡͔̝̲͉̠̬̠̿̈́̊̏́̓̂ͅͅČ̴̛̞̿̈́̂̔͌͒̄K̸̢̢͖͚̖͉̫̘̱̍̍̔͊͋͋̊̑L̷̗̿͌̈̾̚͠I̸̢̧̧̤̫̗͕̔ͅŠ̵̭̃T̴͚̟̦̭͈̣͛́̏͝E̶̝̭͍͉̾͘D̷̨̹͍͖̙̞̠̂͆ͅ ̸̝̟̘͈͓̟̝̓̌͂̌̅̀̇̋́̕ͅͅU̵̟̱͎̪̞͝Ś̸̬̿͂͂̿̽̿E̶͙̭͂͜R̶̲͍̈͂̿́̇')
    
  end
end
