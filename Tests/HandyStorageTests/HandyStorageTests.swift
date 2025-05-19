import Testing
@testable import HandyStorage

// MARK: - TESTS

@Test func handyTest() async throws {
    Task {
        let userTable = "user-table"
        /// - Note: Delete the user-table
        await HandyStorage.shared.delete(table: userTable)
        var usersArray: [HSUser] = await HandyStorage.shared.load(key: userTable)
        #expect(usersArray.count == 0)
        /// - Note: Create an object of HSUser
        let user = HSUser(username: "Walter", password: "123456")
        #expect(user.username == "Walter")
        #expect(user.password == "123456")
        /// - Note: SAVE the user object
        await HandyStorage.shared.save(object: user, key: userTable)
        /// - Note: LOAD the user object
        usersArray = await HandyStorage.shared.load(key: userTable)
        #expect(usersArray.first?.username == "Walter")
        #expect(usersArray.first?.password == "123456")
        /// - Note: UPDATE the user object
        let newUser = HSUser(username: "Harvey", password: "654321")
        await HandyStorage.shared.update(oldObject: user, newObject: newUser, key: userTable)
        usersArray = await HandyStorage.shared.load(key: userTable)
        #expect(usersArray.first?.username == "Harvey")
        #expect(usersArray.first?.password == "654321")
        /// - Note: SAVE ARRAY of cars
        let carTable = "car-table"
        await HandyStorage.shared.delete(table: carTable)
        let ferrari = HSCar(name: "Ferrari", model: "F40")
        let bmw = HSCar(name: "BMW", model: "M5")
        let alfaRomeo = HSCar(name: "Alfa Romeo", model: "Giulia")
        await HandyStorage.shared.saveArray(arrayObject: [ferrari, bmw, alfaRomeo], key: carTable)
        let carsArray: [HSCar] = await HandyStorage.shared.load(key: carTable)
        #expect(carsArray.count == 3)
        #expect(carsArray.last?.name == "Alfa Romeo")
    }
}

// MARK: - Models

struct HSUser: Codable {
    var username: String
    var password: String
}

struct HSCar: Codable {
    var name: String
    var model: String
}
