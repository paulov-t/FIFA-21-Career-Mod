--------------------------------------------------
local v2k4Debug = { }
local v2k4debugfile = io.open("v2k4debugfile.txt", "w")
v2k4debugfile:write('initialisation highresslc.LUA\n')
--------------------------------------------------

-- For running script in standlone lua interpreter
local HIGHRESSLC_DEBUG = 0

--if HIGHRESSLC_DEBUG == 0 then
if false then
	setGlobalEnum("FifaSideLineCharacterType")
else
	FifaSideLineCharacterType_Steward = 0
	FifaSideLineCharacterType_Photographer = 1
	FifaSideLineCharacterType_CameraManStanding = 2
	FifaSideLineCharacterType_CameraManPlatform = 3
	FifaSideLineCharacterType_Medic = 4
	FifaSideLineCharacterType_Ballboy = 5
	FifaSideLineCharacterType_Generic = 6
	FifaSideLineCharacterType_Police = 7
	FifaSideLineCharacterType_BenchPlayerHome = 8
	FifaSideLineCharacterType_BenchPlayerAway = 9
	FifaSideLineCharacterType_ManagerHome = 10
	FifaSideLineCharacterType_ManagerAway = 11
	FifaSideLineCharacterType_CameraManHandHeld = 12
	FifaSideLineCharacterType_AssistantManagerHome = 13
	FifaSideLineCharacterType_AssistantManagerAway = 14
	FifaSideLineCharacterType_TournamentOfficial = 15
	FifaSideLineCharacterType_ChoreoBallboy = 16
	FifaSideLineCharacterType_ChoreoSteadyCam = 17
	FifaSideLineCharacterType_ChoreoPhotographer = 18
	FifaSideLineCharacterType_ChoreoCraneCam = 19
	FifaSideLineCharacterType_ChoreoShoulderCam = 20
	FifaSideLineCharacterType_ChoreoPolice = 21
	FifaSideLineCharacterType_ChoreoSteward = 22
	FifaSideLineCharacterType_NumTypes = 23
end

---------------------------------------------------------------------------------------------------
local SLCS = {
	[FifaSideLineCharacterType_Steward] = {60100 ,60101 ,60102 ,60103 ,60104 ,60105 ,60106 ,60107 ,60108 ,60109 ,60110 ,60111 ,60112 ,60113 ,60114 ,60115 ,60116 ,60117 ,60118 ,60119 ,60120 ,60121 ,60122 ,60123},
	[FifaSideLineCharacterType_Ballboy] = {60130, 60131, 60132, 60133, 60134, 60135},
	[FifaSideLineCharacterType_Medic] = {60124 ,60125 ,60126 ,60127 ,60128 ,60129},
	[FifaSideLineCharacterType_Police] = {60142 ,60143 ,60144 ,60145 ,60146 ,60147 ,60148 ,60149 ,60150 ,60151 ,60152 ,60153 ,60154 ,60155 ,60156 ,60157 ,60158 ,60159 ,60160 ,60161 ,60162 ,60163 ,60164 ,60165 ,60166 ,60167 ,60168},
	[FifaSideLineCharacterType_Photographer] = {60185, 60186, 60187, 60188, 60189, 60190, 60191, 60192},
	[FifaSideLineCharacterType_CameraManStanding] = {60183, 60184},
	[FifaSideLineCharacterType_CameraManPlatform] = {60183, 60184}, -- missing
	[FifaSideLineCharacterType_TournamentOfficial] = {60178, 60179, 60180, 60181, 60182},
	[FifaSideLineCharacterType_AssistantManagerHome] = {60173, 60174, 60175, 60176, 60177},
	[FifaSideLineCharacterType_AssistantManagerAway] = {60173, 60174, 60175, 60176, 60177}, -- missing
	[FifaSideLineCharacterType_CameraManHandHeld] = {60169, 60170, 60171, 60172},
	[FifaSideLineCharacterType_Generic] = {60136, 60137, 60138, 60139, 60140, 60141},
}

