import Foundation
class Game{
    var players: [Player] = [];

    init(playerNames:[String]){
        for playerName in playerNames {
           players.append(Player(name: playerName));
        }
    }
    func getScoreTable() -> String{
        var result = "Scores:\n";
        for player in players {
            result += ("\(player.name) has \(player.score) points\n")
        }
        return result;
    }

    func resetScores(){
        for player in players{
            player.score = 0;
        }
    }
    func beginGame(){
        resetScores();
        while players.map({$0.score}).contains(13) == false{
            for player in players {
                print("\(player.name) is on turn");
                playerTurn(player:player);                
                print("\(player.name)'s turn is over'");
                if(player.score >= 13){
                    print("\(player.name) has won the game")
                    print(getScoreTable());
                    return;
                }
                print("Press Enter to continue")
                readLine();
                clearScreen();
            }
        }
        
    }
    func playerTurn(player: Player){
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
        player.score += turn.turnScore;
    }
}