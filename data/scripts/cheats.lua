-- Cheat codes
-- $Id: cheats.lua,v 1.15 2005/07/06 12:55:55 anton Exp $


--------------------------------------------------
-- cheat codes for buka testers
--------------------------------------------------

function gimmegimmegimme()
		if testcheat()~=1 then return end

		AddPlayerMoney( 10000 )
		println( "Money added" )

		local v = GetPlayerVehicle()

		v:AddModifier( "maxhp", "+ 10000" )
		v:AddModifier( "hp", "+ 10000" )
		println( "HP added" )

		v:AddModifier( "maxfuel", "+ 10000" )
		v:AddModifier( "fuel", "+ 10000" )
		println( "Fuel added" )
end

function GiveMoney(money)
	if testcheat()~=1 then return end
	local mmm=1000
	if money then mmm=money end
	AddPlayerMoney(mmm)
end

function GiveAll()
	if testcheat()~=1 then return end
	gimmegimmegimme()
end

function GiveVehicle(num)
	if testcheat()~=1 then return end
	local model="Bug01"
	if num==1 then
		model="Sml1ForSale"
	elseif num==2 then
		model="Sml2ForSale"
	elseif num==3 then
		model="Sml3ForSale"
	elseif num==4 then
		model="Sml4ForSale"
	elseif num==5 then
		model="ScoutForSale"
	elseif num==6 then
		model="FighterForSale"
	elseif num==7 then
		model="HunterForSale"
	elseif num==8 then
		model="CruiserForSale"
	elseif num==9 then
		model="DozerForSale"
	elseif num==10 then
		model="Bug01"		
	elseif num==11 then
		model="Molokovoz02"		
	elseif num==12 then
		model="Ural02"		
        elseif num==13 then
		model="Belaz01"		
	elseif num==14 then
		model="Mirotvorec01"
	elseif num==15 then
		model="ScoutAtForSale"
	elseif num==16 then
		model="HunterAtForSale"
        elseif num==17 then
		model="UralAtForSale"
	elseif num==18 then
		model="ArcadeScout01"
	elseif num==19 then
		model="UralShot"
	elseif num==20 then
		model="BelazShot"
	elseif num==21 then
		model="MirotvorecShot"
	elseif num==22 then
		model="Tank01"
	elseif num==23 then
		model="AtTank01"
	elseif num==24 then
		model="RobotMetatron"
	elseif num==25 then
		model="BelazAtForSale"
	end
	AddPlayerVehicle(model)
end

function ShowMap()
	local mapsize = GET_GLOBAL_OBJECT( "CurrentLevel" ):GetLandSize() * 128
	local mapname = GET_GLOBAL_OBJECT( "CurrentLevel" ):GetLevelName()
	ShowRectOnMinimap(mapname, 1, 1, mapsize, mapsize)
end

--��� �㭠���� :)

function allmod (md)
	if testcheat()~=1 then return end
	local mode=1
	if md then mode=md end
	AddItemsToPlayerRepository("additional_durability2", 5)
	AddItemsToPlayerRepository("add_stability_and_speed", 5)
	AddItemsToPlayerRepository("all_system_guns1", 5)
end

function god (md)
	if testcheat()~=1 then return end
	local mode=1
	if md then mode=md end
	GetPlayerVehicle():setGodMode(mode)  
end

function truck (number)
	GiveVehicle (number)
end

function car (number)
	GiveVehicle (number)
end

function skin (num)
    local number=0
    if num then number=num end
	GetPlayerVehicle():SetSkin(number)
end

function giveall ()
	if testcheat()~=1 then return end
	AddPlayerMoney( 10000 )

	local v = GetPlayerVehicle()

	v:AddModifier( "maxhp", "+ 10000" )
	v:AddModifier( "hp", "+ 15000" )

	v:AddModifier( "maxfuel", "+ 10000" )
	v:AddModifier( "fuel", "+ 11000" )
end

