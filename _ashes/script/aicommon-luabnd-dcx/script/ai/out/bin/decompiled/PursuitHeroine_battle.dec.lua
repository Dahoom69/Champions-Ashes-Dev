RegisterTableGoal(GOAL_PursuitHeroine527000_Battle, "PursuitHeroineNormalBattle")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_PursuitHeroine527000_Battle, true)

Goal.Initialize = function (_, arg1, _, _)
    arg1:StartAttackPassedTimer(3003, 0)
    arg1:StartAttackPassedTimer(3014, 0)
    arg1:StartAttackPassedTimer(3023, 0)
    arg1:SetNumber(0, 0)
end

Goal.Activate = function (_, actor, goals)
    local probabilities = {}
    local acts = {}
    local f2_local0 = {}
    Common_Clear_Param(probabilities, acts, f2_local0)
    Init_Pseudo_Global(actor, goals)
    actor:SetStringIndexedNumber("Dist_SideStep", 0 + 1)
    actor:SetStringIndexedNumber("Dist_BackStep", 0 + 1)
    actor:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    actor:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    local distance = actor:GetDist(TARGET_ENE_0)
    if actor:GetHpRate(TARGET_SELF) <= 0.6 and not actor:HasSpecialEffectId(TARGET_SELF, 5404) then
        goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 1500, TARGET_ENE_0, 999, 0, 0, 180, 0)
        return false
    elseif actor:GetNumber(0) == 0 then
        probabilities[30] = 100
    else
        if InsideRange(actor, goals, 180, 180, 6, 999) then
            probabilities[5] = 20
            probabilities[7] = 20
            probabilities[12] = 30
            probabilities[13] = 30
        elseif InsideRange(actor, goals, 180, 150, -10, 6) then
            probabilities[2] = 20
            probabilities[9] = 0
            probabilities[12] = 5
            probabilities[19] = 0
            probabilities[22] = 0
        elseif distance >= 8 then
            probabilities[1] = 10
            probabilities[4] = 0
            probabilities[5] = 10
            probabilities[6] = 0
            probabilities[7] = 10
            probabilities[12] = 5
            probabilities[13] = 5
            probabilities[14] = 10
            probabilities[18] = 10
        elseif distance >= 4.5 then
            probabilities[5] = 10
            probabilities[7] = 10
            probabilities[10] = 5
            probabilities[12] = 15
            probabilities[13] = 15
        else
            probabilities[3] = 10
            probabilities[4] = 10
            probabilities[6] = 0
            probabilities[8] = 5
            probabilities[9] = 0
            probabilities[10] = 10
            probabilities[11] = 10
            probabilities[15] = 10
            probabilities[16] = 10
            probabilities[17] = 20
            probabilities[19] = 10
        end
        if distance < 3.5 then
            probabilities[8] = probabilities[8] + 10
        end
        if InsideRange(actor, goals, 270, 180, -10, 3) then
            probabilities[9] = probabilities[9] + 20
        end
        if InsideRange(actor, goals, 135, 150, 0, 3) then
            probabilities[22] = probabilities[22] + 20
        end
        if InsideRange(actor, goals, 270, 120, 0, 2) then
            probabilities[19] = probabilities[19] + 20
        end
        if actor:IsFinishTimer(0) == true then
            probabilities[17] = probabilities[17] + 10
        end
        if actor:GetNumber(1) == 1 then
            actor:SetNumber(1, 0)
            probabilities[17] = probabilities[17] + 10
        end
        if actor:HasSpecialEffectId(TARGET_SELF, 11103) == true then
            probabilities[17] = probabilities[17] - 20
        end
        if InsideRange(actor, goals, 270, 120, 0, 2) then
            probabilities[19] = probabilities[19] + 20
        end
    end
    probabilities[30] = 5
    probabilities[1] = SetCoolTime(actor, goals, 3000, 10, probabilities[1], 1)
    probabilities[3] = SetCoolTime(actor, goals, 3007, 10, probabilities[3], 1)
    probabilities[4] = SetCoolTime(actor, goals, 3009, 10, probabilities[4], 1)
    probabilities[5] = SetCoolTime(actor, goals, 3010, 10, probabilities[5], 1)
    probabilities[7] = SetCoolTime(actor, goals, 3013, 10, probabilities[7], 1)
    probabilities[9] = SetCoolTime(actor, goals, 3015, 10, probabilities[9], 1)
    probabilities[10] = SetCoolTime(actor, goals, 3016, 10, probabilities[3], 1)
    probabilities[11] = SetCoolTime(actor, goals, 3019, 10, probabilities[11], 1)
    probabilities[12] = SetCoolTime(actor, goals, 3020, 10, probabilities[12], 1)
    probabilities[13] = SetCoolTime(actor, goals, 3021, 10, probabilities[13], 1)
    probabilities[14] = SetCoolTime(actor, goals, 3022, 15, probabilities[14], 1)
    probabilities[16] = SetCoolTime(actor, goals, 3024, 10, probabilities[16], 1)
    probabilities[17] = SetCoolTime(actor, goals, 3027, 10, probabilities[17], 1)
    probabilities[18] = SetCoolTime(actor, goals, 3028, 15, probabilities[18], 1)
    probabilities[19] = SetCoolTime(actor, goals, 3033, 10, probabilities[19], 1)
    probabilities[22] = SetCoolTime(actor, goals, 3006, 10, probabilities[22], 1)
    probabilities[2] = SetCoolTime(actor, goals, 3003, 20, probabilities[2], 1)
    probabilities[8] = SetCoolTime(actor, goals, 3014, 25, probabilities[8], 1)
    probabilities[15] = SetCoolTime(actor, goals, 3023, 25, probabilities[15], 1)
    acts[1] = REGIST_FUNC(actor, goals, PursuitHeroine_Act01)
    acts[2] = REGIST_FUNC(actor, goals, PursuitHeroine_Act02)
    acts[3] = REGIST_FUNC(actor, goals, PursuitHeroine_Act03)
    acts[4] = REGIST_FUNC(actor, goals, PursuitHeroine_Act04)
    acts[5] = REGIST_FUNC(actor, goals, PursuitHeroine_Act05)
    acts[6] = REGIST_FUNC(actor, goals, PursuitHeroine_Act06)
    acts[7] = REGIST_FUNC(actor, goals, PursuitHeroine_Act07)
    acts[8] = REGIST_FUNC(actor, goals, PursuitHeroine_Act08)
    acts[9] = REGIST_FUNC(actor, goals, PursuitHeroine_Act09)
    acts[10] = REGIST_FUNC(actor, goals, PursuitHeroine_Act10)
    acts[11] = REGIST_FUNC(actor, goals, PursuitHeroine_Act11)
    acts[12] = REGIST_FUNC(actor, goals, PursuitHeroine_Act12)
    acts[13] = REGIST_FUNC(actor, goals, PursuitHeroine_Act13)
    acts[14] = REGIST_FUNC(actor, goals, PursuitHeroine_Act14)
    acts[15] = REGIST_FUNC(actor, goals, PursuitHeroine_Act15)
    acts[16] = REGIST_FUNC(actor, goals, PursuitHeroine_Act16)
    acts[17] = REGIST_FUNC(actor, goals, PursuitHeroine_Act17)
    acts[18] = REGIST_FUNC(actor, goals, PursuitHeroine_Act18)
    acts[19] = REGIST_FUNC(actor, goals, PursuitHeroine_Act19)
    acts[20] = REGIST_FUNC(actor, goals, PursuitHeroine_Act20)
    acts[21] = REGIST_FUNC(actor, goals, PursuitHeroine_Act21)
    acts[22] = REGIST_FUNC(actor, goals, PursuitHeroine_Act22)
    acts[30] = REGIST_FUNC(actor, goals, PursuitHeroine_Act30)
    Common_Battle_Activate(actor, goals, probabilities, acts, REGIST_FUNC(actor, goals, PursuitHeroine_ActAfter_AdjustSpace), f2_local0)
