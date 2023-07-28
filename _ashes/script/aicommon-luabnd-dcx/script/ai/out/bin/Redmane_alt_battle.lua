RegisterTableGoal(GOAL_Redmane_Alt_Battle, "Redmane_alt")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_Redmane_Alt_Battle, true)
Goal.Initialize = function (arg0, actor, goals, arg3)
    return 
end

Goal.Activate = function (arg0, actor, goals)
    local probabilities = {}
    local acts = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(probabilities, acts, defFuncParamTbl)
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

    if getthinkAttrDoAdmirerTeamEffectivity == 1 and actor:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Kankyaku then
        probabilities[11] = 60
        probabilities[12] = 40
    elseif getthinkAttrDoAdmirerTeamEffectivity == 1 and actor:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Torimaki then
        probabilities[2] = 3
        probabilities[3] = 3
        probabilities[7] = 6
        probabilities[11] = 3
        probabilities[17] = 50
        probabilities[18] = 35
		
		
		
		
		-- alt redmane start
	elseif actor:GetNpcThinkParamID() == 340001 then
		if distance >= 8 then
			if actor:GetHpRate(TARGET_SELF) <= 0.4 then
				probabilities[42] = 100--3019
			end
			probabilities[34] = 34--jump 3011
			probabilities[49] = 34--3025
			probabilities[50] = 32--3025
		elseif distance >= 4 then
			if actor:GetHpRate(TARGET_SELF) <= 0.4 then
				probabilities[42] = 100--3019
			end
			probabilities[38] = 20--atk3007,redguardrunattack
			probabilities[39] = 20--atk3008 stepin combo
			probabilities[40] = 20--atk3005,redguardshortjump
			probabilities[49] = 20--3025
			probabilities[50] = 20--3025
		else
			if actor:IsInsideTarget (TARGET_ENE_0, AI_DIR_TYPE_L, 120) and distance <=2 then
				probabilities[5] = 100--3010
				probabilities[44] = 100
			elseif actor:IsInsideTarget (TARGET_ENE_0, AI_DIR_TYPE_R, 120) and distance <=2 then
				probabilities[6] = 100--3009
				probabilities[44] = 100
			else
				if actor:GetHpRate(TARGET_SELF) <= 0.4 then
					probabilities[42] = 100--3019
				end
				probabilities[32] = 20--atk3000
				probabilities[33] = 20--atk3002
				probabilities[37] = 20--atk3013,redguardflurry
				probabilities[41] = 10--atk3001-1
				probabilities[47] = 10--atk3001-2
				probabilities[48] = 20--grab 3014
			end
		end
		-- alt redmane end
		
		
		
		
		
		
		-- dragon redmane start
	elseif actor:GetNpcThinkParamID() == 340002 then
		if actor:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 180) then
			probabilities[1] = 10--turn
		elseif actor:IsInsideTarget (TARGET_ENE_0, AI_DIR_TYPE_R, 90) and distance <=2 then
			probabilities[5] = 90--3009
		elseif actor:IsInsideTarget (TARGET_ENE_0, AI_DIR_TYPE_B, 180) and distance <=2 then
			probabilities[6] = 90--3010
		else
			probabilities[62] = 10--atk3000
		end
		-- dragon redmane end
		
		
		
		
		
		
		-- base redmane start
	else
		if actor:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 180) then
			probabilities[1] = 10--turn
		elseif actor:IsInsideTarget (TARGET_ENE_0, AI_DIR_TYPE_R, 90) and distance <=2 then
			probabilities[5] = 90--3009
		elseif actor:IsInsideTarget (TARGET_ENE_0, AI_DIR_TYPE_B, 180) and distance <=2 then
			probabilities[6] = 90--3010
		else
			if distance >= 6 then
				probabilities[8] = 20--atk3007,redguardrunattack
				probabilities[20] = 20--atk3016comborunning
				probabilities[19] = 50--spit
				probabilities[4] = 40--jump
			else
				probabilities[2] = 20--atk3000
				probabilities[3] = 20--atk3002
				probabilities[7] = 20--atk3013,redguardflurry
				probabilities[9] = 20--atk3008combo
				probabilities[10] = 20--atk3005,redguardshortjump
				probabilities[11] = 20--atk3001
				probabilities[17] = 10--atk3001-2
				probabilities[18] = 7--grab
				probabilities[21] = 10--atk3017
			end
		end
	end
	-- base redmane end
	
	
	
    acts[1] = REGIST_FUNC(actor, goals, Redmane_Act01)--turn
	acts[5] = REGIST_FUNC(actor, goals, Redmane_Act05)
	acts[6] = REGIST_FUNC(actor, goals, Redmane_Act06)
	
	-- base redmane start
	acts[2] = REGIST_FUNC(actor, goals, Redmane_Act02)
	acts[3] = REGIST_FUNC(actor, goals, Redmane_Act03)
	acts[4] = REGIST_FUNC(actor, goals, Redmane_Act04)
	acts[7] = REGIST_FUNC(actor, goals, Redmane_Act07)
	acts[8] = REGIST_FUNC(actor, goals, Redmane_Act08)
	acts[9] = REGIST_FUNC(actor, goals, Redmane_Act09)
	acts[10] = REGIST_FUNC(actor, goals, Redmane_Act10)
	acts[11] = REGIST_FUNC(actor, goals, Redmane_Act11)
	acts[12] = REGIST_FUNC(actor, goals, Redmane_Act12)
	acts[13] = REGIST_FUNC(actor, goals, Redmane_Act13)
	acts[14] = REGIST_FUNC(actor, goals, Redmane_Act14)
	acts[15] = REGIST_FUNC(actor, goals, Redmane_Act15)
	acts[16] = REGIST_FUNC(actor, goals, Redmane_Act16)--dodge
	-- base redmane end
	
	
	
	
	
	
	-- alt mane start
	
	probabilities[42] = SetCoolTime(actor, goals, 3019, 60, probabilities[42], 0)
	
	probabilities[32] = SetCoolTime(actor, goals, 3000, 14, probabilities[32], 0)
    probabilities[33] = SetCoolTime(actor, goals, 3002, 14, probabilities[33], 0)
    probabilities[37] = SetCoolTime(actor, goals, 3013, 14, probabilities[37], 0)
	probabilities[41] = SetCoolTime(actor, goals, 3001, 14, probabilities[41], 0)
	probabilities[47] = SetCoolTime(actor, goals, 3001, 14, probabilities[47], 0)
	probabilities[48] = SetCoolTime(actor, goals, 3014, 14, probabilities[48], 0) 
	probabilities[34] = SetCoolTime(actor, goals, 3011, 11, probabilities[34], 0) -- dist 4
	probabilities[38] = SetCoolTime(actor, goals, 3007, 11, probabilities[38], 0) -- dist 4
	probabilities[39] = SetCoolTime(actor, goals, 3008, 11, probabilities[39], 0) -- dist 4
	probabilities[40] = SetCoolTime(actor, goals, 3005, 11, probabilities[40], 0) -- dist 4
	probabilities[49] = SetCoolTime(actor, goals, 3025, 11, probabilities[49], 0) -- dist 4
	probabilities[50] = SetCoolTime(actor, goals, 3025, 11, probabilities[50], 0) -- dist 4
	
	acts[32] = REGIST_FUNC(actor, goals, Redmane_Act32)
	acts[33] = REGIST_FUNC(actor, goals, Redmane_Act33)
	acts[34] = REGIST_FUNC(actor, goals, Redmane_Act34)
	acts[37] = REGIST_FUNC(actor, goals, Redmane_Act37)
	acts[38] = REGIST_FUNC(actor, goals, Redmane_Act38)
	acts[39] = REGIST_FUNC(actor, goals, Redmane_Act39)
	acts[40] = REGIST_FUNC(actor, goals, Redmane_Act40)
	acts[41] = REGIST_FUNC(actor, goals, Redmane_Act41)
	acts[42] = REGIST_FUNC(actor, goals, Redmane_Act42)
	acts[43] = REGIST_FUNC(actor, goals, Redmane_Act43)
	acts[44] = REGIST_FUNC(actor, goals, Redmane_Act44)
	
	acts[46] = REGIST_FUNC(actor, goals, Redmane_Act46)--dodge
	acts[47] = REGIST_FUNC(actor, goals, Redmane_Act47)
	acts[48] = REGIST_FUNC(actor, goals, Redmane_Act48)
	acts[49] = REGIST_FUNC(actor, goals, Redmane_Act49)
	acts[50] = REGIST_FUNC(actor, goals, Redmane_Act50)
	
	-- alt mane end
	
	
	
	
	--dragon start
	acts[62] = REGIST_FUNC(actor, goals, Redmane_Act62)
	--dragon end
	
    Common_Battle_Activate(actor, goals, probabilities, acts, REGIST_FUNC(actor, goals, Redmane_ActAfter_AdjustSpace), defFuncParamTbl)
    return 
