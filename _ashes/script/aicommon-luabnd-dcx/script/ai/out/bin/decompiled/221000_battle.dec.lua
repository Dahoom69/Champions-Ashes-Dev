RegisterTableGoal(GOAL_ZonbieCrow_Dagger_221000_Battle, "ZonbieCrow_Dagger_221000_Battle")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_ZonbieCrow_Dagger_221000_Battle, true)

Goal.Initialize = function (_, arg1, _, _)
    arg1:SetEnableInterrupt_LookedTarget(true)
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
    actor:GetRandam_Int(1, 100)
    actor:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkattr_doAdmirer)
    actor:GetEventRequest()
    local distance = actor:GetDist(TARGET_ENE_0)
    actor:GetHpRate(TARGET_SELF)
    local f2_local1 = actor:GetMapHitRadius(TARGET_SELF)
    local f2_local2 = actor:GetExistMeshOnLineDistEx(TARGET_SELF, AI_DIR_TYPE_B, 2, f2_local1, f2_local1)
    local f2_local3 = actor:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer)
    if actor:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 90) then
        probabilities[20] = 100
    else
        if actor:HasSpecialEffectId(TARGET_SELF, 5405) == false then
            if actor:HasSpecialEffectId(TARGET_SELF, 12140) == true and actor:IsVisibleTarget(TARGET_ENE_0) == true then
                probabilities[1] = 0
                probabilities[2] = 0
                probabilities[3] = 0
                probabilities[4] = 100
                probabilities[21] = 0
                probabilities[22] = 0
            elseif distance >= 15 then
                probabilities[1] = 0
                probabilities[2] = 0
                probabilities[3] = 0
                probabilities[4] = 0
                probabilities[21] = 100
                probabilities[22] = 0
            elseif distance >= 10 then
                probabilities[1] = 0
                probabilities[2] = 0
                probabilities[3] = 0
                probabilities[4] = 0
                probabilities[21] = 100
                probabilities[22] = 0
            elseif distance >= 6 then
                probabilities[1] = 6
                probabilities[2] = 6
                probabilities[3] = 6
                probabilities[4] = 0
                probabilities[21] = 20
                probabilities[22] = 50
            else
                probabilities[1] = 0
                probabilities[2] = 0
                probabilities[3] = 0
                probabilities[4] = 100
                probabilities[21] = 0
                probabilities[22] = 0
            end
        elseif f2_local3 == 1 and actor:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Kankyaku then
            if distance >= 25 then
                probabilities[5] = 20
                probabilities[6] = 20
            else
                Kankyaku_Act(actor, goals, 0)
            end
        elseif f2_local3 == 1 and actor:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Torimaki then
            if distance >= 25 then
                probabilities[5] = 20
                probabilities[6] = 20
            else
                Torimaki_Act(actor, goals, 0)
            end
        elseif distance >= 15 then
            probabilities[5] = 20
            probabilities[6] = 20
            probabilities[7] = 20
            probabilities[8] = 20
            probabilities[9] = 20
        elseif distance >= 10 then
            probabilities[5] = 20
            probabilities[6] = 20
            probabilities[7] = 20
            probabilities[8] = 20
            probabilities[9] = 20
        elseif distance >= 6 then
            probabilities[5] = 28
            probabilities[6] = 23
            probabilities[7] = 23
            probabilities[8] = 16
            probabilities[9] = 10
        elseif distance >= 3.5 then
            probabilities[5] = 4
            probabilities[6] = 10
            probabilities[7] = 21
            probabilities[8] = 22
            probabilities[9] = 15
        else
            probabilities[5] = 0
            probabilities[6] = 27
            probabilities[7] = 0
            probabilities[8] = 40
            probabilities[9] = 20
        end
        if actor:HasSpecialEffectAttribute(TARGET_ENE_0, SP_EFFECT_TYPE_TARGET_DOWN) then
            probabilities[1] = 0.1 * probabilities[1]
            probabilities[2] = 0.1 * probabilities[2]
            probabilities[3] = 0.1 * probabilities[3]
            probabilities[4] = 0.1 * probabilities[4]
            probabilities[5] = 0.1 * probabilities[5]
            probabilities[6] = 0.1 * probabilities[6]
            probabilities[7] = 0.1 * probabilities[7]
            probabilities[8] = 0.1 * probabilities[8]
            probabilities[9] = 0.1 * probabilities[9]
            probabilities[21] = 1 * probabilities[21]
            probabilities[22] = 1 * probabilities[22]
        end
        if actor:IsTargetGuard(TARGET_ENE_0) == true then
            probabilities[1] = 1 * probabilities[1]
            probabilities[2] = 1 * probabilities[2]
            probabilities[3] = 1 * probabilities[3]
            probabilities[4] = 1 * probabilities[4]
            probabilities[5] = 1 * probabilities[5]
            probabilities[6] = 1 * probabilities[6]
            probabilities[7] = 1 * probabilities[7]
            probabilities[8] = 1 * probabilities[8]
            probabilities[9] = 1 * probabilities[9]
            probabilities[21] = 1 * probabilities[21]
            probabilities[22] = 1 * probabilities[22]
        end
        if f2_local2 < 0.8 then
            probabilities[21] = 1.2 * probabilities[21]
        end
        probabilities[1] = SetCoolTime(actor, goals, 3000, 0, probabilities[1], probabilities[1] * 0.1)
        probabilities[2] = SetCoolTime(actor, goals, 3001, 0, probabilities[2], probabilities[2] * 0.1)
        probabilities[3] = SetCoolTime(actor, goals, 3002, 0, probabilities[3], probabilities[3] * 0.1)
        probabilities[4] = SetCoolTime(actor, goals, 3003, 0, probabilities[4], probabilities[4] * 0.1)
        probabilities[5] = SetCoolTime(actor, goals, 2003000, 0, probabilities[5], probabilities[5] * 0.1)
        probabilities[6] = SetCoolTime(actor, goals, 2003001, 0, probabilities[6], probabilities[6] * 0.1)
        probabilities[7] = SetCoolTime(actor, goals, 2003002, 0, probabilities[7], probabilities[7] * 0.1)
        probabilities[8] = SetCoolTime(actor, goals, 2003003, 0, probabilities[8], probabilities[8] * 0.1)
        probabilities[9] = SetCoolTime(actor, goals, 2003005, 0, probabilities[9], probabilities[9] * 0.1)
    end
    acts[1] = REGIST_FUNC(actor, goals, ZonbieCrow_Dagger_Act01)
    acts[2] = REGIST_FUNC(actor, goals, ZonbieCrow_Dagger_Act02)
    acts[3] = REGIST_FUNC(actor, goals, ZonbieCrow_Dagger_Act03)
    acts[4] = REGIST_FUNC(actor, goals, ZonbieCrow_Dagger_Act04)
    acts[5] = REGIST_FUNC(actor, goals, ZonbieCrow_Dagger_Act05)
    acts[6] = REGIST_FUNC(actor, goals, ZonbieCrow_Dagger_Act06)
    acts[7] = REGIST_FUNC(actor, goals, ZonbieCrow_Dagger_Act07)
    acts[8] = REGIST_FUNC(actor, goals, ZonbieCrow_Dagger_Act08)
    acts[9] = REGIST_FUNC(actor, goals, ZonbieCrow_Dagger_Act09)
    acts[20] = REGIST_FUNC(actor, goals, ZonbieCrow_Dagger_Act20)
    acts[21] = REGIST_FUNC(actor, goals, ZonbieCrow_Dagger_Act21)
    acts[22] = REGIST_FUNC(actor, goals, ZonbieCrow_Dagger_Act22)
    acts[22] = REGIST_FUNC(actor, goals, ZonbieCrow_Dagger_Act22)
    acts[22] = REGIST_FUNC(actor, goals, ZonbieCrow_Dagger_Act22)
    Common_Battle_Activate(actor, goals, probabilities, acts, REGIST_FUNC(actor, goals, ZonbieCrow_Dagger_ActAfter_AdjustSpace), f2_local0)
