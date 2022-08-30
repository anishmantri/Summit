//
//  TaskViewModel.swift
//  Summit (iOS)
//
//  Created by Anish on 07/05/22.
//

import SwiftUI
import CoreData
import UserNotifications

class TaskViewModel: ObservableObject {
    @Published var currentTab: String = "Today"
    
    // MARK: New Task Properties
    @Published var openEditTask: Bool = false
    @Published var taskTitle: String = ""
    @Published var taskColor: String = "Yellow"
    @Published var taskDeadline: Date = Date()
    @Published var taskType: String = "Basic"
    @Published var showDatePicker: Bool = false
    
    // MARK: Editing Existing Task Data
    @Published var editTask: Task?
    
    // MARK: Adding Task To Core Data
    func addTask(context: NSManagedObjectContext)->Bool{
        // MARK: Updating Existing Data in Core Data
        var task: Task!
        if let editTask = editTask {
            task = editTask
        }else{
            task = Task(context: context)
        }
        task.title = taskTitle
        task.color = taskColor
        task.deadline = taskDeadline
        task.type = taskType
        task.isCompleted = false
        
        if let _ = try? context.save(){
            return true
        }
        return false
    }
    
    // MARK: Resetting Data
    func resetTaskData(){
        taskType = "Low"
        taskColor = "Yellow"
        taskTitle = ""
        taskDeadline = Date()
        editTask = nil
    }
    
    
//    func scheduleNotification() {
//        let content = UNMutableNotificationContent()
//        content.title = "Started working yet?"
//        content.subtitle = "Add some tasks or see what existing ones need to get done"
//        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "so-proud-notification.m4r"))
//        content.badge = 1
//        
//        //time
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
//        
//        let request = UNNotificationRequest(identifier: UUID().uuidString,
//                                            content: content,
//                                            trigger: trigger)
//        UNUserNotificationCenter.current().add(request)
//    }
    
    
    
//    // MARK: Scheduling Notifications
//    func scheduleNotifications() async throws->[String]{
//        let content = UNMutableNotificationContent()
//        content.title = "Summit"
//        content.subtitle = taskTitle + "is due now"
//        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "so-proud-notification.m4r"))
//
//        // Scheduled Ids
//        var notificationIDs: [String] = []
//        let calendar = Calendar.current
//        let weekdaySymbols: [String] = calendar.weekdaySymbols
//
//        // MARK: Scheudling Notifications
//    }
    
    // MARK: If Edit Task Is Available then Setting Exisiting Data
    func setupTask(){
        if let editTask = editTask {
            taskType = editTask.type ?? "Basic"
            taskColor = editTask.color ?? "Yellow"
            taskTitle = editTask.title ?? ""
            taskDeadline = editTask.deadline ?? Date()
        }
    }
}