end



function Redmane_Act01(arg0, actor, goals)
	if arg0:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 90) then
		actor:AddSubGoal(GOAL_COMMON_Turn, 2, TARGET_ENE_0, 0, 0, 0)--turn180
	else
		actor:AddSubGoal(GOAL_COMMON_Turn, 3, TARGET_ENE_0, 45)--turn90
	end
    return
end

function Redmane_Act05(arg0, actor, goals)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3009, TARGET_ENE_0, 999, 0, 0)
	actor:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3015, TARGET_ENE_0, 5, 0)
end

function Redmane_Act06(arg0, actor, goals)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3010, TARGET_ENE_0, 999, 0, 0)
	actor:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3015, TARGET_ENE_0, 5, 0)
end

-- base

function Redmane_Act02(arg0, actor, goals)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	local rand1 = arg0:GetRandam_Int(1, 100)
	Approach_Act_Flex(arg0, actor, 3 - arg0:GetMapHitRadius(TARGET_SELF), 3 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
	actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, 5, 0, 0)
	actor:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3008, TARGET_ENE_0, 5, 0)
	actor:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3006, TARGET_ENE_0, 5, 0)
    return 
end

function Redmane_Act03(arg0, actor, goals)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, actor, 5 - arg0:GetMapHitRadius(TARGET_SELF), 5 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
	actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3002, TARGET_ENE_0, 5, 0, 0)
	actor:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3003, TARGET_ENE_0, 5, 0)
