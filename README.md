![hs-shndrs](https://github.com/user-attachments/assets/af028af3-2397-488e-ba81-126c1227527c)
# HandyStorage
![Workflow Status](https://github.com/shndrs/HandyStorage/actions/workflows/swift.yml/badge.svg)
[![codebeat badge](https://codebeat.co/badges/889e7bd9-5986-4bf1-886c-befec23ee93e)](https://codebeat.co/projects/github-com-shndrs-handystorage-main)
![Cocoapods Version](https://img.shields.io/cocoapods/v/HandyStorage)
![swift-version](https://img.shields.io/badge/Swift-6-blueviolet.svg)
![swift package manager](https://img.shields.io/badge/SwiftPackageManager-compatible-000000.svg)
![cocoapods](https://img.shields.io/badge/CocoaPods-compatible-000000.svg)
![GitHub License](https://img.shields.io/github/license/shndrs/HandyStorage)
![Min iOS Version](https://img.shields.io/badge/iOS_Version-13%2B-yellow)
![Min macOS Version](https://img.shields.io/badge/macOS_Version-10.15%2B-yellow)

In Handy Storage i built an useful thread-safe storage using actors and Swift Concurrency which prevents race conditions. It's super easy to deal with and on top of that you can save `Codable` Objects permanently.

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

await HandyStorage.shared.save(object: user, key: "user-table")
```
## Load
Get all users from "user-table"
```Swift     
let users: [User] = await HandyStorage.shared.load(key: "user-table")
```
## Update
Update a specific object with new one
```Swift
let oldUser: User = await HandyStorage.shared.load(key: "user-table").first
let newUser = HSUser(username: "Harvey", password: "654321")

await HandyStorage.shared.update(oldObject: oldUser, newObject: newUser, key: "user-table")
```
## Save/Insert an array of objects
```Swift
let user0 = User(username: "Jessica", password: "123456")
let user1 = User(username: "Harvey", password: "654321")
let user2 = User(username: "Mike", password: "321456")

await HandyStorage.shared.saveArray(arrayObject: [user0, user1, user2], key: "user-table")
```
## Delete Item
```Swift
let user: User = HandyStorage.shared.load(key: "user-table").first

await HandyStorage.shared.delete(object: user, key: "user-table")
```
## Delete Entire Table
This will delete whole "user-table"
```Swift
await HandyStorage.shared.delete(table: "user-table")
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
- Select "Up to Next Major" with "2.0.1"

Author
=======
sahandraeisi1994@gmail.com, sahandraeisi@yahoo.com, [shndrs](https://linkedin.com/in/shndrs)

License
=======
HandyStorage is available under the MIT license. See the LICENSE file for more info.
