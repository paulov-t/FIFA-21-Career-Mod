PLAYER_FLUSHNESS_COLOR_LIST = { 0x00, 0xFFDE64AE, 0xFFDE64AE, 0xE5DE64AE, 0xD8DE64AE, 0xCCDE64AE, 0x99DE64AE, 0x8CDE64AE, 0x7FDE64AE, 0x66DE64AE, 0x4CDE64AE }

-- generic hair colors
PLAYER_COLOR_PRI_LIST = { 0x00B5A787, 0x00000000, 0x00AB875E, 0x00534238, 0x00A89176, 0x007B614A, 0x00483928, 0x00744F34, 0x007A7A7A, 0x00777777, 0x006A7434, 0x00346A74, 0x00744F34, 0x00603124, 0x00e75366 }
PLAYER_COLOR_SEC_LIST = { 0x00A89269, 0x00231E1E, 0x00A28963, 0x0045332B, 0x00C5B48F, 0x007E6751, 0x00544236, 0x006C371C, 0x009C9996, 0x00787B7D, 0x004B6C28, 0x0028466C, 0x006C4633, 0x00583325, 0x00720c38 }
PLAYER_COLOR_TER_LIST = { 0x00473326, 0x00100E0D, 0x00362815, 0x0017110E, 0x0056463A, 0x002F211A, 0x001F140E, 0x00250E02, 0x00362F2D, 0x00232421, 0x0022250F, 0x0016162C, 0x0021150F, 0x00171413, 0x00330f2d }

ACCESSORY_COLOR_LIST = { 0x00ffffff, 0x000a0a0a, 0x00000072, 0x00720000, 
						 0x00cece00, 0x00000900, 0x009b0900, 0x00090026, 
						 0x00060000, 0x00e112e1, 0x00130001, 0x000038e1, 
						 0x0000001f, 0x003f3f3f }

local FACIALHAIRCOLOR_REMAP = {1, 0, 3, 6, 7}

-------------------------
----- PAULS HELPERS -----
local v2k4Debug = { }
local v2k4debugfile = io.open("v2k4debugfile.txt", "w")
v2k4debugfile:write('initialisation\n')

local use_other_face_system = 0

-------------------------
----- PAULS HELPERS -----