end

function Redmane_Act04(arg0, actor, goals)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, actor, 9 - arg0:GetMapHitRadius(TARGET_SELF), 10 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
	actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3011, TARGET_ENE_0, 999, 0, 0)
	actor:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3012, TARGET_ENE_0, 5, 0)
end

function Redmane_Act07(arg0, actor, goals)
	arg0:SetTimer(1, 5)
	Approach_Act_Flex(arg0, actor, 2.1 - arg0:GetMapHitRadius(TARGET_SELF), 2.1 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
	actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3013, TARGET_ENE_0, 999, 0, 0)
end

function Redmane_Act08(arg0, actor, goals)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, actor, 4 - arg0:GetMapHitRadius(TARGET_SELF), 4.49 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
	actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3007, TARGET_ENE_0, 999, 0, 0)
end

function Redmane_Act09(arg0, actor, goals)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, actor, 2 - arg0:GetMapHitRadius(TARGET_SELF), 2 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 3)
	actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3008, TARGET_ENE_0, 999, 0, 0)
	actor:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3015, TARGET_ENE_0, 7, 0)
	actor:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3002, TARGET_ENE_0, 7, 0)
end

function Redmane_Act10(arg0, actor, goals)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, actor, 2 - arg0:GetMapHitRadius(TARGET_SELF), 2 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 3)
	actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3005, TARGET_ENE_0, 999, 0, 0)
	actor:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3006, TARGET_ENE_0, 5, 0)
end

function Redmane_Act11(arg0, actor, goals)
	localdist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, actor, 2 - arg0:GetMapHitRadius(TARGET_SELF), 2 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 3)
	actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3001, TARGET_ENE_0, 999, 0, 0)
	actor:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3015, TARGET_ENE_0, 7, 0)
	actor:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3000, TARGET_ENE_0, 7, 0)
	actor:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3005, TARGET_ENE_0, 7, 0)
end

function Redmane_Act12(arg0, actor, goals)
	local rand1 = arg0:GetRandam_Int(1, 100)
	actor:ClearSubGoal()
	if rand1 < 50 then
		actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3016, TARGET_ENE_0, 999, 0, 0)
	elseif rand1 >= 70 then
		actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3017, TARGET_ENE_0, 999, 0, 0)
	else
		actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3018, TARGET_ENE_0, 999, 0, 0)
	end
end

