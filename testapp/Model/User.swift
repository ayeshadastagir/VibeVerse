import UIKit

struct User {
    let firstName: String
    let lastName: String
    let phone: String
    let email: String
    
    func toDictionary() -> [String: Any] {
        return [
            "firstName": firstName,
            "lastName": lastName,
            "phone": phone,
            "email": email
        ]
    }
}
