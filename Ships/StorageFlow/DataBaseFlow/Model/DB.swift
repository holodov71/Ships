//
//  DB.swift
//  Ships
//
//  Created by Admin on 07.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit
import SQLite3

struct DB {
    
    static var db: OpaquePointer? = nil
    
    func openDB() -> String {
        
        let resource = "Ships"
        
        guard let dbResourcePath = Bundle.main.path(forResource: resource, ofType: "db") else {
            return "FIG_VAM"
        }
        
        let fileManager = FileManager.default
        
        do {
            let dbPath = try fileManager.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent(resource + ".db")
                .path
            
            if !fileManager.fileExists(atPath: dbPath) {
                try fileManager.copyItem(atPath: dbResourcePath, toPath: dbPath)
            }
            
            guard sqlite3_open(dbPath, &DB.db) == SQLITE_OK else {
                print("error open DB \(Error.self)")
                return "error open DB on path =  \(dbPath)"
            }
            
            return "open DataBase done \(dbPath)"
        } catch {}
        
        return "error copy DB:\(dbResourcePath) in applicationSupportDirectory"
    }
}

//MARK: - getting shiping list
//SELECT name, class, launched from ships
extension DB {
    
    func gettingShipsList(_ dbClass: String) -> [String] {
        let query = "SELECT name, class, launched from ships where class = '\(dbClass)'"
        var str: OpaquePointer? = nil
        
        var ships = [String]()
        
        if sqlite3_prepare_v2(DB.db, query, -1, &str, nil) == SQLITE_OK {
            print("Query \(query) is done!")
        } else {
            print("Query \(query) is incorrect!")
        }
        
        while sqlite3_step(str) == SQLITE_ROW {
            let name = String(cString: sqlite3_column_text(str, 0))
            let dbClass = String(cString: sqlite3_column_text(str, 1))
            let launched = Int(sqlite3_column_int(str, 2))
            
            ships.append("Name = \(name), class = \(dbClass), launched = \(launched)")
        }
        
        sqlite3_finalize(str)
        
        return ships
    }
    
    func gettingShipsList() -> [String] {
        let query = "SELECT name, class, launched from ships"
        var str: OpaquePointer? = nil
        
        var ships = [String]()
        
        if sqlite3_prepare_v2(DB.db, query, -1, &str, nil) == SQLITE_OK {
            print("Query \(query) is done!")
        } else {
            print("Query \(query) is incorrect!")
        }
        
        while sqlite3_step(str) == SQLITE_ROW {
            let name = String(cString: sqlite3_column_text(str, 0))
            let dbClass = String(cString: sqlite3_column_text(str, 1))
            let launched = Int(sqlite3_column_int(str, 2))
            
            ships.append("Name = \(name), class = \(dbClass), launched = \(launched)")
        }
        
        sqlite3_finalize(str)
        
        return ships
    }
    
    //TODO: - make count of classes
    func gettingClassOfShips() -> [String] {
        let query = "SELECT distinct class from Ships"
        var str: OpaquePointer? = nil
        
        var ships = [String]()
        
        if sqlite3_prepare_v2(DB.db, query, -1, &str, nil) == SQLITE_OK {
            print("Query \(query) is done!")
        } else {
            print("Query \(query) is incorrect!")
        }
        
        while sqlite3_step(str) == SQLITE_ROW {
            //            let name = String(cString: sqlite3_column_text(str, 0))
            let dbClass = String(cString: sqlite3_column_text(str, 0))
            //            let launched = Int(sqlite3_column_int(str, 2))
            
            ships.append(dbClass)
        }
        
        sqlite3_finalize(str)
        
        return ships
    }
}

//MARK: - getting battles list
//SELECT name, date from Battles
extension DB {
    
    func gettingBattleList() -> [String] {
        let query = "SELECT name, date from Battles"
        var str: OpaquePointer? = nil
        
        var battles = [String]()
        
        if sqlite3_prepare_v2(DB.db, query, -1, &str, nil) == SQLITE_OK {
            print("Query \(query) is done!")
        } else {
            print("Query \(query) is incorrect!")
        }
        
        while sqlite3_step(str) == SQLITE_ROW {
            let name = String(cString: sqlite3_column_text(str, 0))
            let dateOfBattle = String(cString: sqlite3_column_text(str, 1))
            
            
            battles.append("Name = \(name), date = \(dateOfBattle)")
        }
        
        sqlite3_finalize(str)
        
        return battles
    }
}

extension DB {
    
    func gettingOutcomesList() -> [Outcome] {
        let query = "select ship, battle, result, music from Outcomes"
        var str: OpaquePointer? = nil
        
        var outcomes = [Outcome]()
        
        if sqlite3_prepare_v2(DB.db, query, -1, &str, nil) == SQLITE_OK {
            print("Query \(query) is DONE!")
        } else {
            print("Query \(query) is incorrect!")
        }
        
        while sqlite3_step(str) == SQLITE_ROW {
            let ship = String(cString: sqlite3_column_text(str, 0))
            let battle = String(cString: sqlite3_column_text(str, 1))
            let result = String(cString: sqlite3_column_text(str, 2))
            
            var blob = Data()
            if let dataBlob = sqlite3_column_blob(str, 3){
                let dataBlobLength = sqlite3_column_bytes(str, 3)
                blob = Data(bytes: dataBlob, count: Int(dataBlobLength))
                print("dataBlob: \n", dataBlob)
                print("dataBlobLength = ", dataBlobLength)
            }
            
            outcomes.append(Outcome(shipName: ship, battleName: battle, result: result, music: blob))
        }
        
        sqlite3_finalize(str)
        return outcomes
    }
}

