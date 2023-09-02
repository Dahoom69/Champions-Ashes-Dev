RegisterTableGoal(GOAL_Sandworm_220000_Battle, "GOAL_Sandworm_220000_Battle")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_Sandworm_220000_Battle, true)

Goal.Initialize = function (_, _, _, _)
end

Goal.Activate = function (_, actor, goals)
    Init_Pseudo_Global(actor, goals)
    actor:SetStringIndexedNumber("Dist_SideStep", 5)
    actor:SetStringIndexedNumber("Dist_BackStep", 5)
    local probabilities = {}
    local acts = {}
    local f2_local0 = {}
    Common_Clear_Param(probabilities, acts, f2_local0)
    actor:GetDist(TARGET_ENE_0)
    actor:GetToTargetAngle(TARGET_ENE_0)
    actor:GetHpRate(TARGET_SELF)
    actor:GetRandam_Int(1, 100)
    actor:GetEventRequest(0)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5400)
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5404)
    if actor:HasSpecialEffectId(TARGET_SELF, 5404) == false then
        if InsideRange(actor, goals, 0, 180, 42, 75) then
            probabilities[5] = 10
        elseif InsideRange(actor, goals, 45, 90, 25, 42) then
            probabilities[1] = 10
        elseif InsideRange(actor, goals, -45, 90, 25, 42) then
            probabilities[2] = 10
        elseif InsideRange(actor, goals, 0, 90, 10, 25) then
            probabilities[3] = 10
            probabilities[4] = 10
        elseif InsideRange(actor, goals, 0, 180, -99, 10) then
			probabilities[32] = 10
        else
            probabilities[32] = 10
        end
    elseif InsideRange(actor, goals, 0, 360, 60, 999) then
        probabilities[30] = 10
    elseif InsideRange(actor, goals, 0, 360, 40, 60) then
        probabilities[30] = 10
        probabilities[31] = 20
    elseif InsideRange(actor, goals, 0, 360, 20, 40) then
        probabilities[30] = 10
        probabilities[31] = 30
        probabilities[12] = 10
    elseif InsideRange(actor, goals, 0, 360, 10, 20) then
        probabilities[12] = 10
        probabilities[13] = 10
    else
        probabilities[10] = 10
        probabilities[11] = 10
    end
    probabilities[1] = SetCoolTime(actor, goals, 3010, 10, probabilities[1], 1)
    probabilities[2] = SetCoolTime(actor, goals, 3011, 10, probabilities[2], 1)
    probabilities[3] = SetCoolTime(actor, goals, 3013, 10, probabilities[3], 1)
    probabilities[4] = SetCoolTime(actor, goals, 3012, 10, probabilities[4], 1)
    probabilities[10] = SetCoolTime(actor, goals, 3020, 10, probabilities[10], 1)
    probabilities[11] = SetCoolTime(actor, goals, 3021, 10, probabilities[11], 1)
    probabilities[12] = SetCoolTime(actor, goals, 3022, 10, probabilities[12], 1)
    probabilities[13] = SetCoolTime(actor, goals, 3023, 10, probabilities[13], 1)
    acts[1] = REGIST_FUNC(actor, goals, Sandworm_220000_Act01)
    acts[2] = REGIST_FUNC(actor, goals, Sandworm_220000_Act02)
    acts[3] = REGIST_FUNC(actor, goals, Sandworm_220000_Act03)
    acts[4] = REGIST_FUNC(actor, goals, Sandworm_220000_Act04)
    acts[5] = REGIST_FUNC(actor, goals, Sandworm_220000_Act05)
    acts[10] = REGIST_FUNC(actor, goals, Sandworm_220000_Act10)
    acts[11] = REGIST_FUNC(actor, goals, Sandworm_220000_Act11)
    acts[12] = REGIST_FUNC(actor, goals, Sandworm_220000_Act12)
    acts[13] = REGIST_FUNC(actor, goals, Sandworm_220000_Act13)
    acts[30] = REGIST_FUNC(actor, goals, Sandworm_220000_Act30)
    acts[31] = REGIST_FUNC(actor, goals, Sandworm_220000_Act31)
    acts[32] = REGIST_FUNC(actor, goals, Sandworm_220000_Act32)
    Common_Battle_Activate(actor, goals, probabilities, acts, REGIST_FUNC(actor, goals, Sandworm_220000_AdjustSpace), f2_local0)
end

Goal.Update = function (arg0, arg1, arg2)
    return Update_Default_NoSubGoal(arg0, arg1, arg2)
end

