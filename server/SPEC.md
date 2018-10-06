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
	- Content: Home page. Project board for tribe / Active project.

Project:
	- Path: _find-your-tribe.co.uk/projects/_{**project-name: String**}
	- Content: Project details. Assigned members.

Account:
	- Path: _find-your-tribe.co.uk/user/_{**username: String**}
	- Content: User account page. Assigned projects. User details like school and year group.

Sign-up:
	- Path: _find-your-tribe.co.uk/user/new
	- Content: JSON object with new user information.
