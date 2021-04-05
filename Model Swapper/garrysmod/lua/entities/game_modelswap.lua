ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "game_modelswap"

function ENT:SetupDataTables()

	self:NetworkVar("String", 0, "NewPlayerModel")
	self:SetNewPlayerModel()

end


function ENT:Initialize()

	self:SetModel(self.Model)
	self:PhysicsInit(SOLID_NONE)
	self:SetMoveType(MOVETYPE_NONE)
	self:SetSolid(SOLID_NONE)
	self:SetUseType(3)
	local phys = self:GetPhysicsObject()

	if phys:IsValid() then
		
		phys:Wake()

	end

end


function ENT:KeyValue(key, value)
	if key == "NewModel" then
      -- this is our output, so handle it as such
		self:SetNewPlayerModel(value)
	end
end

function ChangeModel(act,ent)
	act:SetModel(ent:GetNewPlayerModel())
	print(ent:GetNewPlayerModel())
end


function ENT:AcceptInput(name, act, call,string)

	if name == "SwapModel" then
		
		if act:IsPlayer() then
			ChangeModel(act,self)
		end
		
		return true
	end

end