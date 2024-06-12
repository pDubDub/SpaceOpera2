//
//  GameScene.swift
//  SpaceOpera2
//
//  Created by Patrick Wheeler on 11/20/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    var spaceshipCrew: SpaceshipCrew!
    var starfield: Starfield!
  
    var leftArrowPressed = false
    var rightArrowPressed = false
    var lastUpdate: TimeInterval!

    override func didMove(to view: SKView) {
        // Set up your game scene here
        
        starfield = Starfield(size: size)
        addChild(starfield)
        
        let label = SKLabelNode(text: "Hello, Spaceship Crew!")
//        label.position = CGPoint(x: size.width / 2, y: size.height - 50)
        // 0,0 is currently the center of the screen. This command was actually putting things in the upper-right corner.
        addChild(label)
        

        // Create an instance of SpaceshipCrew
        spaceshipCrew = SpaceshipCrew(yPosition: -size.height / 4)
//        spaceshipCrew.position = CGPoint(x: size.width / 2, y: size.height / 2)
//        spaceshipCrew.position = CGPoint(x: 0, y: -size.height / 4)
//        spaceshipCrew.crewYPosition = -size.height / 4
//        print(spaceshipCrew.crewYPosition)
        
//        spaceshipCrew.spaceship.position = CGPoint(x: size.width / 2, y: size.height / 2)
        spaceshipCrew.spaceship.position = CGPoint(x: 0, y: size.height / 4)
        // sets spaceship to upper-center of screen
        
        addChild(spaceshipCrew)
    }

    override func mouseDown(with event: NSEvent) {
        // Called when a mouse click occurs
        // You can add game logic here

        // Example: Move the entire crew to the clicked position
        let location = event.location(in: self)
        let moveAction = SKAction.move(to: location, duration: 1.0)
        spaceshipCrew.run(moveAction)
    }

    override func keyDown(with event: NSEvent) {
        // Handle key events
        switch event.keyCode {
        case 123: // Left arrow key
            leftArrowPressed = true
        case 124: // Right arrow key
            rightArrowPressed = true
        default:
            break
        }
    }
    
    override func keyUp(with event: NSEvent) {
        switch event.keyCode {
        case 123: // Left arrow key
            leftArrowPressed = false
        case 124: // Right arrow key
            rightArrowPressed = false
        default:
            break
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // https://stackoverflow.com/questions/42705980/arrow-keys-in-spritekit
        defer {lastUpdate = currentTime}
        guard lastUpdate != nil else {
            return
        }
        
        let dt = currentTime - lastUpdate
        guard dt < 1 else {
            return // so nothing jumps when the game is unpaused
        }
        
        if leftArrowPressed {
            spaceshipCrew.spaceship.heading -= 1 * dt
        }
        if rightArrowPressed {
            spaceshipCrew.spaceship.heading += 1 * dt
        }
        
        // should call starfield.update() and pass in a value for spaceship speed and maybe dt
        // to move the starfield
    }
}

// Uncomment the following line to run the game in a standalone mode
//NSApplication.shared.run()
