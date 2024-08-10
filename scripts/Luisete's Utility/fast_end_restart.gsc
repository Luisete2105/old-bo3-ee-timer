
function fastExit(){

	level waittill("end_game");
	wait 3;
	exitLevel(0);

}

function fast_restart(){

	self endon("disconnect");

	while(true){
		wait level.tick;

		if(self fragButtonPressed() && self meleeButtonPressed()){
			wait 0.5;
			if(self fragButtonPressed() && self meleeButtonPressed()) map_restart();
		}
	}
}