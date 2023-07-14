RegisterTableGoal(GOAL_Redmane_Alt_Battle, "Redmane_alt")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_Redmane_Alt_Battle, true)
Goal.Initialize = function (arg0, arg1, arg2, arg3)
	--arg1:SetNumber(0, 0)
    return 
end

--GOAL names must first be registered in aicommon, in goal_list.lua

Goal.Activate = function (arg0, arg1, arg2)
    Init_Pseudo_Global(arg1, arg2)
    arg1:SetStringIndexedNumber("Dist_SideStep", 7)
    arg1:SetStringIndexedNumber("Dist_BackStep", 7)
    local probabilities = {}
    local acts = {}
    local f2_local0 = {}
    Common_Clear_Param(probabilities, acts, f2_local0)
    local dist = arg1:GetDist(TARGET_ENE_0)
    local randint = arg1:GetRandam_Int(1, 100)
    local selfhp = arg1:GetHpRate(TARGET_SELF)
	--arg1:AddObserveSpecialEffectAttribute(TARGET_SELF, 5020)
	if arg1:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 180) then
		probabilities[1] = 100--turn
	elseif arg1:IsInsideTarget (TARGET_ENE_0, AI_DIR_TYPE_R, 90) and dist <=2 then
		probabilities[5] = 100--3009
	elseif arg1:IsInsideTarget (TARGET_ENE_0, AI_DIR_TYPE_B, 180) and dist <=2 then
		probabilities[6] = 100--3010
	elseif dist >= 4 then
		probabilities[4] = 16--jump 3011
		probabilities[8] = 16--atk3007,redguardrunattack
		probabilities[9] = 16--atk3008 stepin combo
		probabilities[10] = 16--atk3005,redguardshortjump
		probabilities[19] = 18--3025
		probabilities[20] = 18--3025
	else
		probabilities[2] = 20--atk3000
		probabilities[3] = 20--atk3002
		probabilities[7] = 20--atk3013,redguardflurry
		probabilities[11] = 10--atk3001-1
		probabilities[17] = 10--atk3001-2
		probabilities[18] = 20--grab 3014
	end
	probabilities[2] = SetCoolTime(arg1, arg2, 3000, 14, probabilities[2], 0)
    probabilities[3] = SetCoolTime(arg1, arg2, 3002, 14, probabilities[3], 0)
    probabilities[4] = SetCoolTime(arg1, arg2, 3011, 11, probabilities[4], 0) -- dist 4
    probabilities[5] = SetCoolTime(arg1, arg2, 3009, 14, probabilities[5], 0)
    probabilities[6] = SetCoolTime(arg1, arg2, 3010, 14, probabilities[6], 0)
    probabilities[7] = SetCoolTime(arg1, arg2, 3013, 14, probabilities[7], 0)
    probabilities[8] = SetCoolTime(arg1, arg2, 3007, 11, probabilities[8], 0) -- dist 4
	probabilities[9] = SetCoolTime(arg1, arg2, 3008, 11, probabilities[9], 0) -- dist 4
	probabilities[10] = SetCoolTime(arg1, arg2, 3005, 11, probabilities[10], 0) -- dist 4
	probabilities[11] = SetCoolTime(arg1, arg2, 3001, 14, probabilities[11], 0)
	probabilities[17] = SetCoolTime(arg1, arg2, 3001, 14, probabilities[17], 0)
	probabilities[18] = SetCoolTime(arg1, arg2, 3014, 14, probabilities[18], 0) 
	probabilities[19] = SetCoolTime(arg1, arg2, 3025, 11, probabilities[19], 0) -- dist 4
	probabilities[20] = SetCoolTime(arg1, arg2, 3025, 11, probabilities[19], 0) -- dist 4

	
	--probabilities[2] = SetCoolTime(arg1, arg2, 3000, 6, probabilities[2], 0)
    acts[1] = REGIST_FUNC(arg1, arg2, Redmane_Act01)--turn
	acts[2] = REGIST_FUNC(arg1, arg2, Redmane_Act02)
	acts[3] = REGIST_FUNC(arg1, arg2, Redmane_Act03)
	acts[4] = REGIST_FUNC(arg1, arg2, Redmane_Act04)
	acts[5] = REGIST_FUNC(arg1, arg2, Redmane_Act05)
	acts[6] = REGIST_FUNC(arg1, arg2, Redmane_Act06)
	acts[7] = REGIST_FUNC(arg1, arg2, Redmane_Act07)
	acts[8] = REGIST_FUNC(arg1, arg2, Redmane_Act08)
	acts[9] = REGIST_FUNC(arg1, arg2, Redmane_Act09)
	acts[10] = REGIST_FUNC(arg1, arg2, Redmane_Act10)
	acts[11] = REGIST_FUNC(arg1, arg2, Redmane_Act11)
	acts[12] = REGIST_FUNC(arg1, arg2, Redmane_Act12)
	acts[13] = REGIST_FUNC(arg1, arg2, Redmane_Act13)
	acts[14] = REGIST_FUNC(arg1, arg2, Redmane_Act14)
	acts[15] = REGIST_FUNC(arg1, arg2, Redmane_Act15)
	acts[16] = REGIST_FUNC(arg1, arg2, Redmane_Act16)--dodge
	acts[17] = REGIST_FUNC(arg1, arg2, Redmane_Act17)
	acts[18] = REGIST_FUNC(arg1, arg2, Redmane_Act18)
	acts[19] = REGIST_FUNC(arg1, arg2, Redmane_Act19)
	acts[20] = REGIST_FUNC(arg1, arg2, Redmane_Act20)
    Common_Battle_Activate(arg1, arg2, probabilities, acts, REGIST_FUNC(arg1, arg2, Redmane_ActAfter_AdjustSpace), f2_local0)
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
	Approach_Act_Flex(arg0, arg1, 3 - arg0:GetMapHitRadius(TARGET_SELF), 3 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
	arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3000, TARGET_ENE_0, 5, 0, 0)
	arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 5, 3008, TARGET_ENE_0, 5, 0)
	arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 5, 3006, TARGET_ENE_0, 5, 0)
    return 
