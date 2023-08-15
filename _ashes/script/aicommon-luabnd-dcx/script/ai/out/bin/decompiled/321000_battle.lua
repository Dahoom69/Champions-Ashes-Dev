RegisterTableGoal(GOAL_PoisonAngleInsect_321000_Battle, "GOAL_PoisonAngleInsect321000_Battle")

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
    actor:GetRandam_Int(1, 100)
    actor:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer)
    actor:GetEventRequest()
    if actor:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 240) then
        probabilities[20] = 100
    else
        probabilities[1] = 50
        probabilities[2] = 50
    end
    acts[1] = REGIST_FUNC(actor, goals, PoisonAngleInsect321000_Act01)
    acts[2] = REGIST_FUNC(actor, goals, PoisonAngleInsect321000_Act02)
    acts[10] = REGIST_FUNC(actor, goals, PoisonAngleInsect321000_Act10)
    acts[11] = REGIST_FUNC(actor, goals, PoisonAngleInsect321000_Act11)
    acts[20] = REGIST_FUNC(actor, goals, PoisonAngleInsect321000_Act20)
    Common_Battle_Activate(actor, goals, probabilities, acts, REGIST_FUNC(actor, goals, PoisonAngleInsect321000_ActAfter_AdjustSpace), f2_local0)
end

function PoisonAngleInsect321000_Act01(arg0, goals, _)
    local f3_local0 = 2 - arg0:GetMapHitRadius(TARGET_SELF)
    local f3_local1 = 999
    local f3_local2 = 999
    local f3_local3 = 0
    local f3_local4 = 0
    local f3_local5 = 10
    local f3_local6 = 0
    Approach_Act_Flex(arg0, goals, f3_local0, f3_local1, f3_local2, f3_local3, f3_local4, f3_local5, f3_local6)
    local f3_local7 = 3000
    local f3_local8 = 2 - arg0:GetMapHitRadius(TARGET_SELF)
    local f3_local9 = 0
    local f3_local10 = 0
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f3_local7, TARGET_ENE_0, f3_local8, f3_local9, f3_local10, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PoisonAngleInsect321000_Act02(arg0, goals, _)
    local f4_local0 = 10 - arg0:GetMapHitRadius(TARGET_SELF)
    local f4_local1 = 999
    local f4_local2 = 999
    local f4_local3 = 0
    local f4_local4 = 0
    local f4_local5 = 10
    local f4_local6 = 0
    Approach_Act_Flex(arg0, goals, f4_local0, f4_local1, f4_local2, f4_local3, f4_local4, f4_local5, f4_local6)
    local f4_local7 = 3001
    local f4_local8 = 10 - arg0:GetMapHitRadius(TARGET_SELF)
    local f4_local9 = 0
    local f4_local10 = 0
    goals:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, f4_local7, TARGET_ENE_0, f4_local8, f4_local9, f4_local10, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function PoisonAngleInsect321000_Act10(arg0, goals, _)
    local f5_local0 = 12
    local f5_local1 = 0
    if arg0:GetDist(TARGET_ENE_0) >= 10 then
        Approach_Act(arg0, goals, 10, f5_local0, f5_local1, 3)
    end
    goals:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, 10, TARGET_ENE_0, true, -1)
end

function PoisonAngleInsect321000_Act11(actor, goals, _)
    local random = actor:GetRandam_Int(0, 1)
    goals:AddSubGoal(GOAL_COMMON_SidewayMove, 4, TARGET_ENE_0, random, actor:GetRandam_Int(30, 45), true, true, -1)
end

function PoisonAngleInsect321000_Act20(arg0, goals, _)
    goals:AddSubGoal(GOAL_COMMON_Turn, 2, TARGET_ENE_0, arg0:GetRandam_Int(15, 20))
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function PoisonAngleInsect321000_ActAfter_AdjustSpace(_, goals, _)
    goals:AddSubGoal(GOAL_PoisonAngleInsect_321000_AfterAttackAct, 10)
end

Goal.Update = function (arg0, arg1, arg2)
    return Update_Default_NoSubGoal(arg0, arg1, arg2)
end

Goal.Terminate = function (_, _, _)
end

Goal.Interrupt = function (_, _, _)
end

RegisterTableGoal(GOAL_PoisonAngleInsect_321000_AfterAttackAct, "GOAL_PoisonAngleInsect_321000_AfterAttackAct")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_PoisonAngleInsect_321000_AfterAttackAct, true)

Goal.Activate = function (_, actor, goals)
    local distance = actor:GetDist(TARGET_ENE_0)
    actor:GetToTargetAngle(TARGET_ENE_0)
    actor:SetStringIndexedNumber("DistMin_AAA", -999)
    actor:SetStringIndexedNumber("DistMax_AAA", 6)
    actor:SetStringIndexedNumber("BaseDir_AAA", AI_DIR_TYPE_F)
    actor:SetStringIndexedNumber("Angle_AAA", 80)
    actor:SetStringIndexedNumber("DistMin_Inter_AAA", -999)
    actor:SetStringIndexedNumber("DistMax_Inter_AAA", 6)
    actor:SetStringIndexedNumber("BaseAng_Inter_AAA", 0)
    actor:SetStringIndexedNumber("Ang_Inter_AAA", 80)
    actor:SetStringIndexedNumber("BackAndSide_BackDist_AAA", -10)
    if distance >= 5 then
        actor:SetStringIndexedNumber("Odds_NoAct_AAA", 20)
        actor:SetStringIndexedNumber("Odds_BackAndSide_AAA", 10)
    elseif distance >= 2 then
        actor:SetStringIndexedNumber("Odds_NoAct_AAA", 40)
        actor:SetStringIndexedNumber("Odds_BackAndSide_AAA", 40)
        actor:SetStringIndexedNumber("Odds_Back_AAA", 20)
    else
        actor:SetStringIndexedNumber("Odds_NoAct_AAA", 30)
        actor:SetStringIndexedNumber("Odds_BackAndSide_AAA", 40)
        actor:SetStringIndexedNumber("Odds_Back_AAA", 30)
    end
    goals:AddSubGoal(GOAL_COMMON_AfterAttackAct, 10)
end

Goal.Update = function (arg0, arg1, arg2)
    return Update_Default_NoSubGoal(arg0, arg1, arg2)
end
