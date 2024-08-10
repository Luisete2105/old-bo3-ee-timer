// Thanks Rim for the "Graphical Improvement/Console Enabler" mod
// https://steamcommunity.com/sharedfiles/filedetails/?id=2847091108

function improve_render(){

    SetDvar("r_dof_enable", "0");// disables depth of field/distance blur
	SetDvar("r_lodbiasrigid", "-1000");//increases draw distance/level of detail
	SetDvar("r_modellodbias", "10");//model level of detail

}