function dumpJson(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. ''..k..' : ' .. dumpJson(v) .. ',\n'
      end
      return s .. '}\n '
   else
      return tostring(o)
   end
end

function dumpKeyValue(o) 
	local s = ''
	for k, v in pairs(o) do
		s = s .. k
		s = s .. '='
		s = s .. v
		s = s .. "\n"
		
	end
	return s
end

function dir_exists(directory)
  local ok, err, code = os.rename(directory, directory)
   if not ok then
      if code == 13 then
         -- Permission denied, but it exists
         return true
      end
   end
   return ok, err
end

function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

-- get all lines from a file, returns an empty 
-- list/table if the file does not exist
function lines_from(file)
  if not file_exists(file) then return {} end
  lines = {}
  for line in io.lines(file) do 
    lines[#lines + 1] = line
  end
  return lines
end

function mysplit (inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end

function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

function contains(list, x)
	for _, v in pairs(list) do
		if v == x then return true end
	end
	return false
end

function getVariableFromTable(t, vr) 
	if contains(t, vr) then 
		
		for _, v in pairs(t) do
		if v == vr then return t[vr] end
	end
	
	end
	return nil
end

function getVariableFromFile(file, variableToGet) 
	if(file_exists(file)) then
		
		local lines = lines_from(file)
		
		
		for k,v in pairs(lines) do
		
			local r = split(v, '=')
			
			
			local varName = ""
			local varValue = ""
			for key, value in pairs(r) do
			
				if (varName == "") then
					varName = value
				
				else
					varValue = value
					
					if varName == variableToGet then
						return varValue
					end
					
				end
			end
		end
	end
	
	return nil
end

function random_elem(tb)
    local keys = {}
    for k in pairs(tb) do table.insert(tb, k) end
    return tb[keys[math.random(#keys)]]
end

--v2k4debugfile:write('create hair and facial hair table arrays\n')
local hair_bald = {
	0, -- Bald
	26 -- thin sides
}

local hair_receeding = {
	29, -- receeding
	72, -- receeding thick
	112, -- receeding thick slight spike and mullet
	43
}

local hair_veryshort = {
	1, -- Crew
	16, -- Crew thick
	25, -- thin
	28, -- Crew thick
	60 -- Crew thick
}

local hair_short_wavy = {
	17, -- Wavy slight spiked, thick sides
	18, -- Wavy spiked, thin sides
	57, -- Wavy Styled parting
	114, -- Wavy Styled parting
	115, -- Wavy Styled parting
	118, -- Wavy Styled parting
	104, -- thick sides scruffy
	93
}

local hair_short_curly = {
	21, -- Curly slight spiked
	22, -- Curly Thick spiked
	65, -- short and slick
	93
}

local hair_short_straight = {
	23, -- straight flat hair
	24, -- straight spiked fringe
	64, -- Spiked top (mowhawk)
	65, -- short and slick
	133 -- straight spiked fringe
}

local hair_medium_straight = {
	126, -- straight spiked parted hair
	128, -- straight spiked parted hair
	130, -- straight spiked parted hair
	284 -- straight spiked parted hair
}

local hair_medium_wavy = {
	509, -- wavy spiked parted hair 
	116 -- Wavy Styled parting
	
}

local hair_afro = {
	2, -- Small Afro
	3, -- Big Afro
	97 -- Medium Afro
}

local hair_cornrows = {
	4, -- Short Cornrows
	5, -- Side Parted Long Cornrows
	6, -- Ponytail Cornrows
	7, -- Ponytail Cornrows 2
	549 -- medium length cornrows, bouncy
}

local hair_wavyShoulderLength = {
	11, -- Wavy Long Hair with Fringe
	12, -- Wavy Long Hair brushed back
	32, -- Wavy Long Hair 
	33 -- Wavy Long Hair 
	
}

local hair_wavyMediumLength = {
	13, -- Wavy - Thick - cut short at back parted
	14, -- Wavy - Thick - cut short at back, fringe slicked
	34 -- Wavy - Thin
}


local facialHairShort = {
	1, -- Chin Fuzz
	2, -- Jaw Strap
	4, -- Goatee Thin/Stubble
	7, -- Soul Patch
	9, -- Goatee Thick / Think mustache
	10, -- Moustache
	16 -- Think Chin Strap
}

local facialHairMedium = {
	3, -- Goatee
	5, -- Goatee, not joined up
	15, -- Goatee, not joined up
	17 -- Goatee
}

local facialHairLong = {
	8, -- Long Thick Beard
	14, -- Long Beard, No mustache
	11, -- Long Beard, No mustache
	13 -- Long Beard, No mustache
}



function doPlayerInjection(dir, player) 
	v2k4debugfile:write('checking ' .. dir .. 'exists\n')
	if(dir_exists(dir)) then
		v2k4debugfile:write('checking ' .. dir .. player.PlayerId .. '.txt exists\n')
		
		if(file_exists(dir .. player.PlayerId .. '.txt')) then
		
			v2k4debugfile:write('->>>>> ' .. dir .. player.PlayerId .. '.txt file exists\n')
			
			local lastEditedHour = nil

			if(string.find(dir, "overwrite") == false) then
			
				lastEditedHour = getVariableFromFile(dir .. player.PlayerId .. '.txt', "v2k4LastEditedHour")
				if(lastEditedHour ~= nil) then
					v2k4debugfile:write('->>>>> check file last edited hour ' .. lastEditedHour .. '\n')
				end
			end
			
			
			
			if(lastEditedHour == nil or (tonumber(lastEditedHour) ~= tonumber(os.date("%H")))) then
			
				local head = getVariableFromFile(dir .. player.PlayerId .. '.txt', "Head")
				if(head ~= 0) then
					player.Head = tonumber(head)
					v2k4debugfile:write('->>>>> ->>>>> Attempting to set field head to ' .. head .. '\n')
				end
			
			
				local lines = lines_from(dir .. player.PlayerId .. '.txt')
				
				for k,v in pairs(lines) do
				
					local r = split(v, '=')
					
					local varName = ""
					local varValue = ""
					for key, value in pairs(r) do
					
						if (varName == "") then
							varName = value
						
						else
							varValue = value
							
							if varName == "FacialHairType" then
								v2k4debugfile:write('->>>>> ->>>>> Attempting to set field ' .. varName .. ' to ' .. varValue .. '\n')
								player.FacialHairType = tonumber(varValue)
							elseif varName == "Hair" then
								v2k4debugfile:write('->>>>> ->>>>> Attempting to set field ' .. varName .. ' to ' .. varValue .. '\n')
								player.Hair = tonumber(varValue)	
							elseif varName == "HairStyle" then
								v2k4debugfile:write('->>>>> ->>>>> Attempting to set field ' .. varName .. ' to ' .. varValue .. '\n')
								player.HairStyle = tonumber(varValue)	
							elseif varName == "ShoeType" then
								v2k4debugfile:write('->>>>> ->>>>> Attempting to set field ' .. varName .. ' to ' .. varValue .. '\n')
								player.ShoeType = tonumber(varValue)	
							elseif varName == "TattooLeftArm" then
								v2k4debugfile:write('->>>>> ->>>>> Attempting to set field ' .. varName .. ' to ' .. varValue .. '\n')
								if(player.TattooLeftArm ~= 0) then
									player.HasTattooUpperBody = 1
									player.TattooLeftArm = tonumber(varValue)	
								end
							elseif varName == "TattooRightArm" then
								v2k4debugfile:write('->>>>> ->>>>> Attempting to set field ' .. varName .. ' to ' .. varValue .. '\n')
								if(player.TattooRightArm ~= 0) then
									player.HasTattooUpperBody = 1
									player.TattooRightArm = tonumber(varValue)	
								end
							elseif varName == "TattooRightLeg" then
								v2k4debugfile:write('->>>>> ->>>>> Attempting to set field ' .. varName .. ' to ' .. varValue .. '\n')
								if(player.TattooRightLeg ~= 0) then
									player.HasTattooLowerBody = 1
									player.TattooRightLeg = tonumber(varValue)	
								end
							elseif varName == "TattooLeftLeg" then
								v2k4debugfile:write('->>>>> ->>>>> Attempting to set field ' .. varName .. ' to ' .. varValue .. '\n')
								if(player.TattooLeftLeg ~= 0) then
									player.HasTattooLowerBody = 1
									player.TattooLeftLeg = tonumber(varValue)	
								end
							elseif varName == "TattooHead" then
								v2k4debugfile:write('->>>>> ->>>>> Attempting to set field ' .. varName .. ' to ' .. varValue .. '\n')
								if(player.TattooHead ~= 0) then
									player.HasTattooHead = 1
									player.TattooHead = tonumber(varValue)	
								end
							elseif varName == "HeadAssetId" then
								v2k4debugfile:write('->>>>> ->>>>> Attempting to set field ' .. varName .. ' to ' .. varValue .. '\n')
								--if(player.HeadAssetId ~= 0) then
									player.HeadAssetId = tonumber(varValue)
									--player.HeadVariation = 0
								--end
							elseif varName == "Head" then
								v2k4debugfile:write('->>>>> ->>>>> Attempting to set field ' .. varName .. ' to ' .. varValue .. '\n')
								if(player.Head ~= 0) then
									player.Head = tonumber(varValue)
								end
							elseif varName == "HeadClass" then
								v2k4debugfile:write('->>>>> ->>>>> Attempting to set field ' .. varName .. ' to ' .. varValue .. '\n')
								--if(player.HeadClass ~= 0) then
									player.HeadClass = tonumber(varValue)
								--end
							elseif varName == "HeadSkinType" then
								v2k4debugfile:write('->>>>> ->>>>> Attempting to set field ' .. varName .. ' to ' .. varValue .. '\n')
								--if(player.HeadClass ~= 0) then
									player.HeadSkinType = tonumber(varValue)
								--end
							elseif varName == "FaceProxyHeadClass" then
								v2k4debugfile:write('->>>>> ->>>>> Attempting to set field ' .. varName .. ' to ' .. varValue .. '\n')
								--if(player.HeadClass ~= 0) then
									player.FaceProxyHeadClass = tonumber(varValue)
								--end
							elseif varName == "FaceType" then
								v2k4debugfile:write('->>>>> ->>>>> Attempting to set field ' .. varName .. ' to ' .. varValue .. '\n')
								--if(player.HeadClass ~= 0) then
									player.FaceType = tonumber(varValue)
								--end
							elseif varName == "BodyType" then
								v2k4debugfile:write('->>>>> ->>>>> Attempting to set field ' .. varName .. ' to ' .. varValue .. '\n')
								if(player.BodyType ~= 0) then
									player.BodyType = tonumber(varValue)
								end
							elseif varName == "FaceGenSkinToneType" then
								v2k4debugfile:write('->>>>> ->>>>> Attempting to set field ' .. varName .. ' to ' .. varValue .. '\n')
								player.FaceGenSkinToneType = tonumber(varValue)
							elseif varName == "IsCreatedPlayer" then
								v2k4debugfile:write('->>>>> ->>>>> Attempting to set field ' .. varName .. ' to ' .. varValue .. '\n')
								player.IsCreatedPlayer = tonumber(varValue)
							elseif varName == "UseFaceTextureComposition" then
								v2k4debugfile:write('->>>>> ->>>>> Attempting to set field ' .. varName .. ' to ' .. varValue .. '\n')
								player.UseFaceTextureComposition = tonumber(varValue)
							end
							
							
							
							varName = "";
						end
				
				
					end
					
				end
				
			end
			
			
			if (player.HeadClass == 0) then

				local playerassetid = player.HeadAssetId

				player.Head = playerassetid

				--player.Eyebrow = 0
				player.FaceType = playerassetid
				
				--player.FaceSideBurn = 0
				--player.FacialHairColor = 0
				--player.FacialHairType = 0
				--player.HeadSkinType = 0
				--player.HeadSkinToneType = 0

				--player.Hair = playerassetid
				--player.HairColor = 0
				--player.UseFaceTextureComposition = 0
			end
			
		end	
	end
end

RevertOldFaces = "1"

function doPlayerFaceMod(player, fileLoc, debugFileLoc) 

	local debuggingfile = io.open(debugFileLoc, "w")
	
	debuggingfile:write('doPlayerFaceMod(player,' .. fileLoc .. ',' .. debugFileLoc .. ')\n')

	if(file_exists(fileLoc)) then
		debuggingfile:write('Found ' .. fileLoc .. '\n')
		
		for k,v in pairs(lines_from(fileLoc)) do
		
		
		
			if string.find(v, "/") == nil then
			
				debuggingfile:write(v .. '\n')
				
				local r = split(v, '=')
				local varName = ""
				local varValue = ""
				local isBracketed = false
				for key, value in pairs(r) do
										
								
					--debuggingfile:write('value=' .. value .. '\n')						
					
					if (varName == "") then
						
						varName = value
						
						--debuggingfile:write('varname=' .. varName .. '\n')
						
											
					
					else
						varValue = value
						--debuggingfile:write('varvalue=' .. varValue .. '\n')
						
												
						if string.find(varName, "loadFile")  ~= nil then
			
							debuggingfile:write('loadFile ' .. varValue .. '\n')
							doPlayerFaceMod(player, varValue, debugFileLoc)
						
						else 
													
							if(tonumber(player.PlayerId) == tonumber(varName)) then 
								
								
								player.HeadClass = 0
								player.Head = tonumber(varValue)
								player.HeadAssetId = tonumber(varValue)
								player.PlayerAssetId = tonumber(varValue)
								player.Hair = tonumber(varValue)						
								player.FaceType = tonumber(varValue)
								player.HeadVariation = 0
								player.Eyebrow = 0
								player.FaceSideBurn = 0
								player.FacialHairColor = 0
								player.FacialHairType = 0
								player.HeadSkinType = 0
								player.HeadSkinToneType = 0
								player.HairColor = 0
								player.UseFaceTextureComposition = 0
														
								debuggingfile:write('Face ' .. varName .. ' has been set to ' .. varValue .. '\n')
								
							end
							
							if(RevertOldFaces == "1") then 
													
								-- Set Old Player Id
								if(tonumber(player.PlayerId) == tonumber(varValue)) then 
									
									player.HeadClass = 0
									player.Head = player.PlayerId
									--player.HeadAssetId = 0
									player.HeadAssetId = player.PlayerId
									--player.PlayerAssetId = 0
									player.PlayerAssetId = player.PlayerId
									--player.Hair = math.random(10,165)	

									player.Hair = 126			
									player.HeadVariation = 0									
									
									player.HairColor = 0x00534238;
									player.HairColorPri = 0x00534238;
									player.HairColorSec = 0x0045332B;
									player.HairColorTer = 0x0017110E;
									--player.FacialHairColor=0x00000000;
					
									--player.FaceType = 0
									if(player.Gender == 1) then 
										player.Head = 9000
									end
															
									debuggingfile:write('Face ' .. varValue .. ' has been set to basic model\n')
									debuggingfile:flush()
								end
								
							end
							
						end
						
					end
					
				end
			end
		end
		
	end
	
	debuggingfile:close()
	return true;
end


local function doOtherFaceSystem(player)

	-- Old System
	local status, retval = pcall(doPlayerFaceMod,player,'OtherFaces.txt','v2k4debugfile_Other.txt')
	-- Setup ready to change filename
	--local status, retval = pcall(doPlayerFaceMod,player,'v2k4Faces.txt','v2k4debugfile_Other.txt')

end

local function doKitMod(player, fileLoc, debugFileLoc) 

	local debuggingfile = io.open(debugFileLoc, "w")

	if(file_exists(fileLoc)) then
		debuggingfile:write('Using ' .. fileLoc .. '\n')
		
		for k,v in pairs(lines_from(fileLoc)) do
			
			
			
		
			local r = split(v, '=')
			local varName = ""
			local varValue = ""
			for key, value in pairs(r) do
				
				
				if (varName == "") then
					varName = value
				
				else
					varValue = value
					
					if(tonumber(player.Kit) == tonumber(varName)) then 
												
						player.Kit = tonumber(varValue)
																		
						debuggingfile:write('Kit ' .. varName .. ' has been set to ' .. varValue .. '\n')
						
					end
					
				end
				
			end
		end
		
	end
	
	debuggingfile:close()
	return true;

end

local function doKitSystem(player) 

	local status, retval = pcall(doKitMod,player,'v2k4Kits.txt','v2k4debugfile_Other.txt')

end

local function _updateAccessory(accessory)
    -- Calculation below is to minimize the amount of textures loaded for accessories. Forces the sharing of 1 colormap for left/right meshes.
    -- This is assuming all accessories that require left and right variations have model = even# for left, odd# for right
    -- AND
    -- all single-variation accessories have even# for model
    -- Ideal solution: retrieve modelvar from database so that we don't have to make assumptions here
	local modelNum = accessory.AccessoryModel
	local colorIdx = 0;

	if modelNum < 100 then
		accessory.AccessoryVariation = math.abs(modelNum % 2)
		modelNum = modelNum - math.abs(modelNum % 2)
		accessory.AccessoryModel = modelNum
	end
	
	-- special case for gkgloves
	if (modelNum > 27 and modelNum < 32) then
		colorIdx = 0;
	elseif (modelNum > 4) then
		colorIdx = accessory.AccessoryColor
		accessory.AccessoryColor = 0  -- use 0 for runtime recolouring		
	end
	
	local accessoryColorArgb = ACCESSORY_COLOR_LIST[colorIdx + 1] 
	
	if (accessoryColorArgb == nil) then
		accessory.AccessoryColorArgb = 0x00ffffff
	else
		accessory.AccessoryColorArgb = accessoryColorArgb
	end
end

function PlayerUpdate()
	
	local player = db.player
	
	local DebugMode = getVariableFromFile("v2k4settings.txt", "DebugMode")
	
	if (DebugMode == "1") then
	
		local file_currently_editing = io.open("v2k4_player_before_edit.json", "w")
		file_currently_editing:write(dumpJson(player))
		file_currently_editing:close()
	
	end
	
	-- female added in fifa 2016
	--db.player.Gender = 0 --as:GetInt(player, "gender")  -- 0=male, 1=female
	
	local kitNumber = player.KitNumber
	player.KitNumberTens = math.floor ( kitNumber / 10 )
	player.KitNumberUnits = math.floor ( math.fmod(kitNumber, 10) )

	-- Faceproxyheadclass should never be greater than one including createplayer
	if (player.FaceProxyHeadClass == 2) then
		player.FaceProxyHeadClass = 1
	end

	if (player.Cold ~= 1) then
		player.TeamColorPri = 0x00FF0000
		player.TeamColorSec = 0x0000FF00
		player.TeamColorTer = 0x000000FF
	end
	
	local headSkinToneType = player.HeadSkinToneType

	-- player flushness color per skintone
	local flushnessColor = PLAYER_FLUSHNESS_COLOR_LIST[headSkinToneType + 1]

	if (flushnessColor == nil) then
		flushnessColor = 0xCCDE64AE
	end

	player.FlushnessColor = flushnessColor

	local hairColorPri= 0x00FF0000
	local hairColorSec= 0x0000FF00
	local hairColorTer= 0x000000FF

	local facialHairColorPri= 0x00FF0000
	local facialHairColorSec= 0x0000FF00
	local facialHairColorTer= 0x000000FF

	if (player.HeadClass == 0) then

		-- local playerassetid = player.PlayerAssetId
		local playerassetid = player.HeadAssetId

		player.Head = playerassetid

		player.Eyebrow = 0
		player.FaceType = playerassetid
		
		player.FaceSideBurn = 0
		player.FacialHairColor = 0
		player.FacialHairType = 0
		player.HeadSkinType = 0
		player.HeadSkinToneType = 0

		player.Hair = playerassetid
		player.HairColor = 0
		player.UseFaceTextureComposition = 0
		
	else

		local hairColor = player.HairColor
		hairColorPri = PLAYER_COLOR_PRI_LIST[hairColor + 1]
		hairColorSec = PLAYER_COLOR_SEC_LIST[hairColor + 1]
		hairColorTer = PLAYER_COLOR_TER_LIST[hairColor + 1]

		if (hairColorPri == nil or hairColorSec == nil or hairColorTer == nil) then
			hairColorPri= 0x00FF0000
			hairColorSec= 0x0000FF00
			hairColorTer= 0x000000FF
		end

		-- TODO: fed - facial hair color should be the same indices as hair colors
		local facialHairColor = FACIALHAIRCOLOR_REMAP[player.FacialHairColor+1]
		facialHairColorPri = PLAYER_COLOR_PRI_LIST[facialHairColor + 1]
		facialHairColorSec = PLAYER_COLOR_SEC_LIST[facialHairColor + 1]
		facialHairColorTer = PLAYER_COLOR_TER_LIST[facialHairColor + 1]

		if (facialHairColorPri == nil or facialHairColorSec == nil or facialHairColorTer == nil) then
			facialHairColorPri= 0x00FF0000
			facialHairColorSec= 0x00FF0000
			facialHairColorTer= 0x00FF00FF
		end
		
	end
	
	player.HairColorPri = hairColorPri
	player.HairColorSec = hairColorSec
	player.HairColorTer = hairColorTer

	player.FacialHairColorPri = facialHairColorPri
	player.FacialHairColorSec = facialHairColorSec
	player.FacialHairColorTer = facialHairColorTer
	
	-- sets dirt color per play surface type
	local playSurfaceType = player.PlaySurfaceType
	if (playSurfaceType == 1) then
		-- Mud
		player.DirtType = 1
		player.DirtColorPri = 0x00362606
		player.DirtColorSec = 0x000F0B03
		player.DirtColorTer = 0x00070501
	else
		-- if (playSurfaceType == 0) then
		-- Grass 
		player.DirtType = 0
		player.DirtColorPri = 0x00759600
		player.DirtColorSec = 0x00290800
		player.DirtColorTer = 0x00040100		
	end

	-- Seasonal Assets 

	-- These exist only here and not in the code:
	local seasonal = player.SeasonalJersey

	if(player.IsVirtualPro == 1 or player.IsCreatedPlayer == 1) then
		if(seasonal < 2) then
			seasonal = player.JerseySleeveLength
		end
	elseif(player.Cold == 0) then
		seasonal = player.JerseySleeveLength
	end


	if (seasonal == 0) then
		-- Short Sleeves
		player.JerseySleeveLength  = 0
		player.UnderNeck = -1
		player.UnderArms = -1
		player.ArmLength = 0
	elseif (seasonal == 1) then
		-- Long Sleeves
		player.JerseySleeveLength  = 1
		player.UnderNeck = -1
		player.UnderArms = -1
		player.ArmLength = 1
	elseif (seasonal == 2) then
		-- Long Sleeves and just underarmor neck
		player.JerseySleeveLength = 1
		player.UnderNeck = 0
		player.UnderArms = -1
		player.ArmLength = 1
	elseif (seasonal == 3) then
		-- Short sleeves with underarmor arms no neck
		player.JerseySleeveLength  = 0
		player.UnderNeck = -1
		player.UnderArms = 0
		player.ArmLength = 1
	elseif (seasonal == 4) then
		-- Short sleeves with underarmor neck and arms
		player.JerseySleeveLength  = 0
		player.UnderNeck = 0
		player.UnderArms = 0
		player.ArmLength = 1
	end

	-- Only if not wearing outfit OR manager
	if (player.OutfitId <= 0 and string.find(player.DebugName, "manager") == nil) then

		if (player.Cold > 0) then
			player.UnderShorts = 0
		else
			player.UnderShorts = -1
		end

		-- end of seasonal assets

		-- check if we need to force underwear for injuries
		if (player.ForceUnderArm == 1) then
			player.JerseySleeveLength = 0
			player.UnderArms = 0
			player.ArmLength = 1
		end

		if (player.ForceUnderShorts == 1) then
			player.UnderShorts = 0
		end

		if (player.ForceUnderNeck == 1) then
			player.UnderNeck = 0
		end

		-- Goalie long pants, turn off necessary assets.
		if (player.ShortStyle == 1) then
			player.SockLength = -1
			player.UnderShorts = -1
		end
		
		player.UseKitWarmUpBib = 1
		player.UseKitWarmUpJacket = 1
		player.UseKitWarmUpPants = 1			
	else
		player.UnderNeck = -1
		player.UnderArms = -1
		player.UnderShorts = -1
		
		-- Fix Manager Kit Bug
		player.Height = 180
		player.OutfitId = 532021
		player.SeasonalJersey = 532021
	end
	
	local UseSystem = getVariableFromFile("v2k4settings.txt", "UseSystem")
	local ForceLongSleeves = getVariableFromFile("v2k4settings.txt", "ForceLongSleeves")
	
	if(UseSystem == "1") then
		local UseFaceOtherSystem = getVariableFromFile("v2k4settings.txt", "UseFaceOtherSystem")
		if(UseFaceOtherSystem == "1") then
			doOtherFaceSystem(player)
		end
		
		local UseKitSystem = getVariableFromFile("v2k4settings.txt", "UseKitSystem")
		if(UseKitSystem == "1") then
			doKitSystem(player)
		end
		
		--local UseDynamicSystem = getVariableFromFile("v2k4settings.txt", "UseDynamicSystem")
		--if(UseDynamicSystem == "1") then
		--	doKitSystem(player)
		--end
		
		RevertOldFaces = getVariableFromFile("v2k4settings.txt", "RevertOldFaces")
		
	end
	
	if(ForceLongSleeves == "1") then
		-- For insurance to check file has run
		-- Long Sleeves
		player.JerseySleeveLength  = 1
		player.UnderNeck = -1
		player.UnderArms = -1
		player.ArmLength = 1
	end
	
	-- accessory
	for _, accessory in ipairs(player.Accessories) do
		_updateAccessory(accessory)
	end

	-- if createplayer female disable facial hair stamping
	if (player.IsCreatedPlayer == 1 and player.Gender == 1) then
		player.FacialHairType = 0
	end
	
	if (DebugMode == "1") then
	
		local file_post_editing = io.open("v2k4_player_post_edit.json", "w")
		file_post_editing:write(dumpJson(player))
		file_post_editing:close()
	
	end
	

end

