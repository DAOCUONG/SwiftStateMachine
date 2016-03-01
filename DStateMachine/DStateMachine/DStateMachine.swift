//
//  DStateMachine.swift
//  DStateMachine
//
//  Created by Manh Cuong Dao on 2/29/16.
//  Copyright © 2016 Manh Cuong Dao. All rights reserved.
//

import Foundation
import Foundation

typealias EventHandler =  (context: DStateMachine) -> Void


class DStateMachine {
    var state: StateBase {
        willSet {
            state.exit({_ in (context:self)})
        }
        
        didSet {
            state.enter({_ in (context:self)})
            state.action({_ in (context:self)})
        }
    }
    
    func handleEvent(eventName: String) {
        state.handleEvent(eventName, context: self)
    }
    
    init(initState: StateBase) {
        self.state = initState
    }
}

protocol StateType
{
    func enter(block: EventHandler)
    func action(block: EventHandler)
    func exit(block: EventHandler)
    
    func addHandler(handler: (context: DStateMachine) -> Void , forEvent eventName: String)
    func handleEvent(eventName: String, context: DStateMachine)
}

class StateBase: StateType {
    
    private  var eventHandlers: [String: EventHandler] = [:]
    func enter(block: (context: DStateMachine) -> Void) {}
    func action(block: (context: DStateMachine) -> Void) {}
    func exit(block: (context: DStateMachine) -> Void) {}

    func addHandler(handler: (context: DStateMachine) -> Void , forEvent eventName: String)
    {
        eventHandlers[eventName] = handler
    }
    
    func handleEvent(eventName: String, context: DStateMachine) {
        if let handler =  eventHandlers[eventName] {
            handler(context: context)
        }
    }
}