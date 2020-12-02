//
//  DBManager.swift
//  DemoApp
//
//  Created by 劉良瑋 on 2020/12/1.
//

import Foundation
import CoreData

class DBManager {
    
    private let database = "DemoModel"
    private let entity = "APIDataTable"
    static let shared = DBManager()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: database)
        container.loadPersistentStores { (storeDescription, error) in
            guard let error = error else { return }
            fatalError()
        }
//        print(NSPersistentContainer.defaultDirectoryURL())
        return container
    }()
    
    private lazy var context = persistentContainer.viewContext
    
    func save(apiData: APIData) {
        guard let object = NSEntityDescription.insertNewObject(
                forEntityName: entity,
                into: context) as? APIDataTable else { return }
        
        object.update(with: apiData)
        saveContext()
    }
    
    private func saveContext() {
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch let error {
            print(error)
        }
    }
    
    func request() -> [APIDataTable]? {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        
        do {
            guard let results = try context.fetch(request) as? [APIDataTable] else { return nil }
            return results
        } catch {
            fatalError("\(error)")
        }
    }
}

extension APIDataTable {
    func update(with apiData: APIData) {
        albumId = Int16(apiData.albumId)
        id = Int16(apiData.id)
        title = apiData.title
        url = apiData.url
        thumbnailUrl = apiData.thumbnailUrl
    }
}
