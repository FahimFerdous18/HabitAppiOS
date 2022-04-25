//
//  SceneDelegate.swift
//  EasyHabit
//
//  Created by BJIT on 1/22/22.
//

import UIKit
import CoreData

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //fetch core data
                var cnt = 0
                let context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
                var request = NSFetchRequest<NSFetchRequestResult>()
                request = UserInfoFinal.fetchRequest()
                request.returnsObjectsAsFaults = false
                var i = 0
                do {
                    let arrayOfData = try context.fetch(request) as NSArray
                    cnt = arrayOfData.count
                    if cnt > 1 {
                        for managedObject in arrayOfData.dropFirst()
                           {
                        try context.delete(managedObject as! NSManagedObject)
                           }
                    }
                    i=i+1
                }
                catch
                {
                    print("Fetch Failed")
                }
                var isUserLoggedIn = false
               
                if cnt > 0{
                    isUserLoggedIn = true
                }
                else{
                    isUserLoggedIn = false
                }
                // Create Fetch Request
//                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SaveInfo")
//
//                // Create Batch Delete Request
//                let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//
//                do {
//                    try context.execute(batchDeleteRequest)
//
//                } catch {
//                    // Error Handling
//                }
        
        
                guard let windowScene = (scene as? UIWindowScene) else { return }
                    print(isUserLoggedIn)
                    let window = UIWindow(windowScene: windowScene)
                    self.window = window
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    self.window?.rootViewController = storyboard.instantiateViewController(withIdentifier: (isUserLoggedIn ? "DMViewController" : "ViewController"))
                    self.window?.makeKeyAndVisible()
                   
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

