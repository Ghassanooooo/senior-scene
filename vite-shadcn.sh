#!/bin/bash

# npm create vite@latest ./ -- --template react

# npm install


# npm install -D tailwindcss postcss autoprefixer


# npx tailwindcss init -p

# # This script appends Tailwind directives to App.css

# echo "@tailwind base;" >> ./src/App.css
# echo "@tailwind components;" >> ./src/App.css
# echo "@tailwind utilities;" >> ./src/App.css

# # This script updates jsconfig.json with specified compiler options



# JSCONFIG_PATH="./jsconfig.json"
# if [ ! -f "$JSCONFIG_PATH" ]; then
#     echo '{"compilerOptions": {}}' > "$JSCONFIG_PATH"
# fi

# # Read the current jsconfig.json, update it, and write back to the file
# jq '.compilerOptions |= . + {"baseUrl": ".", "paths": {"@/*": ["src/*"]}}' "$JSCONFIG_PATH" > temp.json && mv temp.json "$JSCONFIG_PATH"


# cat <<EOF > vite.config.js
# import { defineConfig } from "vite";
# import react from "@vitejs/plugin-react";
# import path from "path";

# // https://vitejs.dev/config/
# export default defineConfig({
#   plugins: [react()],
#   resolve: {
#     // eslint-disable-next-line no-undef
#     alias: [{ find: "@", replacement: path.resolve(__dirname, "/src") }],
#   },
# });
# EOF

# # (so you can import "path" without error)
# npm i -D @types/node


# npx shadcn-ui@latest init


# npx shadcn-ui@latest add accordion


# npx shadcn-ui@latest add alert


# npx shadcn-ui@latest add alert-dialog


# npx shadcn-ui@latest add aspect-ratio



# npx shadcn-ui@latest add avatar


# npx shadcn-ui@latest add badge


# npx shadcn-ui@latest add button



# npx shadcn-ui@latest add calendar



# npx shadcn-ui@latest add card


# npx shadcn-ui@latest add checkbox



# npx shadcn-ui@latest add collapsible




# npx shadcn-ui@latest add command


# npx shadcn-ui@latest add context-menu



# npm install @tanstack/react-table



# npx shadcn-ui@latest add dialog



# npx shadcn-ui@latest add dropdown-menu



# npx shadcn-ui@latest add form



# npx shadcn-ui@latest add hover-card

# npx shadcn-ui@latest add input



# npx shadcn-ui@latest add label


# npx shadcn-ui@latest add menubar


# npx shadcn-ui@latest add navigation-menu


# npx shadcn-ui@latest add popover


# npx shadcn-ui@latest add progress


# npx shadcn-ui@latest add radio-group


# npx shadcn-ui@latest add scroll-area


# npx shadcn-ui@latest add select


# npx shadcn-ui@latest add separator


# npx shadcn-ui@latest add sheet


# npx shadcn-ui@latest add skeleton


# npx shadcn-ui@latest add slider


# npx shadcn-ui@latest add switch


# npx shadcn-ui@latest add table


# npx shadcn-ui@latest add tabs


# npx shadcn-ui@latest add textarea


# npx shadcn-ui@latest add toast


# npx shadcn-ui@latest add toggle



# npx shadcn-ui@latest add toggle-group


# npx shadcn-ui@latest add tooltip

# npm install react-router-dom


MAIN_PATH="./src/main.jsx"

if [ ! -d "$MAIN_PATH" ]; then
    touch "$MAIN_PATH"

fi


cat <<EOF > "$MAIN_PATH"

import ReactDOM from "react-dom/client";
import App from "./App.jsx";

import "./index.css";
import { BrowserRouter } from "react-router-dom";

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <BrowserRouter>
      <App />
    </BrowserRouter>
  </React.StrictMode>
);

EOF



APP_PATH="./src/App.jsx"

if [ ! -d "$APP_PATH" ]; then
    touch "$APP_PATH"

fi


cat <<EOF > "$APP_PATH"

import { Route, Routes } from "react-router-dom";
import Navbar from "./components/navbar";
import Home from "./pages/home";
import Footer from "./components/footer";

function App() {
  return (
    <>
      <Navbar />
      <div className="min-h-[92vh]">
        <Routes>
          <Route path="/" element={<Home />} />
        </Routes>
      </div>
      <Footer />
    </>
  );
}

export default App;

EOF



PAGES_PATH="./src/pages"

if [ ! -d "$PAGES_PATH" ]; then
    mkdir "$PAGES_PATH"

fi

cat <<EOF > "$PAGES_PATH/home.jsx"

function Home() {

  return (
    <div>
     Home Page
    </div>
  )
}
export default Home

EOF


CONTEXT_PATH="./src/context"

if [ ! -d "$CONTEXT_PATH" ]; then
    mkdir "$CONTEXT_PATH"
fi


NAVBAR_PATH="./src/components/navbar.jsx"

if [ ! -d "$NAVBAR_PATH" ]; then
       touch "$NAVBAR_PATH"
fi



cat <<EOF > "$NAVBAR_PATH"

import { Link } from "react-router-dom";

const Navbar = () => {
  return (
    <nav className="border-b h-[4vh]">
      <ul className="flex justify-center gap-4">
        <li className="hover:text-blue-500 cursor-pointer">
          <Link to="/">home</Link>
        </li>
      </ul>
    </nav>
  );
};

export default Navbar;

EOF


FOOTER_PATH="./src/components/footer.jsx"

if [ ! -d "$FOOTER_PATH" ]; then
       touch "$FOOTER_PATH"
fi



cat <<EOF > "$FOOTER_PATH"

export default function Footer() {
  return <footer className="h-[4vh] border-t bg-violet-800">footer</footer>;
}

EOF