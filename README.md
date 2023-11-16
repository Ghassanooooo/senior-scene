# Senior Scene

Use the init command to initialize dependencies for a new project:

```bash
npx senior-scene@latest init
```

![Senior Scene logo](./public/images/logo.png)

Run the following command to start the development server:

```bash
npm run dev
```

[Playground Live Demo](https://senior-scene-demo.vercel.app/)

## Introduction

Hello, awesome developers! Get ready to embark on a magical journey where we transform a blank slate into a React front-end masterpiece. 🎨👨‍💻✨

## What's Cooking?

This script is like a gourmet recipe for setting up a React project with Vite and Tailwind CSS. It's spicy with a touch of sweetness, ensuring your project looks good and runs smoothly.

## Ingredients

- Vite and React: The bread and butter of our project.
- Tailwind CSS: For styling that's as easy as pie.
- PostCSS and Autoprefixer: They're like kitchen helpers making sure your CSS looks great in all browsers.
- Shadcn UI: A secret sauce for UI components.
- React Router: To navigate through your app like a GPS.

## Step-by-Step Guide

1. **Creating the Project**: We start with `npm create vite@latest` to summon a new React project from the digital ether.
2. **Adding Style**: `npm install -D tailwindcss postcss autoprefixer` brings in Tailwind CSS, making your app look like it walked off a fashion runway.
3. **Tailwind Configuration**: With a few echoes, we tell App.css to embrace Tailwind's beauty.
4. **JS Superpowers**: Update jsconfig.json to make importing components feel like teleporting.
5. **Vite Config Magic**: We then write an enchanting spell in vite.config.js to make sure our paths are as clear as a summer sky.
6. **Node Types and More**: A dash of @types/node and some tasty libraries like lucide-react and @tanstack/react-table to add more flavors.
7. **Component Galore**: Here comes the fun part! We use Shadcn UI to add a plethora of components like a wizard conjuring spells.
8. **Routing Like a Pro**: Set up react-router-dom to navigate around your application like a starship captain.
9. **File Structure Fun**: We create a neat and tidy folder structure, ensuring everything is in its right place.
10. **Themes and Toggles**: Because everyone loves a little customization, right?
11. **Run, Forest, Run!**: Finally, `npm run dev` to bring your project to life. It's alive! 🧟‍♂️

## Project structure

```sh
.
├── node_modules/
├── public/
│   └── vite.svg
└── src/
    ├── assets/
    │   └── react.svg
    ├── components/
    │   └── features/
    │       ├── accordion.jsx
    │       ├── alert-dialog.jsx
    │       ├── alert.jsx
    │       ├── avatar.jsx
    │       ├── button.jsx
    │       ├── calendar.jsx
    │       ├── card.jsx
    │       ├── collapsible.jsx
    │       ├── combobox.jsx
    │       ├── command.jsx
    │       ├── context-menu.jsx
    │       ├── data-table.jsx
    │       ├── date-picker.jsx
    │       ├── dialog.jsx
    │       └── ... (more files)
    │   └── ui/
    │       ├── accordion.jsx
    │       ├── alert-dialog.jsx
    │       ├── alert.jsx
    │       ├── aspect-ratio.jsx
    │       ├── avatar.jsx
    │       ├── badge.jsx
    │       ├── button.jsx
    │       ├── calendar.jsx
    │       ├── card.jsx
    │       ├── checkbox.jsx
    │       ├── collapsible.jsx
    │       ├── command.jsx
    │       ├── context-menu.jsx
    │       ├── dialog.jsx
    │       ├── dropdown-menu.jsx
    │       ├── form.jsx
    │       ├── hover-card.jsx
    │       ├── input.jsx
    │       ├── label.jsx
    │       ├── menubar.jsx
    │       ├── navigation-menu.jsx
    │       ├── popover.jsx
    │       ├── progress.jsx
    │       ├── radio-group.jsx
    │       ├── scroll-area.jsx
    │       ├── select.jsx
    │       ├── separator.jsx
    │       ├── sheet.jsx
    │       ├── skeleton.jsx
    │       ├── slider.jsx
    │       ├── switch.jsx
    │       ├── table.jsx
    │       ├── tabs.jsx
    │       ├── textarea.jsx
    │       ├── toast.jsx
    │       ├── toaster.jsx
    │       ├── toggle-group.jsx
    │       ├── toggle.jsx
    │       ├── tooltip.jsx
    │       └── use-toast.js
    │   └── theme-toggle.jsx
    ├── context/
    │   └── theme-context.jsx
    ├── lib/
    │   └── utils.js
    ├── pages/
    │   ├── home.jsx
    │   └── App.jsx
    ├── index.css
    ├── main.jsx
    ├── .eslintrc.cjs
    ├── .gitignore
    ├── components.json
    ├── index.html
    ├── jsconfig.json
    ├── package-lock.json
    ├── package.json
    ├── postcss.config.js
    ├── README.md
    ├── tailwind.config.js
    └── vite.config.js


```

## Conclusion

And there you have it, folks! A complete setup for a front-end project that's as easy as baking a cake — maybe even easier if you're not good at baking. 🍰

Happy Coding! 🎉

This document aims to provide a clear, enjoyable, and informative guide to understanding and navigating your script for setting up a front-end project.

## License

MIT License
