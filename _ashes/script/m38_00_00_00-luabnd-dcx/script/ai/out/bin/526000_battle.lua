RegisterTableGoal(GOAL_Halleck526000_Battle, "GOAL_Halleck526000_Battle")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_Halleck526000_Battle, true)
Goal.Initialize = function (arg0, arg1, arg2, arg3)
    arg1:SetTimer(10, 10)
    return 
end

Goal.Activate = function (arg0, arg1, arg2)
    Init_Pseudo_Global(arg1, arg2)
    arg1:SetStringIndexedNumber("Dist_SideStep", 3)
    arg1:SetStringIndexedNumber("Dist_BackStep", 3)
    local local0 = {}
    local local1 = {}
    local local2 = {}
    Common_Clear_Param(local0, local1, local2)
    if arg1:HasSpecialEffectId(TARGET_ENE_0, 100910) == false and arg1:HasSpecialEffectId(TARGET_ENE_0, 100911) == false then
        arg1:AddObserveSpecialEffectAttribute(TARGET_ENE_0, 100920)
        arg1:AddObserveSpecialEffectAttribute(TARGET_ENE_0, 100921)
    end
    arg1:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    arg1:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    arg1:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    arg1:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5028)
    arg1:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5029)
    local local3 = arg1:GetDist(TARGET_ENE_0)
    local local4 = arg1:GetRandam_Int(1, 100)
    if arg1:GetHpRate(TARGET_SELF) <= 0.4 and arg1:HasSpecialEffectId(TARGET_SELF, 5034) == false and arg1:HasSpecialEffectId(TARGET_SELF, 5404) == false then
        local0[20] = 100
    elseif arg1:IsFinishTimer(10) == false then
        local0[32] = 100
    elseif arg1:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 210) then
        if arg1:IsFinishTimer(1) == true and local3 <= 8 then
            local0[16] = 100
            local0[30] = 5
        else
            local0[30] = 10
        end
    elseif arg1:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 270) and 8 <= local3 then
        local0[30] = 10
    elseif arg1:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 240) and 5 <= local3 then
        local0[30] = 10
    elseif arg1:HasSpecialEffectId(TARGET_SELF, 11400) then
        if 15 <= local3 then
            local0[6] = 15
            local0[10] = 10
        elseif 8 <= local3 then
            local0[4] = 20
            local0[6] = 10
            local0[10] = 10
            local0[12] = 25
            local0[17] = 10
            local0[18] = 25
			local0[21] = 30
        elseif 2 <= local3 then
            local0[1] = 20
		    local0[2] = 20
		    local0[3] = 20
		    local0[4] = 20
            local0[5] = 20
		    local0[6] = 20
		    local0[7] = 20
            local0[8] = 20
		    local0[9] = 20
            local0[10] = 20
		    local0[11] = 20
		    local0[12] = 20
		    local0[13] = 20
		    local0[14] = 20
		    local0[15] = 20
		    local0[16] = 20
		    local0[17] = 20
		    local0[18] = 20
            local0[19] = 10
			local0[21] = 10
        else
            local0[1] = 10
            local0[19] = 10
        end
    elseif 15 <= local3 then
        local0[6] = 15
        local0[10] = 10
    elseif 8 <= local3 then
        local0[1] = 20
		local0[2] = 20
		local0[3] = 20
		local0[4] = 20
        local0[5] = 20
		local0[6] = 20
		local0[7] = 20
        local0[8] = 20
		local0[9] = 20
        local0[10] = 20
		local0[11] = 20
		local0[12] = 20
		local0[13] = 20
		local0[14] = 20
		local0[15] = 20
		local0[16] = 20
		local0[17] = 20
		local0[18] = 20
    elseif 2 <= local3 then
	    local0[1] = 20
		local0[2] = 20
		local0[3] = 20
		local0[4] = 20
        local0[5] = 20
		local0[6] = 20
		local0[7] = 20
        local0[8] = 20
		local0[9] = 20
		
    else
        local0[1] = 20
		local0[2] = 20
		local0[3] = 20
		local0[4] = 20
        local0[5] = 20
		local0[6] = 20
		local0[7] = 20
        local0[8] = 20
		local0[9] = 20
        local0[10] = 20
		local0[11] = 20
		local0[12] = 20
		local0[13] = 20
		local0[14] = 20
		local0[15] = 20
		local0[16] = 20
		local0[17] = 20
		local0[18] = 20
    end
    local0[8] = SetCoolTime(arg1, arg2, 3013, 10, local0[8], 1)
    local0[10] = SetCoolTime(arg1, arg2, 3011, 20, local0[10], 1)
    local0[12] = SetCoolTime(arg1, arg2, 3016, 25, local0[12], 1)
    local0[16] = SetCoolTime(arg1, arg2, 3008, 15, local0[16], 1)
    local0[16] = SetCoolTime(arg1, arg2, 3009, 15, local0[16], 1)
    local0[16] = SetCoolTime(arg1, arg2, 3030, 15, local0[16], 1)
    local0[17] = SetCoolTime(arg1, arg2, 3018, 15, local0[17], 1)
    local0[18] = SetCoolTime(arg1, arg2, 3019, 15, local0[18], 1)
    local0[19] = SetCoolTime(arg1, arg2, 3021, 12, local0[19], 1)
	local0[21] = SetCoolTime(arg1, arg2, 3013, 12, local0[21], 1)
    local1[1] = REGIST_FUNC(arg1, arg2, Halleck526000_Act01)
    local1[2] = REGIST_FUNC(arg1, arg2, Halleck526000_Act02)
    local1[3] = REGIST_FUNC(arg1, arg2, Halleck526000_Act03)
    local1[4] = REGIST_FUNC(arg1, arg2, Halleck526000_Act04)
    local1[5] = REGIST_FUNC(arg1, arg2, Halleck526000_Act05)
    local1[6] = REGIST_FUNC(arg1, arg2, Halleck526000_Act06)
    local1[7] = REGIST_FUNC(arg1, arg2, Halleck526000_Act07)
    local1[8] = REGIST_FUNC(arg1, arg2, Halleck526000_Act08)
    local1[9] = REGIST_FUNC(arg1, arg2, Halleck526000_Act09)
    local1[10] = REGIST_FUNC(arg1, arg2, Halleck526000_Act10)
    local1[11] = REGIST_FUNC(arg1, arg2, Halleck526000_Act11)
    local1[12] = REGIST_FUNC(arg1, arg2, Halleck526000_Act12)
    local1[13] = REGIST_FUNC(arg1, arg2, Halleck526000_Act13)
    local1[14] = REGIST_FUNC(arg1, arg2, Halleck526000_Act14)
    local1[15] = REGIST_FUNC(arg1, arg2, Halleck526000_Act15)
    local1[16] = REGIST_FUNC(arg1, arg2, Halleck526000_Act16)
    local1[17] = REGIST_FUNC(arg1, arg2, Halleck526000_Act17)
    local1[18] = REGIST_FUNC(arg1, arg2, Halleck526000_Act18)
    local1[19] = REGIST_FUNC(arg1, arg2, Halleck526000_Act19)
    local1[20] = REGIST_FUNC(arg1, arg2, Halleck526000_Act20)
	local1[21] = REGIST_FUNC(arg1, arg2, Halleck526000_Act21)
    local1[30] = REGIST_FUNC(arg1, arg2, Halleck526000_Act30)
    local1[31] = REGIST_FUNC(arg1, arg2, Halleck526000_Act31)
    local1[32] = REGIST_FUNC(arg1, arg2, Halleck526000_Act32)
    local1[33] = REGIST_FUNC(arg1, arg2, Halleck526000_Act33)
    local1[40] = REGIST_FUNC(arg1, arg2, Halleck526000_Act40)
    Common_Battle_Activate(arg1, arg2, local0, local1, REGIST_FUNC(arg1, arg2, Halleck526000_ActAfter_AdjustSpace), local2)
    return 