function Redmane_Act13(arg0, actor, goals)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	if dist0 < 1 then
		actor:AddSubGoal(GOAL_COMMON_SpinStep, 1.5, 6001, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
	else
		Approach_Act_Flex(arg0, actor, 2.5 - arg0:GetMapHitRadius(TARGET_SELF), 2.5 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
		actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3019, TARGET_ENE_0, 999, 0, 0)
	end
end

function Redmane_Act14(arg0, actor, goals)
	actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 2, 3020, TARGET_ENE_0, 999, 0, 0)
end

function Redmane_Act15(arg0, actor, goals)
	if arg0:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 70) then
		actor:AddSubGoal(GOAL_COMMON_SidewayMove, 1.1, TARGET_ENE_0, 0, 60, true, true, -1)
	elseif arg0:GetDist(TARGET_ENE_0) < 1 then
		actor:AddSubGoal(GOAL_COMMON_LeaveTarget, 1.1, TARGET_ENE_0, 1, TARGET_ENE_0, true, 0)
	else
		Approach_Act_Flex(arg0, actor, 3 - arg0:GetMapHitRadius(TARGET_SELF), 3 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 3)
		actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3021, TARGET_ENE_0, 999, 0, 0)
	end
end

function Redmane_Act16(arg0, actor, goals)
	--arg0:SetNumber(0, 0)
	actor:AddSubGoal(GOAL_COMMON_SpinStep, 0.1, 6001, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
end

function Redmane_Act17(arg0, actor, goals)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, actor, 5 - arg0:GetMapHitRadius(TARGET_SELF), 5 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
	actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3001, TARGET_ENE_0, 999, 0, 0)
	actor:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3004, TARGET_ENE_0, 5, 0)
	actor:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, 5, 0)
end

function Redmane_Act18(arg0, actor, goals)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, actor, 5 - arg0:GetMapHitRadius(TARGET_SELF), 5 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
	actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3014, TARGET_ENE_0, 999, 0, 0)
end

function Redmane_Act19(arg0, actor, goals)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, actor, 13 - arg0:GetMapHitRadius(TARGET_SELF), 10 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
	actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3025, TARGET_ENE_0, 999, 0, 0)
end
function Redmane_Act20(arg0, actor, goals)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, actor, 5 - arg0:GetMapHitRadius(TARGET_SELF), 2 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 3)
	actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3016, TARGET_ENE_0, 999, 0, 0)
	actor:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3017, TARGET_ENE_0, 5, 0)
end
function Redmane_Act21(arg0, actor, goals)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, actor, 5 - arg0:GetMapHitRadius(TARGET_SELF), 5 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
	actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3017, TARGET_ENE_0, 999, 0, 0)
	actor:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3002, TARGET_ENE_0, 5, 0)
	actor:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3003, TARGET_ENE_0, 5, 0)
end


-- Altmane

function Redmane_Act32(arg0, actor, goals)
	Approach_Act_Flex(arg0, actor, 3.2 - arg0:GetMapHitRadius(TARGET_SELF), 3.2 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 3.2 - arg0:GetMapHitRadius(TARGET_SELF) + 10, 50, 0, 4, 8)
    local MaxDist2 = 2.4 - arg0:GetMapHitRadius(TARGET_SELF) + 1
    local MaxDist = 5 - arg0:GetMapHitRadius(TARGET_SELF)
    local spinTime = 0
    local frontAngle = 0
    local getRandom1 = arg0:GetRandam_Int(1, 100)
    if getRandom1 <= 32 then
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, MaxDist, spinTime, frontAngle, 0, 0)
    elseif getRandom1 <= 65 then
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, MaxDist2, spinTime, frontAngle, 0, 0)
        actor:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3008, TARGET_ENE_0, MaxDist, 0, 0)
    else
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, MaxDist2, spinTime, frontAngle, 0, 0)
        actor:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3008, TARGET_ENE_0, 3.9 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 0, 0)
        actor:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3006, TARGET_ENE_0, MaxDist, 0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Redmane_Act33(arg0, actor, goals)
	Approach_Act_Flex(arg0, actor, 3.5 - arg0:GetMapHitRadius(TARGET_SELF), 3.5 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 3.5 - arg0:GetMapHitRadius(TARGET_SELF) + 10, 50, 0, 4, 8)
	local getRandom1 = arg0:GetRandam_Int(1, 100)
	if getRandom1 <= 49 then
		actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3002, TARGET_ENE_0, 5 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0, 0, 0)
	else 
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3002, TARGET_ENE_0, 5 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0, 0, 0)
        actor:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3004, TARGET_ENE_0, 5 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0, 0, 0)
	end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
	
