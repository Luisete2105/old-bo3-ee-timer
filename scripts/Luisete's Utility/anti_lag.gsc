// Thanks HitmanVere for the "Power Lag Fix [MOD]" mod, which I took and tuned a little bit
// https://steamcommunity.com/sharedfiles/filedetails/?id=1621303805

function precache_strings(){

    str_trig = Spawn( "trigger_radius", (0, 0, 0), 0, 16, 16 );
    str_trig SetInvisibleToAll();

    level waittill( "all_players_connected" );

    precache_base_perks(str_trig);
    precache_general(str_trig);
    precache_pap(str_trig);

    str_trig delete();

}

function precache_general(str_trig){

    register_this_string(str_trig, &"HINT_NOICON");
    register_this_string(str_trig, &"ZOMBIE_NEED_POWER");
    register_this_string(str_trig, &"ZOMBIE_NEED_LOCAL_POWER");
    register_this_string(str_trig, &"ZOMBIE_DOOR_ACTIVATE_COUNTER");
    register_this_string(str_trig, &"ZOMBIE_ELECTRIC_SWITCH");
    register_this_string(str_trig, &"ZOMBIE_ELECTRIC_SWITCH_OFF");
    register_this_string(str_trig, &"ZOMBIE_NAVCARD_PICKUP");
    register_this_string(str_trig, &"GENERIC_PICKUP");
    register_this_string(str_trig, &"ZOMBIE_BUTTON_TO_REVIVE_PLAYER");

}

function precache_base_perks(str_trig){

    register_this_string(str_trig, &"ZOMBIE_PERK_ADDITIONALPRIMARYWEAPON", 4000);
    register_this_string(str_trig, &"ZOMBIE_PERK_DOUBLETAP", 2000);
    register_this_string(str_trig, &"ZOMBIE_PERK_FASTRELOAD", 3000);
    register_this_string(str_trig, &"ZOMBIE_PERK_JUGGERNAUT", 2500);
    register_this_string(str_trig, &"ZOMBIE_PERK_MARATHON", 2000);
    register_this_string(str_trig, &"ZOMBIE_PERK_QUICKREVIVE", 1500);
    register_this_string(str_trig, &"ZOMBIE_PERK_QUICKREVIVE", 500);

}

function precache_pap(str_trig){

    register_this_string(str_trig, &"ZOMBIE_PERK_PACKAPUNCH", 5000);
    register_this_string(str_trig, &"ZOMBIE_PERK_PACKAPUNCH_AAT", 2500);
    register_this_string(str_trig, &"ZOMBIE_PERK_PACKAPUNCH_AAT", 500);
    register_this_string(str_trig, &"ZOMBIE_GET_UPGRADED_FILL");

}

function register_this_string(trig, string, insert = undefined)
{
    if(!isDefined(insert)) trig SetHintString(string);
    else trig SetHintString(string, insert);

    wait 0.5; // Just so we don't register all strings at once
}