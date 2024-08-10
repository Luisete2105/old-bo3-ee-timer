function speedmeter_hud()
{

	self endon("disconnect");

	if(!isdefined(self.Speed_hud)){

		self.Speed_hud = newClientHudElem(self);
		self.Speed_hud init_hudelem("right", "top", "user_right", "user_top", -50, 150, 1.5, 0, (1,1,1), 1, &"^6Speed: ");

		self.Speed_hud.alpha = 1;


		while(true){
			wait level.tick;

			self.Speed_hud setvalue( int ( length ( self getVelocity() ) ) );
		}

	}

}