end

function Redmane_Act03(arg0, arg1, arg2)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, arg1, 5 - arg0:GetMapHitRadius(TARGET_SELF), 5 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
	arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3002, TARGET_ENE_0, 5, 0, 0)
	arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 5, 3004, TARGET_ENE_0, 5, 0)
end

function Redmane_Act04(arg0, arg1, arg2)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, arg1, 12 - arg0:GetMapHitRadius(TARGET_SELF), 12 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
	arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3011, TARGET_ENE_0, 999, 0, 0)
	arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 5, 3012, TARGET_ENE_0, 5, 0)
end

function Redmane_Act05(arg0, arg1, arg2)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3009, TARGET_ENE_0, 999, 0, 0)
	arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 5, 3015, TARGET_ENE_0, 5, 0)
end

function Redmane_Act06(arg0, arg1, arg2)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3010, TARGET_ENE_0, 999, 0, 0)
	arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 5, 3015, TARGET_ENE_0, 5, 0)
end

function Redmane_Act07(arg0, arg1, arg2)
	arg0:SetTimer(1, 5)
	Approach_Act_Flex(arg0, arg1, 2.1 - arg0:GetMapHitRadius(TARGET_SELF), 2.1 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
	arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3013, TARGET_ENE_0, 999, 0, 0)
end

function Redmane_Act08(arg0, arg1, arg2)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, arg1, 8 - arg0:GetMapHitRadius(TARGET_SELF), 8 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
	arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3007, TARGET_ENE_0, 999, 0, 0)
end

function Redmane_Act09(arg0, arg1, arg2)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, arg1, 5 - arg0:GetMapHitRadius(TARGET_SELF), 5 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 3)
	arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3008, TARGET_ENE_0, 5, 0, 0)
	arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 5, 3006, TARGET_ENE_0, 3, 0)
	arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 5, 3003, TARGET_ENE_0, 5, 0)
	arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 5, 3005, TARGET_ENE_0, 5, 0)
end

