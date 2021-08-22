--------------------------------------------------
SETTING_Generation = 4
SETTING_UseFlexMaps = false
SETTING_DecalsUseExtraMaps = false
SETTING_EnableStrandHair = false
-------------------------------------------------

setGlobalEnum("ShaderDrawOrder")
setGlobalEnum("ShaderDrawOrderSubOrder")
setGlobalEnum("RenderFormat")

--TextureCompositeEnityData.ddf
setGlobalEnum("RuntimeGeneratedTexturesBlendMode")
setGlobalEnum("AlphaMode")
setGlobalEnum("RecolorMode")
setGlobalEnum("RasterizedTextureFormat")

setGlobalEnum("OfficialType")

brts = {
	base = lookupDataContainer(ResourceCompartment_Game, "content/common/configs/bundlereftable/base_brt"),
	starhead = lookupDataContainer(ResourceCompartment_Game, "content/common/configs/bundlereftable/starhead_brt"),
	generichead = lookupDataContainer(ResourceCompartment_Game, "content/common/configs/bundlereftable/generichead_brt"),

	body = lookupDataContainer(ResourceCompartment_Game, "content/common/configs/bundlereftable/body_brt"),
	shoes = lookupDataContainer(ResourceCompartment_Game, "content/common/configs/bundlereftable/shoe_brt"),
	kit = lookupDataContainer(ResourceCompartment_Game, "content/common/configs/bundlereftable/kit_brt"),

	rigamate = lookupDataContainer(ResourceCompartment_Game, "content/common/configs/bundlereftable/rigamate_brt"),

	psd = lookupDataContainer(ResourceCompartment_Game, "content/common/configs/bundlereftable/psd_brt"),
	
	wardrobe = lookupDataContainer(ResourceCompartment_Game, "content/common/configs/bundlereftable/wardrobe_brt"),
	hotspots = lookupDataContainer(ResourceCompartment_Game, "content/common/configs/bundlereftable/hotspot_brt"),
	badges = lookupDataContainer(ResourceCompartment_Game, "content/common/configs/bundlereftable/badges_brt"),
	armband = lookupDataContainer(ResourceCompartment_Game, "content/common/configs/bundlereftable/armband_brt"),
	font = lookupDataContainer(ResourceCompartment_Game, "content/common/configs/bundlereftable/font_brt"),
	accessory = lookupDataContainer(ResourceCompartment_Game, "content/common/configs/bundlereftable/accessory_brt"),
	tattoo  = lookupDataContainer(ResourceCompartment_Game, "content/common/configs/bundlereftable/tattoo_brt"),

	crowd_highres  = lookupDataContainer(ResourceCompartment_Game, "content/common/configs/bundlereftable/crowd_highres_brt"),
	
	worlds_clothing  = lookupDataContainer(ResourceCompartment_Game, "content/common/configs/bundlereftable/worlds_clothing_brt"),
}

slots = {
	head = "content/common/configs/slots/head_slot",

	cardhair = "content/common/configs/slots/card_hair_slot",
	haircap = "content/common/configs/slots/haircap_slot",
	hairacc = "content/common/configs/slots/hair_accessory_slot",

	beard = "content/common/configs/slots/beard_slot",
	beardcap = "content/common/configs/slots/beardcap_slot",

	strandhair = "strand_hair_slot",

	shorts = "content/common/configs/slots/shorts_cloth_slot",
	gkpants = "content/common/configs/slots/gkpants_slot",
	shoes = "content/common/configs/slots/shoes_slot",
	jersey = "content/common/configs/slots/jersey_cloth_slot",
	socks = "content/common/configs/slots/socks_slot",

	top_base_recolor = "content/common/configs/slots/top_base_recolor_slot",
	top_second_recolor = "content/common/configs/slots/top_second_recolor_slot",
	bottom = "content/common/configs/slots/bottom_slot",
	bottom_second = "content/common/configs/slots/bottom_second_slot",
	wardrobe_socks = "content/common/configs/slots/wardrobe_sock_slot",

	underarms = "content/common/configs/slots/underarms_slot",
	underneck = "content/common/configs/slots/underneck_slot",
	undershorts = "content/common/configs/slots/undershorts_slot",

	gkglove = "content/common/configs/slots/gkglove_slot",

	arms = "content/common/configs/slots/arms_slot",
	arms_short = "content/common/configs/slots/arms_short_slot",
	legs = "content/common/configs/slots/legs_slot",
	bodyupper = "content/common/configs/slots/bodyupper_slot",
	bodylower = "content/common/configs/slots/bodylower_slot",

	warmup_bib = "content/common/configs/slots/warmup_bib_slot",
	warmup_pants = "content/common/configs/slots/warmup_pants_slot",
	warmup_jacket = "content/common/configs/slots/warmup_jacket_slot",

	shadow = "content/common/configs/slots/shadow_slot",

	crowdfan = "content/common/configs/slots/crowdfan_slot",
	crowdfan_prop = "content/common/configs/slots/crowdfan_prop_slot",
}

accessory_slots = {
	"content/common/configs/slots/accessory1_slot",
	"content/common/configs/slots/accessory2_slot",
	"content/common/configs/slots/accessory3_slot",
	"content/common/configs/slots/accessory4_slot",
}

wardrobe_accessory_slots = {
	"content/common/configs/slots/wardrobe_accessory1_slot",
	"content/common/configs/slots/wardrobe_accessory2_slot",
	"content/common/configs/slots/wardrobe_accessory3_slot",
	"content/common/configs/slots/wardrobe_accessory4_slot",
}

local ref_accessories = {
	{ slot = "card_red_left",  model = 30, side = 0 },
	{ slot = "card_red_right", model = 30, side = 1 },
	{ slot = "card_yellow_left",  model = 28, side = 0 },
	{ slot = "card_yellow_right", model = 28, side = 1 },
	{ slot = "ref_book_left",  model = 34, side = 0 },
	{ slot = "ref_book_right", model = 34, side = 1 },
	{ slot = "ref_pen_left",  model = 32, side = 0 },
	{ slot = "ref_pen_right", model = 32, side = 1 },
	{ slot = "ref_watch_left", model = 4, side = 0 },
	{ slot = "ref_earpiece_left", model = 2, side = 0 },
}

-- many geo's include lods as ports of fbx, no need to specify lods
local lod0 = 0
-- most meshes don't contribute to bounding box computations as it will be very expensive
-- but at least few have to, otherwise the model will be invisible
-- we have lod2 and shadow mesh contributing to bbox
local noBoundingBox = false
local updateBoundingBox = true

local playerDrawOrder = ShaderDrawOrder_Pitch
local playerDrawOrder_Default = ShaderDrawOrder_Default

local playerDrawSubOrder = ShaderDrawOrderSubOrder_Player_Clothes
local playerDrawSubOrder_Clothes = ShaderDrawOrderSubOrder_Player_Clothes
local playerDrawSubOrder_Body = ShaderDrawOrderSubOrder_Player_Body
local playerDrawSubOrder_Hair = ShaderDrawOrderSubOrder_Player_Hair
local playerDrawSubOrder_Haircap = ShaderDrawOrderSubOrder_Player_Haircap
local playerDrawSubOrder_Accessory = ShaderDrawOrderSubOrder_Player_Accessory

-- PSD mapping
-- create player PSD backets mapping
-- fifaids/create_player_enums.h
local NUM_MOUTH_PRESETS = 22 --table.getn(MALE_MAPPING)
local CP_MORPH_MOUTH = 5 -- real value is 4, but lua indexing starts from 1
local MALE_MAPPING =   {3, 0, 0, 0, 0, 4, 4, 4, 2, 0, 0, 2, 2, 2, 2, 2, 3, 0, 0, 4, 3, 0}
local FEMALE_MAPPING = {1, 1, 1, 1, 1, 0, 2, 2, 1, 1, 1, 1, 1, 0, 1, 0, 0, 4, 1, 2, 1, 1}

-- PSD head/jersey masking
-- fancy artworks names
local PSD_HEAD_MASKING = {
	"Low",     -- round
	"MidHigh", -- mock turtle
	"MidHigh", -- turt leneck
	"MidLow",  -- new adidas
	"MidLow",  -- new nike
	"MidLow",  -- new puma
	"MidLow",  -- sidevneck
	"MidLow",  -- vneck
	"MidHigh", -- fold medium
	"MidHigh", -- fold medium round
	"MidHigh", -- fold small
	"MidHigh", -- polo
	"Low",     -- puma chipped sides
	"MidLow",  -- addidas chipped center 1
	"MidLow",  -- addidas chipped center 2
	"MidHigh", -- banded polo
	"MidLow",  -- addidas chipped center 3
	"MidLow",  -- fold small vneck
	"MidHigh", -- minipolo
	"Low",     -- square neck
	"Low",     -- roundcenter chip
	"Low",     -- vneck chipped center
	"MidLow",  -- adidas high vneck
	"MidLow",  -- nike back chip
	"MidLow"   -- nike doublev	
}

-- texture compositing descriptions
local BadgeColorCompositorDesc = {
	width = 2048, height = 2048, format = RenderFormat_BC3_SRGB,
	baselayer_alphamode = AlphaMode_Additive,
}

local BadgeNormalCompositorDesc = {
	width = 1024, height = 1024, format = RenderFormat_BC5_UNORM,
	baselayer_alphamode = AlphaMode_None,
}

local BadgeCoeffCompositorDesc = {
	width = 1024, height = 1024, format = RenderFormat_BC1_UNORM,
	baselayer_alphamode = AlphaMode_None,
}

local CullMaskCompositorDesc = {
	width = 128, height = 128, format = RenderFormat_BC4_UNORM,
	baselayer_alphamode = AlphaMode_None,
}

local BodyCompositorDesc = {
	width = 1024, height = 1024, format = RenderFormat_BC1_SRGB,
	baselayer_alphamode = AlphaMode_None,
}

-- helper functions
local function _addDirtShaderParams(material, initData, dirtMap, dirtMask)
	material:addTexture("dirtMapArrayTexture", dirtMap)
	material:addTexture("dirtMaskTexture", dirtMask)

	material:addVector("dirtLightColor", initData.DirtColorPri)
	material:addVector("dirtDarkColor", initData.DirtColorSec)
	material:addVector("dirtMaxColor", initData.DirtColorTer)
end

local function _addWeaveShaderParams(material, weaveCoeffMapArray, weaveNormalMapArray, tile_amounts)
	material:addTexture("weaveNormalArrayTexture", weaveNormalMapArray)
	material:addTexture("weaveCoeffArrayTexture", weaveCoeffMapArray)
	if tile_amounts then
		material:addVector("weaveTiles", tile_amounts)
	end
end

local function _readGenericHotspotData(hotspot_file, group, name)
	local default_hotspot = {-1,-1,-1,-1}
	local default_rotation = 0
	local bounds, rotation = default_hotspot, default_rotation
	if hotspot_file then
		local hotspot_entry = getHotspotEntry(hotspot_file, group, name)
		if hotspot_entry then
			bounds = hotspot_entry.Bounds or default_hotspot
			rotation = hotspot_entry.Rotation or default_rotation
		end
	end
	return {Bounds = bounds, Rotation = rotation}
end

-- hair material helpers
local function _addHairShaderParams(material, initData)
	material:addVector("primaryColor", initData.HairColorPri)
	material:addVector("secondaryColor", initData.HairColorSec)
	material:addVector("tertiaryColor", initData.HairColorTer)
end

local function _addHairMaterials(item, initData)
	_addHairShaderParams(item:addMaterial("hair_mat"), initData)
	_addHairShaderParams(item:addMaterial("haircap_mat"), initData)
	_addHairShaderParams(item:addMaterial("hairlod_mat"), initData)
end


local function _addFacialHairShaderParams(material, initData)
	material:addVector("primaryColor", initData.FacialHairColorPri)
	material:addVector("secondaryColor", initData.FacialHairColorSec)
	material:addVector("tertiaryColor", initData.FacialHairColorTer)
end

local function _addFacialHairMaterials(item, initData)
	_addFacialHairShaderParams(item:addMaterial("hair_mat"), initData)
	_addFacialHairShaderParams(item:addMaterial("haircap_mat"), initData)
	_addFacialHairShaderParams(item:addMaterial("hairlod_mat"), initData)
end

local function _addMuscleFlexParams(material, flexMask, flexNormalMap, flexAmbientMap)
	if(SETTING_UseFlexMaps) then
		material:addTexture("flexMaskTexture", flexMask)
		material:addTexture("flexNormalTexture", flexNormalMap)
		material:addTexture("flexOverlayTexture", flexAmbientMap)
	end
end

local function _addBrandWithHotspot(material, colorMap, coeffMap, normalMap, bounds)
	material:addTexture("brandColorTexture", colorMap)
	
	if(SETTING_DecalsUseExtraMaps) then
		material:addTexture("brandCoeffTexture", coeffMap)
		material:addTexture("brandNormalTexture", normalMap)
	end
	
	material:addVector( "brandBounds", bounds)
end

local function _addCrestWithHotspot(material, colorMap, coeffMap, normalMap, bounds)
	material:addTexture("crestTexture", colorMap)
	
	if(SETTING_DecalsUseExtraMaps) then
		material:addTexture("crestCoeffTexture", coeffMap)
		material:addTexture("crestNormalTexture", normalMap)
	end
	
	material:addVector( "crestBounds", bounds)
end


-- bind functions
-----------------------------------------------------------------------------
local function bindShorts(initData, shorts_mesh,
						  colorMap,coeffMap, aoMap, normalMap,
						  wrinkleMap, twistMap, dirtMap, dirtMask, 
						  numberTensMap, numberUnitsMap, hotspotAsset, 
						  crestColorMap, crestNormalMap, crestCoeffMap, 
						  brandColorMap, brandNormalMap, brandCoeffMap, 
						  taaMap, weaveNormalMapArray, weaveCoeffMapArray)
						  
	local is_goalie = initData.ShortStyle == 1 
	local slot = is_goalie and slots.gkpants or slots.shorts
	local cull_tag_name = is_goalie and "GkPants" or "ShortsCloth"

	-- many geo's include lods as ports of fbx, no need to specify lods
	local item = createItem("shorts", slot, initData.laneId)
	item:setIncludeCullTagHashes(cull_tag_name)
	
	item:addMeshLodPair(lod0, shorts_mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder)


	-- vectors
	local hotspot = getHotspotTensAndUnits(hotspotAsset, initData.ShortsNumberVisible, initData.KitNumber, "shorts", "number")
	local crest_bounds = getHotspotEntry(hotspotAsset, "shorts", "team")
	local brand_bounds = getHotspotEntry(hotspotAsset, "shorts", "brand")
	local weave_tiles = getHotspotEntry(hotspotAsset, "shorts", "weave_tiles")

	if is_goalie then
		local no_hotspot = {-1, -1, -1, -1}
		hotspot.Units = no_hotspot
		hotspot.Tens = no_hotspot
		crest_bounds.Bounds = no_hotspot
	end

	-- material
	local material = item:addMaterial("shorts_mat")

	-- textures
	material:addTexture("colorTexture", colorMap)
	material:addTexture("coefficientTexture", coeffMap)
	material:addTexture("ambientTexture", aoMap)
	material:addTexture("normalTexture", normalMap)
	material:addTexture("normalArrayTexture", wrinkleMap)
	material:addTexture("twistMaskTexture", twistMap)

	material:addTexture("numberTensTexture", numberTensMap)
	material:addTexture("numberUnitsTexture", numberUnitsMap)

	material:addTexture("taaTexture", taaMap)

	_addCrestWithHotspot(material, crestColorMap, crestCoeffMap, crestNormalMap, crest_bounds.Bounds)
	_addBrandWithHotspot(material, brandColorMap, brandCoeffMap, brandNormalMap, brand_bounds.Bounds)

	_addWeaveShaderParams(material, weaveCoeffMapArray, weaveNormalMapArray, weave_tiles.Bounds)
	_addDirtShaderParams(material, initData, dirtMap, dirtMask)

	material:addVector("numberUnitsBounds", hotspot.Units)
	material:addVector("numberTensBounds", hotspot.Tens)


	material:addVector("primaryColor", initData.KitColorShortPri)
	material:addVector("secondaryColor", initData.KitColorShortSec)
	material:addVector("tertiaryColor", initData.KitColorShortTer)

	material:addVector("primaryNumberColor", initData.ShortsNumberColorPri)
	material:addVector("secondaryNumberColor", initData.ShortsNumberColorSec)
	material:addVector("tertiaryNumberColor", initData.ShortsNumberColorTer)

	return item
end

