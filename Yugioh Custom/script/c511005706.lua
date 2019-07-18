--Eternal Rest (DOR)
--scripted by GameMaster(GM)
function c511005706.initial_effect(c)
--Activate
local e1=Effect.CreateEffect(c)
e1:SetCategory(CATEGORY_DESTROY)
e1:SetType(EFFECT_TYPE_ACTIVATE)
e1:SetCode(EVENT_FREE_CHAIN)
e1:SetTarget(c511005706.target)
e1:SetOperation(c511005706.activate)
c:RegisterEffect(e1)
end

function c511005706.filter(c)
return c:IsRace(RACE_ZOMBIE) and c:IsFaceup()
end

function c511005706.target(e,tp,eg,ep,ev,re,r,rp,chk)
if chk==0 then return Duel.IsExistingMatchingCard(c511005706.filter,tp,LOCATION_MZONE,LOCATION_MZONE,1,nil) end
local sg=Duel.GetMatchingGroup(c511005706.filter,tp,LOCATION_MZONE,LOCATION_MZONE,nil)
Duel.SetOperationInfo(0,CATEGORY_DESTROY,sg,sg:GetCount(),0,0)
end

function c511005706.activate(e,tp,eg,ep,ev,re,r,rp)
local sg=Duel.GetMatchingGroup(c511005706.filter,tp,LOCATION_MZONE,LOCATION_MZONE,nil)
Duel.Destroy(sg,REASON_EFFECT)
end
