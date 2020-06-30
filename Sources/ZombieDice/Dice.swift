enum DiceSide{
    case Brains
    case Footsteps
    case Gun
    func description() -> String {
        switch self {
        case DiceSide.Brains:
            return "Brains. This gives you 1 point."
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
            return [DiceSide.Brains,DiceSide.Gun,DiceSide.Gun,DiceSide.Footsteps,DiceSide.Footsteps,DiceSide.Gun]
        case Dice.Yellow:
            return [DiceSide.Brains,DiceSide.Brains,DiceSide.Gun,DiceSide.Footsteps,DiceSide.Footsteps,DiceSide.Gun]
        case Dice.Green:
            return [DiceSide.Brains,DiceSide.Brains,DiceSide.Brains,DiceSide.Footsteps,DiceSide.Footsteps,DiceSide.Gun]
        }
    }
}