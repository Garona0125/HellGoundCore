/*
_______        _         ______
|__   __|      | |       |  ____|
| | __ _ ___| |_ _   _| |__   _ __ ___  _   _
| |/ _` / __| __| | | |  __| | '_ ` _ \| | | |
| | (_| \__ \ |_| |_| | |____| | | | | | |_| |
|_|\__,_|___/\__|\__, |______|_| |_| |_|\__,_|
__/ |
|___/

Script Made By Sinistah
Special Thanks To LilleCarl For The Code Snippet

Legend
------
item_id = the item id of the item ur using.
max_lvl = the max lvl the script will allow players to use the item.
lvl = how many levels the item will grant upon used
*/
#include "Player.h"
#include "DBCStructure.h"
#include "precompiled.h"

enum
{
	item_id = 40022,
	max_lvl = 70
};

bool Item_Level_Max(Player* player, Item* item, const SpellCastTargets &)
{
	if (player->GetMap()->IsBattleGround())
	{
		player->GetSession()->SendNotification("你现在还不能使用这个物品　");
		return false;
	}
	if (player->getLevel() == max_lvl)
	{
		player->GetSession()->SendNotification("等级已达上限　");
		return false;
	}
	int32 oldlevel = player->getLevel();
	int32 newlevel = 70 - oldlevel;
	int32 level = oldlevel + newlevel;
	player->GiveLevel(level);
	player->InitTalentForLevel();
	player->SetUInt32Value(PLAYER_XP, 0);
	player->DestroyItemCount(item_id, 1, true);
	return true;
};


void AddSC_Item_Level_Max()
{
	Script* pNewScript;

	pNewScript = new Script;
	pNewScript->Name = "Item_Level_Max";
	pNewScript->pItemUse = Item_Level_Max;
	pNewScript->RegisterSelf();
}