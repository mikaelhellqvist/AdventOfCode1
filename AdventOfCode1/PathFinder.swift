import Foundation

enum ParseError:Error {
    case WrongRotation
}

enum Direction: Int {
    case North = 1
    case East
    case South
    case West
}

enum Rotation: Int {
    case L = -1
    case R = 1
}

class PathFinder {
    
    var currentDirection: Direction = .North
    var path : [String]
    
    init(pathArray: [String]) {
        path = pathArray
    }
    
    func updateDirection(turnRotation: String) throws -> Direction {
        
        guard turnRotation == "R" || turnRotation == "L" else {
            throw ParseError.WrongRotation
        }
        
        let turnValue = (turnRotation == "R") ? Rotation.R.rawValue : Rotation.L.rawValue
        var newDirectionValue = currentDirection.rawValue + turnValue
        
        if newDirectionValue >= Direction.West.rawValue + 1 {
            newDirectionValue = Direction.North.rawValue
        } else if newDirectionValue <= Direction.North.rawValue - 1 {
            newDirectionValue = Direction.West.rawValue
        }
        
        currentDirection = Direction(rawValue: newDirectionValue)!
        
        return currentDirection
    }
    
    func calculateDistance() -> Int {
        
        var xSteps = 0
        var ySteps = 0
        
        for segment in path {
            
            var steps = segment
            let turnValue = steps.remove(at: steps.startIndex)
        
            let direction = try! updateDirection(turnRotation: String(turnValue))
            
            switch direction {
            case .North:
                ySteps += Int(steps)!
                break
            case .East:
                xSteps += Int(steps)!
                break
            case .South:
                ySteps -= Int(steps)!
                break
            case .West:
                xSteps -= Int(steps)!
                break
            }
        }
        
        return (abs(ySteps) + abs(xSteps))
    }
    
}