end

function PursuitHeroine_Act01(actor, goals, _)
    local action = 3000
    local success_distance = 15 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 60
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_Act02(actor, goals, _)
    local action = 3003
    local success_distance = 15 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 360
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_Act03(arg0, goals, _)
    local action = 3007
    local f5_local0 = 3008
    local success_distance = 6.3 - arg0:GetMapHitRadius(TARGET_SELF) + 1
    local f5_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 180
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f5_local0, TARGET_ENE_0, f5_local1, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_Act04(arg0, goals, _)
    local action = 3009
    local f6_local0 = 3012
    local success_distance = 7.3 - arg0:GetMapHitRadius(TARGET_SELF) + 1
    local f6_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 90
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f6_local0, TARGET_ENE_0, f6_local1, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_Act05(actor, goals, _)
    local action0 = 3010
    local action1 = 3011
    local success_distance0 = 7.8 - actor:GetMapHitRadius(TARGET_SELF) + 1
    local success_distance1 = 15 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 60
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle, 0, 0)
    goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance1, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_Act06(arg0, goals, _)
    local f8_local0 = 3012
    local f8_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local f8_local2 = 0
    local f8_local3 = 90
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f8_local0, TARGET_ENE_0, f8_local1, f8_local2, f8_local3, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_Act07(actor, goals, _)
    local action = 3013
    local success_distance = 15 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 60
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_Act08(arg0, goals, _)
    local action = 3014
    local success_distance = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 360
    goals:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_Act09(arg0, goals, _)
    local f11_local0 = 3015
    local f11_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local f11_local2 = 0
    local f11_local3 = 360
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f11_local0, TARGET_ENE_0, f11_local1, f11_local2, f11_local3, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_Act10(arg0, goals, _)
    local action0 = 3016
    local action1 = 3017
    local f12_local0 = 3018
    local success_distance0 = 11.8 - arg0:GetMapHitRadius(TARGET_SELF) + 1
    local success_distance1 = 11.8 - arg0:GetMapHitRadius(TARGET_SELF) + 1
    local f12_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 45
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle, 0, 0)
    goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance1, 0, 0)
    goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f12_local0, TARGET_ENE_0, f12_local1, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_Act11(arg0, goals, _)
    local action = 3019
    local f13_local0 = 3008
    local success_distance = 6.3 - arg0:GetMapHitRadius(TARGET_SELF) + 1
    local f13_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 180
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f13_local0, TARGET_ENE_0, f13_local1, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_Act12(arg0, goals, _)
    local action = 3020
    local f14_local0 = 3012
    local success_distance = 7.3 - arg0:GetMapHitRadius(TARGET_SELF) + 1
    local f14_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 180
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f14_local0, TARGET_ENE_0, f14_local1, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_Act13(arg0, goals, _)
    local f15_local0 = 3021
    local f15_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local f15_local2 = 0
    local f15_local3 = 90
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f15_local0, TARGET_ENE_0, f15_local1, f15_local2, f15_local3, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_Act14(arg0, goals, _)
    local f16_local0 = 3022
    local f16_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local f16_local2 = 0
    local f16_local3 = 180
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f16_local0, TARGET_ENE_0, f16_local1, f16_local2, f16_local3, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_Act15(arg0, goals, _)
    local f17_local0 = 3023
    local f17_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local f17_local2 = 0
    local f17_local3 = 180
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f17_local0, TARGET_ENE_0, f17_local1, f17_local2, f17_local3, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_Act16(arg0, goals, _)
    local action0 = 3024
    local action1 = 3025
    local f18_local0 = 3026
    local success_distance0 = 8.8 - arg0:GetMapHitRadius(TARGET_SELF) + 1
    local success_distance1 = 9.8 - arg0:GetMapHitRadius(TARGET_SELF) + 1
    local f18_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 90
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle, 0, 0)
    goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance1, 0, 0)
    goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f18_local0, TARGET_ENE_0, f18_local1, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_Act17(arg0, goals, _)
    local f19_local0 = 3027
    local f19_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local f19_local2 = 0
    local f19_local3 = 90
    arg0:SetTimer(0, 15)
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f19_local0, TARGET_ENE_0, f19_local1, f19_local2, f19_local3, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_Act18(arg0, goals, _)
    local f20_local0 = goals:AddSubGoal(GOAL_COMMON_ApproachTarget, 4, TARGET_ENE_0, 3, TARGET_ENE_0, true, 9910)
    f20_local0 = f20_local0:SetFailedEndOption(AI_GOAL_FAILED_END_OPT__PARENT_NEXT_SUB_GOAL)
    f20_local0:SetLifeEndSuccess(true)
    f20_local0 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local f20_local1 = 0
    local f20_local2 = 90
    local f20_local3 = 3032
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f20_local3, TARGET_ENE_0, f20_local0, f20_local1, f20_local2, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_Act19(arg0, goals, _)
    local action0 = 3033
    local action1 = 3025
    local f21_local0 = 3026
    local success_distance0 = 8.8 - arg0:GetMapHitRadius(TARGET_SELF) + 1
    local success_distance1 = 9.8 - arg0:GetMapHitRadius(TARGET_SELF) + 1
    local f21_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 90
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle, 0, 0)
    goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance1, 0, 0)
    goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f21_local0, TARGET_ENE_0, f21_local1, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_Act20(arg0, goals, _)
    local f22_local0 = 3001
    local f22_local1 = 3002
    local f22_local2 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    if InsideRange(arg0, goals, 30, 150, 0, 3) then
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f22_local1, TARGET_ENE_0, f22_local2, 0, 0)
    elseif InsideRange(arg0, goals, 0, 180, 3, 8) then
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f22_local0, TARGET_ENE_0, f22_local2, 0, 0)
    else
        arg0:Replaning()
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_Act21(arg0, goals, _)
    local f23_local0 = 3004
    local f23_local1 = 3005
    local f23_local2 = 3006
    local f23_local3 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    if InsideRange(arg0, goals, 255, 105, 0, 4) then
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f23_local0, TARGET_ENE_0, f23_local3, 0, 0)
    elseif InsideRange(arg0, goals, 0, 105, 0, 6) then
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f23_local1, TARGET_ENE_0, f23_local3, 0, 0)
    elseif InsideRange(arg0, goals, 105, 105, 0, 4) then
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f23_local2, TARGET_ENE_0, f23_local3, 0, 0)
    else
        arg0:Replaning()
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_Act22(arg0, goals, _)
    local action = 3006
    local f24_local0 = 3012
    local success_distance = 5.8 - arg0:GetMapHitRadius(TARGET_SELF) + 1
    local f24_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 360
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f24_local0, TARGET_ENE_0, f24_local1, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_Act30(arg0, goals, _)
    goals:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, 5, TARGET_ENE_0, 7, TARGET_ENE_0, true, -1, arg0:GetRandam_Int(AI_DIR_TYPE_ToL, AI_DIR_TYPE_ToR), arg0:GetRandam_Float(5, 7))
    arg0:SetNumber(0, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function PursuitHeroine_ActAfter_AdjustSpace(actor, goals, _)
    local random = actor:GetRandam_Int(1, 100)
    if actor:GetHpRate(TARGET_SELF) <= 0.7 then
    elseif random <= 50 then
    else
        goals:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, actor:GetRandam_Float(3, 5), TARGET_ENE_0, 7, TARGET_ENE_0, true, -1, actor:GetRandam_Int(AI_DIR_TYPE_ToL, AI_DIR_TYPE_ToR), actor:GetRandam_Float(5, 7))
    end
