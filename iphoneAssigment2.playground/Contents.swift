//Author: Yolanda Alonso Barbero

import Foundation


//Circle struct

struct Circle {
    var radius: Double {
        didSet {
            if radius < 0 {
                radius = 0.0
            }
        }
    }
    var area: Double {
        get {
            return 3.1416 * radius * radius
        }
    }
    var circumference: Double {
        get {
            return 2 * 3.1416 * radius
        }
    }
    
    init() {
        radius = 0.0
    }
    
    init(radius: Double) {
        if radius < 0 {
            self.radius = 0.0
        } else {
            self.radius = radius
        }
    }
}



//CircleCollection class

class CircleCollection {
    private var circles: [Circle]
    var count : Int {
        get {
            return circles.count
        }
    }
    
    func add(circle: Circle) {
        circles.append(circle)
    }
    
    func removeCirclesWithRadiusLargerThan(min: Double, butSmallerThan max: Double) {
        //Remove circles with radius larger than min
        circles = circles.filter { $0.radius <= min }
        //Remove circles with radius smaller than max
        circles = circles.filter { $0.radius >= max }
    }
    
    init() {
        circles = []
    }
}



//ToDoItem class

class ToDoItem {
    var task: String
    var priority: Int {
        didSet {
            if priority < 0 {
                priority = 0
            }
            if priority > 10 {
                priority = 10
            }
        }
    }
    var dueDate: NSDate?
    
    func fullDescription() -> String {
        if dueDate != nil {
            return ("-Task: \(task)\n Priority: \(priority)\n Due date: \(dueDate!)")
        } else {
            return ("-Task: \(task)\n Priority: \(priority)")
        }
    }
    
    init(task: String, priority: Int, dueDate: NSDate? ) {
        self.task = task
        if priority < 0 {
            self.priority = 0
        } else if priority > 10 {
            self.priority = 10
        } else {
            self.priority = priority
        }
        self.dueDate = dueDate
    }
}



//AnnotatedToDoItem class

class AnnotatedToDoItem: ToDoItem {
    var note: String?
    
    override func fullDescription() -> String {
        if note != nil {
            return ("\(super.fullDescription())\n Note: \(note!)")
        } else {
            return ("\(super.fullDescription())")
        }
    }
    
    init(task: String, priority: Int, dueDate: NSDate?, note: String?) {
        self.note = note
        super.init(task: task, priority: priority, dueDate: dueDate)
    }
}
