## Goal Chum

Goal Chum is a helpful little telegram buddy keeping you on track with your goals, and helping keep your goals on track with you!

What does that mean even?!
We're not just mindless machines! We do things for reasons. Sure, like any pall, Goal Chum checks in with you to make sure you get the things you need to get done, done.
But like a great friend, Goal Chum doesnt stop there. Goal Chum helps make sure your tasks stay aligned with your 
over all aspiration. They why behind the what. 

## General Plan
### Tech Stack
- **NX Workspace**
- **Frontend**: React (Single Page App)
- **Backend**: Node.js with Express
- **Database & Auth**: Supabase
- **Telegram Bot**: `telegram.js`
- **NLP**: ChatGPT API

### App Components
1. **Frontend (React)**
    - **Home Component**: Landing page with app description.
        - "Log In" or "Go to App" based on auth state.
    - **Dashboard Component**: Where authenticated users manage tasks, goals & profile etc.
    - **Auth Component**: Handles login and signup.

2. **Backend (Node.js + Koa)**
    - **API Endpoints**: To interact with Supabase and GPT.
    - **Telegram Bot Listener**: To handle incoming Telegram messages.
    - **Scheduled Task**: A single task running at intervals to check for tasks and goals that need attention.

3. **Telegram Bot (`telegram.js`)**
    - **Commands**: To CRUD tasks and goals.
    - **Notifications**: For reminders and updates.

### User Flow
1. **Landing Page**: User arrives at the home page.
2. **Authentication**: 
    - New users: Sign up.
    - Returning users: Log in.
3. **Dashboard**: 
    - View and manage tasks and goals.
    - Generate QR code to connect with Telegram bot.
4. **Telegram Bot**: 
    - Scan QR code to authenticate.
    - Receive coaching and reminders.

### Data Flow
1. **User Input**: Via web app or Telegram bot.
2. **Backend Processing**: 
    - Parse with GPT.
    - Update Supabase DB.
3. **User Feedback**: 
    - Update web dashboard.
    - Send Telegram messages.

### Scheduled Operations
- A single recurring backend task checks Supabase for tasks and goals that need attention and sends reminders via the Telegram bot.



## Start the app

To start the development server run `nx serve goalchum`. Open your browser and navigate to http://localhost:4200/. Happy coding!


## Generate code

If you happen to use Nx plugins, you can leverage code generators that might come with it.

Run `nx list` to get a list of available plugins and whether they have generators. Then run `nx list <plugin-name>` to see what generators are available.

Learn more about [Nx generators on the docs](https://nx.dev/plugin-features/use-code-generators).

## Running tasks

To execute tasks with Nx use the following syntax:

```
nx <target> <project> <...options>
```

You can also run multiple targets:

```
nx run-many -t <target1> <target2>
```

..or add `-p` to filter specific projects

```
nx run-many -t <target1> <target2> -p <proj1> <proj2>
```

Targets can be defined in the `package.json` or `projects.json`. Learn more [in the docs](https://nx.dev/core-features/run-tasks).

## Build Pipeline

GoalChum live in a cozy little VPS over at NetCup. 

When changes are pushed to development or main, a [git workflow action](https://github.com/theronburger/goalchum/tree/development/.github/workflows) builds the frontend with ```<insert code here>``` and copies the build over to the server via ssh

Changes to the dev branch trigger [check.yml](https://github.com/theronburger/goalchum/blob/development/.github/workflows/check.yml), which builds and copies to a staging folder and calculates [a hash for the actual files](https://github.com/theronburger/goalchum/blob/dev/getHash.js) (different to the git hash, as this changes with any commit even if no files have changes) 

Changes to the main branch trigger [deploy.yml](https://github.com/theronburger/goalchum/blob/development/.github/workflows/deploy.yml), which calculates a hash,  skipping the build process if there are no changes. 
Staging or a fresh build are then copied to the build folder on the server and the build script (build.sh) is run via ssh on the server. 