function Redmane_Act10(arg0, arg1, arg2)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, arg1, 6 - arg0:GetMapHitRadius(TARGET_SELF), 6 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 3)
	arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3005, TARGET_ENE_0, 999, 0, 0)
	--arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3006, TARGET_ENE_0, 5, 0)
end

function Redmane_Act11(arg0, arg1, arg2)
	localdist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, arg1, 2 - arg0:GetMapHitRadius(TARGET_SELF), 2 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 3)
	arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3001, TARGET_ENE_0, 999, 0, 0)
	arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 5, 3015, TARGET_ENE_0, 5, 0)
	arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 5, 3003, TARGET_ENE_0, 5, 0)
	arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 5, 3005, TARGET_ENE_0, 5, 0)
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
		arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3019, TARGET_ENE_0, 999, 0, 0)
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
		arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3021, TARGET_ENE_0, 999, 0, 0)
	end
end

function Redmane_Act16(arg0, arg1, arg2)
	--arg0:SetNumber(0, 0)
	arg1:AddSubGoal(GOAL_COMMON_SpinStep, 0.1, 6001, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
end

function Redmane_Act17(arg0, arg1, arg2)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, arg1, 5 - arg0:GetMapHitRadius(TARGET_SELF), 5 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
	arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3001, TARGET_ENE_0, 999, 0, 0)
	arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 5, 3004, TARGET_ENE_0, 5, 0)
	arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 5, 3002, TARGET_ENE_0, 5, 0)
end

function Redmane_Act18(arg0, arg1, arg2)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, arg1, 5 - arg0:GetMapHitRadius(TARGET_SELF), 5 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
	arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3014, TARGET_ENE_0, 999, 0, 0)
end

function Redmane_Act19(arg0, arg1, arg2)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, arg1, 20 - arg0:GetMapHitRadius(TARGET_SELF), 5 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
	arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3025, TARGET_ENE_0, 999, 0, 0)
	arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 5, 3025, TARGET_ENE_0, 999, 0)
end
function Redmane_Act20(arg0, arg1, arg2)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, arg1, 20 - arg0:GetMapHitRadius(TARGET_SELF), 5 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
	arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3025, TARGET_ENE_0, 999, 0, 0)
	arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3007, TARGET_ENE_0, 10, 0)
end
Goal.Update = function (arg0, arg1, arg2)
    return Update_Default_NoSubGoal(arg0, arg1, arg2)
end

Goal.Terminate = function (arg0, arg1, arg2)
    return 
end

Goal.Interrupt = function (arg0, arg1, arg2)
    local dist1 = arg1:GetDist(TARGET_ENE_0)
    local acts = arg1:GetRandam_Int(1, 100)
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

RegisterTableGoal(GOAL_Redmane_Alt_AfterAttackAct, "Redmane_Alt_AfterAttackAct")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_Redmane_Alt_AfterAttackAct, true)
Goal.Activate = function (arg0, arg1, arg2)
    local probabilities = arg1:GetHpRate(TARGET_SELF)
	local acts = arg1:GetRandam_Int(1, 3)
	local f2_local0 = arg1:GetDist(TARGET_ENE_0)
    if 4 <= arg1:GetDist(TARGET_ENE_0) and 0.35 <= probabilities and arg1:GetDist(TARGET_ENE_0) <= 8.8 then
        arg1:AddObserveArea(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 8, 3.5)
		arg2:AddSubGoal(GOAL_COMMON_SidewayMove, arg1:GetRandam_Float(2.5, 5.5), TARGET_ENE_0, arg1:GetRandam_Int(0, 1), arg1:GetRandam_Int(6, 6), true, true, -1)
    elseif acts <= 2 then
		arg1:AddObserveArea(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 8, 2)
		arg2:AddSubGoal(GOAL_COMMON_SidewayMove, arg1:GetRandam_Float(2.5, 5.5), TARGET_ENE_0, arg1:GetRandam_Int(0, 1), arg1:GetRandam_Int(6, 6), true, true, -1)
	elseif acts == 3 and f2_local0 <= 4.2 then
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
