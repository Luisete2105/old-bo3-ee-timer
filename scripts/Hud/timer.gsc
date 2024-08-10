function timer_hud()
{

	//Waits for the match to begin
    level flag::wait_till("start_zombie_round_logic");
	wait 2.15;

	level.game_start_time = getTime()/1000;

	level.height = 10;

	//Creates general match timer
	if(!isdefined(level.timer_hud)){

		level.timer_hud = newHudElem();
		level.timer_hud init_hudelem("left", "top", "user_left", "user_top", 10, level.height, 1.5, 0, (1,1,1), 1, &"^3Global Time: ");

		level.timer_hud setTimerUp(0);
		level.timer_hud.alpha = 1;
		level.first_tick = level.ticks;

		level.height = level.height+15;

	}

	//This starts the splits for the map
	switch(level.script){

		case "zm_zod":

			//Call the whole splits function
			level thread Zod_Splits();

			//Last split wait conditions
			level flag::wait_till("ee_boss_defeated");
			
			//Calculates  end time
			last_tick = level.ticks;
		break;

		case "zm_factory":

			//Call the whole splits function
			level thread Giant_Splits();

			//Last split wait conditions
			while (!is_giant_ee_done()) wait level.tick;
			
			//Calculates  end time
			last_tick = level.ticks;
		break;

		case "zm_castle":

			//Call the whole splits function
			level thread Castle_Splits();

			//Last split wait conditions
			level flag::wait_till("ee_outro");
			
			//Calculates  end time
			last_tick = level.ticks;
		break;

		case "zm_genesis":

			//Call the whole splits function
			level thread Genesis_timer();

			//Last split wait conditions
			level flag::wait_till("ending_room");
			wait 9;
			
			//Calculates  end time
			last_tick = level.ticks;
		break;

		case "zm_cosmodrome":

			//Call the whole splits function
			level thread Cosmodrome_splits();

			//Last split wait conditions
			level flag::wait_till("weapons_combined");
			while(!level.ee_completed) wait level.tick;
			
			//Calculates  end time
			last_tick = level.ticks;
		break;

		default:
			foreach(player in level.players) player iPrintLnBold("The map "+level.script);
			foreach(player in level.players) player iPrintLnBold("Doesnt have a timer");
	}

	//If the map has its own split created, its gonna show the time it took to complete the EE
	if(isDefined(last_tick)){
		total_ticks = last_tick - level.first_tick;
		level.timer_hud thread calculate_time(total_ticks);
	}

}

/*  TEMPLATE TO CREATE NEW SPLIT

	function new_split(){

		//Creates the timer for the split
		if(!isdefined(level.new_split)){

			level.new_split = newHudElem();
			level.new_split init_hudelem("left", "top", "user_left", "user_top", 10, level.height, 1.5, 0, (1,1,1), 1, &"^3new_split: ");

			level.new_split setTimerUp(0);
			//level.new_split.alpha = 1;
			first_tick = level.ticks;

			level.height = level.height+15;

		}

		//Waits for the condition to happen
		while (something) wait level.tick; / level flag::wait_till(str_flag);

		//Saves the time it took
		last_tick = level.ticks;

		//Calculates the time it took
		total_ticks = last_tick - level.first_tick;
		//Deletes the timer and shows the exact time it took to complete the split
		level.new_split thread calculate_split(total_ticks);
	
	}

*/