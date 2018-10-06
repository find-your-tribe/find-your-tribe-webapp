# WebApp Specification

Technical specification for the `findyourtribe` web application.

## Overview
Webapp where users can join 'Tribes' and vote for or contribute to the various projects in their respective tribes.
Users should be able to create accounts to be able to join tribes in their area.

## Feature List
1. User accounts:=
   - Log in
   - Account creation
   
2. Project creation & selection:
   - Location based project suggestion
   - Project upvoting
   - Project sign up (potential issue with signing off projects)

3. Admin:
   - Project filtering
   - Project hour logging for each user in a project

### Account
Information needed when creating accounts:
	- Username
	- Password
	- Avatar
	- School year

### Project
List of projects, ordered by upvotes.

## API 
Root: 
	- Path: _find-your-tribe.co.uk/_
	- Method: GET
	- Content: Home page. Project board for tribe / Active project.

Project:
	New project:
		- Path: _find-yor-tribe.co.uk/project/new_
		- Method: POST - Project details
		- Content: Project details for creation of new project
	Project details:
		- Path: _find-your-tribe.co.uk/project/_{**project-id: Int**}
		- Method: GET
		- Content: Project details. Assigned members.
	Upvote:
		- Path: _find-your-tribe.co.uk/project/upvote_
		- Method: POST - Sends project with score to increase
		- Content: Increases the score of a project. Cont

Account:
	- Path: _find-your-tribe.co.uk/user/_{**username: String**}
	- Method: GET
	- Content: User account page. Assigned projects. User details like school and year group.

Sign-up:
	- Path: _find-your-tribe.co.uk/user/new
	- Method: POST - New user info
	- Content: JSON object with new user information.

### JSON Objects
Examples of JSON objects that will be sent and received from the server

#### Project Details
Sent when creating new projects or requesting already made projects:
```json
{
	"id": Number,
	"name": String,
	"desc": String,
	"score": Number,
	"author": String
}
```

#### User objects
Sent when creating new users:
##### UserDetails
```json
{
	"username": String,
	"password": String
}
```

##### User
Returned from server when displaying user info:
```json
{
	"user-info": UserDetails,
	"authored-projects": [ProjectDetails], // An array of project details
	"assigned-boards": [ProjectDetails]
}
```

#### Project objects
##### ProjectDetails
Sent when creating new project 
```json
{
	"id": Number,
	"name": String,
	"desc": String,
	"score": String,
	"author": String
}
```

##### Project
Received to display on board
```json
{
	"info": ProjectDetails,
	"members": [UserDetails]
}
```

##### Board
This is the request the home page sends. Shows the current project board.
```json
{
	"active-project": Project,
	"project-list": [ProjectDetails]
}
```
