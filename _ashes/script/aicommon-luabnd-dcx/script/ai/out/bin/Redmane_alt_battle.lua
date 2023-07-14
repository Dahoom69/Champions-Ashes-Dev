RegisterTableGoal(GOAL_Redmane_Alt_Battle, "Redmane_alt")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_Redmane_Alt_Battle, true)
Goal.Initialize = function (arg0, actor, goals, arg3)
    return 
end

Goal.Activate = function (arg0, actor, goals)
    local probabilities = {}
    local acts = {}
    local localUnknown = {}
    Common_Clear_Param(probabilities, acts, localUnknown)
    Init_Pseudo_Global(actor, goals)
    actor:SetStringIndexedNumber("Dist_SideStep", 2.7 + 1)
    actor:SetStringIndexedNumber("Dist_BackStep", 2.5 + 1)
    local distance = actor:GetDist(TARGET_ENE_0)
    local distanceY = actor:GetDistYSigned(TARGET_ENE_0)
    local getthinkAttrDoAdmirerTeamEffectivity = actor:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer)
    local getRandom1 = actor:GetRandam_Int(1, 100)
    local getRandom2 = actor:GetRandam_Int(1, 100)
    local getNpcThinkParamID_8 = 0
    local GetNpcThinkParamID_9 = 0
    local GetNpcThinkParamID_10 = 0
    local GetNpcThinkParamID_11 = 0
    local suicideMultiplier = 0
    if actor:GetNpcThinkParamID() == 144000 or actor:GetNpcThinkParamID() == 144001 then
        suicideMultiplier = 1
        if actor:GetHpRate(TARGET_SELF) <= 0.6 then
            suicideMultiplier = 2
        end
    elseif actor:GetNpcThinkParamID() == 110008 then
        getNpcThinkParamID_8 = 1
    elseif actor:GetNpcThinkParamID() == 110007 then
        GetNpcThinkParamID_9 = 1
    elseif actor:GetNpcThinkParamID() == 110006 then
        GetNpcThinkParamID_10 = 1
        GetNpcThinkParamID_9 = 1
    elseif actor:GetNpcThinkParamID() == 110009 or actor:GetNpcThinkParamID() == 110085 or actor:GetNpcThinkParamID() == 144001 then
        GetNpcThinkParamID_11 = 1
    end
    if actor:GetEventRequest(0) == 100 then
        probabilities[17] = 100
    elseif actor:GetEventRequest(1) == 100 then
        probabilities[20] = 100
    elseif getthinkAttrDoAdmirerTeamEffectivity == 1 and actor:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Kankyaku then
        probabilities[11] = 60
        probabilities[12] = 40
    elseif getthinkAttrDoAdmirerTeamEffectivity == 1 and actor:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Torimaki then
        probabilities[1] = 3
        probabilities[4] = 3
        probabilities[7] = 6
        probabilities[8] = 3
        probabilities[11] = 50
        probabilities[12] = 35
    elseif actor:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 240) then
        probabilities[13] = 100
    elseif getNpcThinkParamID_8 == 1 and 8 <= actor:GetAttackPassedTime(3007) and 5 - actor:GetMapHitRadius(TARGET_SELF) <= distance and getRandom1 <= 65 then
        probabilities[6] = 100
    elseif GetNpcThinkParamID_10 == 1 and 13 - actor:GetMapHitRadius(TARGET_SELF) + math.abs(distanceY) <= distance and distanceY < -2 then
        probabilities[16] = 100
    elseif GetNpcThinkParamID_10 == 1 and 5 - actor:GetMapHitRadius(TARGET_SELF) <= distance and distanceY < -2 then
        probabilities[15] = 100
    elseif GetNpcThinkParamID_10 == 1 and 5 - actor:GetMapHitRadius(TARGET_SELF) <= distance and getRandom1 <= 85 then
        probabilities[9] = 100
    elseif GetNpcThinkParamID_9 == 1 and 8 <= actor:GetAttackPassedTime(3011) and 5 - actor:GetMapHitRadius(TARGET_SELF) <= distance and getRandom1 <= 65 then
        probabilities[9] = 100
    elseif actor:GetNpcThinkParamID() == 110085 and 5.5 <= distance then
        probabilities[18] = 100
    elseif GetNpcThinkParamID_11 == 1 and actor:HasSpecialEffectId(TARGET_ENE_0, 3151) == false and 5 - actor:GetMapHitRadius(TARGET_SELF) <= distance and getRandom1 <= 30 and 10 <= actor:GetAttackPassedTime(3015) then
        probabilities[17] = 100
    elseif 10 <= distance then
        probabilities[1] = 15
        probabilities[2] = 40
        probabilities[4] = 5
        probabilities[7] = 10
        probabilities[8] = 15
        probabilities[14] = 15
        probabilities[20] = 20 * suicideMultiplier
        probabilities[21] = 10 * suicideMultiplier
    elseif 5.5 <= distance then
        probabilities[1] = 20
        probabilities[2] = 30
        probabilities[4] = 10
        probabilities[7] = 15
        probabilities[8] = 10
        probabilities[14] = 15
        probabilities[20] = 10 * suicideMultiplier
        probabilities[21] = 20 * suicideMultiplier
    elseif 3 <= distance then
        probabilities[1] = 15
        probabilities[2] = 15
        probabilities[4] = 10
        probabilities[7] = 20
        probabilities[8] = 20
        probabilities[14] = 20
        probabilities[20] = 0 * suicideMultiplier
        probabilities[21] = 30 * suicideMultiplier
    elseif 1 <= distance then
        probabilities[1] = 20
        probabilities[4] = 10
        probabilities[7] = 30
        probabilities[8] = 20
        probabilities[14] = 20
        probabilities[20] = 0 * suicideMultiplier
        probabilities[21] = 10 * suicideMultiplier
    else
        probabilities[1] = 20
        probabilities[4] = 15
        probabilities[7] = 25
        probabilities[8] = 20
        probabilities[14] = 20
        probabilities[20] = 0 * suicideMultiplier
        probabilities[21] = 0 * suicideMultiplier
    end
    acts[1] = REGIST_FUNC(actor, goals, Redmane_Act01)
    acts[2] = REGIST_FUNC(actor, goals, Redmane_Act02)
    acts[4] = REGIST_FUNC(actor, goals, Redmane_Act04)
    acts[5] = REGIST_FUNC(actor, goals, Redmane_Act05)
    acts[6] = REGIST_FUNC(actor, goals, Redmane_Act06)
    acts[7] = REGIST_FUNC(actor, goals, Redmane_Act07)
    acts[8] = REGIST_FUNC(actor, goals, Redmane_Act08)
    acts[9] = REGIST_FUNC(actor, goals, Redmane_Act09)
    acts[11] = REGIST_FUNC(actor, goals, Redmane_Act11)
    acts[12] = REGIST_FUNC(actor, goals, Redmane_Act12)
    acts[13] = REGIST_FUNC(actor, goals, Redmane_Act13)
    acts[14] = REGIST_FUNC(actor, goals, Redmane_Act14)
    acts[15] = REGIST_FUNC(actor, goals, Redmane_Act15)
    acts[16] = REGIST_FUNC(actor, goals, Redmane_Act16)
    acts[17] = REGIST_FUNC(actor, goals, Redmane_Act17)
    acts[18] = REGIST_FUNC(actor, goals, Redmane_Act18)
    acts[20] = REGIST_FUNC(actor, goals, Redmane_Act20)
    acts[21] = REGIST_FUNC(actor, goals, Redmane_Act21)
    Common_Battle_Activate(actor, goals, probabilities, acts, REGIST_FUNC(actor, goals, Redmane_ActAfter_AdjustSpace), localUnknown)
    return 
