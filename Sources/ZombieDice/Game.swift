class Game{
    var playerNames:[String];
    var playerScores:[String:Int];

    init(_playerNames:[String]){
        playerNames = _playerNames;
        playerScores = [:];
        resetScores();
    }
    func getScoreTable() -> String{
        var result = "Scores:\n";
        for name in playerNames {
            result += ("\(name) has \(playerScores[name] ?? 0) points\n")
        }
        return result;
    }

    func resetScores(){
        for name in playerNames{
            playerScores[name] = 0;
        }
    }
    func beginGame(){
        resetScores();
        while Array(playerScores.values).contains(13) == false{
            for player in playerNames {
                print("\(player) is on turn");
                playerTurn(player:player);                
                print("\(player)'s turn is over'");
                if(playerScores[player] ?? 0 >= 13){
                    print("\(player) has won the game")
                    print(getScoreTable());
                    return;
                }
                clearScreen();
            }
        }
        
    }
    func playerTurn(player: String){
        var turnScore = 0;
        var healthPoints = 3;
        print(getScoreTable());
        let pool = DicePool();
        var anotherRoll : Bool;
        repeat {
            var dice = pool.drawDice(upToCount:3);
            var sides = dice.map{$0.throwDice()}

            printThrownDice(dice:dice, sides: sides);
            rerollDicesWithFootsteps(dice: dice, sides: &sides);

            turnScore+=sides.filter({$0==DiceSide.Brain}).count;
            healthPoints-=sides.filter({$0==DiceSide.Gun}).count;

            if(healthPoints==0){
                print("You died. No points from this turn.");
                turnScore = 0;
                return;
            }
            print("\(healthPoints) HP \(turnScore) turn score") 
            print("Do you want to draw 3 more dice?(yes/no)")
            anotherRoll = (readLine() == "yes"); 
        } while anotherRoll
        playerScores[player] = (playerScores[player] ?? 0) + turnScore;
    }
    //printing dice values
    func printThrownDice(dice: [Dice],sides: [DiceSide]){
        for (index, side) in sides.enumerated() {
            print("\(index). \(dice[index]) \(side)") 
        }
    }
    func rerollDicesWithFootsteps(dice: [Dice],sides: inout [DiceSide]){
        //reroll dices with footsteps
        for (index, side) in sides.enumerated() {
            //Doing multiple checks since a reroll could still yield footsteps
            while(sides[index]==(DiceSide.Footsteps)){
                print("Do you want to reroll dice number \(index)?(yes/no)")
                if(readLine()=="yes"){
                    sides[index] = dice[index].throwDice();
                    printThrownDice(dice:dice, sides: sides);
                } else {
                    break;
                }
            }
        }
    }
}