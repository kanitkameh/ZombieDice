class DicePool{
    var dices: [Dice];
    //Creating dice pool of 3 red, 4 yellow and 6 green dices
    init(){
        dices = [];
        let reds = Array(repeating: Dice.Red, count: 3)
        let yellows = Array(repeating: Dice.Yellow, count: 4)
        let greens = Array(repeating: Dice.Green, count: 6)
        dices+=(reds);
        dices+=(yellows);
        dices+=(greens);
    }
    //Draws a dice if there is one in the dice pool
    private func drawDice() -> Dice? {
        if(dices.isEmpty){
            return nil;
        }
        let position = Int.random(in: 0..<dices.count)
        let result: Dice? = dices[position];
        dices.remove(at: position);
        return result;
    }
    //We draw 3 dices in our game
    func drawDices(int count) -> [Dice?] {
        var result: [Dice?];
        for _ in 1...count {
            result.append(drawDice());
        }
        return result;
    }
}