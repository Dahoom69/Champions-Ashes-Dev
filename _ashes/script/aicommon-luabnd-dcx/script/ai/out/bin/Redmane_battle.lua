RegisterTableGoal(GOAL_Redmane_Battle, "Redmane")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_Redmane_Battle, true)
Goal.Initialize = function (arg0, arg1, arg2, arg3)
	--arg1:SetNumber(0, 0)
    return 
end

--GOAL names must first be registered in aicommon, in goal_list.lua

Goal.Activate = function (arg0, arg1, arg2)
    Init_Pseudo_Global(arg1, arg2)
    arg1:SetStringIndexedNumber("Dist_SideStep", 7)
    arg1:SetStringIndexedNumber("Dist_BackStep", 7)
    local local0 = {}
    local local1 = {}
    local local2 = {}
    Common_Clear_Param(local0, local1, local2)
    local dist = arg1:GetDist(TARGET_ENE_0)
    local randint = arg1:GetRandam_Int(1, 100)
    local selfhp = arg1:GetHpRate(TARGET_SELF)
	--arg1:AddObserveSpecialEffectAttribute(TARGET_SELF, 5020)
	if arg1:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 180) then
		local0[1] = 10--turn
	elseif arg1:IsInsideTarget (TARGET_ENE_0, AI_DIR_TYPE_R, 90) and dist <=2 then
		local0[5] = 90--3009
	elseif arg1:IsInsideTarget (TARGET_ENE_0, AI_DIR_TYPE_B, 180) and dist <=2 then
		local0[6] = 90--3010
	elseif dist >= 6 then
		local0[8] = 20--atk3007,redguardrunattack
		local0[20] = 20--atk3016comborunning
		local0[19] = 50--spit
		local0[4] = 40--jump
	else
		local0[2] = 20--atk3000
		local0[3] = 20--atk3002
		local0[7] = 20--atk3013,redguardflurry
		local0[9] = 20--atk3008combo
		local0[10] = 20--atk3005,redguardshortjump
		local0[11] = 20--atk3001
		local0[17] = 10--atk3001-2
		local0[18] = 7--grab
		local0[21] = 10--atk3017
	end
	--local0[2] = SetCoolTime(arg1, arg2, 3000, 6, local0[2], 0)
    local1[1] = REGIST_FUNC(arg1, arg2, Redmane_Act01)--turn
	local1[2] = REGIST_FUNC(arg1, arg2, Redmane_Act02)
	local1[3] = REGIST_FUNC(arg1, arg2, Redmane_Act03)
	local1[4] = REGIST_FUNC(arg1, arg2, Redmane_Act04)
	local1[5] = REGIST_FUNC(arg1, arg2, Redmane_Act05)
	local1[6] = REGIST_FUNC(arg1, arg2, Redmane_Act06)
	local1[7] = REGIST_FUNC(arg1, arg2, Redmane_Act07)
	local1[8] = REGIST_FUNC(arg1, arg2, Redmane_Act08)
	local1[9] = REGIST_FUNC(arg1, arg2, Redmane_Act09)
	local1[10] = REGIST_FUNC(arg1, arg2, Redmane_Act10)
	local1[11] = REGIST_FUNC(arg1, arg2, Redmane_Act11)
	local1[12] = REGIST_FUNC(arg1, arg2, Redmane_Act12)
	local1[13] = REGIST_FUNC(arg1, arg2, Redmane_Act13)
	local1[14] = REGIST_FUNC(arg1, arg2, Redmane_Act14)
	local1[15] = REGIST_FUNC(arg1, arg2, Redmane_Act15)
	local1[16] = REGIST_FUNC(arg1, arg2, Redmane_Act16)--dodge
	local1[17] = REGIST_FUNC(arg1, arg2, Redmane_Act17)
	local1[18] = REGIST_FUNC(arg1, arg2, Redmane_Act18)
	local1[19] = REGIST_FUNC(arg1, arg2, Redmane_Act19)
	local1[20] = REGIST_FUNC(arg1, arg2, Redmane_Act20)
	local1[21] = REGIST_FUNC(arg1, arg2, Redmane_Act21)
    Common_Battle_Activate(arg1, arg2, local0, local1, REGIST_FUNC(arg1, arg2, Redmane_ActAfter_AdjustSpace), local2)
    return 
end




Goal.Update = function (arg0, arg1, arg2)
    return Update_Default_NoSubGoal(arg0, arg1, arg2)
end

Goal.Terminate = function (arg0, arg1, arg2)
    return 
end

Goal.Interrupt = function (arg0, arg1, arg2)
    local dist1 = arg1:GetDist(TARGET_ENE_0)
    local local1 = arg1:GetRandam_Int(1, 100)
	arg1:AddObserveSpecialEffectAttribute(TARGET_SELF, 5028)
	--[[if arg1:GetSpecialEffectActivateInterruptType(0) == 5028 and dist1 < 4 then
		arg2:ClearSubGoal()
		arg2:AddSubGoal(GOAL_COMMON_ComboRepeat, 0.1, 3001, TARGET_ENE_0, 999, 0, 0)
	end--]]
end

function Redmane_ActAfter_AdjustSpace(arg0, arg1, arg2)
    arg1:AddSubGoal(GOAL_Redmane_AfterAttackAct, 10)
    return
end

RegisterTableGoal(GOAL_Redmane_AfterAttackAct, "Redmane_AfterAttackAct")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_Redmane_AfterAttackAct, true)
Goal.Activate = function (arg0, arg1, arg2)
    local local0 = arg1:GetHpRate(TARGET_SELF)
	local local1 = arg1:GetRandam_Int(1, 3)
	local local2 = arg1:GetDist(TARGET_ENE_0)
    if 4 <= arg1:GetDist(TARGET_ENE_0) and 0.35 <= local0 and arg1:GetDist(TARGET_ENE_0) <= 8.8 then
        arg1:AddObserveArea(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 8, 3.5)
		arg2:AddSubGoal(GOAL_COMMON_SidewayMove, arg1:GetRandam_Float(2.5, 5.5), TARGET_ENE_0, arg1:GetRandam_Int(0, 1), arg1:GetRandam_Int(6, 6), true, true, -1)
    elseif local1 <= 2 then
		arg1:AddObserveArea(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 8, 2)
		arg2:AddSubGoal(GOAL_COMMON_SidewayMove, arg1:GetRandam_Float(2.5, 5.5), TARGET_ENE_0, arg1:GetRandam_Int(0, 1), arg1:GetRandam_Int(6, 6), true, true, -1)
	elseif local1 == 3 and local2 <= 4.2 then
		arg1:AddObserveArea(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 8, 2)
		arg2:AddSubGoal(GOAL_COMMON_SidewayMove, arg1:GetRandam_Float(5.5, 9), TARGET_ENE_0, arg1:GetRandam_Int(0, 1), arg1:GetRandam_Int(6, 6), true, true, -1)
	else
		arg1:AddObserveArea(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 8, 2)
		arg2:AddSubGoal(GOAL_COMMON_SidewayMove, arg1:GetRandam_Float(2.5, 5.5), TARGET_ENE_0, arg1:GetRandam_Int(0, 1), arg1:GetRandam_Int(6, 6), true, true, -1)
	end
    return 
end

Goal.Update = function (arg0, arg1, arg2)
    return Update_Default_NoSubGoal(arg0, arg1, arg2)
end

return 