function Sandworm_220000_Act01(actor, goals, _)
    local f4_local0 = 3010
    local f4_local1 = ATT_SUCCESSDIST
    local f4_local2 = 0
    local f4_local3 = 180
    actor:GetRandam_Int(1, 100)
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, f4_local0, TARGET_ENE_0, f4_local1, f4_local2, f4_local3, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Sandworm_220000_Act02(actor, goals, _)
    local f5_local0 = 3011
    local f5_local1 = ATT_SUCCESSDIST
    local f5_local2 = 0
    local f5_local3 = 360
    actor:GetRandam_Int(1, 100)
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, f5_local0, TARGET_ENE_0, f5_local1, f5_local2, f5_local3, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Sandworm_220000_Act03(actor, goals, _)
    local f6_local0 = 3013
    local f6_local1 = ATT_SUCCESSDIST
    local f6_local2 = 0
    local f6_local3 = 360
    actor:GetRandam_Int(1, 100)
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, f6_local0, TARGET_ENE_0, f6_local1, f6_local2, f6_local3, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Sandworm_220000_Act04(actor, goals, _)
    local f7_local0 = 3012
    local f7_local1 = ATT_SUCCESSDIST
    local f7_local2 = 0
    local f7_local3 = 360
    actor:GetRandam_Int(1, 100)
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, f7_local0, TARGET_ENE_0, f7_local1, f7_local2, f7_local3, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Sandworm_220000_Act05(actor, goals, _)
    local f8_local0 = 3005
    local f8_local1 = ATT_SUCCESSDIST
    local f8_local2 = 0
    local f8_local3 = 360
    actor:GetRandam_Int(1, 100)
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, f8_local0, TARGET_ENE_0, f8_local1, f8_local2, f8_local3, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Sandworm_220000_Act10(actor, goals, _)
    local f9_local0 = 3020
    local f9_local1 = ATT_SUCCESSDIST
    local f9_local2 = 0
    local f9_local3 = 180
    actor:GetRandam_Int(1, 100)
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, f9_local0, TARGET_ENE_0, f9_local1, f9_local2, f9_local3, 0, 0)
    SandwormUndergroundWaitTime(actor, goals)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Sandworm_220000_Act11(actor, goals, _)
    local f10_local0 = 3021
    local f10_local1 = ATT_SUCCESSDIST
    local f10_local2 = 0
    local f10_local3 = 360
    actor:GetRandam_Int(1, 100)
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, f10_local0, TARGET_ENE_0, f10_local1, f10_local2, f10_local3, 0, 0)
    SandwormUndergroundWaitTime(actor, goals)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Sandworm_220000_Act12(actor, goals, _)
    local f11_local0 = 3022
    local f11_local1 = ATT_SUCCESSDIST
    local f11_local2 = 0
    local f11_local3 = 360
    actor:GetRandam_Int(1, 100)
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, f11_local0, TARGET_ENE_0, f11_local1, f11_local2, f11_local3, 0, 0)
    SandwormUndergroundWaitTime(actor, goals)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Sandworm_220000_Act13(actor, goals, _)
    local f12_local0 = 3023
    local f12_local1 = ATT_SUCCESSDIST
    local f12_local2 = 0
    local f12_local3 = 360
    actor:GetRandam_Int(1, 100)
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 20, f12_local0, TARGET_ENE_0, f12_local1, f12_local2, f12_local3, 0, 0)
    SandwormUndergroundWaitTime(actor, goals)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Sandworm_220000_Act30(_, goals, _)
    goals:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_ENE_0, 0, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Sandworm_220000_Act31(actor, goals, _)
    local f14_local0 = 3001
    local f14_local1 = ATT_SUCCESSDIST
    local f14_local2 = 0
    local f14_local3 = 360
    actor:GetRandam_Int(1, 100)
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f14_local0, TARGET_ENE_0, f14_local1, f14_local2, f14_local3, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Sandworm_220000_Act32(actor, goals, _)
    local f15_local0 = 3000
    local f15_local1 = ATT_SUCCESSDIST
    local f15_local2 = 0
    local f15_local3 = 360
    actor:GetRandam_Int(1, 100)
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f15_local0, TARGET_ENE_0, f15_local1, f15_local2, f15_local3, 0, 0)
    SandwormUndergroundWaitTime(actor, goals)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function SandwormUndergroundWaitTime(actor, goals)
    local random = actor:GetRandam_Float(1, 3)
    goals:AddSubGoal(GOAL_COMMON_Wait, random, TARGET_ENE_0, 0, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Sandworm_220000_ActAfter_AdjustSpace(_, _, _)
end

Goal.Update = function (arg0, arg1, arg2)
    return Update_Default_NoSubGoal(arg0, arg1, arg2)
end

Goal.Terminate = function (_, _, _)
end

Goal.Interrupt = function (_, actor, goals)
    if actor:IsInterupt(INTERUPT_ActivateSpecialEffect) then
        actor:GetDist(TARGET_ENE_0)
        actor:GetRandam_Int(1, 100)
        if actor:GetSpecialEffectActivateInterruptType(0) == 5400 then
            goals:ClearSubGoal()
            actor:Replaning()
            return true
        elseif actor:GetSpecialEffectActivateInterruptType(0) == 5404 then
            goals:ClearSubGoal()
            actor:Replaning()
            return true
        end
        actor:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5400)
        actor:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5404)
    end
    return false
end