-----------------------------------------------------------------------------
local function bindJersey(initData, jersey_mesh, is_hangingjersey,
						  colorMap, coeffMap, aoMap, normalMap, 
						  wrinkleMap, twistMap, dirtMap, dirtMask, 
						  numberTensMap, numberUnitsMap, hotspotAsset, 
						  badgeMap, normalGeneratedMap, coeffGeneratedMap, playerNameGeneratedMap,
						  crestColorMap, crestNormalMap, crestCoeffMap, 
						  brandColorMap, brandNormalMap, brandCoeffMap, 
						  taaMap, weaveNormalMapArray, weaveCoeffMapArray)

	local bbox_update = is_hangingjersey and updateBoundingBox or noBoundingBox

	local item = createItem("jersey", slots.jersey, initData.laneId)
	item:setTagHashes("jersey")
	item:setIncludeCullTagHashes("JerseyCloth", "JerseyNoCloth")
	--item:setExcludeCullTagHashes("WarmupGear")

	item:addMeshLodPair(lod0, jersey_mesh, bbox_update, playerDrawOrder, playerDrawSubOrder)

	-- hotspots
	local no_hotspot = { Bounds = {-1, -1, -1, -1}, Rotation=0 }
	local crest_bounds = getHotspotEntry(hotspotAsset, "jersey", "team")
	local name_bounds = initData.JerseyNameVisible ~= 0 and getHotspotEntry(hotspotAsset, "jersey", "name") or no_hotspot
	local name_arccenter = getHotspotEntry(hotspotAsset, "jersey", "namearccenter")
	local frontnum_bounds = getHotspotTensAndUnits(hotspotAsset, initData.JerseyFrontNumberVisible, initData.KitNumber, "jersey", "numberfront")
	local backnum_bounds = getHotspotTensAndUnits(hotspotAsset, initData.JerseyBackNumberVisible, initData.KitNumber, "jersey", "numberback")
	local brand_bounds = getHotspotEntry(hotspotAsset, "jersey", "brand")
	local weave_tiles = getHotspotEntry(hotspotAsset, "jersey", "weave_tiles")

	-- material
	local material = item:addMaterial("jersey_mat")

	-- textures
	material:addTexture("colorTexture", colorMap)
	material:addTexture("ambientTexture", aoMap)
	material:addTexture("normalArrayTexture", wrinkleMap)
	material:addTexture("twistMaskTexture", twistMap)
	material:addTexture("numberTensTexture", numberTensMap)
	material:addTexture("numberUnitsTexture", numberUnitsMap)

	material:addTexture("taaTexture", taaMap)
	
	_addCrestWithHotspot(material, crestColorMap, crestCoeffMap, crestNormalMap, crest_bounds.Bounds)
	_addBrandWithHotspot(material, brandColorMap, brandCoeffMap, brandNormalMap, brand_bounds.Bounds)

	_addWeaveShaderParams(material, weaveCoeffMapArray, weaveNormalMapArray, weave_tiles.Bounds)
	_addDirtShaderParams(material, initData, dirtMap, dirtMask)

	material:addVector("nameLayout", initData.JerseyNameLayout)
	material:addVector("nameColor", initData.KitNameColor)

	material:addVector("nameBounds", name_bounds.Bounds)
	material:addVector("nameArcCenter", name_arccenter.Bounds)

	material:addVector("numberTensBoundsFront", frontnum_bounds.Tens)
	material:addVector("numberUnitsBoundsFront", frontnum_bounds.Units)
	material:addVector("numberTensBoundsBack", backnum_bounds.Tens)
	material:addVector("numberUnitsBoundsBack", backnum_bounds.Units)

	material:addVector("primaryColor", initData.KitColorJerseyPri)
	material:addVector("secondaryColor", initData.KitColorJerseySec)
	material:addVector("tertiaryColor", initData.KitColorJerseyTer)

	material:addVector("primaryNumberColor", initData.JerseyNumberColorPri)
	material:addVector("secondaryNumberColor", initData.JerseyNumberColorSec)
	material:addVector("tertiaryNumberColor", initData.JerseyNumberColorTer)

	-- runtime generated textures
	material:addGenTexture("nameTexture", playerNameGeneratedMap)
	material:addGenTexture("badgeMapTexture", badgeMap)
	material:addGenTexture("coefficientTexture", coeffGeneratedMap)
	material:addGenTexture("normalTexture", normalGeneratedMap)

	return item
end

-----------------------------------------------------------------------------
local function bindShoe(initData, shoe_mesh, colorMap, coeffMap, normalMap, dirtMap, dirtMask)
	local item = createItem("shoes", slots.shoes, initData.laneId)
	item:addMeshLodPair(lod0, shoe_mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder)

	local material = item:addMaterial("shoe_mat")

	-- textures
	material:addTexture("colorTexture", colorMap)
	material:addTexture("normalTexture", normalMap)
	material:addTexture("coefficientTexture", coeffMap)

	_addDirtShaderParams(material, initData, dirtMap, dirtMask)

	-- vectors
	material:addVector("primaryColor", initData.ShoeColorPri)
	material:addVector("secondaryColor", initData.ShoeColorSec)
	material:addVector("tertiaryColor", initData.ShoeColorTer)

	return item
end

-----------------------------------------------------------------------------
local function bindSocks(initData, socks_mesh, hotspotAsset, 
						 colorMap, coeffMap, aoMap, normalMap,
						 wrinkleMap, twistMap, dirtMap, dirtMask,
						 taaMap, weaveNormalMapArray, weaveCoeffMapArray)
	local slot = initData.UseWardrobeSock ~= 0 and slots.wardrobe_socks or slots.socks

	local item = createItem("socks", slot, initData.laneId)
	item:setIncludeCullTagHashes("Socks")
	
	if initData.UseKitSock ~=0 then item:setTagHashes("psd_legs") end

	item:addMeshLodPair(lod0, socks_mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder)

	-- hotspots
	local weave_tiles = getHotspotEntry(hotspotAsset, "socks", "weave_tiles")
	
	-- material
	local material = item:addMaterial("socks_mat")
	
	-- textures
	material:addTexture("colorTexture", colorMap)
	material:addTexture("coefficientTexture", coeffMap)
	material:addTexture("ambientTexture", aoMap)
	material:addTexture("normalTexture", normalMap)
	material:addTexture("normalArrayTexture", wrinkleMap)
	material:addTexture("twistMaskTexture", twistMap)
	material:addTexture("taaTexture", taaMap)
	material:addTexture("weaveNormalArrayTexture", weaveNormalMapArray)
	material:addTexture("weaveCoeffArrayTexture", weaveCoeffMapArray)

	_addWeaveShaderParams(material, weaveCoeffMapArray, weaveNormalMapArray, weave_tiles.Bounds)
	_addDirtShaderParams(material, initData, dirtMap, dirtMask)
	
	-- vectors
	material:addVector("primaryColor", initData.KitColorSocksPri)
	material:addVector("secondaryColor", initData.KitColorSocksSec)
	material:addVector("tertiaryColor", initData.KitColorSocksTer)

	return item
end

-----------------------------------------------------------------------------
local function bindGkGloves(initData, mesh, colorMap, coeffMap, normalMap)
	local item = createItem("gkglove", slots.gkglove, initData.laneId)
	item:addMeshLodPair(lod0, mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder)

	local material = item:addMaterial("gkglove_mat")
	material:addTexture("colorTexture", colorMap)
	material:addTexture("normalTexture", normalMap)
	material:addTexture("coefficientTexture", coeffMap)

	return item
end

----------------------------------------------------------------------------------------------
-- underkit
local function bindUnderArms(initData, mesh,
							 colorMap, coeffMap, aoMap, normalMap, 
							 wrinkleMap, twistMap, dirtMap, dirtMask,
							 taaMap, weaveNormalMapArray, weaveCoeffMapArray)
	local item = createItem("underarms", slots.underarms, initData.laneId)
	item:setIncludeCullTagHashes("WinterGear")

	item:addMeshLodPair(lod0, mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder)

	local material = item:addMaterial("underarms_mat")
	material:addTexture("colorTexture", colorMap)
	material:addTexture("coefficientTexture", coeffMap)
	material:addTexture("ambientTexture", aoMap)
	material:addTexture("normalTexture", normalMap)
	material:addTexture("normalArrayTexture", wrinkleMap)
	material:addTexture("twistMaskTexture", twistMap)

	material:addTexture("taaTexture", taaMap)


	material:addVector("primaryColor", initData.KitColorJerseyPri)
	material:addVector("secondaryColor", initData.KitColorJerseySec)
	material:addVector("tertiaryColor", initData.KitColorJerseyTer)

	_addWeaveShaderParams(material, weaveCoeffMapArray, weaveNormalMapArray, nil)
	_addDirtShaderParams(material, initData, dirtMap, dirtMask)

	return item
end

-----------------------------------------------------------------------------
local function bindUnderNeck(initData, mesh, 
							 colorMap, coeffMap, aoMap, normalMap, 
							 wrinkleMap, twistMap, dirtMap, dirtMask,
							 taaMap, weaveNormalMapArray, weaveCoeffMapArray)
	local item = createItem("underneck", slots.underneck, initData.laneId)
	item:setIncludeCullTagHashes("WinterGear")

	item:addMeshLodPair(lod0, mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder)

	local material = item:addMaterial("underneck_mat")
	material:addTexture("colorTexture", colorMap)
	material:addTexture("coefficientTexture", coeffMap)
	material:addTexture("ambientTexture", aoMap)
	material:addTexture("normalTexture", normalMap)
	material:addTexture("normalArrayTexture", wrinkleMap)
	material:addTexture("twistMaskTexture", twistMap)
	
	material:addTexture("taaTexture", taaMap)
	
	material:addVector("primaryColor", initData.KitColorJerseyPri)
	material:addVector("secondaryColor", initData.KitColorJerseySec)
	material:addVector("tertiaryColor", initData.KitColorJerseyTer)

	_addWeaveShaderParams(material, weaveCoeffMapArray, weaveNormalMapArray, nil)
	_addDirtShaderParams(material, initData, dirtMap, dirtMask)
	
	return item
end

-----------------------------------------------------------------------------
local function bindUnderShorts(initData, mesh, 
							   colorMap, coeffMap, aoMap, normalMap, 
							   wrinkleMap, twistMap, dirtMap, dirtMask,
							   taaMap, weaveNormalMapArray, weaveCoeffMapArray)
	local item = createItem("undershorts", slots.undershorts, initData.laneId)
	item:setIncludeCullTagHashes("WinterGear")
	item:setTagHashes("psd_legs")

	item:addMeshLodPair(lod0, mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder)

	local material = item:addMaterial("undershorts_mat")
	material:addTexture("colorTexture", colorMap)
	material:addTexture("coefficientTexture", coeffMap)
	material:addTexture("ambientTexture", aoMap)
	material:addTexture("normalTexture", normalMap)
	material:addTexture("normalArrayTexture", wrinkleMap)
	material:addTexture("twistMaskTexture", twistMap)
	
	material:addTexture("taaTexture", taaMap)
	
	material:addVector("primaryColor", initData.KitColorShortPri)
	material:addVector("secondaryColor", initData.KitColorShortSec)
	material:addVector("tertiaryColor", initData.KitColorShortTer)

	_addWeaveShaderParams(material, weaveCoeffMapArray, weaveNormalMapArray, nil)
	_addDirtShaderParams(material, initData, dirtMap, dirtMask)

	return item
end

----------------------------------------------------------------------------------------------
-- outfit
local function _addOutfitTextureParams(material, colorMap, coeffMap, aoMap, normalMap, weaveCoeffMap, weaveNormalMap, cullMap)
	material:addTexture("colorTexture", colorMap)
	material:addTexture("coefficientTexture", coeffMap)
	material:addTexture("ambientTexture", aoMap)
	material:addTexture("normalArrayTexture", normalMap)

	material:addTexture("weaveCoeffArrayTexture", weaveCoeffMap)
	material:addTexture("weaveNormalArrayTexture", weaveNormalMap)

	material:addTexture("cullTexture", cullMap)
end

-----------------------------------------------------------------------------
local function bindTop0(initData, mesh,
						colorMap, coeffMap, aoMap, normalMap, 
						weaveCoeffMap, weaveNormalMap, cullMap)
	local item = createItem("wardrobe_top_base_recolor", slots.top_base_recolor, initData.laneId)
	item:addMeshLodPair(lod0, mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder)

	local material = item:addMaterial("top_clothing_mat")
	_addOutfitTextureParams(material, colorMap, coeffMap, aoMap, normalMap, weaveCoeffMap, weaveNormalMap, cullMap)
	material:addVector("primaryColor", initData.TopBaseColor)

	return item
end

-----------------------------------------------------------------------------
local function bindTop1(initData, mesh,
						colorMap, coeffMap, aoMap, normalMap,
						weaveCoeffMap, weaveNormalMap, cullMap, 
						hotspotFile, ddsCrestMap)
	local hotspotdata = _readGenericHotspotData(hotspotFile, "top", "team")
	local crest_bounds = hotspotdata.Bounds or {-1,-1,-1,-1}

	local item = createItem("wardrobe_secondlayer_recolor", slots.top_second_recolor, initData.laneId)
	item:addMeshLodPair(lod0, mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder)

	local material = item:addMaterial("top_clothing_mat")
	_addOutfitTextureParams(material, colorMap, coeffMap, aoMap, normalMap, weaveCoeffMap, weaveNormalMap, cullMap)
	material:addVector("primaryColor", initData.TopSecondLayerColor)

	material:addTexture("crestTexture", ddsCrestMap)
	material:addVector("teamCrestBounds", crest_bounds)
	
	return item
end

-----------------------------------------------------------------------------
local function bindBottom0(initData, mesh, 
						   colorMap, coeffMap, aoMap, normalMap, 
						   weaveCoeffMap, weaveNormalMap, cullMap)
	local item = createItem("actor_bottom", slots.bottom, initData.laneId)
	item:addMeshLodPair(lod0, mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder)

	local material = item:addMaterial("bottom_clothing_mat")
	_addOutfitTextureParams(material, colorMap, coeffMap, aoMap, normalMap, weaveCoeffMap, weaveNormalMap, cullMap)
	material:addVector("primaryColor", initData.BottomColor)

	return item
end

-----------------------------------------------------------------------------
local function bindBottom1(initData, mesh, 
						   colorMap, coeffMap, aoMap, normalMap, 
						   weaveCoeffMap, weaveNormalMap, cullMap)
	local item = createItem("actor_bottom_second_layer", slots.bottom_second, initData.laneId)
	item:addMeshLodPair(lod0, mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder)

	local material = item:addMaterial("bottom_clothing_mat")
	_addOutfitTextureParams(material, colorMap, coeffMap, aoMap, normalMap, weaveCoeffMap, weaveNormalMap, cullMap)
	material:addVector("primaryColor", initData.BottomSecondLayerColor)

	return item
end

-----------------------------------------------------------------------------
local function bindHead(initData, head_mesh, lod1_mesh, lod2_mesh,
			colorMap, faceGenMap, normalMap, 
			wrinkleNormalMap, coeffMap, aoMap, specMaskMap, 
			exertionCoeffMap, exertionNormalMap, sssMap, wrinkleMaskMap, eyeMap)

	local isStarHead = initData.HeadClass == 0
	local isCreatedPlayer = initData.IsCreatedPlayer ~= 0
	
	local item = nil

	if isCreatedPlayer then
		item = createItem("caphead", slots.head, initData.laneId)

		item:addMeshLodPair(0, head_mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder_Body)
		item:addMeshLodPair(1, lod1_mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder_Body)
		item:addMeshLodPair(2, lod2_mesh, updateBoundingBox, playerDrawOrder, playerDrawSubOrder_Body)
	
	else
		item = createItem("head", slots.head, initData.laneId)
		item:addMeshLodPair(0, head_mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder_Body)
	end

	item:setTagHashes("normalsmooth", "psd")
	
	local headMaterial = item:addMaterial("head_mat")
	-- head material
	if isStarHead then 
		headMaterial:addTexture("colorTexture", colorMap)
	else
		headMaterial:addGenTexture("colorTexture", faceGenMap)
	end
	
	headMaterial:addTexture("aoBlendTexture", aoMap)
	headMaterial:addTexture("baseNormalTexture", normalMap)
	headMaterial:addTexture("coefficentTexture", coeffMap)
	headMaterial:addTexture("specmaskTexture", specMaskMap)

	headMaterial:addTexture("exertionCoeffTexture", exertionCoeffMap)
	headMaterial:addTexture("exertionNormalTexture", exertionNormalMap)
	headMaterial:addTexture("sssTexture", sssMap)
	
	headMaterial:addTexture("wrinkleMaskTexture", wrinkleMaskMap)
	headMaterial:addTexture("wrinkleNormalTexture", wrinkleNormalMap)
	
	headMaterial:addVector("flushness_color", initData.FlushnessColor)
		
	-- eye material
	local eyesMaterial = item:addMaterial("eyes_mat")
	eyesMaterial:addTexture("colorTexture", eyeMap)
	-- eyesMaterial:addTexture("ambientTexture", eyeAoMap)
	-- eyesMaterial:addTexture("coefficientTexture", eyeCoeffMap)
	---eyesMaterial:addTexture("normalTexture", eyeNormalMap)
	
	return item
end

-----------------------------------------------------------------------------
local function bindHairItem(initData, hair_mesh)
	local item = createItem("card_hair", slots.cardhair, initData.laneId)
	item:setIncludeCullTagHashes("card_hair")
	-- for non cloth hair use "psd" tag for psd wraping
	item:setTagHashes("psd", "card_hair") 
	item:addMeshLodPair(0, hair_mesh, noBoundingBox, playerDrawOrder_Default, playerDrawSubOrder_Hair)
	_addHairMaterials(item, initData)
	return item
end

-- hair cap item
local function bindHaircapItem(initData, haircap_mesh)
	local item = createItem("haircap", slots.haircap, initData.laneId)
	item:setIncludeCullTagHashes("haircap")
	item:setTagHashes("psd", "haircap")
	-- not all haircaps have embedded lods, instead of using lod0 when lower lod is chosen let use no lod at all
	local lodsRequired = 2
	item:addMeshWithEmptyLods(haircap_mesh, lodsRequired, noBoundingBox, playerDrawOrder_Default, playerDrawSubOrder_Haircap)
	_addHairMaterials(item, initData)
	return item
end

-- hair accessory item
local function bindHairAccessoryItem(initData, hair_accessory_mesh)
	local item = createItem("hair_accessory", slots.hairacc, initData.laneId)
	item:setIncludeCullTagHashes("hair_accessory")
	item:setTagHashes("psd", "hair_accessory")
	item:addMeshLodPair(lod0, hair_accessory_mesh, noBoundingBox, playerDrawOrder_Default, playerDrawSubOrder_Haircap)
	item:addMaterial("accessory_mat")
	return item
end

