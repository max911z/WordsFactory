import UIKit

import Foundation

struct BattleInfo{
    func fight(countOfBattlefields: Int, greenArmy: [Int], blueArmy: [Int]) -> String{
        
        var tempGreenArmy = greenArmy
        var tempBlueArmy = blueArmy
        
        var battlefields: [Battlefield] = []
        var count: Int
        
        while (!tempGreenArmy.isEmpty && !tempBlueArmy.isEmpty){
        
            
            count = countOfBattlefields < min(tempGreenArmy.count, tempBlueArmy.count) ? countOfBattlefields : min(tempGreenArmy.count, tempBlueArmy.count)
            
            for _ in 0..<count{
                
                let indexOfGreenFighter = tempGreenArmy.firstIndex(of: tempGreenArmy.max()!)
                let greenFighter = tempGreenArmy.remove(at: indexOfGreenFighter!)
                
                let indexOfBlueFighter = tempBlueArmy.firstIndex(of: tempBlueArmy.max()!)
                let blueFighter = tempBlueArmy.remove(at: indexOfBlueFighter!)
                
                battlefields.append(Battlefield.init(greenFighter: greenFighter, blueFighter: blueFighter))
            }
            
            for var battlefield in battlefields {
                battlefield.letsFight()
                
                if battlefield.blueFighter > 0 && battlefield.greenFighter == 0{
                    tempBlueArmy.append(battlefield.blueFighter)
                }
                else if (battlefield.greenFighter > 0 && battlefield.blueFighter == 0){
                    tempGreenArmy.append(battlefield.greenFighter)
                }
                else{
                    continue
                }
            }
            
            battlefields.removeAll()
        }
        
        if (tempGreenArmy.isEmpty && !tempBlueArmy.isEmpty){
            return ResultOfBattle.blueWin(fighters: tempBlueArmy.sorted(by: >)).title
        }
        else if (tempBlueArmy.isEmpty && !tempGreenArmy.isEmpty){
            return ResultOfBattle.greenWin(fighters: tempGreenArmy.sorted(by: >)).title
        }
        else{
            return ResultOfBattle.draw.title
        }
    }
}
