RegisterTableGoal(GOAL_PursuitHeroine527000_HU_Battle, "PursuitHeroineHUBattle")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_PursuitHeroine527000_HU_Battle, true)

Goal.Initialize = function (_, arg1, _, _)
    arg1:StartAttackPassedTimer(3002, 0)
    arg1:StartAttackPassedTimer(3016, 0)
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
    local distance = actor:GetDist(TARGET_ENE_0)
    if actor:HasSpecialEffectId(TARGET_SELF, 5020) == false then
        probabilities[13] = 100
    else
        if InsideRange(actor, goals, 180, 180, 8, 999) then
            probabilities[2] = 0
            probabilities[6] = 0
            probabilities[7] = 5
            probabilities[8] = 5
            probabilities[9] = 10
            probabilities[10] = 10
            probabilities[13] = 10
            probabilities[30] = 5
        elseif InsideRange(actor, goals, 180, 150, -10, 8) then
            probabilities[2] = 20
            probabilities[6] = 10
            probabilities[9] = 5
            probabilities[12] = 10
            probabilities[13] = 0
            probabilities[15] = 0
            probabilities[16] = 0
            probabilities[17] = 0
            probabilities[30] = 0
        elseif distance >= 8 then
            probabilities[1] = 10
            probabilities[2] = 0
            probabilities[4] = 0
            probabilities[5] = 0
            probabilities[7] = 5
            probabilities[8] = 5
            probabilities[9] = 0
            probabilities[10] = 0
            probabilities[13] = 10
            probabilities[14] = 10
            probabilities[30] = 5
        else
            probabilities[1] = 0
            probabilities[2] = 0
            probabilities[3] = 0
            probabilities[4] = 10
            probabilities[5] = 10
            probabilities[6] = 10
            probabilities[7] = 0
            probabilities[8] = 0
            probabilities[9] = 5
            probabilities[10] = 0
            probabilities[11] = 10
            probabilities[12] = 10
            probabilities[13] = 0
            probabilities[14] = 0
            probabilities[15] = 0
            probabilities[16] = 0
            probabilities[30] = 0
        end
        if distance > 4.5 then
            probabilities[7] = probabilities[7] + 10
            probabilities[8] = probabilities[8] + 10
            probabilities[9] = probabilities[9] + 10
        end
        if InsideRange(actor, goals, 300, 60, 6.3 - actor:GetMapHitRadius(TARGET_SELF), 10.8 - actor:GetMapHitRadius(TARGET_SELF)) then
            probabilities[10] = probabilities[10] + 15
        end
        if distance < 3 then
            probabilities[3] = probabilities[3] + 15
        end
        if InsideRange(actor, goals, 90, 180, 0, 3) then
            probabilities[15] = probabilities[15] + 30
        end
        if InsideRange(actor, goals, 270, 180, 0, 3) then
            probabilities[16] = probabilities[16] + 30
        end
        if InsideRange(actor, goals, 210, 120, 0, 4) then
            probabilities[17] = probabilities[17] + 15
        end
        if InsideRange(actor, goals, 0, 90, -10, 2) then
            probabilities[11] = probabilities[11] + 20
        end
    end
    probabilities[30] = probabilities[30] + 1
    probabilities[1] = SetCoolTime(actor, goals, 3000, 15, probabilities[1], 1)
    probabilities[2] = SetCoolTime(actor, goals, 3001, 10, probabilities[2], 1)
    probabilities[4] = SetCoolTime(actor, goals, 3003, 15, probabilities[4], 1)
    probabilities[5] = SetCoolTime(actor, goals, 3005, 10, probabilities[5], 1)
    probabilities[7] = SetCoolTime(actor, goals, 3008, 15, probabilities[7], 1)
    probabilities[8] = SetCoolTime(actor, goals, 3013, 10, probabilities[8], 1)
    probabilities[9] = SetCoolTime(actor, goals, 3014, 15, probabilities[9], 1)
    probabilities[10] = SetCoolTime(actor, goals, 3015, 15, probabilities[10], 1)
    probabilities[12] = SetCoolTime(actor, goals, 3017, 15, probabilities[12], 1)
    probabilities[13] = SetCoolTime(actor, goals, 3018, 15, probabilities[13], 1)
    probabilities[14] = SetCoolTime(actor, goals, 3021, 15, probabilities[14], 1)
    probabilities[15] = SetCoolTime(actor, goals, 3022, 10, probabilities[15], 1)
    probabilities[16] = SetCoolTime(actor, goals, 3023, 10, probabilities[16], 1)
    probabilities[17] = SetCoolTime(actor, goals, 3025, 10, probabilities[17], 1)
    probabilities[30] = SetCoolTime(actor, goals, 2000, 10, probabilities[30], 1)
    probabilities[3] = SetCoolTime(actor, goals, 3002, 25, probabilities[3], 1)
    probabilities[6] = SetCoolTime(actor, goals, 3007, 20, probabilities[6], 1)
    probabilities[11] = SetCoolTime(actor, goals, 3016, 25, probabilities[11], 1)
    acts[1] = REGIST_FUNC(actor, goals, PursuitHeroine_HU_Act01)
    acts[2] = REGIST_FUNC(actor, goals, PursuitHeroine_HU_Act02)
    acts[3] = REGIST_FUNC(actor, goals, PursuitHeroine_HU_Act03)
    acts[4] = REGIST_FUNC(actor, goals, PursuitHeroine_HU_Act04)
    acts[5] = REGIST_FUNC(actor, goals, PursuitHeroine_HU_Act05)
    acts[6] = REGIST_FUNC(actor, goals, PursuitHeroine_HU_Act06)
    acts[7] = REGIST_FUNC(actor, goals, PursuitHeroine_HU_Act07)
    acts[8] = REGIST_FUNC(actor, goals, PursuitHeroine_HU_Act08)
    acts[9] = REGIST_FUNC(actor, goals, PursuitHeroine_HU_Act09)
    acts[10] = REGIST_FUNC(actor, goals, PursuitHeroine_HU_Act10)
    acts[11] = REGIST_FUNC(actor, goals, PursuitHeroine_HU_Act11)
    acts[12] = REGIST_FUNC(actor, goals, PursuitHeroine_HU_Act12)
    acts[13] = REGIST_FUNC(actor, goals, PursuitHeroine_HU_Act13)
    acts[14] = REGIST_FUNC(actor, goals, PursuitHeroine_HU_Act14)
    acts[15] = REGIST_FUNC(actor, goals, PursuitHeroine_HU_Act15)
    acts[16] = REGIST_FUNC(actor, goals, PursuitHeroine_HU_Act16)
    acts[17] = REGIST_FUNC(actor, goals, PursuitHeroine_HU_Act17)
    acts[18] = REGIST_FUNC(actor, goals, PursuitHeroine_HU_Act18)
    acts[30] = REGIST_FUNC(actor, goals, PursuitHeroine_HU_Act30)
    Common_Battle_Activate(actor, goals, probabilities, acts, REGIST_FUNC(actor, goals, PursuitHeroine_HU_ActAfter_AdjustSpace), f2_local0)
