//
//  AppDelegate.swift
//  InstabugInternshipTask
//
//  Created by Yosef Hamza on 19/04/2021.
//

import UIKit
import CoreData
import InstabugLogger


@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        InstabugLogger.shared.clearLogs()
        
        InstabugLogger.shared.log(level: .error, message: "jWv7k6URq4T4KdQlDshhVN125hRGU9d7i93FSZacTKh0ejmbCSkDqxS5ND085IVlxMcyX11fq7cjq8jNlNopE6dCUw84qA6uxyqcjfZUjFIWhhTvmewtHaUsNIqAsvaiq9dt0VXuGjTFxBjPJpSJLeXvCazz16JeK0n2vYkXhphF2O1WCsoXEIshxXH5Q51YwrrrFWWX0LnBq9gTFeE1zNHb1fSgIgU2Id1HZFuJZMSfzBPHi0nBjyrEeZqI9nnBadmOgFBY4fERJk5SlYgac1TIwzOSGvElmvLNrTSSsNMkBDHl9TNKXilk4JI62KNAhiLb8Pslxjk4LHtlaXPU1by6GXoj6lTsxFhJ6Tlbx3q39KpioYczHdqAtxT6J1xpe9pmbDusEYVrq7CpFPszadZ8cT0YnaoRJlb8vsDgpz735zOIxVg8BlBcP8sWrAozK2b1yof0tZJDnaZzIoQN94ZvSjSRirTBXrxRX35xpvkIG9OAhJC8Me3dwykuCHmM2TqN4WX5PLeaM56o2eZAxhAD3gZFkkg4Sh7JZt7FWv8Q54N0MwSAftCetFEVpSvaUbGuYbxbCdaCfF1SnBhO9mqd936IYe42mHvttJjU8ivqsRRMVfdhaxmU4dAOqmNbcdnOCWynt65U1wwEeYCcjztbwgVwjqui7uwi4HTrUcXJ4egILLRQF6UzOk2GAY9GdgGYTBjR9NKz3krtVPBZWxf6Rf9ILMAgc3ElacmmzEaZC2tRJ6m0aam54maaxzs3xtK6QU7RLtvzIqYj9GFrgKNNEpzgZ4m6HrLHaaGYgGdg3zlpCl0SVY7IXiocvJA5mTCs8V5LigQ0mrMF2br7uxggMsBVp9WzyZgmoLfVdFlLflWn9t9ikGgIfLbtnKF6s3LyD9hQ59NUYHMWfO6mLeQXXeS2FcAQEWw8DyqsRkiDcv1fKtCx1IXK9CRe1FJxe1kpKTcMFuihUYmcTJYSCR68r9XezSQieusfe123Hala")
        
        return true
        
        
    }
    
    
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    
    

}

