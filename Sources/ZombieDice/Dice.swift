enum DiceSide{
    case Brain
    case Footsteps
    case Gun
    func description() -> String {
        switch self {
        case DiceSide.Brain:
            return "Brain. This gives you 1 point."
        case DiceSide.Footsteps:
            return "Footsteps. You may reroll this dice"
        case DiceSide.Gun:
            return "Gun. You have been shot"
        }
    }
}
enum Dice{
    case Red
    case Green
    case Yellow
    func getDiceSides() -> [DiceSide] {
        switch self {
        case Dice.Red:
            return [DiceSide.Brain,DiceSide.Gun,DiceSide.Gun,DiceSide.Footsteps,DiceSide.Footsteps,DiceSide.Gun]
        case Dice.Yellow:
            return [DiceSide.Brain,DiceSide.Brain,DiceSide.Gun,DiceSide.Footsteps,DiceSide.Footsteps,DiceSide.Gun]
        case Dice.Green:
            return [DiceSide.Brain,DiceSide.Brain,DiceSide.Brain,DiceSide.Footsteps,DiceSide.Footsteps,DiceSide.Gun]
        }
    }
    func throwDice() -> DiceSide {
        return self.getDiceSides().randomElement()!;
    }
}