//MARK: - getting list of ships with full info
//select * from Ships
extension DB {
    
    func gettingFullInfoAboutShip() -> [Ship] {
        
        let query = "select * from ships"
        var str: OpaquePointer? = nil
        
        var ships = [Ship]()
        
        if sqlite3_prepare_v2(DB.db, query, -1, &str, nil) == SQLITE_OK {
            print("Query \(query) is DONE!")
        } else {
            print("Query \(query) is incorrect!")
        }
        
        while sqlite3_step(str) == SQLITE_ROW {
            let name = String(cString: sqlite3_column_text(str, 0))
            let shipClass = String(cString: sqlite3_column_text(str, 1))
            let launched = Int(sqlite3_column_int(str, 2))
            
            var blob = Data()
            if let dataBlob = sqlite3_column_blob(str, 3){
                let dataBlobLength = sqlite3_column_bytes(str, 3)
                blob = Data(bytes: dataBlob, count: Int(dataBlobLength))
                print("dataBlob: \n", dataBlob)
                print("dataBlobLength = ", dataBlobLength)
            }
            let imageSource = UIImage(data: blob)
            
            ships.append(Ship(name: name, shipClass: shipClass, launched: launched, icon: imageSource!))
        }
        
        sqlite3_finalize(str)
        return ships
    }
    
    func gettingFullInfoAboutBattles() -> [Battle] {
        
        let query = """
                        select name, date, v.content from battles b join video v
                            on id = b.id_video;
                    """
        var str: OpaquePointer? = nil
        
        var battles = [Battle]()
        
        if sqlite3_prepare_v2(DB.db, query, -1, &str, nil) == SQLITE_OK {
            print("Query \(query) is DONE!")
        } else {
            print("Query \(query) is incorrect!")
        }
        
        while sqlite3_step(str) == SQLITE_ROW {
            let name = String(cString: sqlite3_column_text(str, 0))
            let date = String(cString: sqlite3_column_text(str, 1))
            
            
            var blob = Data()
            if let dataBlob = sqlite3_column_blob(str, 2){
                let dataBlobLength = sqlite3_column_bytes(str, 2)
                blob = Data(bytes: dataBlob, count: Int(dataBlobLength))
                print("dataBlob: \n", dataBlob)
                print("dataBlobLength = ", dataBlobLength)
            }
            battles.append(Battle(name: name, date: date, video: blob))
        }
        
        sqlite3_finalize(str)
        return battles
    }
    
    func getFullInfoAboutClasses() -> [ClassSpecification] {
        
        
        
        let query = "select * from classes"
        var str: OpaquePointer? = nil
        
        var classes = [ClassSpecification]()
        
        if sqlite3_prepare_v2(DB.db, query, -1, &str, nil) == SQLITE_OK {
            print("Query \(query) is DONE!")
        } else {
            print("Query \(query) is incorrect!")
        }
        
        while sqlite3_step(str) == SQLITE_ROW {
            let name = String(cString: sqlite3_column_text(str, 0))
            let type = String(cString: sqlite3_column_text(str, 1))
            let country = String(cString: sqlite3_column_text(str, 2))
            let numGuns = Int(sqlite3_column_int(str, 3))
            let bore = Int(sqlite3_column_int(str, 4))
            let displacement = Int(sqlite3_column_int(str, 5))
            
            classes.append(ClassSpecification(name: name, type: type, country: country, numGuns: numGuns, bore: bore, displacement: displacement))
            
        }
        
        sqlite3_finalize(str)
        return classes
    }
    
    
}

//MARK: - delete battle by name
//delete from Battles where name = '\()'
//FIXME: delete ext after testing
extension DB {
    
    func deleteFromBattle(_ name: String) {
        let query = "delete from Battles where name = '\(name)'"
        var del: OpaquePointer? = nil
        
        guard sqlite3_prepare_v2(DB.db, query, -1, &del, nil) == SQLITE_OK else {
            let errmsg = String(cString: sqlite3_errmsg(DB.db)!)
            print("error prepare delete: \(errmsg)")
            return
        }
        
        guard sqlite3_step(del) == SQLITE_DONE  else {
            let errmsg = String(cString: sqlite3_errmsg(DB.db)!)
            print("error delete: \(errmsg)")
            return
        }
        
        sqlite3_finalize(del)
        print(query)
        
    }
    
    
    
}

protocol ProtocolDB {
    func deleteFromBattle(_ name: String)
}

extension ProtocolDB {
    func deleteFromBattle(_ name: String) {
        let query = "delete from Battles where name = '\(name)'"
        var del: OpaquePointer? = nil
        
        guard sqlite3_prepare_v2(DB.db, query, -1, &del, nil) == SQLITE_OK else {
            let errmsg = String(cString: sqlite3_errmsg(DB.db)!)
            print("error prepare delete: \(errmsg)")
            return
        }
        
        guard sqlite3_step(del) == SQLITE_DONE  else {
            let errmsg = String(cString: sqlite3_errmsg(DB.db)!)
            print("error delete: \(errmsg)")
            return
        }
        
        sqlite3_finalize(del)
        print(query)
        
    }
}
