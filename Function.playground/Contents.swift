//: Playground - noun: a place where people can play

func getMilk(){
    print("go to the shops")
    print("buy 2 cartons of milk")
}
getMilk()

//function get input
func buy(amount : Int){
    print("Your amount of milk is \(amount)")
}
buy(amount: 20)

//function get output
func getOutput(amount: Int) -> Int{
    
    return amount
}
var amount = getOutput(amount: 50)
print(amount)