local PARTS = {
	-- ROW1
	Steward = {
		--[[
		{
			-- Dummy player, tries to load JUST the jacket.
			PlayerId=9999,
			Head=9999,
			Hair=9999,
			FacialHairType=9999,
			Eyebrow=9999,
			ShoeType=9999,
			ShoeDesign=9999,
			BodyType=9999,
			Head=9999,
			HeadAssetId=9999,
			HeadClass=9999,
			UsePlayerArms=false,
			UsePlayerLegs=false,
			UseShoe=false,
			HasTattooUpperBody=false,
			HasTattooLowerBody=false,
			--Gender=9999,
			Outfit={9999,9999,9999,298001,9999,9999},
			TopSecondLayerTextureVariation=0,
			BottomSecondLayerTextureVariation=1,
			--Accessories={{801,1}},
		},
		]]--
		--[[
		{
			PlayerId=26650,
			Outfit={9999,400071,100010,298001,9999,815},
			TopSecondLayerTextureVariation=0,
			BottomSecondLayerTextureVariation=1,
			Accessories={{801,1}},
		},
		{
			PlayerId=26643,
			Outfit={9999,400071,100010,298001,9999,575},
			TopSecondLayerTextureVariation=1,
			BottomSecondLayerTextureVariation=1,
			Accessories={},
		},
		{
			PlayerId=26651,
			Outfit={9999,400071,100010,298001,9999,906},
			TopSecondLayerTextureVariation=2,
			BottomSecondLayerTextureVariation=1,
			Accessories={{801,2},{803,1}},
		},
		{
			PlayerId=26651,
			Outfit={9999,400071,9999,298001,9999,906},
			TopSecondLayerTextureVariation=2,
			BottomSecondLayerTextureVariation=1,
			Accessories={{801,2},{803,1}},
		},
		]]--
		{
			PlayerId=157482,
			Head=8,
			Hair=29,
			FacialHairType=10,
			HairColor=3,
			HeadSkinToneType=3,
			BodySkinToneType=3,
			Outfit={9999,400071,100010,298002,9999,557},
			TopSecondLayerTextureVariation=1,
			BottomSecondLayerTextureVariation=2,
			Accessories={{803,2}},
		},
	},
	-- ROW2
	Ballboy = {
		{
			PlayerId=3281,
			Head=14,
			Hair=309,
			Eyebrow=3,
			HeadSkinToneType=3,
			BodySkinToneType=3,
			Outfit={9999,400071,100010,298002,9999,619},
			TopSecondLayerTextureVariation=0,
			BottomSecondLayerTextureVariation=1,
			Accessories={{801,1}},
		},
		{
			PlayerId=157482,
			Head=8,
			Hair=29,
			FacialHairType=10,
			HairColor=3,
			HeadSkinToneType=3,
			BodySkinToneType=3,
			Outfit={9999,400071,100010,298002,9999,557},
			TopSecondLayerTextureVariation=0,
			BottomSecondLayerTextureVariation=1,
			Accessories={{803,2}},
		},
		{
			PlayerId=16,
			Head=10003,
			Hair=279,
			HairColor=2,
			HeadSkinToneType=3,
			BodySkinToneType=3,
			Outfit={9999,400071,100010,298002,9999,815},
			TopSecondLayerTextureVariation=2,
			BottomSecondLayerTextureVariation=1,
			Accessories={{803,2},{802,1}},
		},
	},
	Misc = {
		-- ROW3
		{
			PlayerId=3281,
			Head=8,
			Hair=29,
			FacialHairType=10,
			HairColor=3,
			HeadSkinToneType=3,
			BodySkinToneType=3,
			Outfit={9999,498001,1,298003,9999,815},
			TopSecondLayerTextureVariation=1,
			BottomSecondLayerTextureVariation=1,
			Accessories={{804,0},{803,0}},
		},
		{
			PlayerId=3281,
			Head=2,
			Hair=290,
			FacialHairType=1,
			HairColor=9,
			Outfit={9999,498001,1,298003,9999,557},
			TopSecondLayerTextureVariation=0,
			BottomSecondLayerTextureVariation=2,
			Accessories={{804,1},{803,0}},
		},
		{
			PlayerId=157482,
			Outfit={9999,498001,1,298003,9999,557},
			TopSecondLayerTextureVariation=2,
			BottomSecondLayerTextureVariation=1,
			Accessories={{804,2},{806,0}},
		},
		-- ROW4
		{
			PlayerId=157482,
			Outfit={9999,400071,1,298004,9999,619},
			TopSecondLayerTextureVariation=0,
			BottomSecondLayerTextureVariation=1,
			Accessories={{805,0}},
		},
		{
			PlayerId=157482,
			Head=2,
			Hair=293,
			HairColor=8,
			Outfit={9999,400071,1,298004,9999,557},
			TopSecondLayerTextureVariation=1,
			BottomSecondLayerTextureVariation=0,
			Accessories={{805,1}},
		},
		{
			PlayerId=157482,
			Head=1000,
			Hair=321,
			HairColor=8,
			HeadSkinToneType=3,
			BodySkinToneType=3,
			Outfit={9999,400071,1,298004,9999,815},
			TopSecondLayerTextureVariation=2,
			BottomSecondLayerTextureVariation=1,
			Accessories={{805,2}},
		},
	},
	Photographer = {
		{
			PlayerId=3281,
			Head=14,
			Hair=309,
			Eyebrow=3,
			HeadSkinToneType=8,
			BodySkinToneType=8,
			Outfit={9999,498020,298039,298040,9999,864},
			TopSecondLayerTextureVariation=0,
			Accessories={{830,0},{829,0},{828,0},{827,0}},
		},
		{
			PlayerId=157482,
			Head=8,
			Hair=310,
			FacialHairType=10,
			HairColor=3,
			HeadSkinToneType=3,
			BodySkinToneType=3,
			Outfit={9999,498020,298039,298040,9999,864},
			TopSecondLayerTextureVariation=0,
			Accessories={{830,0},{829,0},{828,0},{827,0}},
		},
	},
}