end

function Redmane_Act01(arg0, actor, goals)
    Approach_Act_Flex(arg0, actor, 3.2 - arg0:GetMapHitRadius(TARGET_SELF), 3.2 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 3.2 - arg0:GetMapHitRadius(TARGET_SELF) + 10, 50, 0, 4, 8)
    local action0 = 3000
    local action1 = 3001
    local MaxDist2 = 2.4 - arg0:GetMapHitRadius(TARGET_SELF) + 1
    local MaxDist = 5 - arg0:GetMapHitRadius(TARGET_SELF)
    local spinTime = 0
    local frontAngle = 0
    local getRandom1 = arg0:GetRandam_Int(1, 100)
    if getRandom1 <= 35 then
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, MaxDist, spinTime, frontAngle, 0, 0)
    elseif getRandom1 <= 75 then
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, MaxDist2, spinTime, frontAngle, 0, 0)
        actor:AddSubGoal(GOAL_COMMON_ComboFinal, 10, action1, TARGET_ENE_0, MaxDist, 0, 0)
    else
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, MaxDist2, spinTime, frontAngle, 0, 0)
        actor:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, action1, TARGET_ENE_0, 3.9 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 0, 0)
        actor:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, MaxDist, 0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Redmane_Act02(arg0, actor, goals)
    Approach_Act_Flex(arg0, actor, 7 - arg0:GetMapHitRadius(TARGET_SELF), 7 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 7 - arg0:GetMapHitRadius(TARGET_SELF) + 10, 50, 0, 4, 8)
    local action0 = 3003
    local MaxDist = 5 - arg0:GetMapHitRadius(TARGET_SELF)
    local spinTime = 0
    local frontAngle = 0
    if arg0:GetRandam_Int(1, 100) <= 90 then
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, MaxDist, spinTime, frontAngle, 0, 0)
    else
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, getRandomInt, TARGET_ENE_0, 2.4 - arg0:GetMapHitRadius(TARGET_SELF) + 1, spinTime, frontAngle, 0, 0)
        actor:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, MaxDist, 0, 0)
    end
    return 
