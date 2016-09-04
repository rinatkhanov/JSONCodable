//
//  TransformerTests.swift
//  JSONCodable
//
//  Created by Matthew Cheok on 13/10/15.
//
//

import XCTest
import JSONCodable

class TransformerTests: XCTestCase {
    
    let testMessageJSON: [JSONObject] = [
        [
            "ID": 568,
            "av": 125435865,
            "ad": "2016-06-07",
            "ar": 0,
            "at": 0,
            "ah": 0,
            "aj": "te"
        ]
    ]
    
    let testMessageComplexJSON: [JSONObject] = [
        [
            "ID": 568,
            "av": 125435865,
            "ad": "2016-06-07",
            "ar": 0,
            "at": 0,
            "ah": 0,
            "aj": "te"
        ],
        [
            "ID": 415
        ]
    ]
    
    let encodedValue: [String: String] = [
        "name": "image-name",
        "uri": "http://www.example.com/image.png"
    ]
    
    let decodedValue = ImageAsset(
        name: "image-name",
        uri: URL(string: "http://www.example.com/image.png")
    )
    
    func testDecodingTransformer() {
        guard let asset = try? ImageAsset(object: encodedValue) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(asset, decodedValue)
    }
    
    func testEncodingTransformer() {
        guard let json = try? decodedValue.toJSON() else {
            XCTFail()
            return
        }
        XCTAssertEqual(json as! [String : String], encodedValue)
    }
}