end

function PursuitHeroine_HU_Act01(arg0, goals, _)
    local f3_local0 = 3000
    local f3_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local f3_local2 = 0
    local f3_local3 = 45
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f3_local0, TARGET_ENE_0, f3_local1, f3_local2, f3_local3, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_HU_Act02(arg0, goals, _)
    local f4_local0 = 3001
    local f4_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local f4_local2 = 0
    local f4_local3 = 360
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f4_local0, TARGET_ENE_0, f4_local1, f4_local2, f4_local3, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_HU_Act03(arg0, goals, _)
    local action = 3002
    local success_distance = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 360
    goals:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_HU_Act04(arg0, goals, _)
    local action = 3003
    local f6_local0 = 3004
    local success_distance = 6.3 - arg0:GetMapHitRadius(TARGET_SELF)
    local f6_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 60
    goals:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f6_local0, TARGET_ENE_0, f6_local1, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_HU_Act05(arg0, goals, _)
    local action = 3005
    local f7_local0 = 3006
    local success_distance = 6.3 - arg0:GetMapHitRadius(TARGET_SELF)
    local f7_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 90
    goals:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f7_local0, TARGET_ENE_0, f7_local1, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_HU_Act06(arg0, goals, _)
    local f8_local0 = 3007
    local f8_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local f8_local2 = 0
    local f8_local3 = 360
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f8_local0, TARGET_ENE_0, f8_local1, f8_local2, f8_local3, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_HU_Act07(actor, goals, _)
    local action0 = 3008
    local action1 = 3009
    local action2 = 3024
    local success_distance0 = 8.3 - actor:GetMapHitRadius(TARGET_SELF) + 1
    local success_distance1 = 11 - actor:GetMapHitRadius(TARGET_SELF) + 1
    local success_distance2 = 15 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 90
    if actor:GetRandam_Int(1, 100) <= 30 then
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance1, turn_time_before, front_decision_angle, 0, 0)
        local f9_local0 = goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action2, TARGET_ENE_0, success_distance2, 0, 0)
        f9_local0:SetTargetRange(0, -99, 8)
    else
        actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle, 0, 0)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance2, 0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_HU_Act08(actor, goals, _)
    local action = 3013
    local success_distance = 15 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 90
    actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_HU_Act09(actor, goals, _)
    local action0 = 3014
    local f11_local0 = 3009
    local action1 = 3024
    local success_distance0 = 8.3 - actor:GetMapHitRadius(TARGET_SELF) + 1.5
    local success_distance1 = 11 - actor:GetMapHitRadius(TARGET_SELF) + 1
    local success_distance2 = 15 - actor:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 180
    if actor:GetRandam_Int(1, 100) <= 30 then
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance1, turn_time_before, front_decision_angle, 0, 0)
        local f11_local1 = goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance2, 0, 0)
        f11_local1:SetTargetRange(0, -99, 8)
    else
        actor:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle, 0, 0)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f11_local0, TARGET_ENE_0, success_distance2, 0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_HU_Act10(arg0, goals, _)
    local f12_local0 = 3015
    local f12_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local f12_local2 = 0
    local f12_local3 = 90
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f12_local0, TARGET_ENE_0, f12_local1, f12_local2, f12_local3, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_HU_Act11(arg0, goals, _)
    local f13_local0 = 3016
    local f13_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local f13_local2 = 0
    local f13_local3 = 90
    if arg0:IsFinishTimer(0) == true then
        goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f13_local0, TARGET_ENE_0, f13_local1, f13_local2, f13_local3, 0, 0)
    else
        arg0:Replaning()
    end
    arg0:SetTimer(0, 24)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_HU_Act12(arg0, goals, _)
    local f14_local0 = 3017
    local f14_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local f14_local2 = 0
    local f14_local3 = 360
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f14_local0, TARGET_ENE_0, f14_local1, f14_local2, f14_local3, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_HU_Act13(actor, goals, _)
    local success_distance = DIST_None
    local turn_time_before = 0
    local front_decision_angle = 360
    local action = 3018
    local f15_local0 = 3019
    local f15_local1 = 3020
    local distance = actor:GetDist(TARGET_ENE_0)
    goals:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle)
    if InsideRange(actor, goals, 180, 180, -10, 999) then
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f15_local0, TARGET_ENE_0, success_distance)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f15_local0, TARGET_ENE_0, success_distance)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f15_local0, TARGET_ENE_0, success_distance)
    end
    if distance >= 15 then
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f15_local0, TARGET_ENE_0, success_distance)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f15_local0, TARGET_ENE_0, success_distance)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f15_local0, TARGET_ENE_0, success_distance)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f15_local0, TARGET_ENE_0, success_distance)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f15_local0, TARGET_ENE_0, success_distance)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f15_local0, TARGET_ENE_0, success_distance)
    elseif distance >= 10 then
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f15_local0, TARGET_ENE_0, success_distance)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f15_local0, TARGET_ENE_0, success_distance)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f15_local0, TARGET_ENE_0, success_distance)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f15_local0, TARGET_ENE_0, success_distance)
    elseif distance >= 6 then
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f15_local0, TARGET_ENE_0, success_distance)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f15_local0, TARGET_ENE_0, success_distance)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f15_local0, TARGET_ENE_0, success_distance)
    else
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f15_local0, TARGET_ENE_0, success_distance)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, f15_local0, TARGET_ENE_0, success_distance)
    end
    goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f15_local1, TARGET_ENE_0, success_distance)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_HU_Act14(arg0, goals, _)
    local f16_local0 = 3021
    local f16_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local f16_local2 = 0
    local f16_local3 = 180
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f16_local0, TARGET_ENE_0, f16_local1, f16_local2, f16_local3, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_HU_Act15(arg0, goals, _)
    local f17_local0 = 3022
    local f17_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local f17_local2 = 0
    local f17_local3 = 360
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f17_local0, TARGET_ENE_0, f17_local1, f17_local2, f17_local3, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_HU_Act16(arg0, goals, _)
    local f18_local0 = 3023
    local f18_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local f18_local2 = 0
    local f18_local3 = 360
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f18_local0, TARGET_ENE_0, f18_local1, f18_local2, f18_local3, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_HU_Act17(arg0, goals, _)
    local action = 3025
    local f19_local0 = 3004
    local success_distance = 10 - arg0:GetMapHitRadius(TARGET_SELF) + 1
    local f19_local1 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 360
    goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action, TARGET_ENE_0, success_distance, turn_time_before, front_decision_angle, 0, 0)
    goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f19_local0, TARGET_ENE_0, f19_local1, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_HU_Act18(arg0, goals, _)
    local f20_local0 = 3010
    local f20_local1 = 3011
    local f20_local2 = 3012
    local f20_local3 = 15 - arg0:GetMapHitRadius(TARGET_SELF)
    if InsideRange(arg0, goals, 240, 120, 0, 2.5) then
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f20_local0, TARGET_ENE_0, f20_local3, 0, 0)
    elseif InsideRange(arg0, goals, 0, 105, 2, 5.8) then
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f20_local1, TARGET_ENE_0, f20_local3, 0, 0)
    elseif InsideRange(arg0, goals, 120, 120, 0, 2.8) then
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f20_local2, TARGET_ENE_0, f20_local3, 0, 0)
    else
        arg0:Replaning()
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PursuitHeroine_HU_Act30(arg0, goals, _)
    goals:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, 4, TARGET_ENE_0, 7, TARGET_ENE_0, true, -1, arg0:GetRandam_Int(AI_DIR_TYPE_ToL, AI_DIR_TYPE_ToR), arg0:GetRandam_Float(5, 7))
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function PursuitHeroine_HU_ActAfter_AdjustSpace(actor, goals, _)
    local random = actor:GetRandam_Int(1, 100)
    if actor:GetHpRate(TARGET_SELF) <= 0.3 then
        if not InsideRange(actor, goals, 0, 360, -10, 3) then
            if random <= 80 then
            else
                if actor:GetHpRate(TARGET_SELF) <= 0.6 then
                    if not InsideRange(actor, goals, 0, 360, -10, 3) then
                        if random <= 20 then
                        else
                            goals:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, actor:GetRandam_Float(2, 3), TARGET_ENE_0, 7, TARGET_ENE_0, true, -1, actor:GetRandam_Int(AI_DIR_TYPE_ToL, AI_DIR_TYPE_ToR), actor:GetRandam_Float(5, 7))
                        end
                    else
                    end
                end
                goals:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, actor:GetRandam_Float(2, 3), TARGET_ENE_0, 7, TARGET_ENE_0, true, -1, actor:GetRandam_Int(AI_DIR_TYPE_ToL, AI_DIR_TYPE_ToR), actor:GetRandam_Float(5, 7))
            end
        end
    else
        if actor:GetHpRate(TARGET_SELF) <= 0.6 then
            if not InsideRange(actor, goals, 0, 360, -10, 3) then
                if random <= 20 then
                else
                    goals:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, actor:GetRandam_Float(2, 3), TARGET_ENE_0, 7, TARGET_ENE_0, true, -1, actor:GetRandam_Int(AI_DIR_TYPE_ToL, AI_DIR_TYPE_ToR), actor:GetRandam_Float(5, 7))
                end
            else
            end
        end
        goals:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, actor:GetRandam_Float(2, 3), TARGET_ENE_0, 7, TARGET_ENE_0, true, -1, actor:GetRandam_Int(AI_DIR_TYPE_ToL, AI_DIR_TYPE_ToR), actor:GetRandam_Float(5, 7))
    end
