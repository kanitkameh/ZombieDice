//ANSI sequence where \u{001B} is ESCAPE and [2J is clear screen.
func clearScreen(){
    print("\u{001B}[2J");
}
var playAgain: Bool;
print("Enter player names:")
var playerNames:[String]? = readLine()?.split(separator: " ").map { String($0) };

var game = Game(playerNames:playerNames ?? ["Unnamed Player"])
repeat {
    clearScreen();
    game.beginGame();
    print("Do you want to play again?(yes/no)")
    playAgain = (readLine()=="yes");
} while playAgain