end

function Redmane_Act34(arg0, actor, goals)
	Approach_Act_Flex(arg0, actor, 12 - arg0:GetMapHitRadius(TARGET_SELF), 12 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 12 - arg0:GetMapHitRadius(TARGET_SELF) + 10, 50, 0, 4, 8)
    local MaxDist = 5 - arg0:GetMapHitRadius(TARGET_SELF)
    local spinTime = 0
    local frontAngle = 0
    if arg0:GetRandam_Int(1, 100) <= 50 then
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3011, TARGET_ENE_0, MaxDist, spinTime, frontAngle, 0, 0)
    else
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3011, TARGET_ENE_0, 2.4 - arg0:GetMapHitRadius(TARGET_SELF) + 1, spinTime, frontAngle, 0, 0)
        actor:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3012, TARGET_ENE_0, MaxDist, 0, 0)
    end
    return 
end

function Redmane_Act37(arg0, actor, goals)
	Approach_Act_Flex(arg0, actor, 3.5 - arg0:GetMapHitRadius(TARGET_SELF), 3.5 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 3.5 - arg0:GetMapHitRadius(TARGET_SELF) + 10, 50, 0, 4, 8)
	arg0:SetTimer(1, 5)
	actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3013, TARGET_ENE_0, 999, 0, 0)
	GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Redmane_Act38(arg0, actor, goals)
	Approach_Act_Flex(arg0, actor, 8 - arg0:GetMapHitRadius(TARGET_SELF), 8 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 8 - arg0:GetMapHitRadius(TARGET_SELF) + 10, 50, 0, 4, 8)
	actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3007, TARGET_ENE_0, 5 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0)
end

function Redmane_Act39(arg0, actor, goals)
	Approach_Act_Flex(arg0, actor, 6 - arg0:GetMapHitRadius(TARGET_SELF), 6 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 6 - arg0:GetMapHitRadius(TARGET_SELF) + 10, 50, 0, 4, 8)
    local MaxDist = 6 - arg0:GetMapHitRadius(TARGET_SELF)
    local spinTime = 0
    local frontAngle = 0
    actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3008, TARGET_ENE_0, 2.4 - arg0:GetMapHitRadius(TARGET_SELF) + 1, spinTime, frontAngle, 0, 0)
	actor:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3006, TARGET_ENE_0, MaxDist, 0, 0)
	actor:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3003, TARGET_ENE_0, MaxDist, 0, 0)
    actor:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, MaxDist, 0, 0)
	
	GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Redmane_Act40(arg0, actor, goals)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	Approach_Act_Flex(arg0, actor, 6 - arg0:GetMapHitRadius(TARGET_SELF), 6 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 3)
	actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3005, TARGET_ENE_0, 999, 0, 0)
	--actor:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3006, TARGET_ENE_0, 5, 0)
end

function Redmane_Act41(arg0, actor, goals)
	Approach_Act_Flex(arg0, actor, 2.3 - arg0:GetMapHitRadius(TARGET_SELF), 2.3 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 2.3 - arg0:GetMapHitRadius(TARGET_SELF) + 10, 50, 0, 4, 8)
    local getRandom1 = arg0:GetRandam_Int(1, 100)
	if getRandom1 <= 30 then
		actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3001, TARGET_ENE_0, 3 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0, 0, 0)
	else 
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3001, TARGET_ENE_0, 3 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0, 0, 0)
		actor:AddSubGoal(GOAL_COMMON_ComboRepeat, 5, 3015, TARGET_ENE_0, 7 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0, 0, 0)
		actor:AddSubGoal(GOAL_COMMON_ComboRepeat, 5, 3003, TARGET_ENE_0, 7 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0, 0, 0)
        actor:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, 7 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0, 0, 0)
	end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Redmane_Act42(arg0, actor, goals)
	actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3019, TARGET_ENE_0, 999, 0, 0)
    return
end

