# cps406-sprint3-group57
 ===============================
         mQIX Game Project      
 ===============================
 
 Toronto Metropolitan University  
 CPS 406
 ---------------------------------------
 
 Project Title:       mQIX – The Qix-Inspired Arcade Game  
 Course/Instructor:   CPS 406 W2025
 Submission Date:     2025-04-11  
 
 ---------------------------------------
 Team Members
 ---------------------------------------
 
 1. Name: Kasra Ebnerasoul Sanati 
    Student ID: (501280086)
 
 2. Name: Nicholas Smith 
    Student ID: (501255339)
 
 3. Name: Malhar Sankpal 
    Student ID: (501080467)
 
 ---------------------------------------
 Project Description
 ---------------------------------------
 
 mQIX is a 2D arcade-style game inspired by the classic game "Qix". The objective is for the player to claim territory on the field by performing incursions using the "Push" function, while avoiding enemies like Qix and Sparx.
 
 Key Features:
 - Movement along field edges
 - Area-claiming using a custom Push mechanic
 - Collision detection with Qix and Sparx
 - Life-force tracking and level progression
 - Configurable parameters for challenge tuning
 
 ---------------------------------------
 Delivery Package Contents
 ---------------------------------------
 1. Root Files:
 - `README.md`              : Development notes
 - `project.godot`          : Main Godot project file
 - `icon.svg`               : Project icon
 - `.gitignore`             : Git configuration
 
 Folders:
 - `Scenes/`                : All Godot scenes used in the game
     - `field.tscn`, `player.tscn`, `qix.tscn`, `sparx.tscn`, `trail.tscn`, etc.
 - `Scripts/`               : GDScript logic for player, enemies, controller, etc.
     - `controller.gd`      : Central control logic
 - `music/`                 : Background music and audio assets
 
 Temporary and Build Files:
 - Files ending in `.tmp`   : Intermediate or build-generated data
 - 
 2. Build Information:
    - Built using: Godot Engine v4.3
    - Platform: [e.g., Windows, Mac, Linux]
    - To Run: Open `main.tscn` in Godot or run the exported binary if provided.
 
 ---------------------------------------
 Known Issues / Limitations
 ---------------------------------------
 - Push Mechanic is faulty, and does not shrink area
 - Moving pathways are not strictly horizontal/vertical
 - Single-level only
 
