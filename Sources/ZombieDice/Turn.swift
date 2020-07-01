class Turn{
    var dice: [Dice]=[];
    var sides: [DiceSide]=[];
    var lockedDicePositions: Int=0;
    var remainingHealth: Int {
        get{
            let maxHP = 3;
            return min(maxHP-sides.filter({$0==DiceSide.Gun}).count,0); //we want to return zero even if our health is negative
        }
    }
    var turnScore: Int {
        get{
            if(remainingHealth>0){
                return sides.filter({$0==DiceSide.Brain}).count;
            } else {
                return 0;
            }
        }
    }

}