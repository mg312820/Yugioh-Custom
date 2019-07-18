--D - Death Match
function c511002867.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	c:RegisterEffect(e1)
	--damage
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(511002867,0))
	e2:SetCategory(CATEGORY_DAMAGE)
	e2:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e2:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e2:SetCode(EVENT_PHASE+PHASE_END)
	e2:SetRange(LOCATION_SZONE)
	e2:SetCountLimit(1)
	e2:SetTarget(c511002867.damtg)
	e2:SetOperation(c511002867.damop)
	c:RegisterEffect(e2)
	--atk
	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(511002867,1))
	e3:SetCategory(CATEGORY_ATKCHANGE)
	e3:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_O)
	e3:SetCode(EVENT_PHASE+PHASE_END)
	e3:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e3:SetRange(LOCATION_SZONE)
	e3:SetCountLimit(1)
	e3:SetCondition(c511002867.atkcon)
	e3:SetTarget(c511002867.atktg)
	e3:SetOperation(c511002867.atkop)
	c:RegisterEffect(e3)
end
function c511002867.damtg(e,tp,eg,ep,ev,re,r,rp,chk)
	local g1=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_MZONE,0,nil)
	local lv1=g1:GetSum(Card.GetLevel)
	local g2=Duel.GetMatchingGroup(Card.IsFaceup,tp,0,LOCATION_MZONE,nil)
	local lv2=g2:GetSum(Card.GetLevel)
	if chk==0 then return true end
	if lv1>lv2 then
		Duel.SetOperationInfo(0,CATEGORY_DECKDES,nil,0,1-tp,(lv1-lv2)*100)
	end
	if lv2<lv1 then
		Duel.SetOperationInfo(0,CATEGORY_DECKDES,nil,0,tp,(lv2-lv1)*100)
	end
end
function c511002867.damop(e,tp,eg,ep,ev,re,r,rp)
	if not e:GetHandler():IsRelateToEffect(e) then return end
	local g1=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_MZONE,0,nil)
	local lv1=g1:GetSum(Card.GetLevel)
	local g2=Duel.GetMatchingGroup(Card.IsFaceup,tp,0,LOCATION_MZONE,nil)
	local lv2=g2:GetSum(Card.GetLevel)
	if lv1==lv2 then return end
	if lv1>lv2 then
		Duel.Damage(1-tp,(lv1-lv2)*100,REASON_EFFECT)
	else
		Duel.Damage(tp,(lv2-lv1)*100,REASON_EFFECT)
	end
end
function c511002867.atkcon(e,tp,eg,ep,ev,re,r,rp)
	local g1=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_MZONE,0,nil)
	local lv1=g1:GetSum(Card.GetLevel)
	local g2=Duel.GetMatchingGroup(Card.IsFaceup,tp,0,LOCATION_MZONE,nil)
	local lv2=g2:GetSum(Card.GetLevel)
	return lv1>lv2
end
function c511002867.filter(c)
	return c:IsFaceup() and c:IsSetCard(0xc008)
end
function c511002867.atktg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(tp) and c511002867.filter(chkc) end
	if chk==0 then return Duel.IsExistingTarget(c511002867.filter,tp,LOCATION_MZONE,0,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_FACEUP)
	Duel.SelectTarget(tp,c511002867.filter,tp,LOCATION_MZONE,0,1,1,nil)
end
function c511002867.atkop(e,tp,eg,ep,ev,re,r,rp)
	local g1=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_MZONE,0,nil)
	local lv1=g1:GetSum(Card.GetLevel)
	local g2=Duel.GetMatchingGroup(Card.IsFaceup,tp,0,LOCATION_MZONE,nil)
	local lv2=g2:GetSum(Card.GetLevel)
	if lv2>=lv1 then return end
	local c=e:GetHandler()
	local atk=(lv1-lv2)*100
	local tc=Duel.GetFirstTarget()
	if c:IsRelateToEffect(e) and tc and tc:IsRelateToEffect(e) and tc:IsFaceup() then
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_UPDATE_ATTACK)
		e1:SetReset(RESET_EVENT+0x1fe0000)
		e1:SetValue(atk)
		tc:RegisterEffect(e1)
	end
end
