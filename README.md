BondTime App
BondTime is a Flutter application aimed at enhancing parent-child bonding through mindful, screen-free activities. This app encourages early development in children through interactive and engaging features.

🚀 Getting Started
Prerequisites
Make sure you have the following installed:

Flutter SDK (version 3.x or above)
Android Studio or Visual Studio Code
Git (Version control system)
Check Flutter Installation:

bash
Copy
Edit
flutter doctor
Ensure there are no errors before proceeding.

📁 Cloning the Repository
Fork the Repository (Optional)

Go to BondTime Repo
Click on the Fork button to create a copy under your GitHub account.
Clone the Repository Locally

bash
Copy
Edit
git clone https://github.com/YourOrgName/bondtime-app.git
cd bondtime-app
Install Dependencies
bash
Copy
Edit
flutter pub get
Run the Application
bash
Copy
Edit
flutter run
🔧 Branching Strategy
We are using the Git Flow branching strategy:

main - Always stable and production-ready.
dev - Active development happens here.
feature/ - Individual features are developed on separate branches.
Branch Naming Convention
Follow this naming convention:

php-template
Copy
Edit
feature/<feature-name>
Example:

feature/weight-tracker (Sithija)
feature/onboarding-screens (Thisara)
feature/user-input (Sasvin)
feature/pediatrician-contacts (Rushan)
feature/audio-guidance (Dilshan)
feature/forms (Prabhavee)
👨‍💻 Contributing
1. Create a New Branch
bash
Copy
Edit
git checkout -b feature/<feature-name>
2. Make Changes and Commit
Follow the Commit Message Guidelines:
vbnet
Copy
Edit
feat: Added new onboarding screen
fix: Resolved layout issue in pediatrician contacts
chore: Updated dependencies
bash
Copy
Edit
git add .
git commit -m "feat: Implemented weight tracker UI"
3. Push Changes
bash
Copy
Edit
git push origin feature/<feature-name>
4. Create a Pull Request (PR)
Go to BondTime Repo Pull Requests
Click New Pull Request
Select:
Base: dev
Compare: feature/<feature-name>
Add:
Title: feat: Completed onboarding screens
Description:
What was implemented
Screenshots (if UI-related)
Any known issues
5. Code Review and Merge
At least 2 team members should review the PR before merging.
Once approved, Sithija (Maintainer) or any assigned reviewer can merge the PR into dev.
🚀 Pulling Latest Changes
Before starting any work, always pull the latest changes from the dev branch to avoid conflicts:

bash
Copy
Edit
git checkout dev
git pull origin dev
If you are working on your feature branch, rebase your branch:

bash
Copy
Edit
git checkout feature/<feature-name>
git pull origin dev
git rebase dev
📜 Commit Message Guidelines
Follow these prefixes for consistent commit messages:

feat: - New feature
fix: - Bug fix
chore: - Build process or dependency updates
docs: - Documentation updates
refactor: - Code change without feature or bug
style: - Code style changes (e.g., formatting)
Example:

makefile
Copy
Edit
feat: Added onboarding animation
fix: Fixed overflow issue in pediatrician details
chore: Upgraded Flutter SDK version
🎨 UI/UX Guidelines
We are following a consistent design language for BondTime:

Primary Color: #5A87FE (Bright Blue)
Background Color: #FEFEFE (Off-White)
Font Family: Poppins
Typography:
Title: Bold, 24px
Subtitle: Regular, 18px, Grey
For detailed UI references, please check our Figma designs (link will be shared in the team channel).

⚙️ CI/CD Pipeline (GitHub Actions)
We are using GitHub Actions to ensure continuous integration and delivery:

Automatically run tests on every PR.
Build the app to check for compilation errors.
Workflow Configuration
The CI is triggered on:

Pull Requests to dev branch
Merges into main
🎨 UI/UX Feature Assignments
Each member is responsible for the following features:

Sithija - Complex UI Screens (logic-heavy elements)

Weight Tracker
Gamified Activities
Award System
Thisara - Visually Rich Screens (animations and styling)

Onboarding Screens
Get Started
Frame 85
Sasvin - UI with UX-Heavy Focus

Questions and User Input
Disease Recognition Alert
Rushan - Moderate Difficulty Screens

Pediatrician Contacts
List Screen
Details Screen
Dilshan - Simpler Functional UI

Audio Guidance Screens
Prabhavee - Beginner-Friendly Screens

User Input Forms
Additional simpler layouts
🔍 Code Review Process
Every Pull Request requires at least 2 reviews before merging.
Reviewers check for:
Code quality and consistency
Proper naming conventions
Adherence to UI/UX guidelines
No conflicts with dev branch
⚡ Common Commands Cheat Sheet
Check Status
bash
Copy
Edit
git status
Stage Changes
bash
Copy
Edit
git add .
Commit Changes
bash
Copy
Edit
git commit -m "feat: Implemented feature name"
Push to Remote
bash
Copy
Edit
git push origin feature/<feature-name>
Pull Latest Changes
bash
Copy
Edit
git pull origin dev
💬 Communication and Collaboration
We will be using:

Discord/Slack for team communication and daily standups.
GitHub Issues for tracking bugs and tasks.
Figma for UI/UX design collaboration.
🛠️ Additional Notes
Always test your code locally before pushing.
Follow the UI/UX guidelines strictly for consistency.
Avoid pushing directly to the main branch.
Collaborate and ask questions if you're unsure!
💡 Need Help?
If you face any issues or need help:

Reach out on the team's communication channel.
Tag the relevant team member responsible for the feature.
📜 License
This project is licensed under the MIT License - see the LICENSE file for details.

📧 Contact
For any queries, contact:

Sithija (Tech Lead) - GitHub Profile
Team BondTime - BondTime Organization
⚡ Happy Coding! 🚀
Let's build an amazing app together! 🎉