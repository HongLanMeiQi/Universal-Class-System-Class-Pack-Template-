-- Register the behaviour
behaviour("Class_Pack")

function Class_Pack:Start()
	self.script.StartCoroutine(self:FindUniversalClass())
	self.assiginedTeam = self.script.mutator.GetConfigurationDropdown("team")
	self.EffectToPlayer = self.script.mutator.GetConfigurationBool("EffectToPlayer")
	self.classes = {}
	if self.assiginedTeam == 0 then
		self.team = Team.Blue
	elseif self.assiginedTeam == 1 then
		self.team = Team.Red
	else
		self.team = "both"
	end
end

function Class_Pack:InitlizeClassPack()
	return function ()
		coroutine.yield(WaitForSeconds(0.2))
		local ChildCount = self.gameObject.transform.childCount
		local pack_totalRatio = 0
		for i = 0, ChildCount-1, 1 do
			local class = {}
			local gameObject = self.gameObject.transform.GetChild(i).gameObject
			---@type DataContainer
			local dataContainer = gameObject.GetComponent(DataContainer)
			class.name = dataContainer.GetString("Class_Name")
			class.icon = dataContainer.GetSprite("Class_Icon")
			class.ratio = self.script.mutator.GetConfigurationRange(class.name.."Ratio")
			pack_totalRatio = pack_totalRatio + class.ratio
			class.primary = {}
			class.secondary = {}
			class.gear1 = {}
			class.gear2 = {}
			class.gear3 = {}
			self:LoadToList(self.script.mutator.GetConfigurationString(class.name.."PrimaryWeapon"), class.primary)
			self:LoadToList(self.script.mutator.GetConfigurationString(class.name.."SecondaryWeapon"), class.secondary)
			self:LoadToList(self.script.mutator.GetConfigurationString(class.name.."Gear1Weapon"), class.gear1)
			self:LoadToList(self.script.mutator.GetConfigurationString(class.name.."Gear2Weapon"), class.gear2)
			self:LoadToList(self.script.mutator.GetConfigurationString(class.name.."Gear3Weapon"), class.gear3)
			self.classes[class.name] = class
		end
		self.universalClassScript:InitlizeClassToTable(self.classes, self.team, self.EffectToPlayer, pack_totalRatio)
		self:debuglog("Class pack initlized.", Color.green)
		GameObject.Destroy(self.gameObject)
	end
end

function Class_Pack:FindUniversalClass()
	return function ()
		coroutine.yield(WaitForSeconds(0.2))
		local UniversalClass = GameObject.Find("Universal Class System")
		if UniversalClass then
			self.universalClassScript = ScriptedBehaviour.GetScript(UniversalClass)
			self.debug = self.universalClassScript.debug
			self:debuglog("Found universal class system !", Color.green)
			self.script.StartCoroutine(self:InitlizeClassPack())
		else
			self:debuglog("No found universal class system, pack object will be destroyed. ", Color.red)
			GameObject.Destroy(self.gameObject)
		end
	end
end
---加载到列表
---@param string string
---@param table table
function Class_Pack:LoadToList(string, table)
	local count = 1
	for weapon in (string..";"):gmatch("(.-);") do
		weapon = weapon:match("^%s*(.-)%s*$")
		table[count] = weapon
		count = count + 1
	end
end

--- 调试输出
---@param text string
---@param color? Color
function Class_Pack:debuglog(text, color)
	if self.debug or Debug.isTestMode then
		if not color then
			color = Color.white
		end
		print("[Universal Class System - Classes Pack]: "..ColorScheme.RichTextColorTag(color)..text.."</color>")
	end
end