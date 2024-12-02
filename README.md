# HandyStorage
In this project i wanna build an useful storage with UserDefault which is super easy to deal with and on top of that you can save `Codable` Objects
### HOW COOL IS THAT! 🙂
# Usage
It's pretty simple, just follow these instructions and you have it,
First of all you need a `Codable` class/struct like below:
```Swift
struct User: Codable {
    var username: String
    var password: String
}
```
## Save/Insert
This will add a new object to "user-table"
```Swift
let user = User(username: "Walter", password: "123456")

HandyStorage.shared.save(object: user, key: "user-table")
```
## Load
Get all users from "user-table"
```Swift     
let users: [User] = HandyStorage.shared.load(key: "user-table")
```
## Update
Update a specific object with new one
```Swift
let oldUser: User = HandyStorage.shared.load(key: "user-table").first
let newUser = HSUser(username: "Harvey", password: "654321")

HandyStorage.shared.update(oldObject: oldUser, newObject: newUser, key: "user-table")
```
## Save/Insert an array of objects
```Swift
let user0 = User(username: "Jessica", password: "123456")
let user1 = User(username: "Harvey", password: "654321")
let user2 = User(username: "Mike", password: "321456")

HandyStorage.shared.saveArray(arrayObject: [user0, user1, user2], key: "user-table")
```
## Delete Item
```Swift
let user: User = HandyStorage.shared.load(key: "user-table").first

HandyStorage.shared.delete(object: user, key: "user-table")
```
## Delete Entire Table
This will delete whole "user-table"
```Swift
HandyStorage.shared.delete(table: "user-table")
```
Installation
=======

 <img src="https://raw.githubusercontent.com/CocoaPods/shared_resources/master/img/CocoaPods-Logo-Highlight.png" width="128px" height="32px" />

HandyStorage is available through [CocoaPods](https://cocoapods.org/pods/HandyStorage). To install
the latest version, simply add the following line to your Podfile:

```ruby
pod 'HandyStorage'
```
And then on your terminal run 👇🏻:
```bash
pod install
```
![spm-lg](https://github.com/user-attachments/assets/51a6b069-f05d-4152-a73c-9c9bc6e6eb56)
- File > Swift Packages > Add Package Dependency
- Add `https://github.com/shndrs/HandyStorage.git`
- Select "Up to Next Major" with "1.0.1"

Author
=======
sahandraeisi1994@gmail.com, sahandraeisi@yahoo.com, [shndrs](https://linkedin.com/in/shndrs)

License
=======
HandyStorage is available under the MIT license. See the LICENSE file for more info.