local function tprint (t, s)
    for k, v in pairs(t) do
        local kfmt = '["' .. tostring(k) ..'"]'
        if type(k) ~= 'string' then
            kfmt = '[' .. k .. ']'
        end
        local vfmt = '"'.. tostring(v) ..'"'
        if type(v) == 'table' then
            tprint(v, (s or '')..kfmt)
        else
            if type(v) ~= 'string' then
                vfmt = tostring(v)
            end
            print(type(t)..(s or '')..kfmt..' = '..vfmt)
        end
    end
end

---------------------------------------------------------------------------------------------------
function slcUpdate(param)
	local slc = db.highresslc
	local slcIndex = slc.ActorId

	if param == 'updateSlcId' then
		local slctable = SLCS[slc.SlcTypeDb]
		if slctable ~= nil then
			slcIndex = (slcIndex % #slctable) + 1
			slc.SlcId = slctable[slcIndex]
		end
	else
		local slctable = nil
		local slctype = 0--slc.SlcType
		-- Compare against FifaAssetInitData.ddf::FifaSideLineCharacterType enum
		if slctype == 0 or slctype == 22 then
			slctable = PARTS.Steward
		elseif slctype == 5 or slctype == 16 then
			slctable = PARTS.Ballboy
		elseif slctype == 1 or slctype == 18 then
			slctable = PARTS.Photographer
		else
			slctable = PARTS.Misc
		end
		
		if slctable ~= nil then
			slcIndex = (slcIndex % #slctable) + 1
			slctable = slctable[slcIndex]
			for k, v in pairs(slctable) do
				if param == 'updatePlayerId' then
					if k == 'PlayerId' then
						slc[k] = v
					end
				elseif param == 'wardrobe' then
					if k == 'updateWardrobe' then
						slc.UseWardrobeTopBase = true
						slc.UseWardrobeTopSecondLayer = true
						slc.UseWardrobeBottomSecondLayer = true
						slc.UseWardrobeBottom = true
						slc.BottomId = v[1]
						slc.BottomSecondLayerId = v[2]
						slc.TopBaseId = v[3]
						slc.TopSecondLayerId = v[4]
						slc.SockLength = v[5]
						slc.ShoeType = v[6]
					elseif k == 'Accessories' then
						for i, av in ipairs(v) do
							slc.Accessories[i] = {AccessoryModel=av[1], AccessoryVariation=av[2]}
						end
					else
						slc[k] = v
					end
				end
			end
		end
		
		slc['Kit'] = 0
		slc['KitType'] = 0
		slc['TeamId'] = 0
		slc['TeamSide'] = 0
	end
end

if HIGHRESSLC_DEBUG ~= 0 then
	--print(PARTS)
	db = { highresslc = { } }
	db.highresslc.ActorId = 1
	db.highresslc.SlcTypeDb = FifaSideLineCharacterType_Ballboy
	db.highresslc.Accessories = {}
	slcUpdate('updateSlcId')
	tprint(db)
end
