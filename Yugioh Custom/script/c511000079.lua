--属性重力－アトリビュート・グラビティ
function c511000079.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	c:RegisterEffect(e1)
	--must attack (light)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD)
	e2:SetCode(EFFECT_MUST_ATTACK)
	e2:SetRange(LOCATION_SZONE)
	e2:SetTargetRange(LOCATION_MZONE,LOCATION_MZONE)
	e2:SetTarget(c511000079.atktg)
	e2:SetLabel(ATTRIBUTE_LIGHT)
	c:RegisterEffect(e2)
	local e3=e2:Clone()
	e3:SetCode(EFFECT_MUST_BE_ATTACKED)
	e3:SetValue(c511000079.atkval)
	c:RegisterEffect(e3)
	local e5=e2:Clone()
	e5:SetLabel(ATTRIBUTE_DARK)
	c:RegisterEffect(e2)
	local e6=e3:Clone()
	e6:SetLabel(ATTRIBUTE_DARK)
	c:RegisterEffect(e6)
	local e8=e2:Clone()
	e8:SetLabel(ATTRIBUTE_WATER)
	c:RegisterEffect(e8)
	local e9=e3:Clone()
	e9:SetLabel(ATTRIBUTE_WATER)
	c:RegisterEffect(e9)
	local e11=e2:Clone()
	e11:SetLabel(ATTRIBUTE_FIRE)
	c:RegisterEffect(e11)
	local e12=e3:Clone()
	e12:SetLabel(ATTRIBUTE_FIRE)
	c:RegisterEffect(e12)
	local e14=e2:Clone()
	e14:SetLabel(ATTRIBUTE_WIND)
	c:RegisterEffect(e14)
	local e15=e3:Clone()
	e15:SetLabel(ATTRIBUTE_WIND)
	c:RegisterEffect(e15)
	local e17=e2:Clone()
	e17:SetLabel(ATTRIBUTE_DEVINE)
	c:RegisterEffect(e17)
	local e18=e3:Clone()
	e18:SetLabel(ATTRIBUTE_DEVINE)
	c:RegisterEffect(e18)
	local e20=e2:Clone()
	e20:SetLabel(ATTRIBUTE_EARTH)
	c:RegisterEffect(e20)
	local e21=e3:Clone()
	e21:SetLabel(ATTRIBUTE_EARTH)
	c:RegisterEffect(e21)
end
function c511000079.atktg(e,c)
	return c:IsAttribute(e:GetLabel()) 
		and Duel.IsExistingMatchingCard(c511000079.adval,c:GetControler(),0,LOCATION_MZONE,1,nil,e:GetLabel())
end
function c511000079.adval(c,att)
	return c:IsFaceup() and c:IsAttribute(att)
end
function c511000079.atkval(e,c)
	return not c:IsImmuneToEffect(e) and c:IsAttribute(e:GetLabel())
end