end

function Redmane_Act04(arg0, actor, goals)
    Approach_Act_Flex(arg0, actor, 3.5 - arg0:GetMapHitRadius(TARGET_SELF), 3.5 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 3.5 - arg0:GetMapHitRadius(TARGET_SELF) + 10, 50, 0, 4, 8)
    local getRandomInt = arg0:GetRandam_Int(1, 100)
    actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3005, TARGET_ENE_0, 5 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Redmane_Act05(arg0, actor, goals)
    Approach_Act_Flex(arg0, actor, 2.3 - arg0:GetMapHitRadius(TARGET_SELF), 2.3 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 2.3 - arg0:GetMapHitRadius(TARGET_SELF) + 10, 50, 0, 4, 8)
    local getRandomInt = arg0:GetRandam_Int(1, 100)
    actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3006, TARGET_ENE_0, 5 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Redmane_Act06(arg0, actor, goals)
    Approach_Act_Flex(arg0, actor, 13 - arg0:GetMapHitRadius(TARGET_SELF), 13 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 13 - arg0:GetMapHitRadius(TARGET_SELF) + 10, 50, 0, 4, 8)
    local getRandomInt = arg0:GetRandam_Int(1, 100)
    actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3007, TARGET_ENE_0, 5 - arg0:GetMapHitRadius(TARGET_SELF), -1, 45, 0, 0)
    local localActor = actor:AddSubGoal(GOAL_COMMON_Wait, arg0:GetRandam_Float(1.4, 2.2), TARGET_ENE_0, 0, 0, 0)
    localActor:SetTargetRange(0, 4, 999)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Redmane_Act07(arg0, actor, goals)
    Approach_Act_Flex(arg0, actor, 3.5 - arg0:GetMapHitRadius(TARGET_SELF), 3.5 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 3.5 - arg0:GetMapHitRadius(TARGET_SELF) + 10, 50, 0, 4, 8)
    local action0 = 3008
    local MaxDist = 5 - arg0:GetMapHitRadius(TARGET_SELF)
    local spinTime = 0
    local frontAngle = 0
    if arg0:GetRandam_Int(1, 100) <= 30 then
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, MaxDist, spinTime, frontAngle, 0, 0)
    else
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, 3.5 - arg0:GetMapHitRadius(TARGET_SELF) + 1, spinTime, frontAngle, 0, 0)
        actor:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, MaxDist, 0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Redmane_Act08(arg0, actor, goals)
    Approach_Act_Flex(arg0, actor, 2.2 - arg0:GetMapHitRadius(TARGET_SELF), 2.2 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 2.2 - arg0:GetMapHitRadius(TARGET_SELF) + 10, 50, 0, 4, 8)
    local action0 = 3009
    local MaxDist = 5 - arg0:GetMapHitRadius(TARGET_SELF)
    local spinTime = 0
    local frontAngle = 0
    if arg0:GetRandam_Int(1, 100) <= 30 then
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, MaxDist, spinTime, frontAngle, 0, 0)
    else
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, 3.5 - arg0:GetMapHitRadius(TARGET_SELF) + 1, spinTime, frontAngle, 0, 0)
        actor:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, MaxDist, 0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Redmane_Act09(arg0, actor, goals)
    Approach_Act_Flex(arg0, actor, 13 - arg0:GetMapHitRadius(TARGET_SELF), 13 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 13 - arg0:GetMapHitRadius(TARGET_SELF) + 10, 50, 0, 4, 8)
    local getRandomInt = arg0:GetRandam_Int(1, 100)
    actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3011, TARGET_ENE_0, 5 - arg0:GetMapHitRadius(TARGET_SELF), -1, 45, 0, 0)
    local localActor = actor:AddSubGoal(GOAL_COMMON_Wait, arg0:GetRandam_Float(1.4, 2.2), TARGET_ENE_0, 0, 0, 0)
    localActor:SetTargetRange(0, 4, 999)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Redmane_Act11(arg0, actor, goals)
    local getDist = arg0:GetDist(TARGET_ENE_0)
    local localDistance = 10
    if localDistance <= arg0:GetDist(TARGET_ENE_0) then
        Approach_Act(arg0, actor, localDistance, 12, 0, 3)
    end
    actor:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, 10, TARGET_ENE_0, true, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Redmane_Act12(arg0, actor, goals)
    local action0 = -1
    if arg0:GetRandam_Int(1, 100) <= 0 then
        action0 = 9910
    end
    actor:AddSubGoal(GOAL_COMMON_SidewayMove, 4, TARGET_ENE_0, arg0:GetRandam_Int(0, 1), arg0:GetRandam_Int(30, 45), true, true, action0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Redmane_Act13(arg0, actor, goals)
    actor:AddSubGoal(GOAL_COMMON_Turn, 3, TARGET_ENE_0, arg0:GetRandam_Int(15, 20))
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Redmane_Act14(arg0, actor, goals)
    Approach_Act_Flex(arg0, actor, 3.2 - arg0:GetMapHitRadius(TARGET_SELF), 3.2 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 3.2 - arg0:GetMapHitRadius(TARGET_SELF) + 10, 50, 0, 4, 8)
    local action0 = 3000
    local MaxDist = 5 - arg0:GetMapHitRadius(TARGET_SELF)
    local spinTime = 0
    local frontAngle = 0
    if arg0:GetRandam_Int(1, 100) <= 20 then
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, MaxDist, spinTime, frontAngle, 0, 0)
    else
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, action0, TARGET_ENE_0, 2.2 - arg0:GetMapHitRadius(TARGET_SELF) + 1, spinTime, frontAngle, 0, 0)
        actor:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3009, TARGET_ENE_0, MaxDist, 0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Redmane_Act15(arg0, actor, goals)
    actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3011, TARGET_ENE_0, 999, -1, 45, 0, 0)
    local localActorSubgoal = actor:AddSubGoal(GOAL_COMMON_Wait, arg0:GetRandam_Float(1.4, 2.2), TARGET_ENE_0, 0, 0, 0)
    localActorSubgoal:SetTargetRange(0, 4, 999)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Redmane_Act16(arg0, actor, goals)
    local localActorSubgoal = actor:AddSubGoal(GOAL_COMMON_Wait, arg0:GetRandam_Float(1.4, 2.2), TARGET_ENE_0, 0, 0, 0)
    localActorSubgoal:SetTargetRange(0, 4, 999)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Redmane_Act17(arg0, actor, goals)
    Approach_Act_Flex(arg0, actor, 13 - arg0:GetMapHitRadius(TARGET_SELF), 13 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 13 - arg0:GetMapHitRadius(TARGET_SELF) + 10, 50, 0, 4, 8)
    local upAttackAngle = -1
    local downAttackAngle = 45
    actor:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3015, TARGET_ENE_0, 5 - arg0:GetMapHitRadius(TARGET_SELF), upAttackAngle, downAttackAngle, upAttackAngle, downAttackAngle)
    local localActorSubgoal = actor:AddSubGoal(GOAL_COMMON_Wait, arg0:GetRandam_Float(1.4, 2.2), TARGET_ENE_0, 0, 0, 0)
    localActorSubgoal:SetTargetRange(0, 4, 999)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Redmane_Act18(arg0, actor, goals)
    local action0 = 3015
    if arg0:GetDistYSigned(TARGET_ENE_0) < -5 then
        action0 = 3016
    end
    local upAttackAngle = -1
    local downAttackAngle = 0
    actor:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, action0, TARGET_ENE_0, 50, upAttackAngle, downAttackAngle, upAttackAngle, downAttackAngle)
    local getaddSubgoalRandom = actor:AddSubGoal(GOAL_COMMON_Wait, arg0:GetRandam_Float(1.5, 3.5), TARGET_ENE_0, 0, 0, 0)
    getaddSubgoalRandom:SetTargetRange(0, 4, 999)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Redmane_Act20(arg0, actor, goals)
    Approach_Act_Flex(arg0, actor, 20 - arg0:GetMapHitRadius(TARGET_SELF), 20 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 20 - arg0:GetMapHitRadius(TARGET_SELF) + 10, 50, 100, 4, 8)
    local getRandomInt = arg0:GetRandam_Int(1, 100)
    actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 20005, TARGET_ENE_0, 999, -1, 90, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Redmane_Act21(arg0, actor, goals)
    Approach_Act_Flex(arg0, actor, 15 - arg0:GetMapHitRadius(TARGET_SELF), 15 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 15 - arg0:GetMapHitRadius(TARGET_SELF) + 10, 50, 100, 4, 8)
    local getRandomInt = arg0:GetRandam_Int(1, 100)
    actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 20006, TARGET_ENE_0, 999, -1, 90, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Redmane_ActAfter_AdjustSpace(arg0, actor, goals)
    actor:AddSubGoal(GOAL_Redmane_Alt_AfterAttackAct, 10)
    return 
