//
//  DStateMachineTests.swift
//  DStateMachineTests
//
//  Created by Manh Cuong Dao on 2/29/16.
//  Copyright © 2016 Manh Cuong Dao. All rights reserved.
//

import XCTest
@testable import DStateMachine

class StateA: StateBase {

    override func enter(block: (context: DStateMachine) -> Void) {
        print("Enter State A")
    }
    
    override func exit(block: (context: DStateMachine) -> Void) {
        print("Exit State A")
    }
    
    override func action(block: (context: DStateMachine) -> Void) {
        print("Do Action State A")
    }
}

class StateB: StateBase {
    
    override func enter(block: (context: DStateMachine) -> Void) {
        print("Enter State B")
    }
    
    override func exit(block: (context: DStateMachine) -> Void) {
        print("Exit State B")
    }
    
    override func action(block: (context: DStateMachine) -> Void) {
        print("Do Action State B")
    }
}

class StateC: StateBase {
    
    override func enter(block: (context: DStateMachine) -> Void) {
        print("Enter State C")
    }
    
    override func exit(block: (context: DStateMachine) -> Void) {
        print("Exit State C")
    }
    
    override func action(block: (context: DStateMachine) -> Void) {
        print("Do Action State C")
    }
}

class DStateMachineTests: XCTestCase {
    static var stateA: StateA = {
        let state = StateA()
        
        state.addHandler({ (context: DStateMachine) -> Void in
            print("Handle event 1 for State A")
            print("Move to State B")
            context.state = stateB
            }, forEvent: "Event 1")
        
        return state

    }()
    
    static var stateB: StateB = {
        let state = StateB()
        
        state.addHandler({ (context: DStateMachine) -> Void in
            print("Handle event 1 for State B")
            print("Move to State C")
            context.state = stateC
            }, forEvent: "Event 1")
        
        return state
        
    }()
    
    static var stateC: StateC = {
        let state = StateC()
        
        state.addHandler({ (context: DStateMachine) -> Void in
            print("Handle event 1 for State C")
            print("Move to State A")
            context.state = stateA
            }, forEvent: "Event 1")
        
        return state
        
    }()
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let stateMachine = DStateMachine(initState: DStateMachineTests.stateA)
        stateMachine.handleEvent("Event 1")
        stateMachine.handleEvent("Event 1")
        stateMachine.handleEvent("Event 1")
        XCTAssertTrue(stateMachine.state  is StateA)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
