//
//  main.swift
//  Inventory
//
//  Created by StudentAM on 1/17/24.
//

import Foundation

//make varibales to hold the amount being added to cart
var addedCereal : Int = 0
var addedMilk : Int = 0
var addedSyrup : Int = 0
var addedCup : Int = 0
var totalAdded = addedCereal + addedMilk + addedSyrup + addedCup
//make variables to subract from the stock
var cerealStock : Int = 100
var milkStock : Int = 100
var syrupStock: Int = 100
var cupStock: Int = 100
//variables for restock
var cerealRestock: Int = 0
var milkRestock: Int = 0
var syrupRestock: Int = 0
var cupRestock: Int = 0
var totalRestock = cerealRestock + milkRestock + syrupRestock + cupRestock
//variables for prices
var cerealPrice: Double = 4.99
var milkPrice: Double = 6.99
var syrupPrice: Double = 5.99
var cupPrice: Double = 2.99
//variables for total, had to be made a double because a Int and Double cant be multiplied
var cerealTotal: Double = 0.0
var milkTotal: Double = 0.0
var syrupTotal: Double = 0.0
var cupTotal: Double = 0.0
var totalPrice = cerealTotal + milkTotal + syrupTotal + cupTotal

// function to display main menu
func menu (){
    print("Welcome to the grocery store! Lets us know how we can help you (Enter number of selection)")
    print("1. Add item to cart")
    print("2.Remove item from cart")
    print("3.Check item availability in stock")
    print("4.Access Admin Menu")
    print("5.Checkout")
    // when they enter #1 input it takes you to the add item function to display the next options
    if let userInput = readLine(){
        if userInput == "1"{
            //takes you to the funtion that allows you to add iteams to cart
            addItem()
        }
        if userInput == "2"{
            //takes you to the function that allows you to removes items to cart
            removeItem()
        }
        if userInput == "3"{
            //takes you to the function that allows you to check the individual stock of each iteam
            availability()
        }
        if userInput == "4"{
            //takes to the page where you enter the admin id that wil lead to adminmenu
            adminId()
        }
        if userInput == "5"{
            //takes you to checkout function
            checkOut()
        }
        if userInput >= "6"{
            //will run this is the input isnt a number 1-5
            print("Please choose an appropriate option!!")
        }
    }
}
 menu()

//this function will do the adding of the items to cart and calucating total as things are added
func addItem(){
    print("What would you like to add to cart? (Enter number of selection)")
    print("1.Cereal")
    print("2.Milk")
    print("3.Syrup")
    print("4.Cup")
    //this whole chunk will be checking what the user input will be
    if let userInput = readLine(){
        if userInput == "1"{
            //if it is 1 then youll be able to add cereals
            print("How many cereal(s) would you like to add to cart?:")
            if let userInput = readLine(),let amountAdded = Int(userInput){
                //this will add the number/ amount inputted by user to be stored in the varibale that holds the number of cereal added
                addedCereal += amountAdded
                //this will subtract the amount of cereals in the cart from the stock to create new avalability
                cerealStock -= addedCereal
                //this will multiply the price of cereal by number in cart and store it in the total amount of money spent on cereal varibale which is cerealTotal
                cerealTotal += (cerealPrice) * Double(addedCereal)
                // then you will add the total amount of cereal price to the final amount where everything will be added to checkout
                totalPrice += cerealTotal
               //prints the amount of cerel in cart and the current final total of money being spent
                print("There are \(addedCereal) cereal(s) in cart!")
                // string format ... will make sure there are only 2 decimals and not a crazy amount
                print("Current Total is $\(String(format: "%.2f",totalPrice))")
                    // when done will take you back to menu to allow for more adding or removing etc.
                return menu()
                //all this code will be repeated throughout this function in order to add more than just cereal, the item will depend ehat the input is 1= cereal 2=milk 3=syrup 4=cups
            }
            
        }
        if userInput == "2"{
            print("How many milk(s) would you like to add to cart?:")
            if let userInput = readLine(),let amountAdded = Int(userInput){
                addedMilk += amountAdded
                milkStock -= addedMilk
                milkTotal += (milkPrice) * Double(addedMilk)
                totalPrice += milkTotal
                print("There are \(addedMilk) milk(s) in cart!")
                print("Current Total is $\(String(format: "%.2f",totalPrice))")
                return menu()
            }
        }
        if userInput == "3"{
            print("How many syrup(s) would you like to add to cart?:")
            if let userInput = readLine(),let amountAdded = Int(userInput){
                addedSyrup += amountAdded
                syrupStock -= addedSyrup
                syrupTotal += (syrupPrice) * Double(addedSyrup)
                totalPrice += syrupTotal
                print("There are \(addedSyrup) syrup(s) in cart!")
                print("Current Total is $\(String(format: "%.2f",totalPrice))")
                return menu()
            }
        }
        if userInput == "4"{
            print("How many cup(s) would you like to add to cart?:")
            if let userInput = readLine(),let amountAdded = Int(userInput){
                addedCup += amountAdded
                cupStock -= addedCup
                cupTotal += (cupPrice) * Double(addedCup)
                totalPrice += cupTotal
                print("There are \(addedCup) cup(s) in cart!")
                print("Current Total is $\(String(format: "%.2f",totalPrice))")
                return menu()
            }
        }
    }
}