end

Goal.Update = function (arg0, actor, goals)
    return Update_Default_NoSubGoal(arg0, actor, goals)
end

Goal.Terminate = function (arg0, actor, goals)
    return 
end

Goal.Interrupt = function (arg0, actor, goals)
    if actor:IsInterupt(INTERUPT_Damaged) then
        local getDistanceY = actor:GetDistYSigned(TARGET_ENE_0)
        if (actor:GetNpcThinkParamID() == 110004 or actor:GetNpcThinkParamID() == 110006) and 13 - actor:GetMapHitRadius(TARGET_SELF) + math.abs(getDistanceY) <= actor:GetDist(TARGET_ENE_0) and getDistanceY < -2 then
            goals:ClearSubGoal()
            Approach_Act_Flex(actor, goals, 13 - actor:GetMapHitRadius(TARGET_SELF) - 1, 13 - actor:GetMapHitRadius(TARGET_SELF) + 0, 13 - actor:GetMapHitRadius(TARGET_SELF) + 10, 100, 0, 4, 8)
            return true
        end
    end
    if actor:IsInterupt(INTERUPT_TargetOutOfRange) and actor:IsTargetOutOfRangeInterruptSlot(0) then
        goals:ClearSubGoal()
        return true
    else
        return false
    end
end

RegisterTableGoal(GOAL_Redmane_Alt_AfterAttackAct, "Redmane_Alt_AfterAttackAct")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_Redmane_Alt_AfterAttackAct, true)
Goal.Activate = function (arg0, actor, goals)
    local getDistance = actor:GetDist(TARGET_ENE_0)
    local getRandomInt = actor:GetRandam_Int(1, 100)
    local getRandomfloat = actor:GetRandam_Float(2.5, 4.5)
    local distance = actor:GetRandam_Int(0, 1)
    local angle = actor:GetRandam_Int(30, 45)
    local lifeSec = actor:GetRandam_Float(2.5, 4.5)
    local getRandom1 = getDistance + actor:GetRandam_Float(2.5, 4.5)
    local action0 = -1
    if actor:GetRandam_Int(1, 100) <= 0 then
        action0 = 9910
    end
    if actor:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Kankyaku then
        if getDistance <= 6 then
            goals:AddSubGoal(GOAL_COMMON_LeaveTarget, lifeSec, TARGET_ENE_0, 8, TARGET_ENE_0, true, action0)
        else
            goals:AddSubGoal(GOAL_COMMON_SidewayMove, getRandomfloat, TARGET_ENE_0, distance, angle, true, true, action0)
        end
    elseif actor:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Torimaki then
        if getDistance <= 6 then
            goals:AddSubGoal(GOAL_COMMON_LeaveTarget, lifeSec, TARGET_ENE_0, 8, TARGET_ENE_0, true, action0)
        else
            goals:AddSubGoal(GOAL_COMMON_SidewayMove, getRandomfloat, TARGET_ENE_0, distance, angle, true, true, action0)
        end
    elseif 6 <= getDistance then
        if getRandomInt <= 50 then
            goals:AddSubGoal(GOAL_COMMON_SidewayMove, getRandomfloat, TARGET_ENE_0, distance, angle, true, true, action0)
        else
            goals:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, 5.5, TARGET_SELF, false, -1)
        end
    elseif 4 <= getDistance then
        if getRandomInt <= 55 then
            goals:AddSubGoal(GOAL_COMMON_SidewayMove, getRandomfloat, TARGET_ENE_0, distance, angle, true, true, action0)
        end
    elseif 2 <= getDistance then
        if getRandomInt <= 40 then
            goals:AddSubGoal(GOAL_COMMON_SidewayMove, getRandomfloat, TARGET_ENE_0, distance, angle, true, true, action0)
        elseif getRandomInt <= 55 then
            goals:AddSubGoal(GOAL_COMMON_LeaveTarget, lifeSec, TARGET_ENE_0, getRandom1, TARGET_ENE_0, true, action0)
        end
    elseif 0.5 <= getDistance then
        if getRandomInt <= 15 then
            goals:AddSubGoal(GOAL_COMMON_SidewayMove, getRandomfloat, TARGET_ENE_0, distance, angle, true, true, action0)
        elseif getRandomInt <= 35 then
            goals:AddSubGoal(GOAL_COMMON_LeaveTarget, lifeSec, TARGET_ENE_0, getRandom1, TARGET_ENE_0, true, action0)
        end
    elseif getRandomInt <= 0 then
        goals:AddSubGoal(GOAL_COMMON_SidewayMove, getRandomfloat, TARGET_ENE_0, distance, angle, true, true, action0)
    elseif getRandomInt <= 40 then
        goals:AddSubGoal(GOAL_COMMON_LeaveTarget, lifeSec, TARGET_ENE_0, getRandom1, TARGET_ENE_0, true, action0)
    end
    return 
end

Goal.Update = function (arg0, actor, goals)
    return Update_Default_NoSubGoal(arg0, actor, goals)
end

return 
