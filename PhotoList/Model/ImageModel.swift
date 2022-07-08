//
//  PhotoList
//
//  Created by sriramana koppisetti on 07/07/22.
//

import Foundation

struct ImageModel: Decodable, Hashable {
    
    let name : String?
    let description : String?
    let image : ImageInfo?
}

struct ImageInfo : Decodable, Hashable {
    let id : String?
    let width : Int?
    let height : Int?
    let url : String?
}
