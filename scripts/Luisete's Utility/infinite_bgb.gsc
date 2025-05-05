// Add on gameplay start
function free_megas(){

    while( level.bgb.size < 63 ) wait 0.05;

    foreach(i, bgb in level.bgb){

        level.bgb[i].var_35e23ba2 = ::return_false;
    }
}

function return_false(){
    return false;
}

// Add on player connect
function delete_bgb_uses(){

    while( self.bgb_pack.size < 5 ) wait 0.05;
    wait 0.5;

    if( isdefined( self.bgb_stats ) ) self.bgb_stats = undefined;
}