#include "precompiled.h"
#include "Player.h"
#include "Spell.h"
#include "Chat.h"
#include "Language.h"
#include "../system/system.h"
#include "../../include/sc_gossip.h"
#include "../../../game/GossipDef.h"
#include "DBCEnums.h"
char *tmp = new char[100];

bool GossipHello_item_teleport(Player *pPlayer, Item* _Item)
{
	if (!pPlayer)
		return true;

	if (pPlayer->isInCombat())
	{
		pPlayer->CLOSE_GOSSIP_MENU();
	}
	if (pPlayer->IsTaxiFlying() || pPlayer->IsMounted())
	{
		pPlayer->CLOSE_GOSSIP_MENU();
	}
	pPlayer->PlayerTalkClass->ClearMenus();
	sprintf(tmp, "|cFF0041FF当前帐户：[%d]积分|r　", pPlayer->Getjf());
	pPlayer->ADD_GOSSIP_ITEM(4, tmp, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 100);
	//pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(2), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 800);
	pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(3), 2, GOSSIP_ACTION_INFO_DEF + 8);
	pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(4), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 40);
	pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(5), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 50);
	pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(6), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 60);
	pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(7), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 70);
	pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(8), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 80);
	pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(9), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 90);
	pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(999), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 999);
	pPlayer->SEND_GOSSIP_MENU(384, _Item->GetGUID());
	return true;
}