function Redmane_Act43(arg0, actor, goals)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	if dist0 < 1 then
		actor:AddSubGoal(GOAL_COMMON_SpinStep, 1.5, 6001, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
	else
		Approach_Act_Flex(arg0, actor, 2.5 - arg0:GetMapHitRadius(TARGET_SELF), 2.5 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
		actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3019, TARGET_ENE_0, 999, 0, 0)
	end
end

function Redmane_Act44(arg0, actor, goals)
    actor:AddSubGoal(GOAL_COMMON_LeaveTarget, 1, TARGET_ENE_0, 5, TARGET_ENE_0, true, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Redmane_Act46(arg0, actor, goals)
	--arg0:SetNumber(0, 0)
	actor:AddSubGoal(GOAL_COMMON_SpinStep, 0.1, 2001, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
end

function Redmane_Act47(arg0, actor, goals)
	Approach_Act_Flex(arg0, actor, 4 - arg0:GetMapHitRadius(TARGET_SELF), 4 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 4 - arg0:GetMapHitRadius(TARGET_SELF) + 10, 50, 0, 4, 8)
    local MaxDist2 = 2.4 - arg0:GetMapHitRadius(TARGET_SELF) + 1
    local MaxDist = 3 - arg0:GetMapHitRadius(TARGET_SELF)
    local spinTime = 0
    local frontAngle = 0
    local getRandom1 = arg0:GetRandam_Int(1, 100)
    if getRandom1 <= 35 then
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3001, TARGET_ENE_0, MaxDist, spinTime, frontAngle, 0, 0)
    elseif getRandom1 <= 75 then
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3001, TARGET_ENE_0, MaxDist2, spinTime, frontAngle, 0, 0)
        actor:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3004, TARGET_ENE_0, MaxDist, 0, 0)
    else
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3001, TARGET_ENE_0, MaxDist2, spinTime, frontAngle, 0, 0)
        actor:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3004, TARGET_ENE_0, 3.9 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 0, 0)
        actor:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, MaxDist, 0, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Redmane_Act48(arg0, actor, goals)
	Approach_Act_Flex(arg0, actor, 3.5 - arg0:GetMapHitRadius(TARGET_SELF), 3.5 - arg0:GetMapHitRadius(TARGET_SELF) + 1, 3.5 - arg0:GetMapHitRadius(TARGET_SELF) + 10, 50, 0, 4, 8)
    actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3014, TARGET_ENE_0, 5 - arg0:GetMapHitRadius(TARGET_SELF), 0, 0, 0, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Redmane_Act49(arg0, actor, goals)
	Approach_Act_Flex(arg0, actor, 20 - arg0:GetMapHitRadius(TARGET_SELF), 5 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
	local getRandom1 = arg0:GetRandam_Int(1, 100)
    if getRandom1 <= 33 then
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3025, TARGET_ENE_0, 999, 0, 0)
	elseif getRandom1 <= 66 then
	    actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3025, TARGET_ENE_0, 999, 0, 0)
        actor:AddSubGoal(GOAL_COMMON_ComboFinal, 5, 3025, TARGET_ENE_0, 999, 0)
    else
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3025, TARGET_ENE_0, 999, 0, 0)
        actor:AddSubGoal(GOAL_COMMON_ComboRepeat, 5, 3025, TARGET_ENE_0, 999, 0, 0)
		actor:AddSubGoal(GOAL_COMMON_ComboFinal, 5, 3025, TARGET_ENE_0, 999, 0)
    end
    return 
end
	
function Redmane_Act50(arg0, actor, goals)
	Approach_Act_Flex(arg0, actor, 20 - arg0:GetMapHitRadius(TARGET_SELF), 5 - arg0:GetMapHitRadius(TARGET_SELF), 999, 100, 0, 3, 5)
    local MaxDist = 20 - arg0:GetMapHitRadius(TARGET_SELF)
    local spinTime = 0
    local frontAngle = 0
	local getRandom1 = arg0:GetRandam_Int(1, 100)
    if getRandom1 <= 50 then
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3025, TARGET_ENE_0, 999, 0, 0)
    else
        actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3025, TARGET_ENE_0, 999, 0, 0)
        actor:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3007, TARGET_ENE_0, MaxDist, 0, 0)
    end
    return 
end

-- dragon

function Redmane_Act62(arg0, actor, goals)
	local dist0 = arg0:GetDist(TARGET_ENE_0)
	local rand1 = arg0:GetRandam_Int(1, 100)
	Approach_Act_Flex(arg0, actor, 3 - arg0:GetMapHitRadius(TARGET_SELF), 3 - arg0:GetMapHitRadius(TARGET_SELF), 999, 50, 0, 3, 5)
	actor:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, 999, 0, 0)
    return
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