// this function will remove iteams that have been added to the cart
func removeItem (){
    print("What would you like to a remove from cart? (Enter number of selection)")
    print("1.Cereal")
    print("2.Milk")
    print("3.Syrup")
    print("4.Cup")
    //whole below section is actions depending on input 1= cereal 2= milk 3= syrup 4= cups
    if let userInput = readLine(){
        if userInput == "1"{
            //if input one will set out to remove cereal
            print("How many cereal(s) would you like to remove from cart?:")
            if let userInput = readLine(),let removalAmount = Int(userInput){
                //will set stock back to 100 and will add the amount you restock if item were to be restocked
                cerealStock = 100 + cerealRestock
                //will remove the input amount of wanting to remove from the added amount of said iteam in cart
                addedCereal -= removalAmount
                //will take new total of iteam in cart and will subtract it from og plus restock value of stock
                cerealStock -= addedCereal
                //will create price of amount removed and item price and will subtract from the previous current price before the removal and add the new total intp cereal total
                cerealTotal -= (cerealPrice) * Double(addedCereal)
                //will remove that amount from tht total amount in cart
                totalPrice -= cerealTotal
                //printing the now new amount of iteam in cart and new total
                print("There are \(addedCereal) cereal(s) in cart!")
                print("Current Total is $\(String(format: "%.2f",totalPrice))")
                //back to menu to allow new cart and item actons
                return menu()
            }
            //for every if after same concept but iteam is different depending on the input
            
        }
        if userInput == "2"{
            print("How many milk(s) would you like to remove from cart?:")
            if let userInput = readLine(),let removalAmount = Int(userInput){
                milkStock = 100 + milkRestock
                addedMilk -= removalAmount
                milkStock -= addedMilk
                milkTotal -= (milkPrice) * Double(addedMilk)
                totalPrice -= milkTotal
                print("There are \(addedMilk) milk(s) in cart!")
                print("Current Total is $\(String(format: "%.2f",totalPrice))")
                return menu()
            }
        }
        
            if userInput == "3"{
                print("How many syrup(s) would you like to remove from cart?:")
                if let userInput = readLine(),let removalAmount = Int(userInput){
                    syrupStock = 100 + syrupRestock
                    addedSyrup -= removalAmount
                    syrupStock -= addedSyrup
                    syrupTotal -= (syrupPrice) * Double(addedSyrup)
                    totalPrice -= syrupTotal
                    print("There are \(addedSyrup) syrup(s) in cart!")
                    print("Current Total is $\(String(format: "%.2f",totalPrice))")
                    return menu()
                }
            }
            if userInput == "4"{
                print("How many cup(s) would you like to remove from cart?:")
                if let userInput = readLine(),let removalAmount = Int(userInput){
                    syrupStock = 100 + cupRestock
                    addedCup -= removalAmount
                    cupStock -= addedCup
                    cupTotal -= (cupPrice) * Double(addedCup)
                    totalPrice -= cupTotal
                    print("There are \(addedCup) cup(s) in cart!")
                    print("Current Total is $\(String(format: "%.2f",totalPrice))")
                    return menu()
                }
            }
        }
    
}
// will check how many items are still in stock able to be added
func availability (){
    print("What item would you like to check if it's in stock? (Enter number of selection)")
    print("1.Cereal")
    print("2.Milk")
    print("3.Syrup")
    print("4.Cup")
    //big if checks input
    if let userInput = readLine(){
        //if input is 1-4 print the matching item stock varibale to show what is avalible
        if userInput == "1"{
            print("There are currently \(cerealStock) cereals in stock!")
            //return to manu for more actions
            return menu()
        }
        if userInput == ("2"){
            print("There are currently \(milkStock) milks in stock")
            return menu()
        }
        if userInput == ("3"){
            print("There are currently \(syrupStock) syrups in stock")
            return menu()
        }
        if userInput == ("4"){
            print("There are currenly \(cupStock) syrups in stock")
            return menu()
        }
    }
}
//same thing as avalability func but this will return to adminmenu because it it used for the report
func Stocks (){
    print("What item would you like to check if it's in stock? (Enter number of selection)")
    print("1.Cereal")
    print("2.Milk")
    print("3.Syrup")
    print("4.Cup")
    
    if let userInput = readLine(){
        if userInput == "1"{
            print("There are currently \(cerealStock) cereals in stock!")
            return adminMenu()
        }
        if userInput == ("2"){
            print("There are currently \(milkStock) milks in stock")
            return adminMenu()
        }
        if userInput == ("3"){
            print("There are currently \(syrupStock) syrups in stock")
            return adminMenu()
        }
        if userInput == ("4"){
            print("There are currenly \(cupStock) syrups in stock")
            return adminMenu()
        }
    }
}
//will check if the entry is 0000 and take you to other menu if not will say pin is incorrect
func adminId (){
    print("Enter Admin ID:")
    if let userInput = readLine(){
        if userInput == "0000"{
            adminMenu()
        }
        else{
            print("Incorrect Pin :(")
        }
    }
}

