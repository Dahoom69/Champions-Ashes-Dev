RegisterTableGoal(GOAL_Redmane_Alt2_Battle, "Redmane")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_Redmane_Alt2_Battle, true)
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
		local0[6] = 90--3012
	else
		local0[2] = 10--atk3000
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
    Common_Battle_Activate(arg1, arg2, local0, local1, REGIST_FUNC(arg1, arg2, Redmane_ActAfter_AdjustSpace), local2)
    return 
end

function Redmane_Act01(arg0, arg1, arg2)
	if arg0:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 90) then
		arg1:AddSubGoal(GOAL_COMMON_Turn, 2, TARGET_ENE_0, 0, 0, 0)--turn180
	else
		arg1:AddSubGoal(GOAL_COMMON_Turn, 3, TARGET_ENE_0, 45)--turn90
	end
    return
end

function Redmane_Act02(arg0, arg1, arg2)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	local rand1 = arg0:GetRandam_Int(1, 100)
	Approach_Act_Flex(arg0, arg1, 3 - arg0:GetMapHitRadius(TARGET_SELF), 3 - arg0:GetMapHitRadius(TARGET_SELF), 999, 50, 0, 3, 5)
	arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, 999, 0, 0)
    return
end

function Redmane_Act03(arg0, arg1, arg2)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, arg1, 5 - arg0:GetMapHitRadius(TARGET_SELF), 5 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
	arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3002, TARGET_ENE_0, 999, 0, 0)
end

function Redmane_Act04(arg0, arg1, arg2)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, arg1, 4.49 - arg0:GetMapHitRadius(TARGET_SELF), 4.49 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
	arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3003, TARGET_ENE_0, 999, 0, 0)
end

function Redmane_Act05(arg0, arg1, arg2)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, arg1, 2.8 - arg0:GetMapHitRadius(TARGET_SELF), 2.8 - arg0:GetMapHitRadius(TARGET_SELF), 999, 0, 0, 3, 5)
	arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3005, TARGET_ENE_0, 999, 0, 0)
end

function Redmane_Act06(arg0, arg1, arg2)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	if arg0:IsFinishTimer(2) == true then
		arg0:SetNumber(0, 1)
		arg0:SetTimer(2, 6)
		Approach_Act_Flex(arg0, arg1, 3.9 - arg0:GetMapHitRadius(TARGET_SELF), 3.9 - arg0:GetMapHitRadius(TARGET_SELF), 999, 50, 0, 3, 5)
		arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3008, TARGET_ENE_0, 999, 0, 0)
	elseif arg0:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
		arg1:AddSubGoal(GOAL_COMMON_SidewayMove, 1.2, TARGET_ENE_0, 0, 60, true, true, -1)
	else
		arg1:AddSubGoal(GOAL_COMMON_SidewayMove, 1.2, TARGET_ENE_0, 1, 60, true, true, -1)
	end
end

function Redmane_Act07(arg0, arg1, arg2)
	arg0:SetTimer(1, 5)
	Approach_Act_Flex(arg0, arg1, 2.1 - arg0:GetMapHitRadius(TARGET_SELF), 2.1 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
	arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3012, TARGET_ENE_0, 999, 0, 0)
end

function Redmane_Act08(arg0, arg1, arg2)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, arg1, 4.49 - arg0:GetMapHitRadius(TARGET_SELF), 4.49 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
	arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3013, TARGET_ENE_0, 999, 0, 0)
end

function Redmane_Act09(arg0, arg1, arg2)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, arg1, 2 - arg0:GetMapHitRadius(TARGET_SELF), 2 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 3)
	arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3014, TARGET_ENE_0, 999, 0, 0)
end

function Redmane_Act10(arg0, arg1, arg2)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3009, TARGET_ENE_0, 999, 0, 0)
end

function Redmane_Act11(arg0, arg1, arg2)
	local rand1 = arg0:GetRandam_Int(1, 100)
	arg1:ClearSubGoal()
	if rand1 < 50 then
		arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3004, TARGET_ENE_0, 999, 0, 0)
	elseif rand1 >= 75 then
		arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3006, TARGET_ENE_0, 999, 0, 0)
	else
		arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3015, TARGET_ENE_0, 999, 0, 0)
	end
end

function Redmane_Act12(arg0, arg1, arg2)
	local rand1 = arg0:GetRandam_Int(1, 100)
	arg1:ClearSubGoal()
	if rand1 < 50 then
		arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3016, TARGET_ENE_0, 999, 0, 0)
	elseif rand1 >= 70 then
		arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3017, TARGET_ENE_0, 999, 0, 0)
	else
		arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3018, TARGET_ENE_0, 999, 0, 0)
	end
end

function Redmane_Act13(arg0, arg1, arg2)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	if dist0 < 1 then
		arg1:AddSubGoal(GOAL_COMMON_SpinStep, 1.5, 6001, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
	else
		Approach_Act_Flex(arg0, arg1, 2.5 - arg0:GetMapHitRadius(TARGET_SELF), 2.5 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
		arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3019, TARGET_ENE_0, 999, 0, 0)
	end
end

function Redmane_Act14(arg0, arg1, arg2)
	arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 2, 3020, TARGET_ENE_0, 999, 0, 0)
end

function Redmane_Act15(arg0, arg1, arg2)
	if arg0:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 70) then
		arg1:AddSubGoal(GOAL_COMMON_SidewayMove, 1.1, TARGET_ENE_0, 0, 60, true, true, -1)
	elseif arg0:GetDist(TARGET_ENE_0) < 1 then
		arg1:AddSubGoal(GOAL_COMMON_LeaveTarget, 1.1, TARGET_ENE_0, 1, TARGET_ENE_0, true, 0)
	else
		Approach_Act_Flex(arg0, arg1, 3 - arg0:GetMapHitRadius(TARGET_SELF), 3 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 3)
		arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3021, TARGET_ENE_0, 999, 0, 0)
	end
end

function Redmane_Act16(arg0, arg1, arg2)
	--arg0:SetNumber(0, 0)
	arg1:AddSubGoal(GOAL_COMMON_SpinStep, 0.1, 6001, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
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