end

function ZonbieCrow_Dagger_Act01(arg0, goals, _)
    local f3_local0 = 3000
    local f3_local1 = 3 - arg0:GetMapHitRadius(TARGET_SELF)
    local f3_local2 = 0
    local f3_local3 = 0
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f3_local0, TARGET_ENE_0, f3_local1, f3_local2, f3_local3, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function ZonbieCrow_Dagger_Act02(arg0, goals, _)
    local f4_local0 = 3001
    local f4_local1 = 3 - arg0:GetMapHitRadius(TARGET_SELF)
    local f4_local2 = 0
    local f4_local3 = 0
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f4_local0, TARGET_ENE_0, f4_local1, f4_local2, f4_local3, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function ZonbieCrow_Dagger_Act03(arg0, goals, _)
    local f5_local0 = 3002
    local f5_local1 = 3 - arg0:GetMapHitRadius(TARGET_SELF)
    local f5_local2 = 0
    local f5_local3 = 0
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f5_local0, TARGET_ENE_0, f5_local1, f5_local2, f5_local3, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function ZonbieCrow_Dagger_Act04(arg0, goals, _)
    local f6_local0 = 1600
    local f6_local1 = 3 - arg0:GetMapHitRadius(TARGET_SELF)
    local f6_local2 = 0
    local f6_local3 = 0
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f6_local0, TARGET_ENE_0, f6_local1, f6_local2, f6_local3, 0, 0)
    local f6_local4 = goals:AddSubGoal(GOAL_COMMON_LeaveTarget, 0.5, TARGET_ENE_0, -999, TARGET_ENE_0, true, 0)
    f6_local4:SetLifeEndSuccess(true)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function ZonbieCrow_Dagger_Act05(arg0, goals, _)
    local f7_local0 = 12.8 - arg0:GetMapHitRadius(TARGET_SELF)
    local f7_local1 = 0
    local f7_local2 = 12.8 - arg0:GetMapHitRadius(TARGET_SELF) + 3
    local f7_local3 = 100
    local f7_local4 = 0
    local f7_local5 = 2
    local f7_local6 = 5
    Approach_Act_Flex(arg0, goals, f7_local0, f7_local1, f7_local2, f7_local3, f7_local4, f7_local5, f7_local6)
    local f7_local7 = 3000
    local f7_local8 = 3 - arg0:GetMapHitRadius(TARGET_SELF)
    local f7_local9 = 0
    local f7_local10 = 0
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f7_local7, TARGET_ENE_0, f7_local8, f7_local9, f7_local10, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function ZonbieCrow_Dagger_Act06(arg0, goals, _)
    local f8_local0 = 5.7 - arg0:GetMapHitRadius(TARGET_SELF)
    local f8_local1 = 0
    local f8_local2 = 5.7 - arg0:GetMapHitRadius(TARGET_SELF) + 3
    local f8_local3 = 100
    local f8_local4 = 0
    local f8_local5 = 2
    local f8_local6 = 5
    Approach_Act_Flex(arg0, goals, f8_local0, f8_local1, f8_local2, f8_local3, f8_local4, f8_local5, f8_local6)
    local f8_local7 = 3001
    local f8_local8 = 3 - arg0:GetMapHitRadius(TARGET_SELF)
    local f8_local9 = 0
    local f8_local10 = 0
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f8_local7, TARGET_ENE_0, f8_local8, f8_local9, f8_local10, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function ZonbieCrow_Dagger_Act07(arg0, goals, _)
    local f9_local0 = 7.9 - arg0:GetMapHitRadius(TARGET_SELF)
    local f9_local1 = 0
    local f9_local2 = 7.9 - arg0:GetMapHitRadius(TARGET_SELF) + 3
    local f9_local3 = 100
    local f9_local4 = 0
    local f9_local5 = 2
    local f9_local6 = 5
    Approach_Act_Flex(arg0, goals, f9_local0, f9_local1, f9_local2, f9_local3, f9_local4, f9_local5, f9_local6)
    local f9_local7 = 3002
    local f9_local8 = 3 - arg0:GetMapHitRadius(TARGET_SELF)
    local f9_local9 = 0
    local f9_local10 = 0
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f9_local7, TARGET_ENE_0, f9_local8, f9_local9, f9_local10, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function ZonbieCrow_Dagger_Act08(arg0, goals, _)
    local f10_local0 = 3.5 - arg0:GetMapHitRadius(TARGET_SELF)
    local f10_local1 = 0
    local f10_local2 = 3.5 - arg0:GetMapHitRadius(TARGET_SELF) + 3
    local f10_local3 = 100
    local f10_local4 = 0
    local f10_local5 = 2
    local f10_local6 = 5
    Approach_Act_Flex(arg0, goals, f10_local0, f10_local1, f10_local2, f10_local3, f10_local4, f10_local5, f10_local6)
    local action0 = 3003
    local action1 = 3004
    local f10_local7 = 3005
    local success_distance0 = 3.3 - arg0:GetMapHitRadius(TARGET_SELF) + 1
    local success_distance1 = 3.4 - arg0:GetMapHitRadius(TARGET_SELF) + 1
    local f10_local8 = 3 - arg0:GetMapHitRadius(TARGET_SELF)
    local turn_time_before = 0
    local front_decision_angle = 0
    if arg0:GetRandam_Int(1, 100) <= 40 then
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle, 0, 0)
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, action1, TARGET_ENE_0, f10_local8, 0, 0)
    else
        goals:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, success_distance0, turn_time_before, front_decision_angle, 0, 0)
        goals:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, success_distance1, 0, 0)
        goals:AddSubGoal(GOAL_COMMON_ComboFinal, 10, f10_local7, TARGET_ENE_0, f10_local8, 0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function ZonbieCrow_Dagger_Act09(arg0, goals, _)
    local f11_local0 = 4 - arg0:GetMapHitRadius(TARGET_SELF)
    local f11_local1 = 0
    local f11_local2 = 4 - arg0:GetMapHitRadius(TARGET_SELF) + 3
    local f11_local3 = 100
    local f11_local4 = 0
    local f11_local5 = 2
    local f11_local6 = 5
    Approach_Act_Flex(arg0, goals, f11_local0, f11_local1, f11_local2, f11_local3, f11_local4, f11_local5, f11_local6)
    local f11_local7 = 3006
    local f11_local8 = 3 - arg0:GetMapHitRadius(TARGET_SELF)
    local f11_local9 = 0
    local f11_local10 = 0
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f11_local7, TARGET_ENE_0, f11_local8, f11_local9, f11_local10, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function ZonbieCrow_Dagger_Act20(_, goals, _)
    goals:AddSubGoal(GOAL_COMMON_Turn, 2, TARGET_ENE_0, 90, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ZonbieCrow_Dagger_Act21(arg0, goals, _)
    if arg0:HasSpecialEffectId(TARGET_SELF, 5405) == false then
        local f13_local0 = goals:AddSubGoal(GOAL_COMMON_SidewayMove, arg0:GetRandam_Float(2, 3), TARGET_ENE_0, arg0:GetRandam_Int(0, 1), arg0:GetRandam_Int(30, 60), true, true, -1)
        f13_local0:SetTargetRange(0, 6, 999)
    else
        goals:AddSubGoal(GOAL_COMMON_SidewayMove, arg0:GetRandam_Float(2, 3), TARGET_ENE_0, arg0:GetRandam_Int(0, 1), arg0:GetRandam_Int(30, 60), true, true, -1)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ZonbieCrow_Dagger_Act22(actor, goals, _)
    local distance = actor:GetDist(TARGET_ENE_0)
    if actor:HasSpecialEffectId(TARGET_SELF, 5405) == false then
        local f14_local0 = goals:AddSubGoal(GOAL_COMMON_LeaveTarget, 10, TARGET_ENE_0, distance + 1, TARGET_ENE_0, true, -1)
        f14_local0:SetTargetRange(0, 6, 999)
    else
        goals:AddSubGoal(GOAL_COMMON_LeaveTarget, 10, TARGET_ENE_0, distance + 1, TARGET_ENE_0, true, -1)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Goal.Update = function (arg0, arg1, arg2)
    return Update_Default_NoSubGoal(arg0, arg1, arg2)
end

Goal.Terminate = function (_, _, _)
end

Goal.Interrupt = function (_, arg1, goals)
    if arg1:IsLadderAct(TARGET_SELF) then
        return false
    elseif arg1:HasSpecialEffectId(TARGET_SELF, 5405) == true then
        return false
    elseif arg1:IsInterupt(INTERUPT_TargetOutOfRange) and arg1:IsTargetOutOfRangeInterruptSlot(0) then
        goals:ClearSubGoal()
        ZonbieCrow_Dagger_Act04(arg1, goals, paramTbl)
        return true
    elseif arg1:IsInterupt(INTERUPT_Damaged) then
        goals:ClearSubGoal()
        ZonbieCrow_Dagger_Act04(arg1, goals, paramTbl)
        return true
    else
        return false
    end
end

function ZonbieCrow_Dagger_ActAfter_AdjustSpace(_, goals, _)
    goals:AddSubGoal(ZonbieCrow_Dagger_AfterAttackAct, 10)
end

RegisterTableGoal(ZonbieCrow_Dagger_AfterAttackAct, "ZonbieCrow_Dagger_AfterAttackAct")
REGISTER_GOAL_NO_SUB_GOAL(ZonbieCrow_Dagger_AfterAttackAct, true)

Goal.Activate = function (_, actor, goals)
    actor:GetDist(TARGET_ENE_0)
    actor:GetToTargetAngle(TARGET_ENE_0)
    actor:SetStringIndexedNumber("DistMin_AAA", -999)
    actor:SetStringIndexedNumber("DistMax_AAA", 999)
    actor:SetStringIndexedNumber("BaseDir_AAA", AI_DIR_TYPE_F)
    actor:SetStringIndexedNumber("Angle_AAA", 180)
    actor:SetStringIndexedNumber("DistMin_Inter_AAA", 1)
    actor:SetStringIndexedNumber("DistMax_Inter_AAA", 10)
    actor:SetStringIndexedNumber("BaseAng_Inter_AAA", 0)
    actor:SetStringIndexedNumber("Ang_Inter_AAA", 180)
    if actor:HasSpecialEffectId(TARGET_SELF, 5405) == true then
        actor:SetStringIndexedNumber("Odds_Guard_AAA", 0)
        actor:SetStringIndexedNumber("Odds_NoAct_AAA", 60)
        actor:SetStringIndexedNumber("Odds_Back_AAA", 10)
        actor:SetStringIndexedNumber("Odds_Backstep_AAA", 10)
        actor:SetStringIndexedNumber("Odds_Sidestep_AAA", 20)
    else
        actor:SetStringIndexedNumber("Odds_NoAct_AAA", 40)
        actor:SetStringIndexedNumber("Odds_Back_AAA", 20)
        actor:SetStringIndexedNumber("Odds_BackAndSide_AAA", 20)
    end
    goals:AddSubGoal(GOAL_COMMON_AfterAttackAct, 10)
end

Goal.Update = function (arg0, arg1, arg2)
    return Update_Default_NoSubGoal(arg0, arg1, arg2)
end