void SendDefaultMenu_Item(Player *pPlayer, Item *_Item, uint32 action)
{
	switch (action)
	{
	case GOSSIP_ACTION_INFO_DEF + 100:
		pPlayer->PlayerTalkClass->ClearMenus();
		sprintf(tmp, "|cFF0041FF当前帐户：[%d]积分|r　", pPlayer->Getjf());
		pPlayer->ADD_GOSSIP_ITEM(4, tmp, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 100);
		//pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(2), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 800);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(3), 2, GOSSIP_ACTION_INFO_DEF + 8);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(4), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 40);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(5), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 50);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(6), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 60);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(7), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 70);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(8), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 80);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(9), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 90);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(999), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 999);
		pPlayer->PlayerTalkClass->SendGossipMenu(384, _Item->GetGUID());
		break;
	case GOSSIP_ACTION_INFO_DEF + 40://便利道具
		pPlayer->PlayerTalkClass->ClearMenus();
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(41), 2, GOSSIP_ACTION_INFO_DEF + 41);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(42), 2, GOSSIP_ACTION_INFO_DEF + 42);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(43), 2, GOSSIP_ACTION_INFO_DEF + 43);
		//pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(44), 2, GOSSIP_ACTION_INFO_DEF + 44);
		//pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(45), 2, GOSSIP_ACTION_INFO_DEF + 45);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(46), 2, GOSSIP_ACTION_INFO_DEF + 46);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(998), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 100);
		pPlayer->PlayerTalkClass->SendGossipMenu(384, _Item->GetGUID());
		break;
		case GOSSIP_ACTION_INFO_DEF + 50://秒专业
		pPlayer->PlayerTalkClass->ClearMenus();
		if (pPlayer->HasSkill(SKILL_MINING) && pPlayer->GetBaseSkillValue(SKILL_MINING) < 375)
			pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(51), 2, GOSSIP_ACTION_INFO_DEF + 51);
		if (pPlayer->HasSkill(SKILL_HERBALISM) && pPlayer->GetBaseSkillValue(SKILL_HERBALISM) < 375)
			pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(52), 2, GOSSIP_ACTION_INFO_DEF + 52);
		if (pPlayer->HasSkill(SKILL_FISHING) && pPlayer->GetBaseSkillValue(SKILL_FISHING) < 375)
			pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(53), 2, GOSSIP_ACTION_INFO_DEF + 53);
		if (pPlayer->HasSkill(SKILL_COOKING) && pPlayer->GetBaseSkillValue(SKILL_COOKING) < 375)
			pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(54), 2, GOSSIP_ACTION_INFO_DEF + 54);
		if (pPlayer->HasSkill(SKILL_FIRST_AID) && pPlayer->GetBaseSkillValue(SKILL_FIRST_AID) < 375)
			pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(55), 2, GOSSIP_ACTION_INFO_DEF + 55);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(998), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 100);
		pPlayer->PlayerTalkClass->SendGossipMenu(384, _Item->GetGUID());
		break;
		case GOSSIP_ACTION_INFO_DEF + 60://角色功能
		pPlayer->PlayerTalkClass->ClearMenus();
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(61), 2, GOSSIP_ACTION_INFO_DEF + 61);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(62), 2, GOSSIP_ACTION_INFO_DEF + 62);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(998), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 100);
		pPlayer->PlayerTalkClass->SendGossipMenu(384, _Item->GetGUID());
		break;
		case GOSSIP_ACTION_INFO_DEF + 70://坐骑类
		pPlayer->PlayerTalkClass->ClearMenus();
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(71), 2, GOSSIP_ACTION_INFO_DEF + 71);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(72), 2, GOSSIP_ACTION_INFO_DEF + 72);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(73), 2, GOSSIP_ACTION_INFO_DEF + 73);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(74), 2, GOSSIP_ACTION_INFO_DEF + 74);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(75), 2, GOSSIP_ACTION_INFO_DEF + 75);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(998), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 100);
		pPlayer->PlayerTalkClass->SendGossipMenu(384, _Item->GetGUID());
		break;
		case GOSSIP_ACTION_INFO_DEF + 80://变身类
		pPlayer->PlayerTalkClass->ClearMenus();
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(81), 2, GOSSIP_ACTION_INFO_DEF + 81);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(82), 2, GOSSIP_ACTION_INFO_DEF + 82);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(998), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 100);
		pPlayer->PlayerTalkClass->SendGossipMenu(384, _Item->GetGUID());
		break;
		case GOSSIP_ACTION_INFO_DEF + 90://兑换专属声望
		pPlayer->PlayerTalkClass->ClearMenus();
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(91), 2, GOSSIP_ACTION_INFO_DEF + 91);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(92), 2, GOSSIP_ACTION_INFO_DEF + 92);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(93), 2, GOSSIP_ACTION_INFO_DEF + 93);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(998), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 100);
		pPlayer->PlayerTalkClass->SendGossipMenu(384, _Item->GetGUID());
		break;
	case GOSSIP_ACTION_INFO_DEF + 600:  //个人功能
		pPlayer->PlayerTalkClass->ClearMenus();
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(100),2, GOSSIP_ACTION_INFO_DEF + 3);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(101),2, GOSSIP_ACTION_INFO_DEF + 4);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(102),2, GOSSIP_ACTION_INFO_DEF + 5);
		//pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(103),2, GOSSIP_ACTION_INFO_DEF + 6);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(104),2, GOSSIP_ACTION_INFO_DEF + 7);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(998), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 100);
		pPlayer->PlayerTalkClass->SendGossipMenu(384, _Item->GetGUID());
		break;
	case GOSSIP_ACTION_INFO_DEF + 800:  //传送服务
		pPlayer->PlayerTalkClass->ClearMenus();
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(200),GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 810);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(300),GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 820);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(400),GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 830);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(500),GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 840);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(600),GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 850);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(998), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 100);
		pPlayer->PlayerTalkClass->SendGossipMenu(384, _Item->GetGUID());
		break;
	case GOSSIP_ACTION_INFO_DEF + 810:  //主城传送
		pPlayer->PlayerTalkClass->ClearMenus();
		if(pPlayer->GetTeam() == ALLIANCE)
		{
			pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(201),2, GOSSIP_ACTION_INFO_DEF + 860);
			pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(202),2, GOSSIP_ACTION_INFO_DEF + 861);
			pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(203),2, GOSSIP_ACTION_INFO_DEF + 862);
			pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(204),2, GOSSIP_ACTION_INFO_DEF + 863);
		}
		else
		{
			pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(205),2, GOSSIP_ACTION_INFO_DEF + 864);
			pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(206),2, GOSSIP_ACTION_INFO_DEF + 865);
			pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(207),2, GOSSIP_ACTION_INFO_DEF + 866);
			pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(208),2, GOSSIP_ACTION_INFO_DEF + 867);
		}
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(209),2, GOSSIP_ACTION_INFO_DEF + 868);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(210),2, GOSSIP_ACTION_INFO_DEF + 869);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(211),2, GOSSIP_ACTION_INFO_DEF + 870);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(998), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 100);
		pPlayer->PlayerTalkClass->SendGossipMenu(384, _Item->GetGUID());
		break;
	case GOSSIP_ACTION_INFO_DEF + 820:  //出生地传送
		pPlayer->PlayerTalkClass->ClearMenus();
		if (pPlayer->GetTeam() == ALLIANCE)
			{
				pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(301),2, GOSSIP_ACTION_INFO_DEF + 880);
				pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(302),2, GOSSIP_ACTION_INFO_DEF + 881);
				pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(303),2, GOSSIP_ACTION_INFO_DEF + 882);
				pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(304),2, GOSSIP_ACTION_INFO_DEF + 883);
			}
			else
			{
				pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(305),2, GOSSIP_ACTION_INFO_DEF + 884);
				pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(306),2, GOSSIP_ACTION_INFO_DEF + 885);
				pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(307),2, GOSSIP_ACTION_INFO_DEF + 886);
				pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(308),2, GOSSIP_ACTION_INFO_DEF + 887);

			}
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(998), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 100);
		pPlayer->PlayerTalkClass->SendGossipMenu(384, _Item->GetGUID());
		break;
	case GOSSIP_ACTION_INFO_DEF + 830:  //初级副本
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(401),      2, GOSSIP_ACTION_INFO_DEF + 900);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(402),      2, GOSSIP_ACTION_INFO_DEF + 901);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(403),      2, GOSSIP_ACTION_INFO_DEF + 902);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(404),      2, GOSSIP_ACTION_INFO_DEF + 903);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(405),      2, GOSSIP_ACTION_INFO_DEF + 904);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(406),    2, GOSSIP_ACTION_INFO_DEF + 905);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(407),      2, GOSSIP_ACTION_INFO_DEF + 906);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(408),      2, GOSSIP_ACTION_INFO_DEF + 907);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(409),    2, GOSSIP_ACTION_INFO_DEF + 908);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(410),      2, GOSSIP_ACTION_INFO_DEF + 909);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(411),        2, GOSSIP_ACTION_INFO_DEF + 910);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(998), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 100);
		pPlayer->PlayerTalkClass->SendGossipMenu(384, _Item->GetGUID());
		break;
		// 中级副本
	case GOSSIP_ACTION_INFO_DEF + 840:
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(501),      2, GOSSIP_ACTION_INFO_DEF + 920);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(502),          2, GOSSIP_ACTION_INFO_DEF + 921);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(503),      2, GOSSIP_ACTION_INFO_DEF + 922);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(504),        2, GOSSIP_ACTION_INFO_DEF + 923);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(505),        2, GOSSIP_ACTION_INFO_DEF + 924);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(506), 2, GOSSIP_ACTION_INFO_DEF + 925);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(507), 2, GOSSIP_ACTION_INFO_DEF + 926);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(508), 2, GOSSIP_ACTION_INFO_DEF + 927);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(509),        2, GOSSIP_ACTION_INFO_DEF + 928);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(510),        2, GOSSIP_ACTION_INFO_DEF + 929);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(998), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 100);
		pPlayer->PlayerTalkClass->SendGossipMenu(384, _Item->GetGUID());
		break;

		// 团队副本
	case GOSSIP_ACTION_INFO_DEF + 850: 
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(601),         2, GOSSIP_ACTION_INFO_DEF + 930);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(602),         2, GOSSIP_ACTION_INFO_DEF + 931);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(603),       2, GOSSIP_ACTION_INFO_DEF + 932);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(604),         2, GOSSIP_ACTION_INFO_DEF + 933);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(605),           2, GOSSIP_ACTION_INFO_DEF + 934);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(606),       2, GOSSIP_ACTION_INFO_DEF + 935);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(607), 2, GOSSIP_ACTION_INFO_DEF + 936);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(608),       2, GOSSIP_ACTION_INFO_DEF + 937);
		pPlayer->ADD_GOSSIP_ITEM( 0, pPlayer->GetZiZhiName(609),         2, GOSSIP_ACTION_INFO_DEF + 938);
		pPlayer->ADD_GOSSIP_ITEM(0, pPlayer->GetZiZhiName(998), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 100);
		pPlayer->PlayerTalkClass->SendGossipMenu(384, _Item->GetGUID());
		break;
	case GOSSIP_ACTION_INFO_DEF + 999:  //关闭菜单
		pPlayer->PlayerTalkClass->CloseGossip();
		break;
	}
};

