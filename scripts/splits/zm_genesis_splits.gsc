function Genesis_timer(){

    Keeper__Start(); // Starts at begining and ends when keeper starts

    Margwa_Start(); // Starts when Keeper starts and ends when the reel from Margwas round is placed

    Teleport1(); // Starts when reel from Margwas is placed and ends when you TP to Samantha's room to pick up the book

    Eggs(); // Starts when you enter the TP for Samantha's book and ends when you press F to interact with the book

    Book_RNG();// Ends when you interact with the book at bossfight and ends when you collect the 4 correct symbols

    Teleport2(); //Starts when you pick up the symbols and ends when you use TP for Shadowman

    Shadowman_(); //Starts when you end the last TP and ends when you finish the EE
}

function Keeper__Start(){

    //Creates the timer for the split
    if(!isdefined(level.Keeper_Start)){

		level.Keeper_Start = newHudElem();
		level.Keeper_Start init_hudelem("left", "top", "user_left", "user_top", 10, level.height, 1.5, 0, (1,1,1), 1, &"^3Keeper_Start: ");

		level.Keeper_Start setTimerUp(0);
		//level.Keeper_Start.alpha = 1;
		 

        level.height = level.height+15;

	}

    //Waits for the keeper to start
    while (level.ai_companion.ignoreme && !level.ai_companion.allow_zombie_to_target_ai && !level.ai_companion.takedamage) wait level.tick;

    //Saves the time it took
    last_tick = level.ticks;

    //Calculates the time it took
    total_ticks = last_tick - level.first_tick;
    //Deletes the timer and shows the exact time it took to complete the split
	level.Keeper_Start thread calculate_split(total_ticks);

}

function Margwa_Start(){
  
    //Creates the timer for the split
    if(!isdefined(level.Margwa_Start)){

		level.Margwa_Start = newHudElem();
		level.Margwa_Start init_hudelem("left", "top", "user_left", "user_top", 10, level.height, 1.5, 0, (1,1,1), 1, &"^3Margwa_Start: ");

		level.Margwa_Start setTimerUp(0);
		//level.Margwa_Start.alpha = 1;
		 

        level.height = level.height+15;

	}

    //Waits for the condition to happen
    level flag::wait_till("placed_audio1");

    //Saves the time it took
    last_tick = level.ticks;

    //Calculates the time it took
    total_ticks = last_tick - level.first_tick;
    //Deletes the timer and shows the exact time it took to complete the split
	level.Margwa_Start thread calculate_split(total_ticks);
  
}

function Teleport1(){

    //Creates the timer for the split
    if(!isdefined(level.Teleport1)){

		level.Teleport1 = newHudElem();
		level.Teleport1 init_hudelem("left", "top", "user_left", "user_top", 10, level.height, 1.5, 0, (1,1,1), 1, &"^3Teleport1: ");

		level.Teleport1 setTimerUp(0);
		//level.Teleport1.alpha = 1;
		 

		level.height = level.height+15;

	}

    //Waits for the condition to happen
    level flag::wait_till("teleporter_on");

    //Saves the time it took
    last_tick = level.ticks;

    //Calculates the time it took
    total_ticks = last_tick - level.first_tick;
    //Deletes the timer and shows the exact time it took to complete the split
	level.Teleport1 thread calculate_split(total_ticks);
 
}

function Eggs(){

    //Creates the timer for the split
    if(!isdefined(level.Eggs)){

		level.Eggs = newHudElem();
		level.Eggs init_hudelem("left", "top", "user_left", "user_top", 10, level.height, 1.5, 0, (1,1,1), 1, &"^3Eggs: ");

		level.Eggs setTimerUp(0);
		//level.Eggs.alpha = 1;
		 

		level.height = level.height+15;

	}

    //Waits for the condition to happen
    level flag::wait_till("book_runes_in_progress");

    //Saves the time it took
    last_tick = level.ticks;

    //Calculates the time it took
    total_ticks = last_tick - level.first_tick;
    //Deletes the timer and shows the exact time it took to complete the split
	level.Eggs thread calculate_split(total_ticks);
 
}

function Book_RNG(){

    //Creates the timer for the split
    if(!isdefined(level.Book_RNG)){

		level.Book_RNG = newHudElem();
		level.Book_RNG init_hudelem("left", "top", "user_left", "user_top", 10, level.height, 1.5, 0, (1,1,1), 1, &"^3Book_RNG: ");

		level.Book_RNG setTimerUp(0);
		//level.Book_RNG.alpha = 1;
		 

		level.height = level.height+15;

	}

    //Waits for the condition to happen
    level flag::wait_till("book_runes_success");

    //Saves the time it took
    last_tick = level.ticks;

    //Calculates the time it took
    total_ticks = last_tick - level.first_tick;
    //Deletes the timer and shows the exact time it took to complete the split
	level.Book_RNG thread calculate_split(total_ticks);
  
}

function Teleport2(){

    //Creates the timer for the split
    if(!isdefined(level.Teleport2)){

		level.Teleport2 = newHudElem();
		level.Teleport2 init_hudelem("left", "top", "user_left", "user_top", 10, level.height, 1.5, 0, (1,1,1), 1, &"^3Teleport2: ");

		level.Teleport2 setTimerUp(0);
		//level.Teleport2.alpha = 1;
		 

		level.height = level.height+15;

	}

    //Waits for the condition to happen
    level flag::wait_till("teleporter_on");
	level flag::wait_till_clear("teleporter_on");

    //Saves the time it took
    last_tick = level.ticks;

    //Calculates the time it took
    total_ticks = last_tick - level.first_tick;
    //Deletes the timer and shows the exact time it took to complete the split
	level.Teleport2 thread calculate_split(total_ticks);
 
}

function Shadowman_(){

    //Creates the timer for the split
    if(!isdefined(level.Shadowman)){

		level.Shadowman = newHudElem();
		level.Shadowman init_hudelem("left", "top", "user_left", "user_top", 10, level.height, 1.5, 0, (1,1,1), 1, &"^3Shadowman: ");

		level.Shadowman setTimerUp(0);
		//level.Shadowman.alpha = 1;
		 

		level.height = level.height+15;

	}

    //Waits for the condition to happen
    level flag::wait_till("ending_room");
	wait 9;

    //Saves the time it took
    last_tick = level.ticks;

    //Calculates the time it took
    total_ticks = last_tick - level.first_tick;
    //Deletes the timer and shows the exact time it took to complete the split
	level.Shadowman thread calculate_split(total_ticks);
 
}