local function bindStrandHairItem(initData, hair, beard, eye_brow)
	local item = createItem("strandhair", slots.strandhair, initData.laneId)
	item:setIncludeCullTagHashes("strand_hair")
	item:setTagHashes("strand_hair")
	item:addMeshLodPair(lod0, hair, noBoundingBox, playerDrawOrder_Default, playerDrawSubOrder_Hair)
	if beard then item:addMeshLodPair(lod0, beard, noBoundingBox, playerDrawOrder_Default, playerDrawSubOrder_Hair) end
	if eye_brow then item:addMeshLodPair(lod0, eye_brow, noBoundingBox, playerDrawOrder_Default, playerDrawSubOrder_Hair) end

	_addHairMaterials(item, initData)
	return item
end

-----------------------------------------------------------------------------
local function buildWarmupBib(initData, mesh, colorMap)
	local home_clr = {0.94, 0.3, 0.1, 0}
	local away_clr = {0.91, 0.91, 0.07, 0} 
	local custom_clr = {1, 0, 0, 0}
	local team_clr = initData.TeamSide == 0 and home_clr or away_clr
	local clr0 = initData.HasCustomBib == 0 and team_clr or custom_clr

	local item = createItem("warmup_bib", slots.warmup_bib, initData.laneId)
	item:setIncludeCullTagHashes("WarmupBib")
	item:addMeshLodPair(lod0, mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder)

	local mat = item:addMaterial("bib_mat")
	mat:addTexture("colorTexture", colorMap)
	mat:addVector("primaryColor", clr0)
	mat:addVector("secondaryColor", {0,1,0,0})
	mat:addVector("tertiaryColor",  {0,0,1,0})

	return item
end

local function buildWarmupPants(initData, mesh)
	local item = createItem("warmup_pants", slots.warmup_pants, initData.laneId)
	item:setIncludeCullTagHashes("WarmupGear")
	item:setExcludeCullTagHashes("Legs", "ShortsCloth", "ShortsNoCloth", "GkPants", "Socks")
	item:addMeshLodPair(lod0, mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder)

	local mat = item:addMaterial("pant_mat")
	mat:addVector("primaryColor", initData.TeamColorPri)
	mat:addVector("secondaryColor", initData.TeamColorSec)
	mat:addVector("tertiaryColor", initData.TeamColorTer)

	return item
end

local function buildWarmupJacket(initData, mesh)
	local item = createItem("warmup_jacket", slots.warmup_jacket, initData.laneId)
	item:setIncludeCullTagHashes("WarmupGear")
	item:setExcludeCullTagHashes("JerseyCloth", "JerseyNoCloth", "WinterGear", "Arms")
	item:addMeshLodPair(lod0, mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder)

	local mat = item:addMaterial("jacket_mat")
	mat:addVector("primaryColor", initData.TeamColorPri)
	mat:addVector("secondaryColor", initData.TeamColorSec)
	mat:addVector("tertiaryColor", initData.TeamColorTer)

	return item
end

-----------------------------------------------------------------------------
local function buildKitAccessory(initData, idx, accessory, mesh, colorMap, normalMap, coeffMap)
	local name = string.format("accessory_%d", idx)
	local slot = accessory_slots[idx]

	local item = createItem(name, slot, initData.laneId)
	item:addMeshLodPair(lod0, mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder_Accessory)

	local mat = item:addMaterial("accessory_mat")
	mat:addTexture("colorTexture", colorMap)
	mat:addTexture("normalTexture", normalMap)
	mat:addTexture("coefficientTexture", coeffMap)

	mat:addVector("primaryColor", accessory.AccessoryColorArgb)

	return item
end

local function buildWardrobeAccessory(initData, idx, accessory, mesh, colorMap, normalMap, coeffMap, aoMap, weaveNormalMap, weaveCoeffMap)
	local name = string.format("wardrobe_accessory_%d", idx)
	local slot = wardrobe_accessory_slots[idx]

	local item = createItem(name, slot, initData.laneId)
	item:addMeshLodPair(lod0, mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder_Accessory)

	local mat = item:addMaterial("accessory_mat")
	mat:addTexture("ambientTexture", aoMap)
	mat:addTexture("colorTexture", colorMap)
	mat:addTexture("coefficientTexture", coeffMap)
	mat:addTexture("normalArrayTexture", normalMap)

	if weaveNormalMap then
		mat:addTexture("weaveNormalArraryTexture", weaveNormalMap)
		mat:addTexture("weaveCoeffArraryTexture", weaveCoeffMap)
	end
	return item
end

local function buildRefAccessory(laneId, tag, mesh, colorMap, normalMap, coeffMap)
	local name = getAssetName(mesh)
	local slot = name

	local item = createItem(name, slot, laneId)
	item:setIncludeCullTagHashes(tag)
	item:addMeshLodPair(lod0, mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder_Accessory)

	local mat = item:addMaterial("accessory_mat")
	mat:addTexture("colorTexture", colorMap)
	mat:addTexture("normalTexture", normalMap)
	mat:addTexture("coefficientTexture", coeffMap)

	return item
end

-----------------------------------------------------------------------------
local function bindPlayerBeard(initData, is_cap, mesh, colorMap, coeffMap)
	local name = is_cap and "beard_cap" or "beard"
	--local slot = is_cap and slots.haircap or slots.hair_nocloth
	local slot = is_cap and slots.beardcap or slots.beard
	local draw_order = is_cap and playerDrawSubOrder_Haircap or playerDrawSubOrder_Hair

	local item = createItem(name, slot, initData.laneId)
	item:setTagHashes("psd")
	
	local lodsRequired = 2
	item:addMeshWithEmptyLods(mesh, lodsRequired, noBoundingBox, playerDrawOrder_Default, draw_order)

	_addFacialHairMaterials(item, initData)
	return item
end

--[[
local function bindCreatePlayerAccessory(initData, mesh, colorMap, normalMap, coeffMap)
	-- yury test
	local name = getAssetName(mesh)
	local slot = accessory_slots[1]

	local item = createItem(name, slot, initData.laneId)
	item:setTagHashes("psd")

	item:addMeshLodPair(lod0, mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder_Accessory)

	local mat = item:addMaterial("accessory_mat")
	mat:addTexture("colorTexture", colorMap)
	mat:addTexture("normalTexture", normalMap)
	mat:addTexture("coefficientTexture", coeffMap)
	return item
end
]]--
-----------------------------------------------------------------------------
local function bindShadowItem(initData, shadow_mesh, importance_mesh)
	-- use bounding box calculations for planar otherwise they will be invisible
	local item = createItem("shadow", slots.shadow, initData.laneId)
	item:addMeshLodPair(lod0, shadow_mesh, updateBoundingBox, playerDrawOrder_Default)
	item:addMeshLodPair(lod0, importance_mesh, noBoundingBox, playerDrawOrder_Default)
	return item
end

-----------------------------------------------------------------------------
-- texture composition functions
local function compositeJerseyWithBadges(initData, hotspotAsset, competitionHotspot, desc, isNormalMap,
										 badgeBakeMaskMap, baseLayerMap, leftBadgeMap, rightBadgeMap, middleBadgeMap, armbandMap)

	local llongHotspot = getPlayerCompetitionHotspot(competitionHotspot, hotspotAsset, initData.JerseyBadgeLeftID, "leftsleevelong")
	local lshortHotspot = getPlayerCompetitionHotspot(competitionHotspot, hotspotAsset, initData.JerseyBadgeLeftID, "leftsleeveshort")
	local rlongHotspot = getPlayerCompetitionHotspot(competitionHotspot, hotspotAsset, initData.JerseyBadgeRightID, "rightsleevelong")
	local rshortHotspot = getPlayerCompetitionHotspot(competitionHotspot, hotspotAsset, initData.JerseyBadgeRightID, "rightsleeveshort")
	local middleHotspot = getPlayerCompetitionHotspot(competitionHotspot, hotspotAsset, initData.JerseyBadgeMiddleID, "center")
	local armbandHotspot = getHotspotEntry(hotspotAsset, "jersey", "armband")
	
	local defaultHotspot = {0, 0, 1.0, 1.0}
	local rotation = 0

	-- generate unique texture id
	local inputs = {
		getAssetName(baseLayerMap), getAssetName(leftBadgeMap), getAssetName(rightBadgeMap), 
		getAssetName(middleBadgeMap), getAssetName(armbandMap)
	}
	local texture_id = table.concat(inputs, "|")

	-- blend parameters
	local blendMode, alpha = BlendMode_AlphaBlend, 1.0
	local mips, compress, ignore_base_alpha = 0, true, true
	
	local compositor = createTextureCompositor(texture_id, desc.width, desc.height, mips, compress, desc.format)
	compositor:setInputMask(badgeBakeMaskMap, ignore_base_alpha)
	compositor:addParam(baseLayerMap, defaultHotspot, rotation, blendMode, alpha, desc.baselayer_alphamode)

	-- from schematics: For now, Disabling these inputs so they won't be stamped onto the Normal Map, as Normal Map stamping isn't working with the kit badge mask.
	if isNormalMap == false then
		compositor:addParam(leftBadgeMap, llongHotspot.Bounds, llongHotspot.Rotation, blendMode, alpha, AlphaMode_None)
		compositor:addParam(leftBadgeMap, lshortHotspot.Bounds, lshortHotspot.Rotation, blendMode, alpha, AlphaMode_None)

		compositor:addParam(rightBadgeMap, rlongHotspot.Bounds, rlongHotspot.Rotation, blendMode, alpha, AlphaMode_None)
		compositor:addParam(rightBadgeMap, rshortHotspot.Bounds, rshortHotspot.Rotation, blendMode, alpha, AlphaMode_None)

		compositor:addParam(middleBadgeMap, middleHotspot.Bounds, middleHotspot.Rotation, blendMode, alpha, AlphaMode_None)
		compositor:addParam(armbandMap, armbandHotspot.Bounds, rotation, blendMode, alpha, AlphaMode_None)
	end
	
	return compositor:composite()
end

local function compositePlayerName(initData, fontAsset)
	local width, height, mips = 512, 128, 0
	local font_format = RasterizedTextureFormat_R8

	local texture_id = string.format("playername_%d_%s_%s", initData.PlayerId, initData.KitName, getAssetName(fontAsset))
	local compositor = createTextureCompositor(texture_id, width, height, mips)
	compositor:setText(fontAsset, initData.KitName, font_format)
	--compositor:setText(fontAsset, "cañón", font_format)
	return compositor:rasterize()
end

-------------------------------------------------------------------------------------
local function _compositeFaceMap(initData, skinmap, beardmap, browmap, hairlinemap, tattoomap, hotspot_file)
	local full_hs= { Bounds = {0, 0, 1.0, 1.0}, Rotation = 0 }


	local hs = _readGenericHotspotData(hotspot_file, "head", "backneck")
	
	-- these generated ids don't work for create player as they are not unique for the same player
	--local texture_id = (initData.TeamSide * 1000000) + initData.PlayerId
	--local texture_id = string.format("generic_face_%d_%d", initData.PlayerId, initData.TeamSide)
	local texture_id = table.concat({"gen_face", getAssetName(skinmap), 
		getAssetName(beardmap), getAssetName(browmap), getAssetName(hairlinemap), getAssetName(tattoomap)}, "|")

	local mips, compress, alpha = 0, true, 1.0

	local compositor = createTextureCompositor(texture_id, 1024, 1024, mips, compress, RenderFormat_BC3_SRGB)
	compositor:addParam(skinmap, full_hs.Bounds, full_hs.Rotation, BlendMode_AlphaBlend, alpha, AlphaMode_InverseAdditive)
	compositor:addParam(tattoomap, hs.Bounds, hs.Rotation, BlendMode_AlphaBlend, alpha, AlphaMode_None)
	compositor:addParam(beardmap, full_hs.Bounds, full_hs.Rotation, BlendMode_AlphaBlend, alpha, AlphaMode_None)
	compositor:addParam(browmap, full_hs.Bounds, full_hs.Rotation, BlendMode_AlphaBlend, alpha, AlphaMode_None)
	compositor:addParam(hairlinemap, full_hs.Bounds, full_hs.Rotation, BlendMode_Multiply, alpha, AlphaMode_None)
	return compositor:composite()
end

-------------------------------------------------------------------------------------
-- load functions

-----------------------------------------------------------------------------
-- load crest and hotspots
local function _loadTeamCrest(initData, prefix)
	-- if it's custom crest then we load it from GameModes chunk data
	local crestColorMap, crestCoeffMap, crestNormalMap

	local kit = initData.Kit
	local kit_type = initData.KitType
	local kit_year = initData.KitYear

	local crest_coeff_name, crest_normal_name
	
	if initData.CrestAssetId < 1 then 
		local crest_color_name  = string.format("%s_%d_%d_%d_color;crest_%d_%d_%d_color;crest_0_0_0_color", prefix, kit, kit_type, kit_year, kit, kit_type, kit_year)
		crestColorMap = loadAsync(brts.kit, crest_color_name)

		crest_coeff_name  = string.format("%s_%d_%d_%d_coeff;crest_fallback_coeff", prefix, kit, kit_type, kit_year, prefix)
		crest_normal_name = string.format("%s_%d_%d_%d_normal;crest_fallback_normal", prefix, kit, kit_type, kit_year, prefix)
	else
		local custom_crest_color_name = string.format(
			"data/ui/imgAssets/crest/custom/l%d.dds;data/ui/imgAssets/crest/ssf/l%d.dds;data/ui/imgAssets/crest/ssf/notfound.dds", 
			initData.CrestAssetId, initData.CrestAssetId)
		
		crestColorMap = loadRuntimeDDS(custom_crest_color_name)

		crest_coeff_name  = "crest_fallback_coeff"
		crest_normal_name = "crest_fallback_normal"
	end

	
	if (SETTING_DecalsUseExtraMaps) then
		crestCoeffMap  = loadAsync(brts.kit, crest_coeff_name)
		crestNormalMap = loadAsync(brts.kit, crest_normal_name)
	end


	return crestColorMap, crestCoeffMap, crestNormalMap
end

local function _loadBrandMaps(initData, prefix)
	
	local brandColorMap, brandCoeffMap, brandNormalMap
	
	local kit = initData.Kit
	local kit_type = initData.KitType
	local kit_year = initData.KitYear
	
	local brand_color_name = string.format("%s_%d_%d_%d_color;brand_fallback_color", prefix, kit, kit_type, kit_year)
	brandColorMap = loadAsync(brts.kit, brand_color_name)
	
	if(SETTING_DecalsUseExtraMaps) then
		local brand_normal_name = string.format("%s_%d_%d_%d_normal;brand_fallback_normal", prefix, kit, kit_type, kit_year)
		local brand_coeff_name = string.format("%s_%d_%d_%d_coeff;brand_fallback_coeff", prefix,kit, kit_type, kit_year)
		
		brandNormalMap = loadAsync(brts.kit, brand_normal_name)
		brandCoeffMap  = loadAsync(brts.kit, brand_coeff_name)
	end
	
	return brandColorMap, brandCoeffMap, brandNormalMap
	
end

local function _loadMuscleFlexMaps(initData, prefix)
	local flexMask, flexNormalMap, flexAmbientMap
	if(SETTING_UseFlexMaps) then
		local gender = initData.Gender
		local flexmask_name    = prefix .. "_mask"
		local flexnormal_name  = string.format("%s_%d_normal", prefix, gender)
		local flexambient_name = string.format("%s_%d_ambient", prefix, gender)
		flexMask = loadAsync(brts.body, flexmask_name)
		flexNormalMap = loadAsync(brts.body, flexnormal_name)
		flexAmbientMap = loadAsync(brts.body, flexambient_name)
	end
	return flexMask, flexNormalMap, flexAmbientMap
end