bool GossipSelect_item_teleport(Player *pPlayer, Item *_Item, uint32 sender, uint32 action)
{
	switch (sender)
	{
		// 主选单
	case GOSSIP_SENDER_MAIN:
		pPlayer->PlayerTalkClass->GetGossipMenu().ClearMenu();
		SendDefaultMenu_Item(pPlayer, _Item, action);
		break;
		// 动作执行
	case 2:
		switch (action)
		{
			case GOSSIP_ACTION_INFO_DEF + 3:  //重置天赋
				pPlayer->resetTalents(true);
				//pPlayer->SendTalentsInfoData(false);
				pPlayer->GetSession()->SendNotification("您的天赋已经重置了!　");
				pPlayer->PlayerTalkClass->CloseGossip();
				break;
			case GOSSIP_ACTION_INFO_DEF + 4:  //装备修理
				pPlayer->DurabilityRepairAll(false, 0, false);
				pPlayer->GetSession()->SendNotification("您的装备全部修理完毕!　");
				pPlayer->PlayerTalkClass->CloseGossip();
				break;
			case GOSSIP_ACTION_INFO_DEF + 5: //提升熟练度
				pPlayer->UpdateSkillsToMaxSkillsForLevel();
				pPlayer->GetSession()->SendNotification("你的技能已经提升!　");
				pPlayer->PlayerTalkClass->CloseGossip();
				break;
			case GOSSIP_ACTION_INFO_DEF + 6: //副本重置
				for (uint8 i = 0; i < MAX_DIFFICULTY; ++i)
				{
					Player::BoundInstancesMap &binds = pPlayer->GetBoundInstances(Difficulty(i));
					for (Player::BoundInstancesMap::iterator itr = binds.begin(); itr != binds.end();)
					{
						pPlayer->UnbindInstance(itr, Difficulty(i));
					}
				}
				pPlayer->GetSession()->SendNotification("已清除所有副本CD!　");
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			case GOSSIP_ACTION_INFO_DEF + 7: // 清理战斗
				pPlayer->CombatStop();
				pPlayer->GetSession()->SendNotification("已清除战斗状态!　");
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			case GOSSIP_ACTION_INFO_DEF + 8:  //搓炉石
				pPlayer->PlayerTalkClass->CloseGossip();
				pPlayer->CastSpell(pPlayer, 8690, false);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			case GOSSIP_ACTION_INFO_DEF + 41:  //36格包包
				pPlayer->PlayerTalkClass->CloseGossip();
				if(pPlayer->Getjf() >= 99)
				{
					uint32 jifen = 99;
					pPlayer->AddItem(23162,1);
					pPlayer->Modifyjifen(-(int32)99);
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				else
				{
					uint32 jifen = 99;
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_2,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				break;
			case GOSSIP_ACTION_INFO_DEF + 42:  //28格包包
				pPlayer->PlayerTalkClass->CloseGossip();
				if(pPlayer->Getjf() >= 49)
				{
					uint32 jifen = 49;
					pPlayer->AddItem(40012,1);
					pPlayer->Modifyjifen(-(int32)49);
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				else
				{
					uint32 jifen = 49;
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_2,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				break;
			case GOSSIP_ACTION_INFO_DEF + 43:  //洗点
				pPlayer->PlayerTalkClass->CloseGossip();
				if(pPlayer->Getjf() >= 20)
				{
					if(pPlayer->HasItemCount(40013,1))
					{
						pPlayer->CLOSE_GOSSIP_MENU();
					}
					else
					{
						uint32 jifen = 20;
						pPlayer->AddItem(40013,1);
						pPlayer->Modifyjifen(-(int32)20);
						pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
						pPlayer->CLOSE_GOSSIP_MENU();
					}					
				}
				else
				{
					uint32 jifen = 20;
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_2,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				break;
			case GOSSIP_ACTION_INFO_DEF + 44:  //鸟点全开
				pPlayer->PlayerTalkClass->CloseGossip();
				if(pPlayer->Getjf() >= 29)
				{
					uint32 jifen = 29;
					pPlayer->SetTaxiCheater(true);
					pPlayer->Modifyjifen(-(int32)29);
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				else
				{
					uint32 jifen = 29;
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_2,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				break;
			case GOSSIP_ACTION_INFO_DEF + 45:  //武器熟练度满级
				pPlayer->PlayerTalkClass->CloseGossip();
				if(pPlayer->Getjf() >= 19)
				{
					uint32 jifen = 19;
					pPlayer->UpdateSkillsToMaxSkillsForLevel();
					pPlayer->Modifyjifen(-(int32)19);
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				else
				{
					uint32 jifen = 19;
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_2,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				break;
			case GOSSIP_ACTION_INFO_DEF + 46:  //瞬飞证明
				pPlayer->PlayerTalkClass->CloseGossip();
				if(!pPlayer->HasItemCount(40014, 1))
				{					
					if(pPlayer->Getjf() >= 20)
					{
						uint32 jifen = 20;
						pPlayer->AddItem(40014,1);
						pPlayer->Modifyjifen(-(int32)20);
						pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
						pPlayer->CLOSE_GOSSIP_MENU();
					}
					else
					{
						uint32 jifen = 20;
						pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_2,jifen);
						pPlayer->CLOSE_GOSSIP_MENU();
					}					
				}
				else
				{
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_4);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				break;
			case GOSSIP_ACTION_INFO_DEF + 51:  //挖矿
				pPlayer->PlayerTalkClass->CloseGossip();
				if(pPlayer->Getjf() >= 149)
				{
					uint32 jifen = 149;
					pPlayer->SetSkill(SKILL_MINING, 375, 375);
					pPlayer->Modifyjifen(-(int32)149);
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				else
				{
					uint32 jifen = 149;
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_2,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				break;
			case GOSSIP_ACTION_INFO_DEF + 52:  //草药
				pPlayer->PlayerTalkClass->CloseGossip();
				if(pPlayer->Getjf() >= 149)
				{
					uint32 jifen = 149;
					pPlayer->SetSkill(SKILL_HERBALISM, 375, 375);
					pPlayer->Modifyjifen(-(int32)149);
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				else
				{
					uint32 jifen = 149;
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_2,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				break;
			case GOSSIP_ACTION_INFO_DEF + 53:  //钓鱼
				pPlayer->PlayerTalkClass->CloseGossip();
				if(pPlayer->Getjf() >= 99)
				{
					uint32 jifen = 99;
					pPlayer->SetSkill(SKILL_FISHING, 375, 375);
					pPlayer->Modifyjifen(-(int32)99);
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				else
				{
					uint32 jifen = 99;
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_2,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				break;
			case GOSSIP_ACTION_INFO_DEF + 54:  //烹饪
				pPlayer->PlayerTalkClass->CloseGossip();
				if(pPlayer->Getjf() >= 99)
				{
					uint32 jifen = 99;
					pPlayer->SetSkill(SKILL_COOKING, 375, 375);
					pPlayer->Modifyjifen(-(int32)99);
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				else
				{
					uint32 jifen = 99;
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_2,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				break;
			case GOSSIP_ACTION_INFO_DEF + 55:  //急救
				pPlayer->PlayerTalkClass->CloseGossip();
				if(pPlayer->Getjf() >= 99)
				{
					uint32 jifen = 99;
					pPlayer->SetSkill(SKILL_FIRST_AID, 375, 375);
					pPlayer->Modifyjifen(-(int32)99);
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				else
				{
					uint32 jifen = 99;
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_2,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				break;
			case GOSSIP_ACTION_INFO_DEF + 61:  //改名
				pPlayer->PlayerTalkClass->CloseGossip();
				if(pPlayer->Getjf() >= 99)
				{
					uint32 jifen = 99;
					pPlayer->SetAtLoginFlag(AT_LOGIN_RENAME);
					pPlayer->Modifyjifen(-(int32)99);
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
					pPlayer->GetSession()->KickPlayer();
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				else
				{
					uint32 jifen = 99;
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_2,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				break;
			case GOSSIP_ACTION_INFO_DEF + 62:  //改性别
				pPlayer->PlayerTalkClass->CloseGossip();
				if(pPlayer->Getjf() >= 29)
				{
					if(pPlayer->getGender() == 0)
					{
						uint32 jifen = 29;
						pPlayer->SetGender(1);
						pPlayer->Modifyjifen(-(int32)29);
						pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
						pPlayer->GetSession()->KickPlayer();
						pPlayer->CLOSE_GOSSIP_MENU();
					}
					else
					{
						uint32 jifen = 29;
						pPlayer->SetGender(0);
						pPlayer->Modifyjifen(-(int32)29);
						pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
						pPlayer->GetSession()->KickPlayer();
						pPlayer->CLOSE_GOSSIP_MENU();
					}
				}
				else
				{
					uint32 jifen = 29;
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_2,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				break;
			case GOSSIP_ACTION_INFO_DEF + 71:  //迅捷祖利安猛虎
				pPlayer->PlayerTalkClass->CloseGossip();
				if(pPlayer->Getjf() >= 99)
				{
					if(pPlayer->HasItemCount(19902,1))
					{
						pPlayer->CLOSE_GOSSIP_MENU();
					}
					else
					{
						uint32 jifen = 99;
						pPlayer->AddItem(19902,1);
						pPlayer->Modifyjifen(-(int32)99);
						pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
						pPlayer->CLOSE_GOSSIP_MENU();
					}
				}
				else
				{
					uint32 jifen = 99;
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_2,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				break;
			case GOSSIP_ACTION_INFO_DEF + 72:  //乌龟坐骑
				pPlayer->PlayerTalkClass->CloseGossip();
				if(pPlayer->Getjf() >= 49)
				{
					uint32 jifen = 49;
					pPlayer->AddItem(23720,1);
					pPlayer->Modifyjifen(-(int32)49);
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				else
				{
					uint32 jifen = 49;
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_2,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				break;
			case GOSSIP_ACTION_INFO_DEF + 73:  //上古霜刃豹缰绳
				pPlayer->PlayerTalkClass->CloseGossip();
				if(pPlayer->Getjf() >= 99)
				{
					if(pPlayer->HasItemCount(40013,1))
					{
						pPlayer->CLOSE_GOSSIP_MENU();
					}
					uint32 jifen = 99;
					pPlayer->AddItem(12302,1);
					pPlayer->Modifyjifen(-(int32)99);
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				else
				{
					uint32 jifen = 99;
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_2,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				break;
			case GOSSIP_ACTION_INFO_DEF + 74:  //乌鸦之神
				pPlayer->PlayerTalkClass->CloseGossip();
				if(pPlayer->Getjf() >= 199)
				{
					if(pPlayer->HasItemCount(40013,1))
					{
						pPlayer->CLOSE_GOSSIP_MENU();
					}
					else
					{
						uint32 jifen = 199;
						pPlayer->AddItem(32768,1);
						pPlayer->Modifyjifen(-(int32)199);
						pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
						pPlayer->CLOSE_GOSSIP_MENU();
					}
				}
				else
				{
					uint32 jifen = 199;
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_2,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				break;
			case GOSSIP_ACTION_INFO_DEF + 75:  //奥的灰烬
				pPlayer->PlayerTalkClass->CloseGossip();
				if(pPlayer->Getjf() >= 1988)
				{
					if(pPlayer->HasItemCount(40154,1))
					{
						pPlayer->CLOSE_GOSSIP_MENU();
					}
					else
					{
						uint32 jifen = 1988;
						pPlayer->AddItem(40154,1);
						pPlayer->Modifyjifen(-(int32)1988);
						pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
						pPlayer->CLOSE_GOSSIP_MENU();
					}
				}
				else
				{
					uint32 jifen = 1988;
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_2,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				break;
			case GOSSIP_ACTION_INFO_DEF + 81:  //秒级卡1
				pPlayer->PlayerTalkClass->CloseGossip();
				if(pPlayer->Getjf() >= 1)
				{
					uint32 jifen = 1;
					pPlayer->AddItem(40021,1);
					pPlayer->Modifyjifen(-(int32)1);
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();					
				}
				else
				{
					uint32 jifen = 1;
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_2,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				break;
			case GOSSIP_ACTION_INFO_DEF + 82:  //秒级卡max
				pPlayer->PlayerTalkClass->CloseGossip();
				if(pPlayer->Getjf() >= 50)
				{
					if(pPlayer->HasItemCount(40022,1))
					{
						pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_4);
						pPlayer->CLOSE_GOSSIP_MENU();
					}
					else
					{
						uint32 jifen = 50;
						pPlayer->AddItem(40022,1);
						pPlayer->Modifyjifen(-(int32)50);
						pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
						pPlayer->CLOSE_GOSSIP_MENU();
					}					
				}
				else
				{
					uint32 jifen = 50;
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_2,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				break;
			case GOSSIP_ACTION_INFO_DEF + 91:  //兑换经典声望
				pPlayer->PlayerTalkClass->CloseGossip();
				if(pPlayer->Getjf() >= 1)
				{
					uint32 jifen = 1;
					pPlayer->AddItem(40020,1);
					pPlayer->Modifyjifen(-(int32)1);
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();					
				}
				else
				{
					uint32 jifen = 1;
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_2,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				break;
			case GOSSIP_ACTION_INFO_DEF + 92:  //兑换经典声望
				pPlayer->PlayerTalkClass->CloseGossip();
				if(pPlayer->Getjf() >= 10)
				{
					uint32 jifen = 10;
					pPlayer->AddItem(40020,10);
					pPlayer->Modifyjifen(-(int32)10);
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();					
				}
				else
				{
					uint32 jifen = 10;
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_2,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				break;
			case GOSSIP_ACTION_INFO_DEF + 93:  //兑换经典声望
				pPlayer->PlayerTalkClass->CloseGossip();
				if(pPlayer->Getjf() >= 100)
				{
					uint32 jifen = 100;
					pPlayer->AddItem(40020,100);
					pPlayer->Modifyjifen(-(int32)100);
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_1,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();					
				}
				else
				{
					uint32 jifen = 100;
					pPlayer->GetSession()->SendNotification(HELLGROUND_STRING_2,jifen);
					pPlayer->CLOSE_GOSSIP_MENU();
				}
				break;
			// 暴风城
			case GOSSIP_ACTION_INFO_DEF + 860:
				pPlayer->TeleportTo(0, -9065, 434, 94, 0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			// 铁炉堡
			case GOSSIP_ACTION_INFO_DEF + 861:
				pPlayer->TeleportTo(0, -5032, -819, 495, 0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			// 达纳苏斯
			case GOSSIP_ACTION_INFO_DEF + 862:
				pPlayer->TeleportTo(1, 9961, 2055, 1329, 0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			// 德萊尼主城
			case GOSSIP_ACTION_INFO_DEF + 863:
				pPlayer->TeleportTo(530, -4071.7f, -12036.7f, -1.5f, 0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			// 奥格瑞玛
			case GOSSIP_ACTION_INFO_DEF + 864:
				pPlayer->TeleportTo(1, 1317, -4383, 27, 0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			// 雷霆崖
			case GOSSIP_ACTION_INFO_DEF + 865:
				pPlayer->TeleportTo(1, -1391, 140, 23, 0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			// 幽暗城
			case GOSSIP_ACTION_INFO_DEF + 866:
				pPlayer->TeleportTo(0, 1909, 235, 53, 0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			//血精灵主城
			case GOSSIP_ACTION_INFO_DEF + 867:
				pPlayer->TeleportTo(530, 9336.9f, -7278.4f, 13.6f, 0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			// 棘齿城 */
			case GOSSIP_ACTION_INFO_DEF + 868:
				pPlayer->TeleportTo(1, -977, -3788, 6, 0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			// 藏宝海湾
			case GOSSIP_ACTION_INFO_DEF + 869:
				pPlayer->TeleportTo(0, -14302, 518, 9, 0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
				// 沙塔斯
			case GOSSIP_ACTION_INFO_DEF + 870:
				pPlayer->TeleportTo(530,-1831,5297,-11,0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			// ·人类出生地 统一格式说明：(MapID, X, Y, Z, 0);
			case GOSSIP_ACTION_INFO_DEF + 880:
				pPlayer->TeleportTo(0, -8945.808594f, -152.064667f, 82.491745f, 0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			// ·暗夜精灵出生地
			case GOSSIP_ACTION_INFO_DEF + 881:
				pPlayer->TeleportTo(1, 10321.046875f, 834.703125f, 1326.373413f, 0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			// ·地精出生地
			case GOSSIP_ACTION_INFO_DEF + 882:
				pPlayer->TeleportTo(0, -6238.875488f, 336.343140f, 382.963715f, 0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			// ·德莱妮出生地
			case GOSSIP_ACTION_INFO_DEF + 883:
				pPlayer->TeleportTo(530, -3963.237549f, -13929.471680f, 100.529718f, 0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			// ·兽人出生地
			case GOSSIP_ACTION_INFO_DEF + 884:
				pPlayer->TeleportTo(1, -600.34890f, -4263.093262f, 38.956245f, 0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			// ·牛头人出生地
			case GOSSIP_ACTION_INFO_DEF + 885:
				pPlayer->TeleportTo(1, -2938.627686f, -265.806152f, 53.438744f, 0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			// ·亡灵出生地
			case GOSSIP_ACTION_INFO_DEF + 886:
				pPlayer->TeleportTo(0, 1664.067139f, 1677.903564f, 120.529999f, 0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			// ·血精灵出生地
			case GOSSIP_ACTION_INFO_DEF + 887:
				pPlayer->TeleportTo(530, 10351.513250f, -6358.020020f, 33.610661f, 0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
				// [14] 怒焰裂谷 统一格式说明：(MapID, X, Y, Z, 0);
			case GOSSIP_ACTION_INFO_DEF + 900:
				pPlayer->TeleportTo(389,2.024650f,-10.021000f,-16.187500f,0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
				// [19] 死亡矿井
			case GOSSIP_ACTION_INFO_DEF + 901:
				pPlayer->TeleportTo(36,-16.4f,-383.07f,61.78f,0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
				// [22] 哀嚎洞穴
			case GOSSIP_ACTION_INFO_DEF + 902:
				pPlayer->TeleportTo(43,-161.841995f,133.266998f,-73.866203f,0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
				// [24] 影牙城堡
			case GOSSIP_ACTION_INFO_DEF + 903:
				pPlayer->TeleportTo(33,-228.19f,2110.56f,76.89f,0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
				// [26] 黑暗深渊
			case GOSSIP_ACTION_INFO_DEF + 904:
				pPlayer->TeleportTo(48,-150.367004f,102.995003f,-40.555801f,0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
				// [27] 暴风城监狱
			case GOSSIP_ACTION_INFO_DEF + 905:
				pPlayer->TeleportTo(34,48.29f,0.45f,-16.14f,0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
				// [31] 剃刀沼泽
			case GOSSIP_ACTION_INFO_DEF + 906:
				pPlayer->TeleportTo(47,1943,1544,82,0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
				// [33] 诺莫瑞根
			case GOSSIP_ACTION_INFO_DEF + 907:
				pPlayer->TeleportTo(90,-332.562988f,-3.445f,-152.845993f,0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
				// [40] 血色修道院
			case GOSSIP_ACTION_INFO_DEF + 908:
				pPlayer->TeleportTo(189,855.903992f,1321.939941f,18.673000f,0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
				// [42] 剃刀高地
			case GOSSIP_ACTION_INFO_DEF + 909:
				pPlayer->TeleportTo(129,2593.209961f,1109.459961f,51.093300f,0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
				// [45] 奥达曼
			case GOSSIP_ACTION_INFO_DEF + 910:
				pPlayer->TeleportTo(70,-227.529007f,45.009800f,-46.019600f,0);
				pPlayer->CLOSE_GOSSIP_MENU();
				break;
				// [46] 祖尔法拉克 统一格式说明：(MapID, X, Y, Z, 0);
				case GOSSIP_ACTION_INFO_DEF + 920:
					pPlayer->TeleportTo(209,1213,841,8.9f,0);
					pPlayer->CLOSE_GOSSIP_MENU();
					break;
					// [49] 玛拉顿
				case GOSSIP_ACTION_INFO_DEF + 921:
					pPlayer->TeleportTo(349,1012.700012f,-459.317993f,-43.547100f,0);
					pPlayer->CLOSE_GOSSIP_MENU();
					break;
					// [53] 失落的神庙
				case GOSSIP_ACTION_INFO_DEF + 922:
					pPlayer->TeleportTo(109,-313.369995f,99.955399f,-131.848999f,0);
					pPlayer->CLOSE_GOSSIP_MENU();
					break;
					// [57] 黑石深渊
				case GOSSIP_ACTION_INFO_DEF + 923:
					pPlayer->TeleportTo(230,456.928986f,34.927700f,-69.388100f,0);
					pPlayer->CLOSE_GOSSIP_MENU();
					break;
					// [60] 通灵学院
				case GOSSIP_ACTION_INFO_DEF + 924:
					pPlayer->TeleportTo(289,199,126,135,0);
					pPlayer->CLOSE_GOSSIP_MENU();
					break;
					// [60] 厄运之槌 (北区)
				case GOSSIP_ACTION_INFO_DEF + 925:
					pPlayer->TeleportTo(429,255.164001f,-17.024200f,-2.560600f,0);
					pPlayer->CLOSE_GOSSIP_MENU();
					break;
					// [60] 厄运之槌 (东区)
				case GOSSIP_ACTION_INFO_DEF + 926:
					pPlayer->TeleportTo(429,46.24f,-155.53f,-2.71349f,0);
					pPlayer->CLOSE_GOSSIP_MENU();
					break;
					// [60] 厄运之槌 (西区)
				case GOSSIP_ACTION_INFO_DEF + 927:
					pPlayer->TeleportTo(429,32.722599f,159.417007f,-3.470170f,0);
					pPlayer->CLOSE_GOSSIP_MENU();
					break;
					// [60] 斯坦索姆
				case GOSSIP_ACTION_INFO_DEF + 928:
					pPlayer->TeleportTo(329,3392,-3379,143,0);
					pPlayer->CLOSE_GOSSIP_MENU();
					break;
					// [60] 黑石塔下
				case GOSSIP_ACTION_INFO_DEF + 929:
					pPlayer->TeleportTo(229,78.19f,-227.63f,49.72f,0);
					pPlayer->CLOSE_GOSSIP_MENU();
					break;
					// [团] 溶火之心 统一格式说明：(MapID, X, Y, Z, 0);
				case GOSSIP_ACTION_INFO_DEF + 930:
					pPlayer->TeleportTo(409,1089.601685f,-470.190247f,-106.413055f,0);
					pPlayer->CLOSE_GOSSIP_MENU();
					break;
					// [团] 黑石塔上
				case GOSSIP_ACTION_INFO_DEF + 931:
					pPlayer->TeleportTo(229,78.339836f,-227.793518f,49.7103f,0);
					pPlayer->CLOSE_GOSSIP_MENU();
					break;
					// [团] 祖尔格拉布
				case GOSSIP_ACTION_INFO_DEF + 932:
					pPlayer->TeleportTo(309,-11916,-1251.469971f,92.32f,0);
					pPlayer->CLOSE_GOSSIP_MENU();
					break;
					// [团] 黑翼之巢
				case GOSSIP_ACTION_INFO_DEF + 933:
					pPlayer->TeleportTo(469,-7674.470215f,-1108.380005f,396.649994f,0);
					pPlayer->CLOSE_GOSSIP_MENU();
					break;
					// [团] 安其拉
				case GOSSIP_ACTION_INFO_DEF + 934:
					pPlayer->TeleportTo(531,-8212.002930f,2034.474854f,129.141342f,0);
					pPlayer->CLOSE_GOSSIP_MENU();
					break;
					// [团] 安其拉废墟
				case GOSSIP_ACTION_INFO_DEF + 935:
					pPlayer->TeleportTo(509,-8443.475586f,1518.648560f,31.906958f,0);
					pPlayer->CLOSE_GOSSIP_MENU();
					break;
					// [团] 奥妮克希亚的巢穴
				case GOSSIP_ACTION_INFO_DEF + 936:
					pPlayer->TeleportTo(249,30.010290f,-58.840508f,-5.325367f,0);
					pPlayer->CLOSE_GOSSIP_MENU();
					break;
					//[团] 纳克萨玛斯 
				case GOSSIP_ACTION_INFO_DEF + 937:
					pPlayer->TeleportTo(533,3005.87f,-3435.01f,293.882f,0);
					pPlayer->CLOSE_GOSSIP_MENU();
					break;
					// [团] 冰龙巢穴
				case GOSSIP_ACTION_INFO_DEF + 938:
					pPlayer->TeleportTo(533,3700.35f,-5185.92f,143.957f,4.403038f,0);
					pPlayer->CLOSE_GOSSIP_MENU();
					break;

		}
	}
	return true;
}

bool GossipSelect_Item(Player *player, Item *_Item, uint32 sender, uint32 action)
{
	return GossipSelect_item_teleport(player, _Item, sender, action);
}

bool Gossip_test_USE(Player *player, Item* _Item, SpellCastTargets const& targets)
{
	return GossipHello_item_teleport(player, _Item);
}

void AddSC_item_teleport()
{
	Script *newscript;
	newscript = new Script;
	newscript->Name = "item_teleport";
	//newscript->pGossipHello_Item = &GossipHello_npc_tele;
	newscript->pItemUse = Gossip_test_USE;
	newscript->pGossipItemSelect = GossipSelect_Item;
	newscript->RegisterSelf();
}