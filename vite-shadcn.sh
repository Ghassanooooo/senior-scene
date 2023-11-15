#!/bin/bash

npm create vite@latest ./ -- --template react

npm install


npm install -D tailwindcss postcss autoprefixer


npx tailwindcss init -p

# This script appends Tailwind directives to App.css

echo "@tailwind base;" >> ./src/App.css
echo "@tailwind components;" >> ./src/App.css
echo "@tailwind utilities;" >> ./src/App.css

# This script updates jsconfig.json with specified compiler options



JSCONFIG_PATH="./jsconfig.json"
if [ ! -f "$JSCONFIG_PATH" ]; then
    echo '{"compilerOptions": {}}' > "$JSCONFIG_PATH"
fi

# Read the current jsconfig.json, update it, and write back to the file
jq '.compilerOptions |= . + {"baseUrl": ".", "paths": {"@/*": ["src/*"]}}' "$JSCONFIG_PATH" > temp.json && mv temp.json "$JSCONFIG_PATH"


cat <<EOF > vite.config.js
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import path from "path";

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  resolve: {
    // eslint-disable-next-line no-undef
    alias: [{ find: "@", replacement: path.resolve(__dirname, "/src") }],
  },
});
EOF

# (so you can import "path" without error)
npm i -D @types/node


npx shadcn-ui@latest init


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