function teleport ()
	if testcheat()~=1 then return end
	MovePlayerToCamera()
end

function tp ()
	teleport()
end

function cab (num)
	if testcheat()~=1 then return end
   local number=1
   if num then number=num end
   local curcab=GetPlayerVehicle():GetCabin():GetProperty("Prototype").AsString
   local len=strlen(curcab)
   local newcab=strsub(curcab, 1, len-1)..number
   GetPlayerVehicle():SetNewPart("CABIN",newcab)
end

function cargo (num)
	if testcheat()~=1 then return end
   local number=1
   if num then number=num end
   local curcargo=GetPlayerVehicle():GetBasket():GetProperty("Prototype").AsString
   local len=strlen(curcargo)
   local newcargo=strsub(curcargo, 1, len-1)..number
   GetPlayerVehicle():SetNewPart("BASKET",newcargo)
end

function giveguns ()
--������
	if testcheat()~=1 then return end
			local veh=GetPlayerVehicle()
			local parts={"CABIN_","BASKET_","CHASSIS_"}
			local slots={"SMALL_","BIG_","GIANT_","SIDE_"}
			local guns={"GUN","GUN_0","GUN_1","GUN_2"}
			local smallgun={"hornet01","specter01","pkt01","kord01","maxim01","storm01","fagot01"}
			local biggun={"rapier01","vector01","vulcan01","flag01","kpvt01","rainmetal01","elephant01","odin01","bumblebee01","omega01","hurricane01"}
			local giantgun={"cyclops01","octopus01","rocketLauncher","big_swingfire01"}
			local sidegun={"hailSideGun","marsSideGun","zeusSideGun","hunterSideGun"}
			local i,j,k=1,1,1
			while parts[i] do
				while slots[j] do
					while guns[k] do
--						LOG(parts[i]..slots[j]..guns[k])
						local gun=1
						local slot=parts[i]..slots[j]..guns[k]
						if j==1 then
							gun=smallgun[random(7)]
						elseif j==2 then
							gun=biggun[random(11)]
						elseif j==3 then
							gun=giantgun[random(4)]
						elseif j==4 then
							gun=sidegun[random(4)]
						end

--						LOG(gun)
						if veh:CanPartBeAttached(slot) then
						    LOG(slot.." -- "..gun)
							veh:SetNewPart(slot,gun)
						end
						k=k+1
					end
					k=1
					j=j+1
				end
				j=1
				i=i+1
			end
end

function map ()
	ShowMap()
end

function givemoney(money)
	if testcheat()~=1 then return end
	local mmm=1000
	if money then mmm=money end
	AddPlayerMoney(mmm)
end

function suicide()
	GetPlayerVehicle():AddModifier( "hp", "= 0" )
end


function OpenEncyclopaedia()
	Journal:ShowAllInEncyclopaedia()
end

function testcheat()
    if	GetComputerName() == "JSINX" 	or GetComputerName() == "ANTON2" 	or
		GetComputerName() == "MIF2000"	or GetComputerName() == "HRRR" 		or
		GetComputerName() == "PHOSGEN" 	or GetComputerName() == "ALEXTG" 	or
		GetComputerName() == "MAIN" 	or GetComputerName() == "POWERPLANT" 	or
		GetComputerName() == "VANO" 	or GetComputerName() == "STAZ" 		then
		return 1
	end
	if anticheat==0 then	
		LOG("---------------------- CHEAT WAS USED --------- ANTICHEAT -----------------")
    	AddFadingMsgId( "fm_cheat_is_allowed" )
    	AddImportantFadingMsgId( "fm_cheat_is_allowed" )
		return 1
 	else
		LOG("---------------------- CHEAT CAN'T BE USED ---- ANTICHEAT -----------------")
    	AddFadingMsgId( "fm_cheat_is_not_allowed" )
    	AddImportantFadingMsgId( "fm_cheat_is_not_allowed" )
    	return 0
 	end
end


