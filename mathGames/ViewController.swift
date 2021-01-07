

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topicLabel: UILabel! //顯示題目
    //目前答對幾題
    @IBOutlet weak var 狀態label: UILabel!
    //目前題數
    @IBOutlet weak var 目前題數: UILabel!
    //得分
    @IBOutlet weak var 分數: UILabel!
    
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    @IBOutlet weak var 計算10題後結果: UILabel!
    
  
    var 算式 = [String]()
    var index = 0 //存目前題數
    var 得分數 = 0
    var 答對次數 = 0
    var 答案 = 0
    var 選擇1 = 0
    var 選擇2 = 0
    var 選擇3 = 0
    var 存答案array = [Int]()
    var 存答對次數 = 0
    var 存答錯次數 = 0
   
    
    //顯示題目、判斷答案func
    func 題目(){
        var 加法 = Int.random(in: 1...10)
        var 加法2 = Int.random(in: 1...10)
        var 減法 = Int.random(in: 50...100)
        var 減法2 = Int.random(in: 1...50)
        var 除法 = Int.random(in: 50...100)
        var 除法2 = Int.random(in: 2...9)
        算式 = ["加","減","乘","除"]
        算式.shuffle() // 亂數算式array
        if 算式[0] == "加"{
        topicLabel.text = "\(加法) + \(加法2)"
            答案 = 加法 + 加法2
            選擇1 = 答案+10
            選擇2 = 答案+20
            選擇3 = 答案+30
            存答案array = [答案,選擇1,選擇2,選擇3]
            存答案array.shuffle()
            buttonA.setTitle("\(存答案array[0])", for: .normal)
            buttonB.setTitle("\(存答案array[1])", for: .normal)
            buttonC.setTitle("\(存答案array[2])", for: .normal)
            buttonD.setTitle("\(存答案array[3])", for: .normal)
            
        }
        else if 算式[0] == "減"{
            topicLabel.text = "\(減法) − \(減法2)"
            答案 = 減法 - 減法2
            選擇1 = 答案+10
            選擇2 = 答案+20
            選擇3 = 答案+30
            存答案array = [答案,選擇1,選擇2,選擇3]
            存答案array.shuffle()
            buttonA.setTitle("\(存答案array[0])", for: .normal)
            buttonB.setTitle("\(存答案array[1])", for: .normal)
            buttonC.setTitle("\(存答案array[2])", for: .normal)
            buttonD.setTitle("\(存答案array[3])", for: .normal)
        }
        else if 算式[0] == "乘"{
            topicLabel.text = "\(加法) × \(加法2)"
            答案 = 加法 * 加法2
            選擇1 = 答案+10
            選擇2 = 答案+20
            選擇3 = 答案+30
            存答案array = [答案,選擇1,選擇2,選擇3]
            存答案array.shuffle()
            buttonA.setTitle("\(存答案array[0])", for: .normal)
            buttonB.setTitle("\(存答案array[1])", for: .normal)
            buttonC.setTitle("\(存答案array[2])", for: .normal)
            buttonD.setTitle("\(存答案array[3])", for: .normal)
        }
        else{ //除法 無條件捨去
            topicLabel.text = "\(除法) ÷ \(除法2)"
            答案 = 除法 / 除法2
            選擇1 = 答案+10
            選擇2 = 答案+20
            選擇3 = 答案+30
            存答案array = [答案,選擇1,選擇2,選擇3]
            存答案array.shuffle()
            buttonA.setTitle("\(存答案array[0])", for: .normal)
            buttonB.setTitle("\(存答案array[1])", for: .normal)
            buttonC.setTitle("\(存答案array[2])", for: .normal)
            buttonD.setTitle("\(存答案array[3])", for: .normal)
        }
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //判斷題目、選擇題答案
        題目()//顯示題目、判斷答案func
        
        
    }
    
    
    @IBAction func 答案選擇(_ sender: UIButton) {
        if index < 10 {
        index = index + 1
        目前題數.text = "目前第\(index)題" //目前題目數量+1
        //如果答對
        if sender.titleLabel?.text == "\(答案)"{
            答對次數 = 答對次數 + 1
            存答對次數 = 存答對次數 + 1
            if 答對次數 >= 3{ //如果答對次數大於3
                得分數 = 得分數 + 30
                狀態label.text = "㊗️恭喜開啟分數加倍㊗️"
            }else{
                得分數 = 得分數 + 10
                狀態label.text = "🎇恭喜答對🎇"
            }
        //如果答錯
        }else{
            存答錯次數 = 存答錯次數 + 1
            狀態label.text = "😭答錯囉😭"
           
            if 得分數 <= 10{
                得分數 = 0
            }else{
                得分數 = 得分數 - 10
            }
            分數.text = "分數：\(得分數)"
            
            if 答對次數 <= 0{ //如果答對次數少於0
                答對次數 = 0
                
            }else{
                答對次數 = 0
            }
        }

        題目()//顯示題目、判斷答案func
        分數.text = "分數：\(得分數)"
        }
        else if index == 10{
            狀態label.text = "結束囉"
            計算10題後結果.alpha = 1 //顯現出來
            計算10題後結果.text = "恭喜答對\(存答對次數),答錯\(存答錯次數)"
        }
    }
    
    //再一次button
    @IBAction func again(_ sender: UIButton) {
       // 重新亂數製造題目
        題目()//顯示題目、判斷答案func
        狀態label.text = ""
        計算10題後結果.alpha = 0 //隱藏
        index = 0 //目前答題數回0
        目前題數.text = "目前第\(index)題"
        得分數 = 0
        分數.text = "分數：\(得分數)"
        答對次數 = 0
        存答對次數 = 0
        存答錯次數 = 0
    }
    

}

