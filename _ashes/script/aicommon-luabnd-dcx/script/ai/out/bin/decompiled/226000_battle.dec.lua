RegisterTableGoal(GOAL_Ballista226000_Battle, "GOAL_Ballista226000_Battle")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_Ballista226000_Battle, true)

Goal.Initialize = function (_, _, goals, _)
    goals:AddSubGoal(GOAL_COMMON_Wait, 2, TARGET_NONE, 0, 0, 0)
end

Goal.Activate = function (_, actor, goals)
    Init_Pseudo_Global(actor, goals)
    actor:SetStringIndexedNumber("Dist_SideStep", 0)
    actor:SetStringIndexedNumber("Dist_BackStep", 0)
    local probabilities = {}
    local acts = {}
    local f2_local0 = {}
    Common_Clear_Param(probabilities, acts, f2_local0)
    actor:GetDist(TARGET_ENE_0)
    actor:GetRandam_Int(1, 100)
    actor:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkattr_doAdmirer)
    actor:GetEventRequest()
    actor:GetDist(TARGET_ENE_0)
    if actor:IsInsideMsbRegion(TARGET_ENE_0, AI_DIR_TYPE_F, 0, 3802500) == true or actor:IsInsideMsbRegion(TARGET_ENE_0, AI_DIR_TYPE_F, 0, 3802501) == true or actor:IsInsideMsbRegion(TARGET_ENE_0, AI_DIR_TYPE_F, 0, 3802502) == true or actor:IsInsideMsbRegion(TARGET_ENE_0, AI_DIR_TYPE_F, 0, 3802503) == true or actor:IsEventFlag(13800200) == false then
        probabilities[4] = 100
    elseif actor:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 10) then
        probabilities[1] = 100
    else
        probabilities[3] = 100
    end
    acts[1] = REGIST_FUNC(actor, goals, Ballista_Act01)
    acts[2] = REGIST_FUNC(actor, goals, Ballista_Act02)
    acts[3] = REGIST_FUNC(actor, goals, Ballista_Act03)
    acts[4] = REGIST_FUNC(actor, goals, Ballista_Act04)
    Common_Battle_Activate(actor, goals, probabilities, acts, REGIST_FUNC(actor, goals, Ballista226000_Battle_ActAfter_AdjustSpace), f2_local0)
end

function Ballista_Act01(_, goals, _)
    local f3_local0 = goals:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3001, TARGET_ENE_0, 999, 0, 0)
    f3_local0:SetLifeEndSuccess(true)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Ballista_Act02(_, goals, _)
    goals:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3004, TARGET_ENE_0, 999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Ballista_Act03(_, goals, _)
    goals:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_ENE_0, 0, 0, 0)
    local f5_local0 = goals:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, -1, TARGET_SELF, true, 0)
    f5_local0:SetTargetAngle(1, 180, 350)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Ballista_Act04(_, goals, _)
    goals:AddSubGoal(GOAL_COMMON_Wait, 0.5, TARGET_NONE, 0, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Ballista226000_Battle_ActAfter_AdjustSpace(_, _, _)
end

Goal.Update = function (arg0, arg1, arg2)
    return Update_Default_NoSubGoal(arg0, arg1, arg2)
end

Goal.Terminate = function (_, _, _)
end

Goal.Interrupt = function (_, arg1, goals)
    if arg1:IsInterupt(INTERUPT_TargetOutOfAngle) then
        goals:ClearSubGoal()
        goals:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_NONE, 0, 0, 0)
        return true
    else
    end
end
