#!/usr/bin/env node

// /*
// /$$$$$$$$ /$$$$$$ / $$$$$$$ / $$$$$$$$ / $$$$$$ / $$ / $$ / $$$$$$ / $$$$$$$ / $$
// | $$_____/|_  $$_/| $$__  $$| $$_____/ /$$__  $$| $$  | $$|_  $$_/| $$__  $$|__/
// | $$        | $$  | $$  \ $$| $$      | $$  \__/| $$  | $$  | $$  | $$  \ $$ /$$  /$$$$$$
// | $$$$$     | $$  | $$$$$$$/| $$$$$   |  $$$$$$ | $$$$$$$$  | $$  | $$$$$$$/| $$ /$$__  $$
// | $$__/     | $$  | $$__  $$| $$__/    \____  $$| $$__  $$  | $$  | $$____/ | $$| $$  \ $$
// | $$        | $$  | $$  \ $$| $$       /$$  \ $$| $$  | $$  | $$  | $$      | $$| $$  | $$
// | $$       /$$$$$$| $$  | $$| $$$$$$$$|  $$$$$$/| $$  | $$ /$$$$$$| $$ /$$  | $$|  $$$$$$/
// |__/      |______/|__/  |__/|________/ \______/ |__/  |__/|______/|__/|__/  |__/ \______/
// */

import chalk from "chalk";
import inquirer from "inquirer";
import gradient from "gradient-string";
import chalkAnimation from "chalk-animation";
import figlet from "figlet";
import { createSpinner } from "nanospinner";
import { execa } from "execa";
import path from "path";

import { promises as fs } from "fs";

import { fileURLToPath } from "url";
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

interface Program {
  projectType: "Fullstack" | "Frontend" | "Backend";
  projectStack: "React + vite";
  projectPath: string;
}

const program: Program = {
  projectType: "Frontend",
  projectStack: "React + vite",
  projectPath: "./my-project",
};

async function appendToFile(filePath: string, content: string) {
  try {
    await fs.appendFile(filePath, content);
  } catch (error) {
    console.error("Error appending to file:", error);
  }
}

async function downloadTemplate({ projectPath }: any) {
  try {
    const repoUrl = "https://github.com/vitejs/vite.git";
    const templatePath = "packages/create-vite/template-react";
    const destinationPath = path.join(__dirname, projectPath);

    // Clone the repository
    await execa("git", ["clone", repoUrl, "vite-temp"]);

    // Copy the template to the destination
    await execa("cp", ["-R", `vite-temp/${templatePath}/.`, destinationPath]);
    // Remove the temporary cloned repository
    await execa("rm", ["-rf", "vite-temp"]);
    await execa("mv", ["_gitignore", ".gitignore"], { cwd: destinationPath });
    await execa("npm", ["install"], {
      cwd: destinationPath,
    });
    await execa("npm", ["install", "tailwindcss", "postcss", "autoprefixer"], {
      cwd: destinationPath,
    });

    // await execa("npx", ["tailwindcss", "init", "-p"], { cwd: destinationPath });

    await execa("rm", ["-rf", "src"], { cwd: destinationPath });

    // // Create src

    await execa("mkdir", ["src"], { cwd: destinationPath });
    await execa("touch", ["index.css"], { cwd: destinationPath + "/src" });
    await appendToFile(
      destinationPath + "/src/index.css",
      "@tailwind base;\n@tailwind components;\n@tailwind utilities;\n"
    );

    console.log("Template downloaded successfully");
  } catch (error) {
    console.error("Error:", error);
  }
}

const sleep = (ms = 2000) => new Promise((r) => setTimeout(r, ms));

async function welcome() {
  const rainbowTitle = chalkAnimation.rainbow(
    "Senior Scene Wants To Setup Your Project? \n"
  );

  await sleep();
  rainbowTitle.stop();
}

async function questionPath() {
  const answers = await inquirer.prompt({
    name: "project_path",
    type: "input",
    message: "What is your project path?",
    default() {
      return program.projectPath;
    },
  });

  program.projectPath = answers.project_path;
}

// function winner() {
//   console.clear();
//   figlet(`Congrats , ${projectPath} !\n $ 1 , 0 0 0 , 0 0 0`, (err, data) => {
//     console.log(gradient.pastel.multiline(data) + "\n");

//     console.log(
//       chalk.green(
//         `Programming isn't about what you know; it's about making the command line look cool`
//       )
//     );
//     process.exit(0);
//   });
// }

async function spinnerEffect(text: string) {
  const spinner = createSpinner("Checking answer...").start();

  await sleep();
  spinner.success({
    text,
  });
}

async function questionAppType() {
  const answers = await inquirer.prompt({
    name: "question",
    type: "list",
    message: "What type of project you going to build?\n",
    choices: ["Fullstack", "Frontend", "Backend"],
  });
  //spinnerEffect(answers.question);
  program.projectType = answers.question;
}

async function questionFrontend() {
  const answers = await inquirer.prompt({
    name: "question",
    type: "list",
    message: "What is your frontend tech?\n",
    choices: ["React + vite"],
  });
  // spinnerEffect(answers.question);
  program.projectStack = answers.question;
}

console.clear();
async function PromiseAll() {
  // await welcome();
  // await questionPath();
  // await questionAppType();
  // await questionFrontend();

  //winner();
  console.log("Program ==> ", program);
  downloadTemplate(program);
  // try {
  //   const { stdout } = await execa("ls", ["-al"]);
  //   console.log(stdout);
  // } catch (error) {
  //   console.error("Error executing command:", error);
  // }
  //=> 'unicorns'
}

PromiseAll();
