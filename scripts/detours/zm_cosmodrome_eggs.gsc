//Makes switch step doable on any amount of players
detour zm_cosmodrome_eggs<scripts\zm\zm_cosmodrome_eggs.gsc>::switch_watcher()
{
	level endon("between_round_over");
	pressed = 0;
	switches = struct::get_array("sync_switch_start", "targetname");
	while(true)
	{
		level waittill("sync_button_pressed");
		timeout = gettime() + 500;
		/#
			if(isdefined(level.var_ee92e6f7) && level.var_ee92e6f7)
			{
				timeout = timeout + 100000;
			}
		#/
		while(gettime() < timeout)
		{
			pressed = 0;
			for(i = 0; i < switches.size; i++)
			{
				if(isdefined(switches[i].pressed) && switches[i].pressed)
				{
					pressed++;
				}
			}
			if(pressed == level.players.size)
			{
				level flag::set("switches_synced");
				level notify("switches_synced");
				for(i = 0; i < switches.size; i++)
				{
					playsoundatposition("zmb_ee_syncbutton_success", switches[i].origin);
				}
				return;
			}
			wait(0.05);
		}
		/*switch(pressed)
		{
			case 1:
			case 2:
			case 3:
			{
				for(i = 0; i < switches.size; i++)
				{
					playsoundatposition("zmb_ee_syncbutton_deny", switches[i].origin);
				}
				break;
			}
		}*/

        if(pressed != level.players.size) foreach(buton in switches) playsoundatposition("zmb_ee_syncbutton_deny", buton.origin);

        foreach(button in switches) button.pressed = 0;

		/*for(i = 0; i < switches.size; i++)
		{
			switches[i].pressed = 0;
		}*/
	}
}

//Makes autotimer detect when EE has been completed
detour zm_cosmodrome_eggs<scripts\zm\zm_cosmodrome_eggs.gsc>::reward_wait()
{

    level.ee_completed = true;

    while(!zombie_utility::is_player_valid(self) || (self usebuttonpressed() && self zm_utility::in_revive_trigger()))
	{
		wait(1);
	}
	if(!self bgb::is_enabled("zm_bgb_disorderly_combat"))
	{
		level thread zm_powerup_weapon_minigun::minigun_weapon_powerup(self, 90);
	}
	self zm_utility::give_player_all_perks();
}

//Makes the letter grab step doable on Solo
detour zm_cosmodrome_eggs<scripts\zm\zm_cosmodrome_eggs.gsc>::letter_grab(letter, model)
{
	level endon("lander_grounded");

	if(level.players.size == 1){

		//self waittill("trigger", e_player);
		level flag::set("letter_acquired");
		playsoundatposition("zmb_powerup_grabbed", model.origin);
		model ghost();
		/#
			self zm_cosmodrome::function_bb831d("");
		#/
		if(letter == level.passkey[level.passkey_progress])
		{
			level.passkey_progress++;
			if(level.passkey_progress == level.passkey.size)
			{
				level flag::set("passkey_confirmed");
			}
		}
		else
		{
			level.passkey_progress = 0;
		}
		if(letter == level.var_b505a146[level.var_66e412e8])
		{
			level.var_66e412e8++;
			if(level.var_66e412e8 == level.var_b505a146.size)
			{
				level.players[0] playsoundtoplayer("evt_letter_pickup_secret_1", level.players[0]);
			}
		}
		else
		{
			level.var_66e412e8 = 0;
		}
		if(letter == level.var_8f0326dd[level.var_fd63aa69])
		{
			level.var_fd63aa69++;
			if(level.var_fd63aa69 == level.var_8f0326dd.size)
			{
				level.players[0] playsoundtoplayer("evt_letter_pickup_secret_2", level.players[0]);
			}
		}
		else
		{
			level.var_fd63aa69 = 0;
		}

	}else{

		self waittill("trigger", e_player);
		level flag::set("letter_acquired");
		playsoundatposition("zmb_powerup_grabbed", model.origin);
		model ghost();
		/#
			self zm_cosmodrome::function_bb831d("");
		#/
		if(letter == level.passkey[level.passkey_progress])
		{
			level.passkey_progress++;
			if(level.passkey_progress == level.passkey.size)
			{
				level flag::set("passkey_confirmed");
			}
		}
		else
		{
			level.passkey_progress = 0;
		}
		if(letter == level.var_b505a146[level.var_66e412e8])
		{
			level.var_66e412e8++;
			if(level.var_66e412e8 == level.var_b505a146.size)
			{
				e_player playsoundtoplayer("evt_letter_pickup_secret_1", e_player);
			}
		}
		else
		{
			level.var_66e412e8 = 0;
		}
		if(letter == level.var_8f0326dd[level.var_fd63aa69])
		{
			level.var_fd63aa69++;
			if(level.var_fd63aa69 == level.var_8f0326dd.size)
			{
				e_player playsoundtoplayer("evt_letter_pickup_secret_2", e_player);
			}
		}
		else
		{
			level.var_fd63aa69 = 0;
		}

	}

}

//Makes the weapon combo part doable on solo
detour zm_cosmodrome_eggs<scripts\zm\zm_cosmodrome_eggs.gsc>::wait_for_combo(trig)
{
	self endon("death");
	//self thread zm_cosmodrome_eggs::kill_trig_on_death(trig);
	self thread [[ @zm_cosmodrome_eggs<scripts\zm\zm_cosmodrome_eggs.gsc>::kill_trig_on_death ]](trig);
	weapon_combo_spot = struct::get("weapon_combo_spot", "targetname");
	ray_gun_hit = 0;
	doll_hit = 0;
	/#
		if(isdefined(level.var_55336afe) && level.var_55336afe)
		{
			ray_gun_hit = 1;
			doll_hit = 1;
		}
	#/
	players = getplayers();
	array::thread_all(players, zm_cosmodrome_eggs::thundergun_check, self, trig, weapon_combo_spot);
	while(true)
	{
		trig waittill("damage", amount, inflictor, direction, point, type, tagname, modelname, partname, weapon);
		if(isdefined(inflictor))
		{
			if(type == "MOD_PROJECTILE" && (weapon.name == "ray_gun_upgraded" || weapon.name == "raygun_mark2_upgraded"))
			{
				ray_gun_hit = 1;
			}
			else if(weapon.name == "nesting_dolls" || weapon.name == "nesting_dolls_single")
			{
				doll_hit = 1;
			}

			if(level.players.size == 1){

				if(ray_gun_hit && level flag::get("thundergun_hit")){
					level flag::set("weapons_combined");
					//level thread zm_cosmodrome_eggs::soul_release(self, trig.origin);
					level thread [[ @zm_cosmodrome_eggs<scripts\zm\zm_cosmodrome_eggs.gsc>::soul_release ]](self, trig.origin);
					return;
				}
				
			}else{

				if(ray_gun_hit && doll_hit && level flag::get("thundergun_hit")){
					level flag::set("weapons_combined");
					//level thread zm_cosmodrome_eggs::soul_release(self, trig.origin);
					level thread [[ @zm_cosmodrome_eggs<scripts\zm\zm_cosmodrome_eggs.gsc>::soul_release ]](self, trig.origin);
					return;
				}

			}

		}
	}
}