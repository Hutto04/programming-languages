


/*
Description: This file contains the implementation of a PetStore simulation in the Io programming language.
The PetStore simulation consists of various classes such as Animal, Feline, Canine, Staff, Manager, Clerk, and Clock.
Each class has its own set of methods and properties to simulate the behavior of animals and staff members in a pet store.
The simulation runs for 24 hours, with different actions performed at specific times of the day.
Author: William Hutto
Date: 2024-02-04
*/

// Utility function to write output to a file
writeToFile := method(text,
    outFile := File with("petStoreResults.txt")
    outFile openForAppending
    outFile write(text .. "\n") // Ensure newline for each entry
    outFile close
)
// Define base Animal, Feline, and Canine classes outside the PetStore definition
Animal := Object clone do(
    name ::= nil
    type ::= nil // "cat" or "dog"
    animalList := list()
    addAnimal := method(animal, animalList append(animal))
    removeAnimal := method(animal, animalList remove(animal))
    printAnimals := method(animalList foreach(animal, writeln(animal)))
    allSleep := method(animalList foreach(animal, writeln(animal name, " sleeps.")))
    allMakeNoise := method(animalList foreach(animal, animal makeNoise))
    allEat := method(animalList foreach(animal, animal eat))
    allPlay := method(animalList foreach(animal, animal play))
)

// Define Feline and Canine classes that inherit from Animal
Feline := Animal clone do(
    type := "cat"
    eat := method(writeln(name," eats."))
    play := method(writeln(name," plays."))
    makeNoise := method(writeln(name," meows."))
)

// Define Canine class that inherits from Animal
Canine := Animal clone do(
    type := "dog"
    eat := method(writeln(name," eats."))
    play := method(writeln(name," plays."))
    makeNoise := method(writeln(name," barks."))
)

// Create a list of animals and add them to the list
animalList := Animal clone
cat1 := Feline clone
cat1 name := "Whiskers the cat"
cat2 := Feline clone
cat2 name := "Shadow the cat"
cat3 := Feline clone
cat3 name := "Oliver the cat"
dog1 := Canine clone
dog1 name := "Rex the dog"
dog2 := Canine clone
dog2 name := "Buddy the dog"
dog3 := Canine clone
dog3 name := "Max the dog"
animalList addAnimal(cat1)
animalList addAnimal(cat2)
animalList addAnimal(cat3)
animalList addAnimal(dog1)
animalList addAnimal(dog2)
animalList addAnimal(dog3)


// Define Staff, Manager, Clerk, and Clock outside PetStore for clarity and reuse
Staff := Object clone do(
    name ::= nil
    arrive := method(writeln(name," arrives."))
    lunch := method(writeln(name," takes lunch."))
    leave := method(writeln(name," leaves."))
)

// Manager class inherits from Staff
Manager := Staff clone do(
    name := "Bob the Manager"
    openStore := method(writeln(name," opens the store.")
        animalList allMakeNoise
    )
    // All animals sleep when the store closes
    closeStore := method(writeln(name," closes the store")
        // all animals sleep
        animalList allSleep

    )
)

// Clerk class inherits from Staff
Clerk := Staff clone do(
    name := "Alice the Clerk"
    feedAnimals := method(
        writeln(name, " feeds the animals.")
        animalList allEat
        )
    )
    // Play with animals
    playAnimals := method(
        writeln(name," plays with the animals.")
        animalList allPlay
    )
    // Sell animals and add new animals
    sellAnimal := method(
        animalList := Animal animalList
        animalsSold := List clone
        // Randomly sell animals
        animalList foreach(animal,
            if(Random value <= 0.2,
                animalsSold append(animal)
            )
        )
        // Remove sold animals from the list
        animalsSold foreach(animal,
            writeln(name, " sells ", animal name)
            animalList remove(animal)

        // Logic to determine type and add a new animal of the same type
        animalType := animal type
        newName := if(animalType == "cat",
        catOptions at((Random value * catOptions size) floor) name,
        dogOptions at((Random value * dogOptions size) floor) name
        )
        if(animalType == "cat", catOptions remove(newName), dogOptions remove(newName))

        // Add a new animal of the same type
        newAnimal := if(animalType == "cat", Feline clone, Canine clone)
        newAnimal name := newName
        animalList append(newAnimal)
        writeln("Added new animal: ", newAnimal name)
    )
)

// Create random cats and dogs
randCat1 := Feline clone
randCat1 name := "Luna the cat"
randCat2 := Feline clone
randCat2 name := "Bella the cat"
randCat3 := Feline clone
randCat3 name := "Lucy the cat"
randCat4 := Feline clone
randCat4 name := "Mittens the cat"
randCat5 := Feline clone
randCat5 name := "Tiger the cat"
randCat6 := Feline clone
randCat6 name := "Smokey the cat"
randDog1 := Canine clone
randDog1 name := "Charlie the dog"
randDog2 := Canine clone
randDog2 name := "Cooper the dog"
randDog3 := Canine clone
randDog3 name := "Daisy the dog"
randDog4 := Canine clone
randDog4 name := "Molly the dog"
randDog5 := Canine clone
randDog5 name := "Bailey the dog"
randDog6 := Canine clone
randDog6 name := "Sadie the dog"
// Create a list of random cats and dogs
catOptions := list(randCat1, randCat2, randCat3, randCat4, randCat5, randCat6)
dogOptions := list(randDog1, randDog2, randDog3, randDog4, randDog5, randDog6)
randomIndex := Random value() * 6


// Adjust the Clock to support this structure
Clock := Object clone do(

    times := list("0800","0900","1100","1200","1300","1600","1700","1800")
    timenow := 0
    // Define the Clock to keep track of time and announce the hour
    incrtime := method(if(timenow>6,timenow=0,timenow=timenow+1))
    announceHour := method((times at(timenow))) //fix timenow
    runtimer := method(
        yield
        incrtime
    
    )
)
// Define the PetStore class
PetStore := Object clone do(
    manager := Manager clone
    clerk := Clerk clone //setName("Bob the Clerk")
    day := 1
    localtime := method(clock announceHour)
    // Define the PetStore to announce the day and time
    announce := method(
        writeln("\nDay and time at store ",day," ",localtime)
        if (localtime == "0800", manager arrive)
        if (localtime == "0800", manager openStore)
        if (localtime == "0900", clerk feedAnimals)
        if (localtime == "1100", clerk playAnimals)
        if (localtime == "1200", manager lunch)
        if (localtime == "1300", clerk lunch)
        if (localtime == "1600", clerk sellAnimal and animalList printAnimals)
        if (localtime == "1700", clerk leave)
        if (localtime == "1800", manager closeStore)
        if (localtime == "1800", manager leave)
        if (localtime == "1800", day=day+1; writeln("\n\n"))
        yield
    )
)
// Create instances of the PetStore and Clock
store := PetStore clone
clock := Clock clone

// Run the simulation
for(i, 1, 24, writeToFile(store @@announce); writeToFile(clock @@runtimer); wait(2))
Coroutine currentCoroutine pause

