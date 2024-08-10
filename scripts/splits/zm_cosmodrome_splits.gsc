function Cosmodrome_splits(){

    level endon("game_ended");

    level.ee_completed = false;

    //generator_tp();

    //power_monitor();

    //switches();

    //landers_passkey();

    //guns_combination();

    power_on();

    clock_step();

    ee_end();



}

function generator_tp(){

    level endon("game_ended");

    //Creates the timer for the split
    if(!isdefined(level.generator_tp)){

		level.generator_tp = newHudElem();
		level.generator_tp init_hudelem("left", "top", "user_left", "user_top", 10, level.height, 1.5, 0, (1,1,1), 1, &"^3generator_tp: ");

		level.generator_tp setTimerUp(0);
		//level.generator_tp.alpha = 1;
		first_tick = level.ticks;

		level.height = level.height+15;

	}

    //Waits for the condition to happen
    level waittill(#"hash_2a49912");

    //Saves the time it took
    last_tick = level.ticks;

    //Calculates the time it took
    total_ticks = last_tick - level.first_tick;
    //Deletes the timer and shows the exact time it took to complete the split
	level.generator_tp thread calculate_split(total_ticks);
 
}

function power_monitor(){

    level endon("game_ended");

    //Creates the timer for the split
    if(!isdefined(level.power_monitor)){

		level.power_monitor = newHudElem();
		level.power_monitor init_hudelem("left", "top", "user_left", "user_top", 10, level.height, 1.5, 0, (1,1,1), 1, &"^3power_monitor: ");

		level.power_monitor setTimerUp(0);
		//level.power_monitor.alpha = 1;
		first_tick = level.ticks;

		level.height = level.height+15;

	}

    //Waits for the condition to happen
    level flag::wait_till("rerouted_power");

    //Saves the time it took
    last_tick = level.ticks;

    //Calculates the time it took
    total_ticks = last_tick - level.first_tick;
    //Deletes the timer and shows the exact time it took to complete the split
	level.power_monitor thread calculate_split(total_ticks);
 
}

function switches(){

    level endon("game_ended");

    //Creates the timer for the split
    if(!isdefined(level.switches)){

		level.switches = newHudElem();
		level.switches init_hudelem("left", "top", "user_left", "user_top", 10, level.height, 1.5, 0, (1,1,1), 1, &"^3switches: ");

		level.switches setTimerUp(0);
		//level.switches.alpha = 1;
		first_tick = level.ticks;

		level.height = level.height+15;

	}

    //Waits for the condition to happen
    level flag::wait_till("switches_synced");

    //Saves the time it took
    last_tick = level.ticks;

    //Calculates the time it took
    total_ticks = last_tick - level.first_tick;
    //Deletes the timer and shows the exact time it took to complete the split
	level.switches thread calculate_split(total_ticks);
 
}

function clock_step(){

    level endon("game_ended");

    //Creates the timer for the split
    if(!isdefined(level.clock_step)){

		level.clock_step = newHudElem();
		level.clock_step init_hudelem("left", "top", "user_left", "user_top", 10, level.height, 1.5, 0, (1,1,1), 1, &"^3Clock step: ");

		level.clock_step setTimerUp(  level.game_start_time - (getTime()/1000) );
		level.clock_step.alpha = 1;
		first_tick = level.ticks;

		level.height = level.height+15;

	}

    //Waits for the condition to happen
    //level flag::wait_till("pressure_sustained");
    level flag::wait_till("launch_complete");

    //Saves the time it took
    last_tick = level.ticks;

    //Calculates the time it took
    total_ticks = last_tick - level.first_tick;
    //Deletes the timer and shows the exact time it took to complete the split
	level.clock_step thread calculate_split(total_ticks);
 
}

function landers_passkey(){

    level endon("game_ended");

    //Creates the timer for the split
    if(!isdefined(level.landers_passkey)){

		level.landers_passkey = newHudElem();
		level.landers_passkey init_hudelem("left", "top", "user_left", "user_top", 10, level.height, 1.5, 0, (1,1,1), 1, &"^3landers_passkey: ");

		level.landers_passkey setTimerUp(0);
		//level.landers_passkey.alpha = 1;
		first_tick = level.ticks;

		level.height = level.height+15;

	}

    //Waits for the condition to happen
    level flag::wait_till("passkey_confirmed");

    //Saves the time it took
    last_tick = level.ticks;

    //Calculates the time it took
    total_ticks = last_tick - level.first_tick;
    //Deletes the timer and shows the exact time it took to complete the split
	level.landers_passkey thread calculate_split(total_ticks);
 
}

function guns_combination(){

    level endon("game_ended");

    //Creates the timer for the split
    if(!isdefined(level.guns_combination)){

		level.guns_combination = newHudElem();
		level.guns_combination init_hudelem("left", "top", "user_left", "user_top", 10, level.height, 1.5, 0, (1,1,1), 1, &"^3guns_combination: ");

		level.guns_combination setTimerUp(0);
		//level.guns_combination.alpha = 1;
		first_tick = level.ticks;

		level.height = level.height+15;

	}

    //Waits for the condition to happen
    level flag::wait_till("weapons_combined");

    //Saves the time it took
    last_tick = level.ticks;

    //Calculates the time it took
    total_ticks = last_tick - level.first_tick;
    //Deletes the timer and shows the exact time it took to complete the split
	level.guns_combination thread calculate_split(total_ticks);
 
}

function power_on(){

    //Creates the timer for the split
    if(!isdefined(level.power_on)){

		level.power_on = newHudElem();
		level.power_on init_hudelem("left", "top", "user_left", "user_top", 10, level.height, 1.5, 0, (1,1,1), 1, &"Power on: ");

		level.power_on setTimerUp(0);
		level.power_on.alpha = 1;
		first_tick = level.ticks;

		level.height = level.height+15;

	}

    //Waits for the condition to happen
    level flag::wait_till("power_on");

    //Saves the time it took
    last_tick = level.ticks;

    //Calculates the time it took
    total_ticks = last_tick - level.first_tick;
    //Deletes the timer and shows the exact time it took to complete the split
	level.power_on thread calculate_split(total_ticks);
 
}

function ee_end(){

    level endon("game_ended");

    //Creates the timer for the split
    if(!isdefined(level.ee_end)){

		level.ee_end = newHudElem();
		level.ee_end init_hudelem("left", "top", "user_left", "user_top", 10, level.height, 1.5, 0, (1,1,1), 1, &"^3EE end: ");

		level.ee_end setTimerUp( level.game_start_time - (getTime()/1000) );
		level.ee_end.alpha = 1;
		first_tick = level.ticks;

		level.height = level.height+15;

	}

    //Waits for the condition to happen
    while (!level.ee_completed) wait level.tick;

    //Saves the time it took
    last_tick = level.ticks;

    //Calculates the time it took
    total_ticks = last_tick - level.first_tick;
    //Deletes the timer and shows the exact time it took to complete the split
	level.ee_end thread calculate_split(total_ticks);
 
}