end

Goal.Update = function (arg0, arg1, arg2)
    return Update_Default_NoSubGoal(arg0, arg1, arg2)
end

Goal.Terminate = function (_, _, _)
end

Goal.Interrupt = function (_, actor, goals)
    local random = actor:GetRandam_Int(1, 100)
    actor:GetRandam_Int(1, 100)
    actor:GetDist(TARGET_ENE_0)
    if actor:HasSpecialEffectId(TARGET_SELF, 5025) and random <= 30 and actor:IsInterupt(INTERUPT_Damaged) then
        actor:SetNumber(1, 1)
        actor:Replaning()
        return true
    elseif actor:IsInterupt(INTERUPT_ActivateSpecialEffect) then
        actor:GetDist(TARGET_ENE_0)
        actor:GetRandam_Int(1, 100)
        if actor:GetSpecialEffectActivateInterruptType(0) == 5026 and InsideRange(actor, goals, 45, 270, -1, 13.8 - actor:GetMapHitRadius(TARGET_SELF)) then
            goals:ClearSubGoal()
            PursuitHeroine_Act20(actor, goals, paramTbl)
            return true
        elseif actor:GetSpecialEffectActivateInterruptType(0) == 5027 and InsideRange(actor, goals, 0, 270, -1, 8.8 - actor:GetMapHitRadius(TARGET_SELF)) then
            goals:ClearSubGoal()
            PursuitHeroine_Act21(actor, goals, paramTbl)
            return true
        end
    end
    return false
end
