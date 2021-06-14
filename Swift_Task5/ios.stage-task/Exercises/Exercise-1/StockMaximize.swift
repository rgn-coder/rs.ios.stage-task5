import Foundation

class StockMaximize {
    
    
    
    func countProfit(prices: [Int]) -> Int {
        var result = 0
        var forPrices:[Int] = prices
        while forPrices.count > 1 {
            let max = findMax(array: forPrices)//находит максимум
            
            let indicatorsOfSale = crushingArray(originalArray: forPrices, maximum: max)
            // let countOfSales = howManySales(arrayWithIndicators: indicatorsOfFirstSale)
            result = result + findProfit(arrWithIndicators: indicatorsOfSale)
            if indicatorsOfSale.count != prices.count {
                forPrices = changeOriginalArray(firstArray: forPrices, firstPartOfArray: indicatorsOfSale)
            }
            if indicatorsOfSale.count == prices.count {
                break
            }
        }
        return result
    }
    
    
    func findMax(array: [Int]) -> Int {
        let maxNumber = array.max()
        return maxNumber!
    }
    
    func crushingArray(originalArray: [Int], maximum: Int) -> [Int] {
        let index = originalArray.index(of: maximum)//узнаем индекс макс числа
        var arrayBeforeSale:[Int] = []
        var newArray = originalArray//перезаписываем исходный массив
        for prieceIndex in 0...index! {
            arrayBeforeSale.append(originalArray[prieceIndex]) //[1 7]
            
        }
        return arrayBeforeSale
    }
    func changeOriginalArray(firstArray: [Int], firstPartOfArray: [Int]) -> [Int] {
        var cuttedArray = firstArray
        for e in 0...firstPartOfArray.count - 1 {
            let index = cuttedArray.firstIndex(of: firstPartOfArray[e])
            cuttedArray.remove(at: index!)
        }
        if cuttedArray.count > 0 && cuttedArray[0] == firstPartOfArray.last {
            cuttedArray.remove(at: 0)
        }
        return cuttedArray
    }
    
    
    func findProfit(arrWithIndicators:[Int]) -> Int {
        var profit = 0
        for p in 0..<arrWithIndicators.count-1 {
            profit = profit + (arrWithIndicators[arrWithIndicators.count-1] - arrWithIndicators[p])
            
        }
        
        return profit
    }
}
