class Turn{
    var dice: [Dice]=[]; //Dice from the current turn
    var sides: [DiceSide]=[]; //The currentside for every dice
    var pool: DicePool=DicePool(); //The pool which will contain 13 dice when full
    var lockedDicePositions: Int = -1;
    var healthPoints: Int {
        get{
            let maxHP = 3;
            return max(maxHP-sides.filter({$0==DiceSide.Gun}).count,0); //we want to return zero even if our health is negative
        }
    }
    var turnScore: Int {
        get{
            if(healthPoints>0){
                return sides.filter({$0==DiceSide.Brain}).count;
            } else {
                return 0;
            }
        }
    }
    //printing dice values
    func getThrownDice() -> String{
        var result: String="";
        for (index, side) in sides.enumerated() {
            result+=("\(index). \(dice[index]) \(side) \(index<=lockedDicePositions ? "locked" : "")\n") 
        }
        result+=("\(healthPoints) HP\n");
        result+=("\(turnScore) turn score\n") 
        return result;
    }
    func rerollDicesWithFootsteps(){
        while(sides.contains(DiceSide.Footsteps)){
            //Check if the player has died
            if(healthPoints==0){
                return;
            } 
            print("Do you want to reroll dice?(yes/no)")
            if(readLine()=="yes"){
                print("Which index?");
                var index = Int(readLine() ?? "-1") ?? -1;
                if(index>lockedDicePositions && index<dice.count && sides[index]==DiceSide.Footsteps){
                    sides[index] = dice[index].throwDice();
                    print(getThrownDice());
                }else{
                    print("This index isn't footsteps and can't be rerolled");
                }
            } else {
                break;
            }
        }
        //These three dice will no longer be able to be rerolled even if they have footsteps
        lockedDicePositions = dice.count-1;
    }
    func drawAndRoll(diceCount: Int){
        var newDice = pool.drawDice(upToCount:diceCount);
        sides += newDice.map{$0.throwDice()}
        dice += newDice;
        print(getThrownDice());
    }
}