end

function Halleck526000_Act01(arg0, arg1, arg2)
    local local0 = 20 - arg0:GetMapHitRadius(TARGET_SELF)
    local local1 = 1
    local local2 = arg0:GetRandam_Int(1, 100)
    local local3 = arg0:GetDist(TARGET_ENE_0)
    arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5029)
    arg0:SetTimer(1, 5)
    if arg0:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 180) then
        local local4 = arg1:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1.5, 3003, TARGET_ENE_0, local0, local1, 360, 0, 0)
        local4:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    elseif arg0:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 180) then
        local local4 = arg1:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, 3000, TARGET_ENE_0, local0, local1, 360, 0, 0)
        local4:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    else
        Halleck526000_Act30(arg0, arg1, arg2)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Halleck526000_Act02(arg0, arg1, arg2)
    local local0 = 2 - arg0:GetMapHitRadius(TARGET_SELF) + 1
    local local1 = 20 - arg0:GetMapHitRadius(TARGET_SELF)
    local local2 = arg0:GetRandam_Int(1, 100)
    arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    arg0:SetTimer(1, 5)
    if InsideRange(arg0, arg1, 0, 120, -1, 2 - arg0:GetMapHitRadius(TARGET_SELF)) and 50 <= local2 then
        local local3 = arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 2, 3000, TARGET_ENE_0, local0, 0, 20, 0, 0)
        local3:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    elseif InsideRange(arg0, arg1, 180, 150, -1, 1.6 - arg0:GetMapHitRadius(TARGET_SELF) + 1) then
        local local3 = arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 1.5, 3001, TARGET_ENE_0, local0, 0, 360, 0, 0)
        local3:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    elseif InsideRange(arg0, arg1, 45, 180, 2 - arg0:GetMapHitRadius(TARGET_SELF), 4.1 - arg0:GetMapHitRadius(TARGET_SELF) + 1) then
        local local3 = arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 2, 3002, TARGET_ENE_0, local1, 0, 0)
        local3:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    elseif InsideRange(arg0, arg1, 300, 105, -1, 10.6 - arg0:GetMapHitRadius(TARGET_SELF)) and 50 <= local2 then
        arg0:SetTimer(1, 8)
        local local3 = arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 2, 3030, TARGET_ENE_0, local1, 0, 0)
        local3:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    elseif 30 <= arg0:GetRandam_Int(1, 100) and arg0:IsFinishTimer(2) == true then
        Halleck526000_Act19(arg0, arg1, arg2)
    else
        Halleck526000_Act30(arg0, arg1, arg2)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Halleck526000_Act03(arg0, arg1, arg2)
    local local0 = 2 - arg0:GetMapHitRadius(TARGET_SELF) + 1
    local local1 = arg0:GetRandam_Int(1, 100)
    arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5025)
    arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5029)
    local local2 = arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 1.5, 3003, TARGET_ENE_0, 20 - arg0:GetMapHitRadius(TARGET_SELF), 0, 360, 0, 0)
    local2:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Halleck526000_Act04(arg0, arg1, arg2)
    Approach_Act_Flex(arg0, arg1, 7.8 - arg0:GetMapHitRadius(TARGET_SELF) - 1, 7.8 - arg0:GetMapHitRadius(TARGET_SELF) - 1, 7.8 - arg0:GetMapHitRadius(TARGET_SELF) - 1, 100, 0, 5, 5)
    local local0 = 20 - arg0:GetMapHitRadius(TARGET_SELF)
    local local1 = arg0:GetRandam_Int(1, 100)
    arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    local local2 = arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3004, TARGET_ENE_0, DistToAtt1, 1, 120, 0, 0)
    local2:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Halleck526000_Act05(arg0, arg1, arg2)
    local local0 = 7.8 - arg0:GetMapHitRadius(TARGET_SELF) + 1
    local local1 = arg0:GetRandam_Int(1, 100)
    if InsideRange(arg0, arg1, 270, 90, 3, 9.8 - arg0:GetMapHitRadius(TARGET_SELF) + 1) then
        local local2 = arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3006, TARGET_ENE_0, local0, 0, 360, 0, 0)
        local2:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    elseif InsideRange(arg0, arg1, 90, 120, 0, 8.8 - arg0:GetMapHitRadius(TARGET_SELF)) then
        local local2 = arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3007, TARGET_ENE_0, local0, 0, 360, 0, 0)
        local2:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    else
        local local2 = arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, 20 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)\
		arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3010, TARGET_ENE_0, 20 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
        local2:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Halleck526000_Act06(arg0, arg1, arg2)
    Approach_Act_Flex(arg0, arg1, 14.8 - arg0:GetMapHitRadius(TARGET_SELF) - 1, 14.8 - arg0:GetMapHitRadius(TARGET_SELF) - 1, 14.8 - arg0:GetMapHitRadius(TARGET_SELF) - 1, 100, 0, 5, 5)
    local local0 = arg0:GetRandam_Int(1, 100)
    arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    local local1 = arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3010, TARGET_ENE_0, 20 - arg0:GetMapHitRadius(TARGET_SELF), 1, 120, 0, 0)
    local1:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Halleck526000_Act07(arg0, arg1, arg2)
    local local0 = 20 - arg0:GetMapHitRadius(TARGET_SELF)
    local local1 = arg0:GetRandam_Int(1, 100)
    arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
    local local2 = arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 1.5, 3008, TARGET_ENE_0, 0, 0, 0, 0)
    local2:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Halleck526000_Act08(arg0, arg1, arg2)
    Approach_Act_Flex(arg0, arg1, 6.8 - arg0:GetMapHitRadius(TARGET_SELF) - 1, 6.8 - arg0:GetMapHitRadius(TARGET_SELF) - 1, 6.8 - arg0:GetMapHitRadius(TARGET_SELF) - 1, 100, 0, 5, 5)
    local local0 = arg0:GetRandam_Int(1, 100)
    if arg0:HasSpecialEffectId(TARGET_SELF, 11400) then
        arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    end
    local local1 = arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3013, TARGET_ENE_0, 9.8 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 1, 150, 0, 0)
    local1:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    local1 = arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3014, TARGET_ENE_0, 7.8 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 0, 0)
    local1:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    local1 = arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3015, TARGET_ENE_0, 20 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
    local1:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
	local local1 = arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3013, TARGET_ENE_0, 9.8 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 1, 150, 0, 0)
    local1:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    local1 = arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3012, TARGET_ENE_0, 7.8 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 0, 0)
    local1:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Halleck526000_Act09(arg0, arg1, arg2)
    local local0 = arg0:GetRandam_Int(1, 100)
    if arg0:HasSpecialEffectId(TARGET_SELF, 11400) then
        arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    end
    local local1 = arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3014, TARGET_ENE_0, 7.8 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 0, 0, 0, 0)
    local1:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    local1 = arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3015, TARGET_ENE_0, 20 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
    local1:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Halleck526000_Act10(arg0, arg1, arg2)
    Approach_Act_Flex(arg0, arg1, 15.8 - arg0:GetMapHitRadius(TARGET_SELF) - 1.5, 15.8 - arg0:GetMapHitRadius(TARGET_SELF) - 1.5, 15.8 - arg0:GetMapHitRadius(TARGET_SELF) - 1.5, 100, 0, 5, 5)
    local local0 = 9.8 - arg0:GetMapHitRadius(TARGET_SELF) + 999
    local local1 = 20 - arg0:GetMapHitRadius(TARGET_SELF)
    local local2 = arg0:GetRandam_Int(1, 100)
    arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3011, TARGET_ENE_0, local1, 1, 150, 0, 0)
    local local3 = arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3012, TARGET_ENE_0, local1, 0, 0)
    local3:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Halleck526000_Act11(arg0, arg1, arg2)
    local local0 = 20 - arg0:GetMapHitRadius(TARGET_SELF)
    local local1 = arg0:GetRandam_Int(1, 100)
    arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5028)
    arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 1.5, 3009, TARGET_ENE_0, 15.8 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 0, 360, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Halleck526000_Act12(arg0, arg1, arg2)
    Approach_Act_Flex(arg0, arg1, 9.8 - arg0:GetMapHitRadius(TARGET_SELF) - 1.5, 9.8 - arg0:GetMapHitRadius(TARGET_SELF) - 1.5, 9.8 - arg0:GetMapHitRadius(TARGET_SELF) - 1.5, 100, 0, 5, 5)
    local local0 = 20 - arg0:GetMapHitRadius(TARGET_SELF)
    local local1 = arg0:GetRandam_Int(1, 100)
    local local2 = arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3016, TARGET_ENE_0, 20 - arg0:GetMapHitRadius(TARGET_SELF), 1, 120, 0, 0)
    local2:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Halleck526000_Act13(arg0, arg1, arg2)
    local local0 = 20 - arg0:GetMapHitRadius(TARGET_SELF)
    local local1 = arg0:GetRandam_Int(1, 100)
    arg0:SetTimer(0, 12)
    arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 5, 3017, TARGET_ENE_0, 9.8 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 1, 150, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Halleck526000_Act14(arg0, arg1, arg2)
    local local0 = 20 - arg0:GetMapHitRadius(TARGET_SELF)
    local local1 = arg0:GetRandam_Int(1, 100)
    arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3011, TARGET_ENE_0, local0, 0, 180, 0, 0)
    local local2 = arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3012, TARGET_ENE_0, local0, 0, 0)
    local2:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Halleck526000_Act15(arg0, arg1, arg2)
    local local0 = 20 - arg0:GetMapHitRadius(TARGET_SELF)
    local local1 = arg0:GetRandam_Int(1, 100)
    local local2 = arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3030, TARGET_ENE_0, 9.8 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 1, 360, 0, 0)
    local2:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Halleck526000_Act16(arg0, arg1, arg2)
    arg0:SetTimer(1, 8)
    if InsideRange(arg0, arg1, 180, 180, -1, 1 - arg0:GetMapHitRadius(TARGET_SELF)) then
        Halleck526000_Act03(arg0, arg1, arg2)
    elseif InsideRange(arg0, arg1, 150, 60, 2, 10.8 - arg0:GetMapHitRadius(TARGET_SELF)) then
        Halleck526000_Act07(arg0, arg1, arg2)
    elseif InsideRange(arg0, arg1, 180, 120, 1, 4.5 - arg0:GetMapHitRadius(TARGET_SELF)) then
        Halleck526000_Act11(arg0, arg1, arg2)
    elseif InsideRange(arg0, arg1, 300, 105, -1, 10.6 - arg0:GetMapHitRadius(TARGET_SELF)) and 50 <= arg0:GetRandam_Int(1, 100) then
        Halleck526000_Act15(arg0, arg1, arg2)
    elseif InsideRange(arg0, arg1, 0, 360, -1, 3.5) and 30 <= arg0:GetRandam_Int(1, 100) and arg0:IsFinishTimer(2) == true then
        Halleck526000_Act19(arg0, arg1, arg2)
    else
        Halleck526000_Act30(arg0, arg1, arg2)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Halleck526000_Act17(arg0, arg1, arg2)
    Approach_Act_Flex(arg0, arg1, 11 - arg0:GetMapHitRadius(TARGET_SELF) - 2, 14.8 - arg0:GetMapHitRadius(TARGET_SELF) + 999, 14.8 - arg0:GetMapHitRadius(TARGET_SELF) + 999, 100, 0, 5, 5)
    local local0 = arg0:GetRandam_Int(1, 100)
    local local1 = arg1:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3018, TARGET_ENE_0, 20 - arg0:GetMapHitRadius(TARGET_SELF), 1, 120, 0, 0)
    arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, 20 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
	arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3006, TARGET_ENE_0, 20 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
	arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, 20 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Halleck526000_Act18(arg0, arg1, arg2)
    Approach_Act_Flex(arg0, arg1, 7 - arg0:GetMapHitRadius(TARGET_SELF) - 2, 7 - arg0:GetMapHitRadius(TARGET_SELF) - 2, 7 - arg0:GetMapHitRadius(TARGET_SELF) - 2, 100, 0, 5, 5)
    local local0 = arg0:GetRandam_Int(1, 100)
    arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3019, TARGET_ENE_0, 9.5 - arg0:GetMapHitRadius(TARGET_SELF), 1, 90, 0, 0)
    arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3020, TARGET_ENE_0, 20 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Halleck526000_Act19(arg0, arg1, arg2)
    local local0 = 3021
    local local1 = 20 - arg0:GetMapHitRadius(TARGET_SELF)
    local local2 = 1
    local local3 = 180
    local local4 = arg0:GetRandam_Int(1, 100)
    arg0:SetTimer(2, 13)
    if arg0:HasSpecialEffectId(TARGET_SELF, 11400) then
        arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5026)
        local local5 = arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, local0, TARGET_ENE_0, 14.8 - arg0:GetMapHitRadius(TARGET_SELF), local2, local3, 0, 0)
        local5:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
        arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3010, TARGET_ENE_0, local1, 0, 0)
    else
        arg1:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, local0, TARGET_ENE_0, local1, local2, local3, 0, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Halleck526000_Act20(arg0, arg1, arg2)
    arg1:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 1500, TARGET_ENE_0, SuccessDist, 0, 0, 0, 0)
    arg0:SetTimer(10, 10)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Halleck526000_Act21(arg0, arg1, arg2)
    Approach_Act_Flex(arg0, arg1, 6.8 - arg0:GetMapHitRadius(TARGET_SELF) - 1, 6.8 - arg0:GetMapHitRadius(TARGET_SELF) - 1, 6.8 - arg0:GetMapHitRadius(TARGET_SELF) - 1, 100, 0, 5, 5)
    local local0 = arg0:GetRandam_Int(1, 100)
    if arg0:HasSpecialEffectId(TARGET_SELF, 11400) then
        arg0:AddObserveSpecialEffectAttribute(TARGET_SELF, 5027)
    end
    local local1 = arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3013, TARGET_ENE_0, 9.8 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 1, 150, 0, 0)
    local1:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    local1 = arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3014, TARGET_ENE_0, 20 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 0, 0)
    local1:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    local1 = arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3019, TARGET_ENE_0, 20 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
    local1:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
	local1 = arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3020, TARGET_ENE_0, 20 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
    local1:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
	local1 = arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3009, TARGET_ENE_0, 20 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
    local1:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
	local local1 = arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3017, TARGET_ENE_0, 9.8 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 1, 150, 0, 0)
    local1:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    local1 = arg1:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3021, TARGET_ENE_0, 7.8 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 0, 0)
    local1:SetTargetRange(0, -99, 15.3 - arg0:GetMapHitRadius(TARGET_SELF) - 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Halleck526000_Act30(arg0, arg1, arg2)
    arg1:AddSubGoal(GOAL_COMMON_Turn, 2, TARGET_ENE_0, 0, 0, 0)
    arg0:SetTimer(1, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Halleck526000_Act31(arg0, arg1, arg2)
    local local0 = 10
    if local0 <= arg0:GetDist(TARGET_ENE_0) then
        Approach_Act(arg0, arg1, local0, 12, Odds_Guard, 3)
    end
    arg1:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, local0, TARGET_ENE_0, true, -1)
    return 
end

function Halleck526000_Act32(arg0, arg1, arg2)
    arg0:AddObserveArea(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 12)
    arg1:AddSubGoal(GOAL_COMMON_ApproachTarget, arg0:GetRandam_Float(4, 6), TARGET_ENE_0, 5, TARGET_SELF, true, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Halleck526000_Act40(arg0, arg1, arg2)
    local local0 = 3021
    local local1 = 20 - arg0:GetMapHitRadius(TARGET_SELF)
    local local2 = arg0:GetRandam_Int(1, 100)
    arg1:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3021, TARGET_ENE_0, 999, 1.5, 360, 0, 0)
    arg1:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3017, TARGET_ENE_0, 999, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Halleck526000_ActAfter_AdjustSpace(arg0, arg1, arg2)
    arg1:AddSubGoal(GOAL_Halleck526000_AfterAttackAct, 10)
    return 
end

Goal.Update = function (arg0, arg1, arg2)
    return Update_Default_NoSubGoal(arg0, arg1, arg2)
end

Goal.Terminate = function (arg0, arg1, arg2)
    return 
end

Goal.Interrupt = function (arg0, arg1, arg2)
    if arg1:IsInterupt(INTERUPT_Inside_ObserveArea) then
        local local0 = arg1:GetDist(TARGET_ENE_0)
        local local1 = arg1:GetRandam_Int(1, 100)
        if arg1:IsInsideObserve(1) then
            arg1:SetTimer(10, 0)
            arg1:Replaning()
            arg1:DeleteObserve(1)
            return true
        end
    end
    if arg1:IsInterupt(INTERUPT_TargetOutOfRange) and arg1:IsTargetOutOfRangeInterruptSlot(0) and InsideRange(arg1, arg2, 0, 90, 15.3 - arg1:GetMapHitRadius(TARGET_SELF) - 1.5, 22.8 - arg1:GetMapHitRadius(TARGET_SELF)) and arg1:HasSpecialEffectId(TARGET_SELF, 11400) and arg1:IsFinishTimer(0) == true then
        arg1:SetTimer(0, 12)
        arg2:ClearSubGoal()
        Halleck526000_Act13(arg1, arg2, paramTbl)
        return true
    elseif arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) then
        if arg1:GetSpecialEffectActivateInterruptType(0) == 5025 and arg1:HasSpecialEffectId(TARGET_ENE_0, 90) == false and arg1:GetDist(TARGET_ENE_0) <= 5 then
            arg2:ClearSubGoal()
            Halleck526000_Act02(arg1, arg2, paramTbl)
            return true
        elseif arg1:GetSpecialEffectActivateInterruptType(0) == 5026 and InsideRange(arg1, arg2, 0, 180, 0, 7.8 - arg1:GetMapHitRadius(TARGET_SELF)) then
            arg2:ClearSubGoal()
            Halleck526000_Act05(arg1, arg2, paramTbl)
            return true
        elseif arg1:GetSpecialEffectActivateInterruptType(0) == 5027 and InsideRange(arg1, arg2, 0, 120, 3, 9.8 - arg1:GetMapHitRadius(TARGET_SELF) + 1) and 50 <= arg1:GetRandam_Int(1, 100) then
            arg2:ClearSubGoal()
            Halleck526000_Act09(arg1, arg2, paramTbl)
            return true
        elseif arg1:GetSpecialEffectActivateInterruptType(0) == 5028 and InsideRange(arg1, arg2, 330, 120, 3, 15.8 - arg1:GetMapHitRadius(TARGET_SELF) + 1) then
            arg2:ClearSubGoal()
            Halleck526000_Act14(arg1, arg2, paramTbl)
            return true
        elseif arg1:GetSpecialEffectActivateInterruptType(0) == 5029 and InsideRange(arg1, arg2, 330, 75, 4.5, 9.8 - arg1:GetMapHitRadius(TARGET_SELF) + 1) then
            arg2:ClearSubGoal()
            local local2 = arg2:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3031, TARGET_ENE_0, 9.8 - arg1:GetMapHitRadius(TARGET_SELF) + 1, 0, 0)
            local2:SetTargetRange(0, -99, 15.3 - arg1:GetMapHitRadius(TARGET_SELF) - 1)
            if arg1:HasSpecialEffectId(TARGET_SELF, 11400) then
                local2 = arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3012, TARGET_ENE_0, SuccessDist, 0, 0)
                local2:SetTargetRange(0, -99, 15.3 - arg1:GetMapHitRadius(TARGET_SELF) - 1)
            end
            return true
        elseif arg1:GetSpecialEffectActivateInterruptType(0) == 100920 then
            arg1:DeleteObserveSpecialEffectAttribute(TARGET_ENE_0, 100920)
            if arg1:HasSpecialEffectId(TARGET_SELF, 5033) == true then
                arg1:Replaning()
                return true
            end
        end
        if arg1:GetSpecialEffectActivateInterruptType(0) == 100921 then
            arg1:DeleteObserveSpecialEffectAttribute(TARGET_ENE_0, 100921)
            if arg1:HasSpecialEffectId(TARGET_SELF, 5033) == true then
                arg1:Replaning()
                return true
            end
        end
    end
    return false
