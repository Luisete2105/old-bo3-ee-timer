#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\hud_message_shared;
#include scripts\shared\hud_shared;
#include scripts\shared\array_shared;

#include scripts\shared\flag_shared;

#include scripts\zm\_zm_utility;
#include scripts\shared\ai\zombie_utility;
#include scripts\zm\_zm_powerup_weapon_minigun;


#namespace ee_timer;

function autoexec __init__sytem__()
{
	compiler::detour();
	system::register("ee_timer", ::__init__, undefined, undefined);
}

function __init__()
{
	callback::on_start_gametype(::init);
	callback::on_connect(::on_player_connect);
}