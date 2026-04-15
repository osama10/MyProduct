# TASK-001: Create Folder Structure

## Title
Create folder structure for Clean Architecture

## Goal
Set up the project directory structure matching the approved architecture plan, with Core, Domain, Data, and UI folders and their subfolders.

## Scope - What to Implement
- Create `MyProduct/Core/` folder
- Create `MyProduct/Domain/Models/` folder
- Create `MyProduct/Domain/Repositories/` folder
- Create `MyProduct/Domain/UseCases/` folder
- Create `MyProduct/Data/DTOs/` folder
- Create `MyProduct/Data/DataSources/` folder
- Create `MyProduct/Data/Repositories/` folder
- Create `MyProduct/Data/Resources/` folder
- Create `MyProduct/UI/ProductList/` folder
- Create `MyProduct/UI/ProductDetail/` folder
- Create `MyProductTests/Domain/` folder
- Create `MyProductTests/Data/` folder
- Create `MyProductTests/UI/` folder
- Ensure all folders are registered in the Xcode project

## Out of Scope
- Do NOT create any Swift files
- Do NOT modify existing code files
- Do NOT add any dependencies

## Files Expected to Change
- `MyProduct.xcodeproj/project.pbxproj` (folder group references)

## Implementation Notes
- Use Xcode-aware tools to create folders so they appear in the project navigator
- Follow the exact folder structure from the implementation plan
- Folders must be real filesystem directories, not just Xcode groups

## Completion Criteria
- All folders from the plan exist on disk
- All folders appear in Xcode project navigator
- Project still builds successfully (no broken references)
