var playAgain: Bool;
print("Enter player names:")
var playerNames:[String]? = readLine()?.split(separator: " ").map { String($0) };

var game = Game(_playerNames:playerNames ?? ["Unnamed Player"])
repeat {
    game.beginGame();
    print("Do you want to play again?(yes/no)")
    playAgain = (readLine()=="yes");
} while playAgain

func clearScreen(){
    print("\u{001B}[2J");
}