end

Goal.Update = function (arg0, arg1, arg2)
    return Update_Default_NoSubGoal(arg0, arg1, arg2)
end

Goal.Terminate = function (_, _, _)
end

Goal.Interrupt = function (_, actor, goals)
    local random = actor:GetRandam_Int(1, 100)
    actor:GetDist(TARGET_ENE_0)
    if actor:HasSpecialEffectId(TARGET_SELF, 5025) and random <= 30 and actor:IsInterupt(INTERUPT_Damaged) then
        actor:Replaning()
        return true
    elseif actor:IsInterupt(INTERUPT_TargetOutOfRange) and actor:IsTargetOutOfRangeInterruptSlot(0) then
        goals:ClearSubGoal()
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3021, TARGET_ENE_0, SuccessDist, 0, 0)
        return true
    elseif actor:IsInterupt(INTERUPT_ActivateSpecialEffect) then
        actor:GetDist(TARGET_ENE_0)
        actor:GetRandam_Int(1, 100)
        if actor:GetSpecialEffectActivateInterruptType(0) == 5026 and InsideRange(actor, goals, 0, 270, -1, 6.8 - actor:GetMapHitRadius(TARGET_SELF)) then
            goals:ClearSubGoal()
            PursuitHeroine_HU_Act18(actor, goals, paramTbl)
            return true
        end
    end
    return false
end