end

RegisterTableGoal(GOAL_Halleck526000_AfterAttackAct, "Halleck526000_AfterAttackAct")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_Halleck526000_AfterAttackAct, true)
Goal.Activate = function (arg0, arg1, arg2)
    local local0 = arg1:GetDist(TARGET_ENE_0)
    local local1 = arg1:GetToTargetAngle(TARGET_ENE_0)
    local local2 = arg1:GetRandam_Int(1, 100)
    if arg1:HasSpecialEffectId(TARGET_ENE_0, 100910) == false and arg1:HasSpecialEffectId(TARGET_ENE_0, 100911) == false and 0.3 <= arg1:GetHpRate(TARGET_SELF) then
        arg1:AddObserveArea(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 9)
        arg2:AddSubGoal(GOAL_COMMON_ApproachTarget, arg1:GetRandam_Float(3, 4), TARGET_ENE_0, 5, TARGET_SELF, true, -1)
    end
    return 
end

Goal.Update = function (arg0, arg1, arg2)
    return Update_Default_NoSubGoal(arg0, arg1, arg2)
end

Goal.Terminate = function (arg0, arg1, arg2)
    return 
end

Goal.Interrupt = function (arg0, arg1, arg2)
    if arg1:IsInterupt(INTERUPT_Inside_ObserveArea) then
        local local0 = arg1:GetDist(TARGET_ENE_0)
        local local1 = arg1:GetRandam_Int(1, 100)
        if arg1:IsInsideObserve(1) then
            arg1:Replaning()
            arg1:DeleteObserve(1)
            return true
        end
    end
    if arg1:IsInterupt(INTERUPT_ActivateSpecialEffect) then
        if arg1:GetSpecialEffectActivateInterruptType(0) == 100920 then
            arg1:DeleteObserveSpecialEffectAttribute(TARGET_ENE_0, 100920)
            if arg1:HasSpecialEffectId(TARGET_SELF, 5033) == true then
                arg1:Replaning()
                return true
            end
        end
        if arg1:GetSpecialEffectActivateInterruptType(0) == 100921 then
            arg1:DeleteObserveSpecialEffectAttribute(TARGET_ENE_0, 100921)
            if arg1:HasSpecialEffectId(TARGET_SELF, 5033) == true then
                arg1:Replaning()
                return true
            end
        end
    end
    return false
end

return 