-----------------------------------------------------------------------------
local function loadKitShorts(items, initData, hotspotAsset)

	-- dont load shorts if there is bottom outfit layer
	local useWardrobe = initData.UseWardrobeBottom ~= 0 or initData.UseWardrobeBottomSecondLayer ~= 0
	if useWardrobe then return end

	local allow_missing = false
	local kit = initData.Kit
	local kit_type = initData.KitType
	local kit_year = initData.KitYear
	local gender = initData.Gender
	local dirt_type = initData.DirtType
	local short_style = initData.ShortStyle
	
	-- todo: why do we have duplicated short assets without cloth suffix?
	-- shorts and gkpants
	local shorts_name = string.format("shorts_0_%d_%d_cloth;shorts_0_%d_%d", short_style, gender, short_style, gender)
	local shorts_mesh = loadAsync(brts.body, shorts_name, allow_missing)

	if not shorts_mesh then return end

	local color_name = string.format("shorts_%d_%d_%d_color;shorts_0_0_0_color", kit, kit_type, kit_year)
	local coeff_name = string.format("shorts_%d_%d_%d_coeff;shorts_0_0_0_coeff", kit, kit_type, kit_year)
	local ao_name = string.format("shorts_0_%d_%d_ambient", initData.Wet, gender)
	local normal_name = string.format("shorts_%d_%d_%d_normal;shorts_0_normal", kit, kit_type, kit_year)

	local wrinkle_normal = string.format("shorts_0_%d_normal_array", gender)
	local twist_mask = string.format("shorts_%d_twist_mask", gender)

	local dirtmap_name = string.format("shorts_0_dk_%d", dirt_type)
	local dirtmask_name = string.format("shorts_%d_%d_dk_region", gender, dirt_type)

	local numberTens_name = string.format("numbers_%d_%d_color;numbers_0_%d_color", initData.ShortsNumberFont, initData.KitNumberTens, initData.KitNumberTens)
	local numberUnits_name = string.format("numbers_%d_%d_color;numbers_0_%d_color", initData.ShortsNumberFont, initData.KitNumberUnits, initData.KitNumberUnits)

	local is_goalie = short_style == 1
	if is_goalie then
		local gk_pants_kit = initData.GkPantsKit
		local gk_pants_type = initData.GkPantsKitType

		color_name = string.format("gkpants_%d_%d_0_color;gkpants_5200_2_0_color", gk_pants_kit, gk_pants_type)
		coeff_name = string.format("gkpants_%d_%d_0_coeff;gkpants_5200_2_0_coeff", gk_pants_kit, gk_pants_type)
		ao_name = "shorts_1_1_0_ambient"
		normal_name = string.format("gkpants_%d_%d_0_normal;gkpants_5200_2_0_normal", gk_pants_kit, gk_pants_type)
		wrinkle_normal = string.format("gkpants_%d_%d_0_normal_array;gkpants_5200_2_0_normal_array", gk_pants_kit, gk_pants_type)
	end
	
	local taa_name = string.format("shorts_%d_%d_%d_taa;shorts_0_0_0_taa", kit, kit_type, kit_year)

	local weave_normal_array = string.format("weave_shorts_%d_%d_%d_normal_array;weave_shorts_0_0_0_normal_array", kit, kit_type, kit_year)
	local weave_coeff_array  = string.format("weave_shorts_%d_%d_%d_coeff_array;weave_shorts_0_0_0_coeff_array", kit, kit_type, kit_year)
	
	local colorMap = loadAsync(brts.kit, color_name)
	local coeffMap = loadAsync(brts.kit, coeff_name)
	local aoMap = loadAsync(brts.kit, ao_name)
	local normalMap = loadAsync(brts.kit, normal_name)

	local wrinkleMap = loadAsync(brts.kit, wrinkle_normal)
	local twistMap = loadAsync(brts.kit, twist_mask)

	local dirtMap = loadAsync(brts.kit, dirtmap_name)
	local dirtMask = loadAsync(brts.kit, dirtmask_name)

	local numberTensMap = loadAsync(brts.kit, numberTens_name)
	local numberUnitsMap = loadAsync(brts.kit, numberUnits_name)

	-- crest
	local crestColorMap, crestCoeffMap, crestNormalMap = _loadTeamCrest(initData, "crest_shorts")
	
	-- brand
	local brandColorMap, brandNormalMap, brandCoeffMap = _loadBrandMaps(initData, "brand_shorts")

	-- weave/anisotropic
	local taaMap = loadAsync(brts.kit, taa_name)
	local weaveNormalMapArray = loadAsync(brts.kit, weave_normal_array)
	local weaveCoeffMapArray = loadAsync(brts.kit, weave_coeff_array)
	
	items[#items + 1] = futureCall(bindShorts, initData, shorts_mesh, 
		colorMap, coeffMap, aoMap, 
		normalMap, wrinkleMap, twistMap, 
		dirtMap, dirtMask, 
		numberTensMap, numberUnitsMap, hotspotAsset,
		crestColorMap, crestNormalMap, crestCoeffMap, 
		brandColorMap, brandNormalMap, brandCoeffMap, 
		taaMap, weaveNormalMapArray, weaveCoeffMapArray)

	-- under shorts
	if initData.UnderShorts > -1 then
		local undershorts_name = string.format("undershorts_0_%d_%d", initData.SockLength, gender)
		local undershorts_mesh = loadAsync(brts.body, undershorts_name)
		-- common weave array for undergear
		weaveNormalMapArray = loadAsync(brts.kit, "weave_undergear_0_normal_array")
		weaveCoeffMapArray = loadAsync(brts.kit, "weave_undergear_0_coeff_array")
		
		items[#items + 1] = futureCall(bindUnderShorts, initData, undershorts_mesh, 
			colorMap, coeffMap, aoMap, 
			normalMap, wrinkleMap, twistMap, 
			dirtMap, dirtMask,
			taaMap, weaveNormalMapArray, weaveCoeffMapArray)
	end
end

-----------------------------------------------------------------------------
-- side: 0 - left, 1 - right, 2 - middle
local function loadBadge(id, initData, side)
	-- position: 0 - left, 1 - right, 2 - middle
	-- suffix: color, normal, coeff
	local makeBadgeName = function(id, kit, kit_type, kit_year, position, suffix)
		local pattern = "badge_%d_%d_%d_%d_%d_%s;badge_%d_%d_%d_%d_%d_%s;badge_%d_%d_%d_%d_%d_%s;badge_0_0_0_0_0_%s"
		return string.format(pattern, 
			id, kit, kit_type, kit_year, position, suffix,
			id, kit, kit_type, 0, position, suffix,
			id, 0, 0, 0, position, suffix, 
			suffix)
	end

	local kit = initData.Kit
	local kit_type = initData.KitType
	local kit_year = initData.KitYear

	local color_name = makeBadgeName(id, kit, kit_type, kit_year, side, "color")
	local normal_name = makeBadgeName(id, kit, kit_type, kit_year, side, "normal")
	local coeff_name = makeBadgeName(id, kit, kit_type, kit_year, side, "coeff")

	local colorMap = loadAsync(brts.badges, color_name)
	local normalMap = loadAsync(brts.badges, normal_name)
	local coeffMap = loadAsync(brts.badges, coeff_name)
	return {color = colorMap, normal = normalMap, coeff = coeffMap}
end

-----------------------------------------------------------------------------
local function loadArmband(id)
	local makeName = function(id, suffix) return string.format("armband_%d_0_%s;armband_0_0_%s", id, suffix, suffix) end

	local color_name = makeName(id, "color")
	local normal_name = makeName(id, "normal")
	local coeff_name = makeName(id, "coeff")

	local colorMap = loadAsync(brts.armband, color_name)
	local normalMap = loadAsync(brts.armband, normal_name)
	local coeffMap = loadAsync(brts.armband, coeff_name)
	return {color = colorMap, normal = normalMap, coeff = coeffMap}
end

-----------------------------------------------------------------------------
local function _isClothJersey(initData)
	return (initData.JerseyFit == 0 and initData.DisableCloth == 0)
end

