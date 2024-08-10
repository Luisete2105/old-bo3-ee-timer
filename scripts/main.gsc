function init()
{
    //Starts custom in game timer
    level thread game_time();

    //Skips game end cinematic
    level thread fastExit();

    //Starts the ingame timers
    level thread timer_hud();

    //Makes megas free to use
    level thread free_megas();

    //My attempt to get rid of Power Lag
    level thread precache_strings();

    // A few enhacements for the game
    level thread improve_render();

}

function on_player_connect()
{
    // Shows Speedmeter to the player
    self thread speedmeter_hud();

    // Deletes record of used gums
    self thread delete_bgb_uses();

    // Enables "fast_restart" for non host players with 'melee' & 'frag' buttons
    if(!self ishost()) self thread fast_restart();
}

