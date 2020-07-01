import Foundation
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
                print("Press Enter to continue")
                readLine();
                clearScreen();
            }
        }
        
    }
    func playerTurn(player: String){
        var turn : Turn = Turn();
        print(getScoreTable());
        var anotherRoll : Bool;
        repeat {
            turn.drawAndRoll(diceCount: 3);
            turn.rerollDicesWithFootsteps();
            if(turn.healthPoints==0){
                print("You died. No points from this turn.");
                return;
            }
            print("Do you want to draw 3 more dice?(yes/no)")
            anotherRoll = (readLine() == "yes"); 
        } while (anotherRoll && !turn.pool.isEmpty())
        playerScores[player] = (playerScores[player] ?? 0) + turn.turnScore;
    }
}