local function loadKitJersey(items, generatedTextures, initData, hotspotAsset, competitionHotspot, is_hangingjersey)
	-- don't load jersey if there is top base outfit
	if initData.UseWardrobeTopBase ~= 0 then return end

	local allow_missing = false
	local kit = initData.Kit
	local kit_type = initData.KitType
	local kit_year = initData.KitYear
	local gender = initData.Gender
	local dirt_type = initData.DirtType
	local jersey_tucked = initData.JerseyTucked
	local jersey_fit = initData.JerseyFit

	local is_cloth = _isClothJersey(initData) and "_cloth" or ""
	
	local jersey_name, brt_name
	
	if is_hangingjersey then
		jersey_name = string.format("hangingjersey_%d", initData.HangingJerseyVariation)
		brt_name = brts.worlds_clothing
	else
		jersey_name = string.format("jersey_0_%d_%d_%d_%d_%d_%d%s", initData.JerseyCollarType, initData.JerseySleeveLength, initData.IsCaptain,
			jersey_tucked, jersey_fit, gender, is_cloth)
		brt_name = brts.body
	end

	local jersey_mesh = loadAsync(brt_name, jersey_name, allow_missing)
	
	if not jersey_mesh then return end

	-- textures
	local color_name = string.format("jersey_%d_%d_%d_color;jersey_0_0_0_color", kit, kit_type, kit_year)
	local coeff_name = string.format("jersey_%d_%d_%d_coeff;jersey_0_0_0_coeff", kit, kit_type, kit_year)
	local normal_name = string.format("jersey_%d_%d_%d_normal;jersey_0_normal", kit, kit_type, kit_year)
	local ao_name = string.format("jersey_%d_%d_%d_ambient", jersey_tucked, initData.Wet, gender)

	local wrinkle_normal = string.format("jersey_%d_%d_%d_normal_array", jersey_tucked, jersey_fit, gender)
	local twist_mask = string.format("jersey_%d_twist_mask", gender)

	local dirtmap_name = string.format("jersey_dk_%d;jersey_dk_0", dirt_type)
	local dirtmask_name = string.format("jersey_%d_dk_region;jersey_0_dk_region", dirt_type)

	local numberTens_name = string.format("numbers_%d_%d_color;numbers_0_%d_color", initData.KitNumberFont, initData.KitNumberTens, initData.KitNumberTens)
	local numberUnits_name = string.format("numbers_%d_%d_color;numbers_0_%d_color", initData.KitNumberFont, initData.KitNumberUnits, initData.KitNumberUnits)
	
		local taa_name = string.format("jersey_%d_%d_%d_taa;jersey_0_0_0_taa", kit, kit_type, kit_year)
	local weave_normal_array = string.format("weave_jersey_%d_%d_%d_normal_array;weave_jersey_0_0_0_normal_array", kit, kit_type, kit_year)
	local weave_coeff_array = string.format("weave_jersey_%d_%d_%d_coeff_array;weave_jersey_0_0_0_coeff_array", kit, kit_type, kit_year)

	if is_hangingjersey then wrinkle_normal = "jersey_0_normal" end

	local colorMap = loadAsync(brts.kit, color_name)
	local aoMap = loadAsync(brts.kit, ao_name)

	local coeffMap = loadAsync(brts.kit, coeff_name)
	local normalMap = loadAsync(brts.kit, normal_name)

	local wrinkleMap = loadAsync(brts.kit, wrinkle_normal)
	local twistMap = loadAsync(brts.kit, twist_mask)

	local dirtMap = loadAsync(brts.kit, dirtmap_name)
	local dirtMask = loadAsync(brts.kit, dirtmask_name)

	local numberTensMap = loadAsync(brts.kit, numberTens_name)
	local numberUnitsMap = loadAsync(brts.kit, numberUnits_name)

	local font_name = string.format("font_%d;font_0", initData.KitNameFont)
	local fontAsset = loadAsync(brts.font, font_name)
	
	-- crest
	local crestColorMap, crestCoeffMap, crestNormalMap = _loadTeamCrest(initData, "crest") 
	
	-- brand
	local brandColorMap, brandNormalMap, brandCoeffMap = _loadBrandMaps(initData, "brand_jersey")
	
	-- weave/anisotropic
	local taaMap = loadAsync(brts.kit, taa_name)
	local weaveNormalMapArray = loadAsync(brts.kit, weave_normal_array)
	local weaveCoeffMapArray = loadAsync(brts.kit, weave_coeff_array)

	-- badges
	local badgeBakeMaskMap = loadAsync(brts.kit, "badge_bake_mask;badge_0_0_0_0_0_color")
	local leftBadge = loadBadge(initData.JerseyBadgeLeftID, initData, 0)
	local rightBadge = loadBadge(initData.JerseyBadgeRightID, initData, 1)
	local middleBadge = loadBadge(initData.JerseyBadgeMiddleID, initData, 2)
	local armbandBadge = loadArmband(initData.JerseyArmbandID)

	-- color composite
	local colorGeneratedMap = futureCall(compositeJerseyWithBadges, initData, 
		hotspotAsset, competitionHotspot, BadgeColorCompositorDesc, false, badgeBakeMaskMap, 
		colorMap, leftBadge.color, rightBadge.color, middleBadge.color, armbandBadge.color)
	generatedTextures[#generatedTextures + 1] = colorGeneratedMap
	
	-- coeff composite
	local coeffGeneratedMap = futureCall(compositeJerseyWithBadges, initData, 
		hotspotAsset, competitionHotspot, BadgeCoeffCompositorDesc, false, badgeBakeMaskMap, 
		coeffMap, leftBadge.coeff, rightBadge.coeff, middleBadge.coeff, armbandBadge.coeff)
	generatedTextures[#generatedTextures + 1] = coeffGeneratedMap
	
	-- normal composite
	local normalGeneratedMap = futureCall(compositeJerseyWithBadges, initData, 
		hotspotAsset, competitionHotspot, BadgeNormalCompositorDesc, true, badgeBakeMaskMap, 
		normalMap, leftBadge.normal, rightBadge.normal, middleBadge.normal, armbandBadge.normal)
	generatedTextures[#generatedTextures + 1] = normalGeneratedMap

	-- player name
	local playerNameGeneratedMap = futureCall(compositePlayerName, initData, fontAsset)
	generatedTextures[#generatedTextures + 1] = playerNameGeneratedMap

	-- jersey material
	items[#items + 1] = futureCall(bindJersey, initData, jersey_mesh, is_hangingjersey,
		colorMap, coeffMap, aoMap, 
		normalMap, wrinkleMap, twistMap, 
		dirtMap, dirtMask, 
		numberTensMap, numberUnitsMap, hotspotAsset, 
		colorGeneratedMap, normalGeneratedMap, coeffGeneratedMap, playerNameGeneratedMap,
		crestColorMap, crestNormalMap, crestCoeffMap, 
		brandColorMap, brandNormalMap, brandCoeffMap, 
		taaMap, weaveNormalMapArray, weaveCoeffMapArray)

	-- under arms
	if initData.UnderArms > -1 then
		local underarms_name = string.format("underarms_0_0_%d", gender)
		local underarms_mesh = loadAsync(brts.body, underarms_name)
		-- common weave array for undergear
		weaveNormalMapArray = loadAsync(brts.kit, "weave_undergear_0_normal_array")
		weaveCoeffMapArray = loadAsync(brts.kit, "weave_undergear_0_coeff_array")
	
		items[#items + 1] = futureCall(bindUnderArms, initData, underarms_mesh,
			colorMap, coeffMap, aoMap, 
			normalMap, wrinkleMap, twistMap, 
			dirtMap, dirtMask, 
			taaMap, weaveNormalMapArray, weaveCoeffMapArray)
	end

	-- under neck
	if initData.UnderNeck > -1 then
		local underneck_name = string.format("underneck_0_0_%d", gender)
		local underneck_mesh = loadAsync(brts.body, underneck_name)
		-- common weave array for undergear
		weaveNormalMapArray = loadAsync(brts.kit, "weave_undergear_0_normal_array")
		weaveCoeffMapArray = loadAsync(brts.kit, "weave_undergear_0_coeff_array")
		
		items[#items + 1] = futureCall(bindUnderNeck, initData, underneck_mesh,
			colorMap, coeffMap, aoMap, 
			normalMap, wrinkleMap, twistMap, 
			dirtMap, dirtMask,
			taaMap, weaveNormalMapArray, weaveCoeffMapArray)
	end
end

-----------------------------------------------------------------------------
local function loadShoes(items, initData)
	if initData.UseShoe == 0 then return end
	
	local allow_missing = false
	local shoe_type = initData.ShoeType
	local shoe_design = initData.ShoeDesign

	local shoe_name = string.format("shoe_%d;shoe_15;shoe_0", shoe_type)
	local shoe_mesh = loadAsync(brts.shoes, shoe_name, allow_missing)
	if not shoe_mesh then return end

	local color_name = string.format("shoe_%d_%d_color;shoe_15_0_color;debug_texture_color", shoe_type, shoe_design)
	local normal_name = string.format("shoe_%d_%d_normal;shoe_15_0_normal;debug_texture_normal", shoe_type, shoe_design)
	local coeff_name = string.format("shoe_%d_%d_coeff;shoe_15_0_coeff;debug_texture_coeff", shoe_type, shoe_design)

	local dirtmap_name = string.format("shoe_dk_%d;debug_texture_dk", initData.DirtType)
	local dirtmask_name = "shoes_dk_region;debug_texture_mask"

	local colorMap = loadAsync(brts.shoes, color_name)
	local normalMap = loadAsync(brts.shoes, normal_name)
	local coeffMap = loadAsync(brts.shoes, coeff_name)

	local dirtMap = loadAsync(brts.kit, dirtmap_name)
	local dirtMask = loadAsync(brts.kit, dirtmask_name)

	items[#items + 1] = futureCall(bindShoe, initData, shoe_mesh, 
		colorMap, coeffMap, normalMap, dirtMap, dirtMask)
end

-----------------------------------------------------------------------------
local function loadSocks(items, initData, hotspotAsset)
	local sock_length = initData.SockLength

	if sock_length == 9999 or sock_length == -1 then return end
	local is_gkpants = initData.ShortStyle == 1 
	if(is_gkpants) then return end	

	local allow_missing = false

	local kit = initData.Kit
	local kit_type = initData.KitType
	local kit_year = initData.KitYear
	local gender = initData.Gender

	-- lua always initializes variable to nil
	local socks_name
	local color_name, normal_name, coeff_name, ao_name, wrinkle_normal
	local taa_name, weave_normal_array, weave_coeff_array
	local mesh_brt, texture_brt

	local shinpad = 0

	if initData.UseKitSock ~= 0 then
		mesh_brt, texture_brt = brts.body, brts.kit

		-- sock 0-3 use normal array, sock 4 use noshinpad normal array
		if sock_length == 4 then shinpad = 1 end

		socks_name = string.format("sock_0_%d_%d", sock_length, gender)
		color_name = string.format("socks_%d_%d_%d_color;socks_0_0_0_color", kit, kit_type, kit_year)
		normal_name = string.format("socks_%d_%d_%d_normal;socks_0_normal", kit, kit_type, kit_year)
		wrinkle_normal = string.format("socks_%d_%d_normal_array", gender, shinpad)
		coeff_name = string.format("socks_%d_%d_%d_coeff;socks_0_0_0_coeff", kit, kit_type, kit_year)
		ao_name = string.format("socks_0_%d_%d_ambient", initData.Wet, gender)
		taa_name = string.format("socks_%d_%d_%d_taa;socks_0_0_0_taa", kit, kit_type, kit_year)
		weave_normal_array = string.format("weave_socks_%d_%d_%d_normal_array;weave_socks_0_0_0_normal_array", kit, kit_type, kit_year)
		weave_coeff_array = string.format("weave_socks_%d_%d_%d_coeff_array;weave_socks_0_0_0_coeff_array", kit, kit_type, kit_year)

	end
	if initData.UseWardrobeSock ~= 0 then
		mesh_brt, texture_brt = brts.wardrobe, brts.wardrobe
		allow_missing = true

		local sock_class = initData.SockClothingClass
		local sock_variation = initData.SockVariation
		socks_name = string.format("sock_%d_%d_%d", sock_length, sock_class, gender)
		color_name = string.format("sock_%d_%d_%d_%d_color;debug_texture_color", sock_length, sock_class, sock_variation, gender)
		normal_name = string.format("sock_%d_%d_%d_%d_normal;debug_texture_normal", sock_length, sock_class, sock_variation, gender)
		wrinkle_normal = string.format("sock_%d_%d_%d_%d_normal;debug_texture_normal", sock_length, sock_class, sock_variation, gender)
		coeff_name = string.format("sock_%d_%d_%d_%d_coeff;debug_texture_coeff", sock_length, sock_class, sock_variation, gender)
		ao_name = string.format("sock_%d_%d_ambient;debug_texture_aoblend", sock_length, gender)
		taa_name = "socks_0_0_0_taa"
		local clothingclass = 1
		weave_normal_array = string.format("sock_%d_%d_weave_nm_array;sock_11_1_weave_nm_array", sock_length, clothingclass)
		weave_coeff_array = string.format("sock_%d_%d_weave_coeff_array;sock_11_1_weave_coeff_array", sock_length, clothingclass)
	end

	-- no socks
	if not socks_name then return end

	-- no socks
	local socks_mesh = loadAsync(mesh_brt, socks_name, allow_missing)
	if not socks_mesh then return end

	local twist_mask = "socks_0_twist_mask"

	local dirtmap_name = string.format("socks_dk_%d", initData.DirtType)
	local dirtmask_name = "socks_0_0_dk_region"

	local colorMap = loadAsync(texture_brt, color_name)
	local coeffMap = loadAsync(texture_brt, coeff_name)
	local aoMap = loadAsync(texture_brt, ao_name)
	local normalMap = loadAsync(texture_brt, normal_name)

	local wrinkleMap = loadAsync(texture_brt, wrinkle_normal)
	
	local twistMap = loadAsync(brts.kit, twist_mask)

	local dirtMap = loadAsync(brts.kit, dirtmap_name)
	local dirtMask = loadAsync(brts.kit, dirtmask_name)
	
	local taaMap = loadAsync(brts.kit, taa_name)
	local weaveNormalMapArray = loadAsync(texture_brt, weave_normal_array)
	local weaveCoeffMapArray = loadAsync(texture_brt, weave_coeff_array)

	items[#items + 1] = futureCall(bindSocks, initData, socks_mesh, hotspotAsset,
		colorMap, coeffMap, aoMap, 
		normalMap, wrinkleMap, twistMap, 
		dirtMap, dirtMask, taaMap, weaveNormalMapArray, weaveCoeffMapArray)
end

-----------------------------------------------------------------------------
local function loadGkGloves(items, initData)
	if initData.IsGoalie == 0 and initData.UseKitGkGloves == 0 then return end

	local glove_type = initData.GkGloveType

	local mesh_name = string.format("gkglove_%d;gkglove_1", glove_type)
	local mesh = loadAsync(brts.accessory, mesh_name)

	local color_name = string.format("gkglove_%d_color;gkglove_1_color;debug_texture_color", glove_type)
	local normal_name = string.format("gkglove_%d_normal;gkglove_1_normal;debug_texture_normal", glove_type)
	local coeff_name = string.format("gkglove_%d_coeff;gkglove_1_coeff;debug_texture_coeff", glove_type)

	local colorMap = loadAsync(brts.accessory, color_name)
	local normalMap = loadAsync(brts.accessory, normal_name)
	local coeffMap = loadAsync(brts.accessory, coeff_name)

	--[[
	local color_name = string.format("gkglove_%d_color", glove_type)
	local normal_name = string.format("gkglove_%d_normal", glove_type)
	local coeff_name = string.format("gkglove_%d_coeff", glove_type)

	local colorMap = loadAsync(brts.accessory, color_name, true) or loadAsync(brts.base, "debug_texture_color")
	local normalMap = loadAsync(brts.accessory, normal_name, true) or loadAsync(brts.base, "debug_texture_normal")
	local coeffMap = loadAsync(brts.accessory, coeff_name, true) or loadAsync(brts.base, "debug_texture_coeff")
	]]--

	-- not used
	--local dirtMap = loadAsync(brts.kit, "gkglove_dk")
	--local dirtMask = loadAsync(brts.kit, dirtmask_name)

	items[#items + 1] = futureCall(bindGkGloves, initData, mesh, colorMap, coeffMap, normalMap)
end

-----------------------------------------------------------------------------
-- load outfit
local function loadBottom0(items, initData)
	if initData.UseWardrobeBottom == 0 then return end

	local allow_missing = true

	local gender = initData.Gender
	local bottom_id = initData.BottomId
	local bottom_class = initData.BottomClothingClass
	local bottom_variation = initData.BottomTextureVariation

	local bottom0_name = string.format("bottom_0_%d_%d_0_0_%d", bottom_id, bottom_class, gender)
	local bottom0_mesh = loadAsync(brts.wardrobe, bottom0_name, allow_missing)

	local color_name = string.format("bottom_%d_%d_%d_%d_color;debug_texture_color", bottom_id, bottom_class, bottom_variation, gender)
	local normal_name = string.format("bottom_%d_%d_%d_%d_normal;debug_texture_normal", bottom_id, bottom_class, bottom_variation, gender)
	local coeff_name = string.format("bottom_%d_%d_%d_%d_coeff;debug_texture_coeff",bottom_id, bottom_class, bottom_variation, gender)
	local ao_name = string.format("bottom_%d_%d_ambient;debug_texture_color", bottom_id, gender)

	local weave_normal_name = string.format("bottom_%d_%d_weave_nm_array;debug_texture_normal_array", bottom_id, bottom_class)
	local weave_coeff_name = string.format("bottom_%d_%d_weave_coeff_array;debug_texture_normal_array", bottom_id, bottom_class)

	local cull_name = string.format("bottom_%d_%d_clothingcull", initData.BottomSecondLayerId, gender)

	local colorMap = loadAsync(brts.wardrobe, color_name)
	local coeffMap = loadAsync(brts.wardrobe, coeff_name)
	local aoMap = loadAsync(brts.wardrobe, ao_name)
	local normalMap = loadAsync(brts.wardrobe, normal_name)

	local weaveNormalMap = loadAsync(brts.wardrobe, weave_normal_name)
	local weaveCoeffMap = loadAsync(brts.wardrobe, weave_coeff_name)
	
	local cullMap = loadAsync(brts.wardrobe, cull_name, allow_missing)
	if not cullMap then cullMap = loadAsync(brts.body, "nocull") end

	if bottom0_mesh then
		items[#items + 1] = futureCall(bindBottom0, initData, bottom0_mesh,
			colorMap, coeffMap, aoMap, normalMap, 
			weaveCoeffMap, weaveNormalMap, cullMap)
	end
end

-----------------------------------------------------------------------------
local function loadBottom1(items, initData)
	if initData.UseWardrobeBottomSecondLayer == 0 then return end

	local allow_missing = true

	local gender = initData.Gender
	local bottom_id = initData.BottomSecondLayerId
	local bottom_class = initData.BottomSecondLayerClothingClass
	local bottom_variation = initData.BottomSecondLayerTextureVariation

	local bottom1_name = string.format("bottom_0_%d_%d_0_0_%d", bottom_id, bottom_class, gender)
	local bottom1_mesh = loadAsync(brts.wardrobe, bottom1_name, allow_missing)

	local color_name = string.format("bottom_%d_%d_%d_%d_color;debug_texture_color", bottom_id, bottom_class, bottom_variation, gender)
	local normal_name = string.format("bottom_%d_%d_%d_%d_normal;debug_texture_normal", bottom_id, bottom_class, bottom_variation, gender)
	local coeff_name = string.format("bottom_%d_%d_%d_%d_coeff;debug_texture_coeff", bottom_id, bottom_class, bottom_variation, gender)
	local ao_name = string.format("bottom_%d_%d_ambient;debug_texture_color", bottom_id, gender)

	local weave_normal_name = string.format("bottom_%d_%d_weave_nm_array;debug_texture_normal_array", bottom_id, bottom_class)
	local weave_coeff_name = string.format("bottom_%d_%d_weave_coeff_array;debug_texture_normal_array", bottom_id, bottom_class)

	local colorMap = loadAsync(brts.wardrobe, color_name)
	local coeffMap = loadAsync(brts.wardrobe, coeff_name)
	local aoMap = loadAsync(brts.wardrobe, ao_name)
	local normalMap = loadAsync(brts.wardrobe, normal_name)

	local weaveNormalMap = loadAsync(brts.wardrobe, weave_normal_name)
	local weaveCoeffMap = loadAsync(brts.wardrobe, weave_coeff_name)
	
	local cullMap = loadAsync(brts.body, "nocull")

	if bottom1_mesh then
		items[#items + 1] = futureCall(bindBottom1, initData, bottom1_mesh,
			colorMap, coeffMap, aoMap, normalMap, 
			weaveCoeffMap, weaveNormalMap, cullMap)
	end
end

-----------------------------------------------------------------------------
local function loadTop0(items, initData)
	if initData.UseWardrobeTopBase == 0 then return end

	local allow_missing = true
	
	local gender = initData.Gender
	local top_id = initData.TopBaseId
	local top_class = initData.TopBaseClothingClass
	local top_variation = initData.TopBaseTextureVariation

	local top0_name = string.format("top_0_%d_%d_0_0_%d", top_id, top_class, gender)
	local top0_mesh = loadAsync(brts.wardrobe, top0_name, allow_missing)
	--local top0_mesh = loadAsync(brts.wardrobe, top0_name)

	local color_name = string.format("top_%d_%d_%d_%d_color;debug_texture_color", top_id, top_class, top_variation, gender)
	local normal_name = string.format("top_%d_%d_%d_%d_normal;debug_texture_normal", top_id, top_class, top_variation, gender)
	local coeff_name = string.format("top_%d_%d_%d_%d_coeff;debug_texture_coeff", top_id, top_class, top_variation, gender)
	local ao_name = string.format("top_%d_%d_ambient;debug_texture_color", top_id, gender)

	local weave_normal_name = string.format("top_%d_%d_weave_nm_array;debug_texture_normal_array", top_id, top_class)
	local weave_coeff_name = string.format("top_%d_%d_weave_coeff_array;debug_texture_normal_array", top_id, top_class)

	local cull_name = string.format("top_%d_%d_clothingcull", initData.TopSecondLayerId, gender)

	local colorMap = loadAsync(brts.wardrobe, color_name)
	local coeffMap = loadAsync(brts.wardrobe, coeff_name)
	local aoMap = loadAsync(brts.wardrobe, ao_name)
	local normalMap = loadAsync(brts.wardrobe, normal_name)

	local weaveNormalMap = loadAsync(brts.wardrobe, weave_normal_name)
	local weaveCoeffMap = loadAsync(brts.wardrobe, weave_coeff_name)
	
	local cullMap = loadAsync(brts.wardrobe, cull_name, allow_missing)
	if not cullMap then cullMap = loadAsync(brts.body, "nocull") end

	if top0_mesh then
		items[#items + 1] = futureCall(bindTop0, initData, top0_mesh,
			colorMap, coeffMap, aoMap, normalMap, 
			weaveCoeffMap, weaveNormalMap, cullMap)
	end
end

-----------------------------------------------------------------------------
local function loadTop1(items, initData)
	if initData.UseWardrobeTopSecondLayer == 0 then return end

	local allow_missing = true

	local gender = initData.Gender
	local top_id = initData.TopSecondLayerId
	local top_class = initData.TopSecondLayerClothingClass
	local top_variation = initData.TopSecondLayerTextureVariation

	local top1_name = string.format("top_0_%d_%d_0_0_%d", top_id, top_class, gender)
	local top1_mesh = loadAsync(brts.wardrobe, top1_name, allow_missing)

	local color_name = string.format("top_%d_%d_%d_%d_color;debug_texture_color", top_id, top_class, top_variation, gender)
	local normal_name = string.format("top_%d_%d_%d_%d_normal;debug_texture_normal", top_id, top_class, top_variation, gender)
	local coeff_name = string.format("top_%d_%d_%d_%d_coeff;debug_texture_coeff", top_id, top_class, top_variation, gender)
	local ao_name = string.format("top_%d_%d_ambient;debug_texture_color", top_id, gender)

	local weave_normal_name = string.format("top_%d_%d_weave_nm_array;debug_texture_normal_array", top_id, top_class)
	local weave_coeff_name = string.format("top_%d_%d_weave_coeff_array;debug_texture_normal_array", top_id, top_class)

	local colorMap = loadAsync(brts.wardrobe, color_name)
	local coeffMap = loadAsync(brts.wardrobe, coeff_name)
	local aoMap = loadAsync(brts.wardrobe, ao_name)
	local normalMap = loadAsync(brts.wardrobe, normal_name)

	local weaveNormalMap = loadAsync(brts.wardrobe, weave_normal_name)
	local weaveCoeffMap = loadAsync(brts.wardrobe, weave_coeff_name)
	
	local cullMap = loadAsync(brts.body, "nocull")

	local hotspots_name = string.format("top_%d_%d_hotspot", top_id, gender)
	local hotspot = loadAsync(brts.wardrobe, hotspots_name, allow_missing)
	
	-- loading different crest from UI folder, test: mload 0 2
	local crest_name = initData.CrestAssetId < 1 and 
		string.format("data/ui/imgAssets/crest/dark/l%d.dds;data/ui/imgAssets/crest/dark/notfound.dds", initData.TeamId) or
		string.format("data/ui/imgAssets/crest/custom/l%d.dds;data/ui/imgAssets/crest/ssf/l%d.dds;data/ui/imgAssets/crest/ssf/notfound.dds", 
			initData.CrestAssetId, initData.CrestAssetId)
	local ddsCrestMap = loadRuntimeDDS(crest_name)

	if top1_mesh then
		items[#items + 1] = futureCall(bindTop1, initData, top1_mesh,
			colorMap, coeffMap, aoMap, normalMap, 
			weaveCoeffMap, weaveNormalMap, cullMap, hotspot, ddsCrestMap)
	end
end

-----------------------------------------------------------------------------
local function _loadTattoo(tattooid)
	local allow_missing = false
	local tattoo_map = loadAsync(brts.tattoo, string.format("tattoo_%d_color;tattoo_0_color", tattooid), allow_missing)
	local hotspot_file = loadAsync(brts.tattoo, string.format("tattoo_%d_hotspot;tattoo_0_hotspot", tattooid), allow_missing)
	return tattoo_map, hotspot_file
end

-----------------------------------------------------------------------------
local function bindUpperBody(initData, slot, mesh, colorMap, coeffMap, normalMap, 
							dirtMap, dirtMask, sssMap, 
							cullMapGenerated, skinMapGenerated, 
							flexMask, flexNormalMap, flexAmbientMap)
	local is_kit_body = (slot == slots.arms or slot == slots.arms_short)
		
	local item = createItem("bodyupper_item", slot, initData.laneId)

	if is_kit_body then
		if (slot == slots.arms) then 
			item:setIncludeCullTagHashes("Arms")
			item:setExcludeCullTagHashes("ArmsShort") 
		end
		if (slot == slots.arms_short) then
			item:setIncludeCullTagHashes("ArmsShort")
		end
	end
	item:setTagHashes("psd_arms" )

	item:addMeshLodPair(lod0, mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder)

	local material = item:addMaterial("body_mat")

	-- textures
	if skinMapGenerated then 
		material:addGenTexture("colorTexture", skinMapGenerated)
	else
		material:addTexture("colorTexture", colorMap)
	end

	material:addTexture("coefficientTexture", coeffMap)
	material:addTexture("normalTexture", normalMap)
	material:addTexture("sssTexture", sssMap)
	if is_kit_body then
		_addMuscleFlexParams(material, flexMask, flexNormalMap, flexAmbientMap)
	end

	-- runtime generated textures
	material:addGenTexture("cullTexture", cullMapGenerated)

	_addDirtShaderParams(material, initData, dirtMap, dirtMask)

	return item
end

-----------------------------------------------------------------------------
local function bindLowerBody(initData, slot, mesh, colorMap, coeffMap, normalMap,
							dirtMap, dirtMask, sssMap,
							cullMapGenerated, skinMapGenerated,
							flexMask, flexNormalMap, flexAmbientMap)
	local is_kit_body = (slot == slots.legs)
		
	local item = createItem("bodylower_item", slot, initData.laneId)

	if is_kit_body then
		item:setIncludeCullTagHashes("Legs")
	end
	item:setTagHashes("psd_legs" )

	item:addMeshLodPair(lod0, mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder)
	
	local material = item:addMaterial("body_mat")

	-- textures
	if skinMapGenerated then 
		material:addGenTexture("colorTexture", skinMapGenerated)
	else
		material:addTexture("colorTexture", colorMap)
	end

	material:addTexture("coefficientTexture", coeffMap)
	material:addTexture("normalTexture", normalMap)
	material:addTexture("sssTexture", sssMap)
	
	if is_kit_body then
		_addMuscleFlexParams(material, flexMask, flexNormalMap, flexAmbientMap)
	end
	
	-- runtime generated textures
	material:addGenTexture("cullTexture", cullMapGenerated)

	_addDirtShaderParams(material, initData, dirtMap, dirtMask)

	return item
end

-----------------------------------------------------------------------------
local function _compositeBodyUpperTattoo(initData, desc, basemap, ttmap0, hsfile0, ttmap1, hsfile1, ttmap2, hsfile2, ttmap3, hsfile3)
	local default_rotation = 0

	local texture_id = table.concat({getAssetName(basemap), getAssetName(ttmap0), getAssetName(ttmap1), getAssetName(ttmap2), getAssetName(ttmap3) }, "|")
	local mips, compress, alpha = 0, true, 1.0

	local hsdata0 = _readGenericHotspotData(hsfile0, "bodyupper", "rightarm")
	local hsdata1 = _readGenericHotspotData(hsfile1, "bodyupper", "leftarm")
	local hsdata2 = _readGenericHotspotData(hsfile2, "bodyupper", "back")
	local hsdata3 = _readGenericHotspotData(hsfile3, "bodyupper", "front")
	
	local compositor = createTextureCompositor(texture_id, desc.width, desc.height, mips, compress, desc.format)
	compositor:addParam(basemap, {0,0,1,1}, default_rotation, BlendMode_AlphaBlend, alpha, AlphaMode_None)
	compositor:addParam(ttmap0, hsdata0.Bounds, hsdata0.Rotation, BlendMode_AlphaBlend, alpha, AlphaMode_None)
	compositor:addParam(ttmap1, hsdata1.Bounds, hsdata1.Rotation, BlendMode_AlphaBlend, alpha, AlphaMode_None)
	compositor:addParam(ttmap2, hsdata2.Bounds, hsdata2.Rotation, BlendMode_AlphaBlend, alpha, AlphaMode_None)
	compositor:addParam(ttmap3, hsdata3.Bounds, hsdata3.Rotation, BlendMode_AlphaBlend, alpha, AlphaMode_None)
	return compositor:composite()
end

-----------------------------------------------------------------------------
local function _compositeBodyLowerTattoo(initData, desc, basemap, ttmap0, hsfile0, ttmap1, hsfile1)
	local default_rotation = 0

	local texture_id = table.concat({getAssetName(basemap), getAssetName(ttmap0), getAssetName(ttmap1) }, "|")
	local mips, compress, alpha = 0, true, 1.0

	local hsdata0 = _readGenericHotspotData(hsfile0, "bodylower", "rightleg")
	local hsdata1 = _readGenericHotspotData(hsfile1, "bodylower", "leftleg")
	
	local compositor = createTextureCompositor(texture_id, desc.width, desc.height, mips, compress, desc.format)
	compositor:addParam(basemap, {0,0,1,1}, default_rotation, BlendMode_AlphaBlend, alpha, AlphaMode_None)
	compositor:addParam(ttmap0, hsdata0.Bounds, hsdata0.Rotation, BlendMode_AlphaBlend, alpha, AlphaMode_None)
	compositor:addParam(ttmap1, hsdata1.Bounds, hsdata1.Rotation, BlendMode_AlphaBlend, alpha, AlphaMode_None)
	return compositor:composite()
end

-----------------------------------------------------------------------------
local function _compositeBodyUpperCullMask(initData, desc, cullmap0, cullmap1)
	local texture_id = table.concat({getAssetName(cullmap0), getAssetName(cullmap1) }, "|")
	local mips, compress, alpha = 0, true, 1.0

	local defaultHotspot = {0, 0, 1.0, 1.0}
	local rotation = 0

	local compositor = createTextureCompositor(texture_id, desc.width, desc.height, mips, compress, desc.format)
	compositor:addParam(cullmap0, defaultHotspot, rotation, BlendMode_AlphaBlend, alpha, AlphaMode_None)
	compositor:addParam(cullmap1, defaultHotspot, rotation,   BlendMode_Multiply, alpha, AlphaMode_None)
	return compositor:composite()
end

-----------------------------------------------------------------------------
local function _compositeBodyLowerCullMask(initData, desc, cullmap0, cullmap1, cullmap2, cullmap3)
	local texture_id = table.concat({getAssetName(cullmap0), getAssetName(cullmap1), getAssetName(cullmap2), getAssetName(cullmap3) }, "|")
	local mips, compress, alpha = 0, true, 1.0

	local defaultHotspot = {0, 0, 1.0, 1.0}
	local rotation = 0

	local compositor = createTextureCompositor(texture_id, desc.width, desc.height, mips, compress, desc.format)
	compositor:addParam(cullmap0, defaultHotspot, rotation, BlendMode_AlphaBlend, alpha, AlphaMode_None)
	compositor:addParam(cullmap1, defaultHotspot, rotation,   BlendMode_Multiply, alpha, AlphaMode_None)
	compositor:addParam(cullmap2, defaultHotspot, rotation,   BlendMode_Multiply, alpha, AlphaMode_None)
	compositor:addParam(cullmap3, defaultHotspot, rotation,   BlendMode_Multiply, alpha, AlphaMode_None)
	return compositor:composite()
end

-----------------------------------------------------------------------------
local function loadUpperBody(items, generatedTextures, initData)
	local allow_missing = true
	local disallow_missing = false
	local use_kit_body = initData.UsePlayerArms ~= 0
	local need_tattoo_stamping = initData.HasTattooUpperBody ~= 0
	local db_gender = initData.Gender

	-- load female body skin when players are children. 
	local is_child = initData.Age < 15
	local gender = is_child and 1 or db_gender 
	
	-- texture names and loading	
	local color_name = string.format("bodyupper_%d_%d_color;bodyupper_%d_%d_color;bodyupper_1_0_color", initData.PlayerId, gender, initData.BodySkinToneType, gender)
	local normal_name = string.format("bodyupper_common_%d_normal", gender)
	local coeff_name = string.format("bodyupper_common_%d_coeff", gender)
	local sss_name = "bodyupper_common_sss"
	local dirtmap_name = string.format("bodyupper_dk_%d", initData.DirtType)
	local dirtmask_name = "bodyupper_dk_region"

	local colorMap = loadAsync(brts.body, color_name)
	local coeffMap = loadAsync(brts.body, coeff_name)
	local normalMap = loadAsync(brts.body, normal_name)
	local dirtMap = loadAsync(brts.body, dirtmap_name)
	local dirtMask = loadAsync(brts.body, dirtmask_name)
	local sssMap = loadAsync(brts.body, sss_name)
	
	-- cull mask generated texture
	local top0_cullmask_name = string.format("top_%d_%d_bodyuppercull", initData.TopBaseId, gender)
	local top1_cullmask_name = string.format("top_%d_%d_bodyuppercull", initData.TopSecondLayerId, gender)

	local nocullMap = loadAsync(brts.body, "nocull")
	local top0_cullMap = loadAsync(brts.wardrobe, top0_cullmask_name, allow_missing)
	local top1_cullMap = loadAsync(brts.wardrobe, top1_cullmask_name, allow_missing)
	
	top0_cullMap = top0_cullMap or nocullMap
	top1_cullMap = top1_cullMap or nocullMap

	local generatedCullMap = futureCall(_compositeBodyUpperCullMask, initData, CullMaskCompositorDesc, top0_cullMap, top1_cullMap)
	generatedTextures[#generatedTextures + 1] = generatedCullMap
	
	-- composite tattoos if necessary
	local generatedSkinMap = nil

	-- yury todo: there is no bools in initData
	if need_tattoo_stamping then
		local tattoo0, hotspot0 = _loadTattoo(initData.TattooRightArm)
		local tattoo1, hotspot1 = _loadTattoo(initData.TattooLeftArm)
		local tattoo2, hotspot2 = _loadTattoo(initData.TattooTorsoBack)
		local tattoo3, hotspot3 = _loadTattoo(initData.TattooTorsoFront)
		
		generatedSkinMap = futureCall(_compositeBodyUpperTattoo, initData, BodyCompositorDesc, colorMap,
			tattoo0, hotspot0, tattoo1, hotspot1, tattoo2, hotspot2, tattoo3, hotspot3)

		generatedTextures[#generatedTextures + 1] = generatedSkinMap
	end	

	local flexMask = nil
	local flexNormalMap = nil
	local flexAmbientMap = nil
	
	if use_kit_body then
		local bodyupper_ss_name = string.format("arms_0_%d_%d", initData.ArmLength, gender)
		local bodyupper_ls_name = string.format("arms_0_1_%d", gender)
		local bodyupper_ss_mesh = loadAsync(brts.body, bodyupper_ss_name, disallow_missing)
		local bodyupper_ls_mesh = loadAsync(brts.body, bodyupper_ls_name, disallow_missing)
		
		flexMask, flexNormalMap, flexAmbientMap = _loadMuscleFlexMaps(initData, "bodyupper_flex")
		
		items[#items + 1] = futureCall(bindUpperBody, initData, slots.arms, bodyupper_ss_mesh,
									colorMap, coeffMap, normalMap, dirtMap, dirtMask, sssMap, generatedCullMap, generatedSkinMap, flexMask, flexNormalMap, flexAmbientMap)
		items[#items + 1] = futureCall(bindUpperBody, initData, slots.arms_short, bodyupper_ls_mesh,
									colorMap, coeffMap, normalMap, dirtMap, dirtMask, sssMap, generatedCullMap, generatedSkinMap, flexMask, flexNormalMap, flexAmbientMap)
	else
		local bodyupper_name = string.format("bodyupper_%d", db_gender)
		local bodyupper_mesh = loadAsync(brts.body, bodyupper_name, disallow_missing)
		items[#items + 1] = futureCall(bindUpperBody, initData, slots.bodyupper, bodyupper_mesh, 
			colorMap, coeffMap, normalMap, dirtMap, dirtMask, sssMap, generatedCullMap, generatedSkinMap, flexMask, flexNormalMap, flexAmbientMap)
	end
end

-----------------------------------------------------------------------------
local function loadLowerBody(items, generatedTextures, initData)
	if(initData.LegLength < 0 or initData.LegLength == 9999) then return end	
	local is_gkpants = initData.ShortStyle == 1 
	if(is_gkpants) then return end	
	
	local allow_missing = true
	local disallow_missing = false
	local use_kit_body = initData.UsePlayerLegs ~= 0
	local need_tattoo_stamping = initData.HasTattooLowerBody ~= 0
	local db_gender = initData.Gender
	
	-- load female skin when players are children.
	local is_child = initData.Age < 15
	local gender = is_child and 1 or db_gender 
	
	-- texture names and loading	
	local color_name = string.format("bodylower_%d_%d_color;bodylower_%d_%d_color;bodylower_1_0_color", initData.PlayerId, gender, initData.BodySkinToneType, gender)
	local normal_name = string.format("bodylower_common_%d_normal", gender)
	local coeff_name = string.format("bodylower_common_%d_coeff", gender)
	local sss_name = "bodylower_common_sss"
	local dirtmap_name = string.format("bodylower_dk_%d", initData.DirtType)
	local dirtmask_name = "bodylower_dk_region"

	local colorMap = loadAsync(brts.body, color_name)
	local coeffMap = loadAsync(brts.body, coeff_name)
	local normalMap = loadAsync(brts.body, normal_name)
	local dirtMap = loadAsync(brts.body, dirtmap_name)
	local dirtMask = loadAsync(brts.body, dirtmask_name)
	local sssMap = loadAsync(brts.body, sss_name)
	
	-- cull mask generated texture
	local bottom0_cullmask_name = string.format("bottom_%d_%d_bodylowercull", initData.BottomId, gender)
	local bottom1_cullmask_name = string.format("bottom_%d_%d_bodylowercull", initData.BottomSecondLayerId, gender)
	local sock_cullmask_name = string.format("sock_%d_%d_bodylowercull", initData.SockLength, gender)
	local shoe_cullmask_name = string.format("shoe_%d_0_bodylowercull", initData.ShoeType)

	local nocullMap = loadAsync(brts.body, "nocull", disallow_missing)
	local bottom0_cullMap = loadAsync(brts.wardrobe, bottom0_cullmask_name, allow_missing) or nocullMap
	local bottom1_cullMap = loadAsync(brts.wardrobe, bottom1_cullmask_name, allow_missing) or nocullMap
	local sock_cullMap = loadAsync(brts.wardrobe, sock_cullmask_name, allow_missing) or nocullMap
	local shoe_cullMap = loadAsync(brts.shoes, shoe_cullmask_name, allow_missing) or nocullMap

	local generatedCullMap = futureCall(_compositeBodyLowerCullMask, initData, CullMaskCompositorDesc, bottom0_cullMap, bottom1_cullMap, sock_cullMap, shoe_cullMap)
	generatedTextures[#generatedTextures + 1] = generatedCullMap

	-- composite tattoos if necessary
	local generatedSkinMap = nil

	if need_tattoo_stamping then
		local tattoo0, hotspot0 = _loadTattoo(initData.TattooRightLeg)
		local tattoo1, hotspot1 = _loadTattoo(initData.TattooLeftLeg)
	
		generatedSkinMap = futureCall(_compositeBodyLowerTattoo, initData, BodyCompositorDesc, colorMap,
			tattoo0, hotspot0, tattoo1, hotspot1)

		generatedTextures[#generatedTextures + 1] = generatedSkinMap
	end
	
	local bodylower_name
	local slot
	local flexMask = nil
	local flexNormalMap = nil
	local flexAmbientMap = nil
	
	if use_kit_body then
		bodylower_name = string.format("legs_0_%d_%d", initData.LegLength, db_gender)
		slot = slots.legs
		
		flexMask, flexNormalMap, flexAmbientMap = _loadMuscleFlexMaps(initData, "bodylower_flex")
	
	else
		bodylower_name = string.format("bodylower_%d", db_gender)
		slot = slots.bodylower
	end

	local bodylower_mesh = loadAsync(brts.body, bodylower_name, disallow_missing)
	if bodylower_mesh then
		items[#items+1] = futureCall(bindLowerBody, initData, slot, bodylower_mesh,
				colorMap, coeffMap, normalMap, dirtMap, dirtMask, sssMap, generatedCullMap, generatedSkinMap, flexMask, flexNormalMap, flexAmbientMap)
	end
end

-----------------------------------------------------------------------------
local function _loadStarHead(items, initData, lod1_mesh, lod2_mesh, exertionCoeffMap, exertionNormalMap, sssMap, wrinkleMaskMap)
	local gender = initData.Gender
	local head = initData.Head
	local head_variation = initData.HeadVariation

	--local head_name = string.format("head_%d_0_%d;head_0_1_0", head, head_variation)
	local head_name = string.format("head_%d_0_%d", head, head_variation)
	local fallback_head_name = string.format("basehead_%d", gender) -- head_0_1_0" -- comes from another brt
	local fallback_face_name = string.format("skin_%d_0_color;debug_texture_color", initData.BodySkinToneType) -- comes from another brt

	local head_mesh = loadAsync(brts.starhead, head_name, true) or loadAsync(brts.generichead, fallback_head_name)

	local color_name = string.format("face_%d_0_%d_color", head, head_variation)
	local base_normal = string.format("face_%d_0_%d_normal;head_common_%d_normal;debug_texture_normal", head, head_variation, gender)
	local wrinkle_normal = string.format("face_expression_%d_0_%d_normal;head_expression_%d_normal;debug_texture_normal_array", head, head_variation, gender)
	local coeff_name = string.format("head_common_%d_coeff;debug_texture_coeff", gender)
	local ao_name = string.format("face_expression_%d_0_%d_ambient;head_expression_%d_ambient;debug_texture_aoblend", head, head_variation, gender)
	local specmask_name = string.format("face_%d_0_%d_specmask;head_common_sk_coeff", head, head_variation)

	local colorMap = loadAsync(brts.starhead, color_name, true) or loadAsync(brts.generichead, fallback_face_name)
	local normalMap = loadAsync(brts.starhead, base_normal)
	local wrinkleNormalMap = loadAsync(brts.starhead, wrinkle_normal)
	local coeffMap = loadAsync(brts.base, coeff_name)
	local aoMap = loadAsync(brts.starhead, ao_name)
	local specMaskMap = loadAsync(brts.starhead, specmask_name)
	
	local eye_name = string.format("eye_%d_1_color;eye_1_1_color", initData.EyeColor)
	local eyeMap = loadAsync(brts.base, eye_name)

	-- schedule a function that builds the head to run once all the loads above are complete
	items[#items + 1] = futureCall(bindHead, initData, head_mesh, lod1_mesh, lod2_mesh, 
			colorMap, nil, normalMap, wrinkleNormalMap, coeffMap, aoMap, specMaskMap, 
			exertionCoeffMap, exertionNormalMap, sssMap, wrinkleMaskMap, eyeMap)
end

local function _loadGenericHead(items, generatedTextures, initData, lod1_mesh, lod2_mesh, 
								exertionCoeffMap, exertionNormalMap, 
								sssMap, wrinkleMaskMap,
								has3dbeard)

	local gender = initData.Gender
	local skin_tone = initData.HeadSkinToneType
	local skin_type = initData.HeadSkinType
	local facialhair_type = has3dbeard and 0 or initData.FacialHairType

	-- color map composition
	local skin_name = string.format("skin_%d_%d_color;skin_2_0_color", skin_tone, skin_type)
	local beard_name = string.format("beard_%d_%d_%d_color;beard_2_0_0_color", skin_tone, facialhair_type, initData.FacialHairColor)
	local brow_name = string.format("brow_%d_%d_%d_color;brow_2_0_0_color", skin_tone, initData.Eyebrow, initData.FacialHairColor)
	local hairline_name = string.format("hair_%d_%d_%d_hairline;hair_0_1_0_hairline", initData.Hair, initData.HeadClass, initData.HairStyle)

	local skinMap = loadAsync(brts.generichead, skin_name)
	local beardMap = loadAsync(brts.generichead, beard_name)
	local browMap = loadAsync(brts.generichead, brow_name)
	local hairlineMap = loadAsync(brts.generichead, hairline_name)

	local tattoo, hotspot = _loadTattoo(initData.TattooHead)

	local faceGenMap = futureCall(_compositeFaceMap, initData, skinMap, beardMap, browMap, hairlineMap, tattoo, hotspot)
	generatedTextures[#generatedTextures + 1] = faceGenMap

	-- yury todo: create player
	local head_name = string.format("head_%d_1_0;head_0_1_0", initData.Head)
	local cp_head_name = string.format("basehead_%d", gender)
	--local head_mesh = initData.IsCreatedPlayer == 0 and loadAsync(brts.generichead, head_name) or emptyRef()
	--local head_mesh = initData.IsCreatedPlayer == 0 and loadAsync(brts.generichead, head_name) or nil
	local head_mesh = initData.IsCreatedPlayer == 0 and loadAsync(brts.generichead, head_name) or loadAsync(brts.generichead, cp_head_name)

	local base_normal = string.format("head_generic_%d_%d_normal;head_common_%d_normal", skin_tone, skin_type, gender)
	local wrinkle_normal = string.format("head_expression_%d_normal", gender)
	local coeff_name = string.format("head_common_%d_coeff", gender)
	local ao_name = string.format("head_expression_%d_ambient", gender)
	local specmask_name = string.format("head_generic_%d_%d_specmask;head_common_sk_coeff", skin_tone, skin_type)

	local normalMap = loadAsync(brts.generichead, base_normal)
	local wrinkleNormalMap = loadAsync(brts.base, wrinkle_normal)
	local coeffMap = loadAsync(brts.base, coeff_name)
	local aoMap = loadAsync(brts.base, ao_name)
	local specMaskMap = loadAsync(brts.generichead, specmask_name)
		  
	local eye_name = string.format("eye_%d_1_color;eye_1_1_color", initData.EyeColor)
	local eyeMap = loadAsync(brts.base, eye_name)
	
	items[#items + 1] = futureCall(bindHead, initData, head_mesh, lod1_mesh, lod2_mesh, 
			nil, faceGenMap, normalMap, wrinkleNormalMap, coeffMap, aoMap, specMaskMap, 
			exertionCoeffMap, exertionNormalMap, sssMap, wrinkleMaskMap, eyeMap)
end

local function loadHead(items, generatedTextures, initData, has3dbeard)
	-- lods 
	local gender = initData.Gender
	local isCreatedPlayer = initData.IsCreatedPlayer ~= 0

	local lod1_name = string.format("headlod_1_%d", gender)
	local lod2_name = string.format("headlod_2_%d", gender)
	local lod1_mesh = nil
	local lod2_mesh = nil
	
	if isCreatedPlayer then
		lod1_mesh = loadAsync(brts.body, lod1_name)
		lod2_mesh = loadAsync(brts.body, lod2_name)
	end

	-- common textures
	local exertionCoeffMap = loadAsync(brts.base, "head_common_exertion_coeff")
	local exertionNormalMap = loadAsync(brts.base, "head_common_exertion_normal")
	local sssMap = loadAsync(brts.base, "head_common_sss")
	local wrinkleMaskMap = loadAsync(brts.base, "head_mask_normal")

	-- if create player LoadCap and LoadFaceTextures
	if initData.HeadClass == 0 then
		_loadStarHead(items, initData, 
					  lod1_mesh, lod2_mesh, 
					  exertionCoeffMap, exertionNormalMap, sssMap, wrinkleMaskMap)
	else
		_loadGenericHead(items, generatedTextures, initData, 
						 lod1_mesh, lod2_mesh, 
						 exertionCoeffMap, exertionNormalMap, sssMap, wrinkleMaskMap,
						 has3dbeard)
	end
end

-----------------------------------------------------------------------------
local function loadHair(items, initData)
	local hair_id = initData.Hair
	local hair_style = initData.HairStyle
	local head_class = initData.HeadClass

	local hair_name = string.format("hair_%d_%d_%d", hair_id, head_class, hair_style)
	local haircap_name = string.format("haircap_%d_%d_%d", hair_id, head_class, hair_style)
	local hair_accessory_name = string.format("hair_accessory_%d_%d_%d", hair_id, head_class, hair_style)

	local allow_missing = true
	local hair_brt = head_class == 0 and brts.starhead or brts.generichead
	
	local hair_mesh = loadAsync(hair_brt, hair_name, allow_missing)
	local haircap_mesh = loadAsync(hair_brt, haircap_name, allow_missing)
	local hair_accessory_mesh = loadAsync(hair_brt, hair_accessory_name, allow_missing)

	if hair_mesh then
		items[#items + 1] = futureCall(bindHairItem, initData, hair_mesh)
	end

	if haircap_mesh then
		items[#items + 1] = futureCall(bindHaircapItem, initData, haircap_mesh)
	end
	
	if hair_accessory_mesh then
		items[#items + 1] = futureCall(bindHairAccessoryItem, initData, hair_accessory_mesh)
	end
end

-----------------------------------------------------------------------------
-- temp, testing loading strand hair, work in progress, it is going to change
local function loadStrandHair(items, initData)
	local hair_id = initData.Hair
	local hair_style = initData.HairStyle
	local head_class = initData.HeadClass

	local hair_name = string.format("strandbind_hair_%d_%d_%d", hair_id, head_class, hair_style)
	local beard_name = string.format("strandbind_beard_%d_%d_%d", hair_id, head_class, hair_style)
	local eyebrow_name = string.format("strandbind_eyebrow_%d_%d_%d", hair_id, head_class, hair_style)

	local allow_missing = true
	local hair_brt = brts.starhead
	
	local hair = loadAsync(hair_brt, hair_name, allow_missing)
	local beard = loadAsync(hair_brt, beard_name, allow_missing)
	local eye_brow = loadAsync(hair_brt, eyebrow_name, allow_missing)

	if hair then
		items[#items + 1] = futureCall(bindStrandHairItem, initData, hair, beard, eye_brow)
	end

	return (hair ~= nil)
end

-----------------------------------------------------------------------------
local function loadWarmupGear(items, initData)
	local useBib = (initData.UseKitWarmUpBib ~= 0 and initData.Cold == 0) or initData.IsSwapped ~= 0
	local usePants = (initData.UseKitWarmUpPants ~= 0 and initData.Cold == 1)
	local useJacket = (initData.UseKitWarmUpJacket ~= 0 and initData.Cold == 1)

	local gender = initData.Gender
	if useBib then
		local mesh_name = string.format("warmup_0_0_0_%d", gender)
		local mesh = loadAsync(brts.body, mesh_name)

		local bib_id = initData.HasCustomBib ~= 0 and initData.TournamentId or 0
		local color_name = string.format("warmup_top_0_%d_%d_color;warmup_top_0_0_color", bib_id, initData.TeamSide)
		local colorMap = loadAsync(brts.body, color_name)
		items[#items + 1] = futureCall(buildWarmupBib, initData, mesh, colorMap)
	end

	if usePants then
		local mesh_name = string.format("warmup_0_1_1_%d", gender)
		local mesh = loadAsync(brts.body, mesh_name)
		items[#items + 1] = futureCall(buildWarmupPants, initData, mesh)
	end

	if useJacket then
		local mesh_name = string.format("warmup_0_1_0_%d", gender)
		local mesh = loadAsync(brts.body, mesh_name)
		items[#items + 1] = futureCall(buildWarmupJacket, initData, mesh)
	end
end

-----------------------------------------------------------------------------
local function loadAccessory(items, initData, idx, accessory)
	if idx < 1 and idx > #accessory_slots then return end

	local gender = initData.Gender
	local model = accessory.AccessoryModel
	local variation = accessory.AccessoryVariation

	if model == 0 then return end -- early out if no accessory

	if initData.UseKitAccessory ~= 0 then 
		local mesh_name = string.format("accessory_%d_%d_%d", model, variation, gender)
		local mesh = loadAsync(brts.accessory, mesh_name, true)
		if mesh then
			local colorMap = loadAsync(brts.accessory, string.format("accessory_%d_color", model))
			local normalMap = loadAsync(brts.accessory, string.format("accessory_%d_normal", model))
			local coeffMap = loadAsync(brts.accessory, string.format("accessory_%d_coeff", model))
			items[#items + 1] = futureCall(buildKitAccessory, initData, idx, accessory, mesh, colorMap, normalMap, coeffMap)
		end
	end

	if initData.UseWardrobeAccessory ~= 0 then
		local accessory_side = 0
		local mesh_name = string.format("accessory_%d_0_%d_%d", model, accessory_side, gender)
		local mesh = loadAsync(brts.accessory, mesh_name, true)
		if mesh then
			local noaoMap = loadAsync(brts.body, "debug_texture_aoblend")
			local aoMap = loadAsync(brts.accessory, string.format("accessory_%d_%d_0_0_ambient", model, variation), true)
			local colorMap = loadAsync(brts.accessory, string.format("accessory_%d_%d_0_0_color", model, variation))
			local normalMap = loadAsync(brts.accessory, string.format("accessory_%d_%d_0_0_normal", model, variation))
			local coeffMap = loadAsync(brts.accessory, string.format("accessory_%d_%d_0_0_coeff", model, variation))

			-- some accessories don't have aomap
			aoMap = aoMap or noaoMap

			-- todo: clothing_weave_.._array is located under story/character/_development 
			-- it has to be moved into some common folder in proper brt
			local weave_normal_name = string.format("accessory_%d_weave_nm_array;clothing_weave_nm_array", model)
			local weave_coeff_name = string.format("accessory_%d_weave_coeff_array;clothing_weave_coeff_array", model)
			local weaveNormalMap = loadAsync(brts.accessory, weave_normal_name, true)
			local weaveCoeffMap = loadAsync(brts.accessory, weave_coeff_name, true)

			items[#items + 1] = futureCall(buildWardrobeAccessory, initData, idx, accessory, mesh, colorMap, normalMap, coeffMap,
				aoMap, weaveNormalMap, weaveCoeffMap)
		end
	end
end


-----------------------------------------------------------------------------
local function loadRefAccessory(items, laneId, tag, model, variation, gender)
	local mesh_name = string.format("accessory_%d_%d_%d", model, variation, gender)
	local mesh = loadAsync(brts.accessory, mesh_name, true)
	if mesh then
		local colorMap = loadAsync(brts.accessory, string.format("accessory_%d_color", model))
		local normalMap = loadAsync(brts.accessory, string.format("accessory_%d_normal", model))
		local coeffMap = loadAsync(brts.accessory, string.format("accessory_%d_coeff", model))
		items[#items + 1] = futureCall(buildRefAccessory, laneId, tag, mesh, colorMap, normalMap, coeffMap)
	end
end

-----------------------------------------------------------------------------
local function loadPlayerBeard(items, initData)
	local isCreatedPlayer = initData.IsCreatedPlayer ~= 0
	if not isCreatedPlayer or initData.FacialHairType < 1 then 
		return false 
	end

	local allow_missing = true
	local model = initData.FacialHairType
	local headclass = 1 -- always generic 
	local variation = 0 -- no variation / hairstyle

	local hair_name = string.format("facialhair_%d_%d_%d", model, headclass, variation)
	local haircap_name = string.format("facialhaircap_%d_%d_%d", model, headclass, variation)

	local mesh_hair = loadAsync(brts.generichead, hair_name, allow_missing)
	local mesh_cap = loadAsync(brts.generichead, haircap_name, allow_missing)

	if mesh_hair then
		local colorMap = loadAsync(brts.generichead, string.format("facialhair_%d_%d_%d_color", model, headclass, variation))
		local coeffMap = loadAsync(brts.generichead, string.format("facialhair_%d_%d_%d_coeff", model, headclass, variation))

		items[#items + 1] = futureCall(bindPlayerBeard, initData, false, mesh_hair, colorMap, coeffMap)

		if mesh_cap then
			items[#items + 1] = futureCall(bindPlayerBeard, initData, true, mesh_cap, colorMap, coeffMap)
		end
	end
	
	return mesh_hair and true or false
end

-----------------------------------------------------------------------------
--[[
local function loadCreatePlayerAccessory(items, initData)
	local isCreatedPlayer = initData.IsCreatedPlayer ~= 0
	if not isCreatedPlayer then return end

	local mesh = loadAsync(brts.accessory, "face_mask", true)
	if mesh then
		local colorMap = loadAsync(brts.accessory, "accessory_mask_color")
		local normalMap = loadAsync(brts.accessory, "accessory_mask_normal")
		local coeffMap = loadAsync(brts.accessory, "accessory_mask_coeff")
		items[#items + 1] = futureCall(bindCreatePlayerAccessory, initData, mesh, colorMap, normalMap, coeffMap)
	end
end
--]]

-----------------------------------------------------------------------------
local function loadShadow(items, initData)
	local jersey_sleeve_length = initData.JerseySleeveLength
	local shadow_name = string.format("playershadow_5_%d_0", jersey_sleeve_length)
	local importance_name = string.format("playerimportance_5_%d_0", jersey_sleeve_length)

	local shadow_mesh = loadAsync(brts.body, shadow_name)
	local importance_mesh = loadAsync(brts.body, importance_name)

	items[#items + 1] = futureCall(bindShadowItem, initData, shadow_mesh, importance_mesh)
end

-----------------------------------------------------------------------------
local function loadHotspots(initData)
	local hotspots_name = string.format("hotspots_%d_%d_%d;hotspots_0_0_0", initData.Kit, initData.KitType, initData.KitYear)
	local hotspotAsset = loadAsync(brts.hotspots, hotspots_name)

	local competitionHotspot = loadAsync(brts.hotspots, "competition_hotspots")
	return hotspotAsset, competitionHotspot
end

-----------------------------------------------------------------------------
-- detect errors when reading an absent field in table
-- lua's behaviour is to return nil
local function _no_read_access(t, k)
	error("error: invalid read, no key in the table: " .. k)
	return nil
end

local function _disable_read_from_undefined_key(t, disable)
	local mt = getmetatable(t) or {}
	if disable then
		mt.__index = _no_read_access
	else
		mt.__index = rawget(t, k)
	end
	setmetatable(t, mt)
end

-----------------------------------------------------------------------------
local function _loadPsdAssets(assets, initData)
	local _hasAccessory = function(initData)
		if initData.IsGoalie ~= 0 then return true end
		for _, accessory in ipairs(initData.Accessories) do
			local accessory_model = accessory.AccessoryModel
			-- if accessory_model == 16 then return true end -- winter gloves
			-- if accessory_model ==  6 or accessory_model ==  7 then return true end -- wrist athletic tape
			-- if accessory_model == 22 or accessory_model == 23 then return true end -- finger tape
			-- if accessory_model == 200 then return true end -- gloves

			if accessory_model ~= 0 then return true end
		end
		return false
	end

	local gender = initData.Gender
	local official = initData.OfficialType

	-- arm
	local skipArmPsd = (official == OfficialType_Manager) or
		(official == OfficialType_None and _hasAccessory(initData))
	if skipArmPsd == false then 
		local arm_psd_name = string.format("arms_%d_%d_psd", initData.ArmLength, gender)
		assets.ArmPsd = loadAsync(brts.psd, arm_psd_name, true)
	end

	-- yury todo: why do we load leg psd for managers and avatar, long pants? 
	local leg_psd_name = string.format("legs_%d_%d_psd", initData.SockLength, gender)
	assets.LegPsd = loadAsync(brts.psd, leg_psd_name, true)

	-- psd face backets, if create player then use mouth shape mapping
	local facePoserPreset = initData.FacePoserPreset
	if initData.IsCreatedPlayer ~= 0 then
		if #initData.MorphRegions >= CP_MORPH_MOUTH then -- there is morph data
			local mouthPreset = initData.MorphRegions[CP_MORPH_MOUTH].PresetId
			if mouthPreset >= 0 and mouthPreset < NUM_MOUTH_PRESETS then
				facePoserPreset = gender == 0 and MALE_MAPPING[mouthPreset + 1] or FEMALE_MAPPING[mouthPreset + 1]
			end
		end
	end
	local head_psd_name = string.format("head_%d_%d_0_psd;head_common_%d_%d_0_psd;head_common_%d_0_0_psd", initData.Head, initData.HeadClass, gender, facePoserPreset, gender)
	assets.HeadPsd = loadAsync(brts.psd, head_psd_name)

	-- psd head mask
	local jerseyCollarType = initData.JerseyCollarType
	local head_psd_mask = ""
	if jerseyCollarType >= 0 and jerseyCollarType < #PSD_HEAD_MASKING then
		if initData.UnderArms == -1 and initData.UnderNeck == -1 then
			head_psd_mask = PSD_HEAD_MASKING[jerseyCollarType + 1]
		else
			head_psd_mask = "MidHigh"
		end
	end
	local mask_psd_name = string.format("psdMT_Collar%s;psdMT_Collar", head_psd_mask)
	assets.MaskTuningPsd = loadAsync(brts.psd, mask_psd_name)

	-- mask for recalculating normals for face PSD
	assets.HeadNormalCalcMask = loadAsync(brts.base, "head_mask_meshcompute")
end
-----------------------------------------------------------------------------
local function _loadRigamateAssets(assets, initData)
	local gender = initData.Gender
	local rigamate_type = initData.RigamateType

	-- rigamate expressions
	local body0_kernel_name = string.format("rigamate_expr_body_%d_0_%d", rigamate_type, gender)
	local body1_kernel_name = string.format("rigamate_expr_body_%d_1_%d", rigamate_type, gender)
	--local body2_kernel_name = string.format("rigamate_expr_body_%d_2_%d", rigamate_type, gender)

	assets.BodyLod0Kernel = loadAsync(brts.rigamate, body0_kernel_name)
	assets.BodyLod1Kernel = loadAsync(brts.rigamate, body1_kernel_name)
	--assets.BodyLod2Kernel = loadAsync(brts.rigamate, body2_kernel_name) -- not being used 

	assets.FaceKernel = loadAsync(brts.rigamate, "rigamate_expr_face")
	assets.FaceWrinkleKernel = loadAsync(brts.rigamate, "rigamate_expr_face_wrinkle")
	assets.JerseyWrinkleKernel = loadAsync(brts.rigamate, "rigamate_expr_jersey_wrinkle")
	assets.EyesKernel = loadAsync(brts.rigamate, "rigamate_expr_face_eyes")
end

-----------------------------------------------------------------------------
local function _loadClothColliders(assets, initData)
	local gender = initData.Gender
	-- cloth external colliders
	local collider_top_name = string.format("collider_0_%d_%d", initData.TopColliderId, gender)
	local collider_bottrom_name = string.format("collider_1_%d_%d", initData.BottomColliderId, gender)
	assets.TopCollider = loadAsync(brts.body, collider_top_name, true)
	assets.BottomCollider = loadAsync(brts.body, collider_bottrom_name, true)
end

-----------------------------------------------------------------------------
-- FifaPlayer = {}
-- FifaPlayer.LoadShorts = function(items, generatedTextures, initData)

-- player scheme
	--+ jersey
	--+ short and gkpants
	--+ under gear
		--+ under arm
		--+ under neck
		--+ under shorts
	--+ shoes
	--+ socks
	--+ top wardrobe
		--+ layer 0
		--+ layer 1
	--+ bottom wardrobe
		--+ layer 0
		--+ layer 1
	--+ team crest
	--+ bodyupper
	--+ bodylower
	--+ character shadow
	--
	--+ accessories
		--+ gloves
		--+ other
		--+ referee accessories
	--+ warmupgear: bibs
--
-- dont forget to set setIncludeCullTagHashes and setTagHashes
-- initData doesn't contain booleans, they are converted to int

function loadPlayerKit(initData)
	_disable_read_from_undefined_key(initData, true)

	local items = {}
	local generatedTextures = {}
	local assets = {}
	
	loadv2k4Kit(initData)
	loadv2k4Tattoo(initData)
	loadv2k4Head(initData)
	loadv2k4Boot(initData)

	-- hotspots
	local hotspotAsset, competitionHotspot = loadHotspots(initData)

	-- schedule texture generation first

	-- team kit 
	loadKitJersey(items, generatedTextures, initData, hotspotAsset, competitionHotspot, false)
	loadKitShorts(items, initData, hotspotAsset)
	
	-- body
	loadUpperBody(items, generatedTextures, initData)
	loadLowerBody(items, generatedTextures, initData)

	-- 3d beard
	local has3dbeard = loadPlayerBeard(items, initData)

	-- head
	loadHead(items, generatedTextures, initData, has3dbeard)

	-- hair
	-- if there is strand hair then load both, disable stranhair for team sheet overlay
	local enableStrandHair = SETTING_EnableStrandHair and initData.DisableCloth == 0
	if enableStrandHair then
		loadStrandHair(items, initData)
		loadHair(items, initData)
	else
		loadHair(items, initData)
	end

	-- wardrobe outfit
	loadTop0(items, initData)
	loadTop1(items, initData)
	loadBottom0(items, initData)
	loadBottom1(items, initData)

	-- shoes and socks
	loadShoes(items, initData)
	loadSocks(items, initData, hotspotAsset)

	-- goalkeeper gloves
	loadGkGloves(items, initData)

	-- warmup gear
	loadWarmupGear(items, initData)

	-- accessory
	for idx, accessory in ipairs(initData.Accessories) do
		loadAccessory(items, initData, idx, accessory)
	end
	
	-- ref accessories
	do
		local official = initData.OfficialType
		local gender = initData.Gender
		local laneId = initData.laneId

		if official == OfficialType_Referee then
			for _, v in ipairs(ref_accessories) do
				loadRefAccessory(items, laneId, v.slot, v.model, v.side, gender)
			end
		elseif official == OfficialType_Linesman or official == OfficialType_Fourth then
			loadRefAccessory(items, laneId, "ref_watch_left", 4, 0, gender)
			loadRefAccessory(items, laneId, "ref_earpiece_left", 2, 0, gender)
		end
	end

	-- load create player accessories
	--[[
	--loadCreatePlayerAccessory(items, initData)
	--]]

		
	-- shadows
	loadShadow(items, initData)

	-- load non-appearance assets for external usage
	_loadPsdAssets(assets, initData)
	_loadRigamateAssets(assets, initData)
	_loadClothColliders(assets, initData)

	return items, generatedTextures, assets
end

-----------------------------------------------------------------------------
function loadHangingJersey(initData)
	_disable_read_from_undefined_key(initData, true)
	
	local is_hangingjersey = true

	local items = {}
	local generatedTextures = {}

	-- hotspots
	local hotspotAsset, competitionHotspot = loadHotspots(initData)

	-- team kit 
	loadKitJersey(items, generatedTextures, initData, hotspotAsset, competitionHotspot, is_hangingjersey)

	return items, generatedTextures
end

-----------------------------------------------------------------------------
function loadJersey(initData)
	_disable_read_from_undefined_key(initData, true)

	local items = {}
	local generatedTextures = {}

	-- hotspots
	local hotspotAsset, competitionHotspot = loadHotspots(initData)

	-- team kit 
	loadKitJersey(items, generatedTextures, initData, hotspotAsset, competitionHotspot)

	return items, generatedTextures
end

-----------------------------------------------------------------------------
-- initData is FifaCrowdFanInitData
-- FifaAssetData\Shared\FifaAssetInitData.ddf
local function _bindHighResFanBody(initData, mesh, color_map, hair_color_map)
	local item = createItem("crowdfan", slots.crowdfan, initData.laneId)
	item:addMeshLodPair(lod0, mesh, updateBoundingBox, playerDrawOrder, playerDrawSubOrder_Clothes)

	local outfit_mat = item:addMaterial("crowd_lod0_mat")
	outfit_mat:addTexture("colorTexture", color_map)

	local head_mat = item:addMaterial("head_mat")
	head_mat:addTexture("colorTexture", color_map)
	
	local body_mat = item:addMaterial("body_mat")
	body_mat:addTexture("colorTexture", color_map)

	local hair_mat = item:addMaterial("hair_mat")
	hair_mat:addTexture("colorTexture", hair_color_map)

	local haircap_mat = item:addMaterial("haircap_mat")
	haircap_mat:addTexture("colorTexture", hair_color_map)

	return item
end

local function _bindHighResFanAccessory(initData, mesh, colorMap, normalMap, coeffMap)
	local item = createItem("crowdfan_prop_cellphone", slots.crowdfan_prop, initData.laneId)
	item:addMeshLodPair(lod0, mesh, noBoundingBox, playerDrawOrder, playerDrawSubOrder_Accessory)

	local mat = item:addMaterial("accessory_mat")
	mat:addTexture("colorTexture", colorMap)
	mat:addTexture("normalTexture", normalMap)
	mat:addTexture("coefficientTexture", coeffMap)
	return item
end

function loadHighResFan(initData)
	_disable_read_from_undefined_key(initData, true)

	local items = {}
	local generatedTextures = {}

	-- jersey
	if initData.HasJersey ~= 0 then
		local hotspotAsset, competitionHotspot = loadHotspots(initData)
		loadKitJersey(items, generatedTextures, initData, hotspotAsset, competitionHotspot)
	end

	-- shadows
	loadShadow(items, initData)

	-- load fan assets
	local assetId = initData.AssetId
	local weather = initData.Weather
	local skinTone = initData.SkinTone

	do
		local body_name = string.format("crowdhigh_%d_%d_%d", assetId, weather, skinTone)
		local body_mesh = loadAsync(brts.crowd_highres, body_name)

		local color_name = string.format("crowdhigh_%d_%d_%d_%d_color;debug_texture_color", assetId, weather, skinTone, initData.Variation)
		local colorMap = loadAsync(brts.crowd_highres, color_name)

		local hair_color_name = string.format("crowdhigh_hair_%d_%d_%d_%d_color;debug_texture_color", assetId, weather, skinTone, initData.Variation)
		local hairColorMap = loadAsync(brts.crowd_highres, hair_color_name)

		items[#items + 1] = futureCall(_bindHighResFanBody, initData, body_mesh, colorMap, hairColorMap)
	end

	-- cell phone
	do
		local model = 38 -- cell phone
		local mesh = loadAsync(brts.accessory, string.format("accessory_%d_0_0", model))
		local colorMap = loadAsync(brts.accessory, string.format("accessory_%d_color", model))
		local normalMap = loadAsync(brts.accessory, string.format("accessory_%d_normal", model))
		local coeffMap = loadAsync(brts.accessory, string.format("accessory_%d_coeff", model))
		items[#items + 1] = futureCall(_bindHighResFanAccessory, initData, mesh, colorMap, normalMap, coeffMap)
	end

	-- load non-appearance assets for external usage
	local assets = {}
	_loadRigamateAssets(assets, initData)

	return items, generatedTextures, assets
end



-------------------------
----- PAULS HELPERS -----

local DirectoryDynamicSystem = 'DynamicSystem'
local DirectoryDynamicSystem_Teams = 'DynamicSystem\\Teams'
local DebugFileLocation = 'DynamicSystem\\v2k4debugfile_player_kit.txt'

function logToDebugFile(txt)
	
	if(directoryExists2(DirectoryDynamicSystem)) then 
	
		if(file_exists(DebugFileLocation) == false) then
			
			local debugFile = io.open(DebugFileLocation, 'w')
			debugFile:close()
		end
	
		if(file_exists(DebugFileLocation)) then 
			-- Open the file in r mode (don't modify file, just read)
			local out = io.open(DebugFileLocation, 'r')

			local lines = {}
			for line in out:lines() do
				table.insert(lines, line)
			end
			
			-- Close the file so that we can open it in a different mode
			out:close()
			
			-- Insert what we want to write to the first line into the table
			table.insert(lines, 1, txt .. "\n")

			-- Open temporary file in w mode (write data)
			-- Iterate through the lines table and write each line to the file
			local out = io.open('v2k4debugfile_player_kit.file.tmp.txt', 'w')
			for _, line in ipairs(lines) do
				out:write(line .. "\n")
			end
			out:close()

			-- At this point, we should have successfully written the data to the temporary file

			-- Delete the old file
			os.remove(DebugFileLocation)

			-- Rename the new file
			os.rename('v2k4debugfile_player_kit.file.tmp.txt', DebugFileLocation)
		end
	
	end

end



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

function directoryExists2(directory)
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

function file_exists_checked(file)

	local status, exists = pcall(file_exists, file)
	
	return (status and exists)

end

-- get all lines from a file, returns an empty 
-- list/table if the file does not exist
function lines_from(file)
  if not file_exists_checked(file) then return {} end
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

local fileVariables = {}

function getAllVariablesIntoDictionary(file)
	
	local exists = file_exists(file)

	if(exists) then
		
		
		
		local l = lines_from(file)
		
		local file_table = {}
		
		for k,v in pairs(l) do
		
			local r = split(v, '=')
			
			
			local varName = ""
			local varValue = ""
			for key, value in pairs(r) do
				
				
				if (varName == "") then
					varName = value
				
				else
					varValue = value
					
					file_table[varName] = varValue
					varName = ""
					
				end
			end
			
		end
		
		fileVariables[file] = file_table
		
	end

end

function getVariableFromFile(file, variableToGet) 

	--local status, exists = pcall(file_exists, file)
local exists = file_exists(file)
	--if(status and exists) then
	if (exists) then
	
		if(fileVariables[file] == nil) then
			getAllVariablesIntoDictionary(file)
		end
		
		if(fileVariables[file] ~= nil) then
		
			return fileVariables[file][variableToGet]
		
		end
		
		--local status2, lines = pcall(lines_from, file)
		--if(status2 == false) then
		--	return nil
		--end
		
		--local l = lines_from(file)
		
		--for k,v in pairs(l) do
		
		--	local r = split(v, '=')
			
			
		--	local varName = ""
		--	local varValue = ""
		--	for key, value in pairs(r) do
			
		--		if (varName == "") then
		--			varName = value
				
		--		else
		--			varValue = value
					
		--			if varName == variableToGet then
		--				return varValue
		--			end
					
		--		end
		--	end
		--end
	end
	
	return nil
end

function getVariableFromFile2(file, variableToGet, valueIfNil)
	local tmp = getVariableFromFile(file, variableToGet)
	if(tmp == nil) then
		tmp = valueIfNil
	end
	
	return tmp
end 

local function getKitFileLocation(initData) 

	local kitFile = "DynamicSystem\\Teams\\" .. tostring(initData.TeamId) .. "\\Kit_" .. tostring(initData.KitType) .. ".txt"
	return kitFile
end

local function kitFileExists(initData) 

	--return file_exists_checked(getKitFileLocation(initData))
	return file_exists(getKitFileLocation(initData))
end

local function kitSystemEnabled() 

	local result = "0"
	if(file_exists("v2k4Settings.txt")) then
	
		result = getVariableFromFile2("v2k4Settings.txt", "UseKitSystem", result)
	
	end
		
	if(file_exists("DynamicSystem\\Settings.txt")) then
	
		result = getVariableFromFile2("DynamicSystem\\Settings.txt", "UseKitSystem", result)
	
	end


	return result == "1"
end


------------------------------------------------------
-- CORE V2k4 Functions
------------------------------------------------------
function loadv2k4Kit(initData)

	
	local kitFile = getKitFileLocation(initData)
	if(kitSystemEnabled() and kitFileExists(initData)) then
				
		initData.Kit = getVariableFromFile2(kitFile, "ReplacementKit", initData.Kit)
		initData.JerseyCollarType = getVariableFromFile2(kitFile, "JerseyCollarType", initData.JerseyCollarType)
		
		initData.JerseyNumberColorPri = getVariableFromFile2(kitFile, "JerseyNumberColorPrimary", initData.JerseyNumberColorPri)
		initData.JerseyNumberColorSec = getVariableFromFile2(kitFile, "JerseyNumberColorSecondary", initData.JerseyNumberColorSec)
		initData.JerseyNumberColorTer = getVariableFromFile2(kitFile, "JerseyNumberColorTertiary", initData.JerseyNumberColorTer)
	
		initData.ShortsNumberColorPri = getVariableFromFile2(kitFile, "ShortsNumberColorPrimary", initData.ShortsNumberColorPri)		
		initData.ShortsNumberColorSec = getVariableFromFile2(kitFile, "ShortsNumberColorSecondary", initData.ShortsNumberColorSec)
		initData.ShortsNumberColorTer = getVariableFromFile2(kitFile, "ShortsNumberColorTertiary", initData.ShortsNumberColorTer)

		initData.KitNameColor = getVariableFromFile2(kitFile, "KitNameColor", initData.KitNameColor)
	end

end

function loadv2k4Tattoo(initData)

	local playerFile = "DynamicSystem\\Players\\" .. tostring(initData.PlayerId) .. ".txt"
		
	if(file_exists_checked(playerFile)) then
		
		initData.HasTattooUpperBody = getVariableFromFile2(playerFile, "HasTattooUpperBody", initData.HasTattooUpperBody)
		initData.TattooTorsoBack = getVariableFromFile2(playerFile, "TattooTorsoBack", initData.TattooTorsoBack)
		
		initData.TattooRightArm = tonumber(getVariableFromFile2(playerFile, "TattooRightArm", initData.TattooRightArm))
		if(initData.TattooRightArm ~= 0) then
			initData.HasTattooUpperBody = 1
		end
		
		initData.TattooLeftArm = tonumber(getVariableFromFile2(playerFile, "TattooLeftArm", initData.TattooRightArm))
		if(initData.TattooLeftArm ~= 0) then
			initData.HasTattooUpperBody = 1
		end
		
		initData.TattooRightLeg = tonumber(getVariableFromFile2(playerFile, "TattooRightLeg", initData.TattooRightLeg))
		if(initData.TattooRightLeg ~= 0) then
			initData.HasTattooLowerBody = 1
		end
		
		initData.TattooLeftLeg = tonumber(getVariableFromFile2(playerFile, "TattooLeftLeg", initData.TattooLeftLeg))
		if(initData.TattooLeftLeg ~= 0) then
			initData.HasTattooLowerBody = 1
		end
	end

	local tattooRightArmFile = "DynamicSystem\\Players\\_TattooAssignment_RightArm.txt"
	if(file_exists(tattooRightArmFile)) then
		
		initData.TattooRightArm = tonumber(getVariableFromFile2(tattooRightArmFile, tostring(initData.PlayerId), initData.TattooRightArm))
		if(initData.TattooRightArm ~= 0) then
			initData.HasTattooUpperBody = 1
		end
		
	end
	
	local tattooLeftArmFile = "DynamicSystem\\Players\\_TattooAssignment_LeftArm.txt"
	if(file_exists(tattooLeftArmFile)) then
		
		initData.TattooLeftArm = tonumber(getVariableFromFile2(tattooLeftArmFile, tostring(initData.PlayerId), initData.TattooLeftArm))
		if(initData.TattooLeftArm ~= 0) then
			initData.HasTattooUpperBody = 1
		end
		
	end
	
	local tattooRightLegFile = "DynamicSystem\\Players\\_TattooAssignment_RightLeg.txt"
	if(file_exists(tattooRightLegFile)) then
		
		initData.TattooRightLeg = tonumber(getVariableFromFile2(tattooRightLegFile, tostring(initData.PlayerId), initData.TattooRightLeg))
		if(initData.TattooRightLeg ~= 0) then
			initData.HasTattooLowerBody = 1
		end
		
	end
	
	local tattooLeftLegFile = "DynamicSystem\\Players\\_TattooAssignment_LeftLeg.txt"
	if(file_exists(tattooLeftLegFile)) then
		
		initData.TattooLeftLeg = tonumber(getVariableFromFile2(tattooLeftLegFile, tostring(initData.PlayerId), initData.TattooLeftLeg))
		if(initData.TattooLeftLeg ~= 0) then
			initData.HasTattooLowerBody = 1
		end
		
	end
end


function loadv2k4Head(initData)

	local a = 1

end

local DebugMode = 1

function loadv2k4Boot(initData)

	local fileLoc = "DynamicSystem\\Players\\_BootAssignment.txt"
	local playerFile = "DynamicSystem\\Players\\" .. tostring(initData.PlayerId) .. ".txt"
	if(file_exists(fileLoc)) then 

		if(DebugMode == 1) then
			logToDebugFile("player_kit.lua::loadv2k4Boot:DynamicSystem\\Players\\_BootAssignment.txt:found")
		end
		
		initData.ShoeType = getVariableFromFile2(fileLoc, initData.PlayerId, initData.ShoeType)
		
	elseif(file_exists(playerFile)) then

	
		initData.ShoeType = getVariableFromFile2(playerFile, "Boot", initData.ShoeType)
	
	end

end