func adminMenu(){
    print("Welcome to the Admin menu! Lets us know how we can help you (Enter number of selection):")
    print("1. Restock inventory")
    print("2. Generate report")
    print("3. Check number of items")
    print("4. Quit admin menu")
    //new menu will match the input # to function and if it is a function will take you to said func
    if let userInput = readLine(){
        if userInput == "1"{
            restock()
        }
        if userInput == "2"{
            report()
        }
        if userInput == "3"{
            Stocks()
        }
        if userInput == "4"{
            menu()
        }
        else{
            print("Select appropriate action please!")
        }
    }
}

//will add more to restock
func restock(){
    print("What would you like to restock? (Enter number of selection):")
    print("1.Cereal")
    print("2.Milk")
    print("3.Syrup")
    print("4.Cup")
   
    if let userInput = readLine(){
        if userInput == "1"{//will check what input is to match item
            print("How many units of cereal would you like to restock?: ")
            if let userInput = readLine(),let amountAdded = Int(userInput){
                //puts input amount into cereal restock varibale
                cerealRestock += amountAdded
                //add the resrock ampunt the the regualr instock variable
                cerealStock += cerealRestock
                print("Restocked \(cerealRestock) units of cereal")
                //returns to admin menu for more actions
                return adminMenu()
            }
            
        }
        if userInput == "2"{
            print("How many units of milk would you like to restock?: ")
            if let userInput = readLine(),let amountAdded = Int(userInput){
                milkRestock += amountAdded
                milkStock += milkRestock
                print("Restocked \(milkRestock) units of cereal")
                return adminMenu()
            }
            
        }
        if userInput == "3"{
            print("How many units of syrup would you like to restock?: ")
            if let userInput = readLine(),let amountAdded = Int(userInput){
                syrupRestock += amountAdded
                syrupStock += syrupRestock
                print("Restocked \(syrupRestock) units of cereal")
                return adminMenu()
            }
            
        }
        if userInput == "4"{
            print("How many units of cups would you like to restock?: ")
            if let userInput = readLine(),let amountAdded = Int(userInput){
                cupRestock += amountAdded
                cupStock += cupRestock
                print("Restocked \(cupRestock) units of cereal")
                return adminMenu()
            }
            
        }
        
    }
}

// will show stocks and sales if 2 in admin menu is clicked
 func report(){
     print("Summary Report:")
     print("Remaining cereals: \(cerealStock) items")
     print("Remaining milks: \(milkStock) items")
     print("Remaining syrups: \(syrupStock) items")
     print("Remaining cups: \(cupStock) items")
     ///adds all avalible stock to display the total amount of iteams left
     print("Remaining Inventory: \(cerealStock + milkStock + syrupStock + cupStock)items")
     print("Total Sales: $\(String(format: "%.2f",totalPrice))")
     return adminMenu()
 }
//will display the amount of each item in cart if 5 in admin menu is clicked
func checkOut(){
    print("Thanks for shopping with us!")
    print("You purchased the following:")
    print("Cereals:\(addedCereal)")
    print("Milk:\(addedMilk)")
    print("Syrup:\(addedSyrup)")
    print("Cups:\(addedCup)")
    //adds tax to total price
    let grandTotal = totalPrice * 0.0925
    
    print("Your grand total including tax (9.25%) is: $\(String(format: "%.2f",totalPrice + grandTotal))")
}



