//
//  Bundle+extension.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 12/07/2021.
//
import Foundation
import RxSwift


enum FileReadError: Error {
   case fileNotFound, unreadable, encodingFailed
 }
extension Bundle {
   
    func decode(from file: String) ->  Data {
           
           guard let url = self.url(forResource: file, withExtension: nil) else {
                    fatalError("Failed to locate \(file) in bundle.")
                }
                
                guard let data = try? Data(contentsOf: url) else {
                    fatalError("Failed to load \(file) from bundle.")
                }
       return data
//                let decoder = JSONDecoder()
//                decoder.dateDecodingStrategy = dateDecodingStrategy
//                decoder.keyDecodingStrategy = keyDecodingStrategy
//
//                do {
//                    return try  Observable.just(decoder.decode(T.self, from: data))
//                } catch DecodingError.keyNotFound(let key, let context) {
//                    fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
//                } catch DecodingError.typeMismatch(_, let context) {
//                    fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
//                } catch DecodingError.valueNotFound(let type, let context) {
//                    fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
//                } catch DecodingError.dataCorrupted(_) {
//                    fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
//                } catch {
//                    fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
//                }
        
        
       }
}
