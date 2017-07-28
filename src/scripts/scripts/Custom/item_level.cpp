#include "Player.h"
#include "DBCStructure.h"
#include "precompiled.h"

enum
{
	item_id = 40021,
	max_lvl = 70
};

bool Item_Level_I(Player* player, Item* item, const SpellCastTargets &)
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
	int32 addlevel = 1;
	int32 oldlevel = player->getLevel();
	int32 newlevel = oldlevel + addlevel;
	player->GiveLevel(newlevel);
	player->InitTalentForLevel();
	player->SetUInt32Value(PLAYER_XP, 0);
	player->DestroyItemCount(item_id, 1, true);
	player->GetSession()->SendNotification("你的等级提升了　");
	return true;
};


void AddSC_Item_Level_I()
{
	Script* pNewScript;

	pNewScript = new Script;
	pNewScript->Name = "item_level_i";
	pNewScript->pItemUse = Item_Level_I;
	pNewScript->RegisterSelf();
}