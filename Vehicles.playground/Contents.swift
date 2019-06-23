import UIKit

class Vehicle {
    
    var Make : String
    var Model : String
    var Year : Int
    var Weight : Decimal
    var NeedsMaintenance : Bool = false
    var TripsSinceMaintenance : Int = 0
    
    init(_make : String, _model : String, _year : Int, _weight : Decimal) {
        Make = _make
        Model = _model
        Year = _year
        Weight = _weight
    }
}

class Car : Vehicle {
    
    var IsDriving : Bool = false {
        didSet {
            if (IsDriving == true){
                TripsSinceMaintenance += 1
                if (TripsSinceMaintenance == 100) {
                    NeedsMaintenance = true
                }
            }
        }
    }
    
    func Drive() {
        IsDriving = true
    }
    
    func Stop() {
        IsDriving = false
    }
    
    func Repair() {
        TripsSinceMaintenance = 0
        NeedsMaintenance = false
    }
}

//Car Tests
var hondaCivic = Car(_make: "Honda", _model: "Civic", _year: 2019, _weight: 2500)

for _ in 1...100 {
    hondaCivic.Drive()
    hondaCivic.Stop()
}

print("Honda Civic trips since maintenance \(hondaCivic.TripsSinceMaintenance)")
print("Honda Civic needs maintenance? \(hondaCivic.NeedsMaintenance)")

hondaCivic.Repair()

print("Honda Civic trips since maintenance after repair \(hondaCivic.TripsSinceMaintenance)")
print("Honda Civic needs maintenance after repair? \(hondaCivic.NeedsMaintenance)")

var porsche911 = Car(_make: "Porsche", _model: "911", _year: 2019, _weight: 2000)

for _ in 1...10 {
    porsche911.Drive()
    porsche911.Stop()
}

print("Porsche 911 trips since maintenance \(porsche911.TripsSinceMaintenance)")
print("Porsche 911 needs maintenance? \(porsche911.NeedsMaintenance)")

porsche911.Repair()

print("Porsche 911 trips since maintenance after repair \(porsche911.TripsSinceMaintenance)")
print("Porsche 911 needs maintenance after repair? \(porsche911.NeedsMaintenance)")

var chevyVolt = Car(_make: "Chevy", _model: "Volt", _year: 2019, _weight: 2500)

for _ in 1...50 {
    chevyVolt.Drive()
    chevyVolt.Stop()
}

print("Chevy Volt trips since maintenance \(chevyVolt.TripsSinceMaintenance)")
print("Chevy Volt needs maintenance? \(chevyVolt.NeedsMaintenance)")

chevyVolt.Repair()

print("Chevy Volt trips since maintenance after repair \(chevyVolt.TripsSinceMaintenance)")
print("Chevy Volt needs maintenance after repair? \(chevyVolt.NeedsMaintenance)")

class Plane : Vehicle {
    
    var IsFlying : Bool = false {
        didSet {
            if (IsFlying == true) {
                TripsSinceMaintenance += 1
                if (TripsSinceMaintenance == 100) {
                    NeedsMaintenance = true
                }
            }
        }
    }
    
    func Fly() {
        
        if (NeedsMaintenance == true){
            print("The plane can't fly until it's repaired")
            return IsFlying = false
        }
        
        IsFlying = true
    }
    
    func Land() {
        IsFlying = false
    }
    
    func Repair() {
        TripsSinceMaintenance = 0
        NeedsMaintenance = false
    }
}

//Plane Tests
var plane = Plane(_make: "Bowing", _model: "737", _year: 2019, _weight: 735000 )

for _ in 1...100 {
    plane.Fly()
    plane.Land()
}

print("Plane trips since maintenance \(plane.TripsSinceMaintenance) times")
print("Plane needs maintenance? \(plane.NeedsMaintenance)")

plane.Fly()

plane.Repair()

print("Plane trips since maintenance after repair \(plane.TripsSinceMaintenance)")
print("Plane needs maintenance? \(plane.NeedsMaintenance)")

plane.Fly()

print("Plane trips since maintenance after repair \(plane.TripsSinceMaintenance)")


