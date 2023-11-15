#!/bin/bash

# Prompt the user for a project directory
echo "Enter your project directory (e.g., './', 'my project'):"
read project_dir

# Replace spaces with slugs and trim input
processed_dir=$(echo $project_dir | sed 's/ /-/g' | xargs)

# Check if the directory is './', otherwise create a new directory
if [ "$processed_dir" != "./" ]; then
    mkdir -p "$processed_dir"
    cd "$processed_dir"
fi

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

npm install lucide-react

npx shadcn-ui@latest init


npx shadcn-ui@latest add accordion


npx shadcn-ui@latest add alert


npx shadcn-ui@latest add alert-dialog


npx shadcn-ui@latest add aspect-ratio



npx shadcn-ui@latest add avatar


npx shadcn-ui@latest add badge


npx shadcn-ui@latest add button



npx shadcn-ui@latest add calendar



npx shadcn-ui@latest add card


npx shadcn-ui@latest add checkbox



npx shadcn-ui@latest add collapsible




npx shadcn-ui@latest add command


npx shadcn-ui@latest add context-menu



npm install @tanstack/react-table



npx shadcn-ui@latest add dialog



npx shadcn-ui@latest add dropdown-menu



npx shadcn-ui@latest add form



npx shadcn-ui@latest add hover-card

npx shadcn-ui@latest add input



npx shadcn-ui@latest add label


npx shadcn-ui@latest add menubar


npx shadcn-ui@latest add navigation-menu


npx shadcn-ui@latest add popover


npx shadcn-ui@latest add progress


npx shadcn-ui@latest add radio-group


npx shadcn-ui@latest add scroll-area


npx shadcn-ui@latest add select


npx shadcn-ui@latest add separator


npx shadcn-ui@latest add sheet


npx shadcn-ui@latest add skeleton


npx shadcn-ui@latest add slider


npx shadcn-ui@latest add switch


npx shadcn-ui@latest add table


npx shadcn-ui@latest add tabs


npx shadcn-ui@latest add textarea


npx shadcn-ui@latest add toast


npx shadcn-ui@latest add toggle



npx shadcn-ui@latest add toggle-group


npx shadcn-ui@latest add tooltip

npm install react-router-dom


MAIN_PATH="./src/main.jsx"

if [ ! -d "$MAIN_PATH" ]; then
    touch "$MAIN_PATH"

fi


cat <<EOF > "$MAIN_PATH"

import ReactDOM from "react-dom/client";
import App from "./App.jsx";
import { BrowserRouter } from "react-router-dom";
import React from "react";

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
import Navbar from "./components/examples/navbar";
import Home from "./pages/home";
import Footer from "./components/examples/footer";
import "./App.css";
import { ThemeProvider } from "./context/theme-context";
function App() {
  return (
    <ThemeProvider>
      <Navbar />
      <div className="min-h-[92vh]">
        <Routes>
          <Route path="/" element={<Home />} />
        </Routes>
      </div>
      <Footer />
    </ThemeProvider>
  );
}

export default App;


EOF



PAGES_PATH="./src/pages"

if [ ! -d "$PAGES_PATH" ]; then
    mkdir "$PAGES_PATH"

fi

cat <<EOF > "$PAGES_PATH/home.jsx"

import { AccordionDemo } from "@/components/examples/accordion";
import { AlertDemo } from "@/components/examples/alert";
import { AlertDialogDemo } from "@/components/examples/alert-dialog";
import { AvatarDemo } from "@/components/examples/avatar";
import { ButtonDemo } from "@/components/examples/button";
import { CalendarDemo } from "@/components/examples/calendar";
import { CardWithForm } from "@/components/examples/card";
import { CollapsibleDemo } from "@/components/examples/collapsible";
import { ComboboxDemo } from "@/components/examples/combobox";
import { CommandDemo } from "@/components/examples/command";
import { ContextMenuDemo } from "@/components/examples/context-menu";
import { DataTableDemo } from "@/components/examples/data-table";
import { DatePickerDemo } from "@/components/examples/date-picker";
import { DialogDemo } from "@/components/examples/dialog";
import { DropdownMenuDemo } from "@/components/examples/dropdown-menu";

function Home() {
  return (
    <div className="grid grid-cols-4 gap-4 p-4">
      <AlertDemo />
      <AccordionDemo />
      <AlertDialogDemo />
      <AvatarDemo />
      <ButtonDemo />
      <CalendarDemo />
      <CardWithForm />
      <CollapsibleDemo />
      <ComboboxDemo />
      <CommandDemo />
      <ContextMenuDemo />
      <DataTableDemo />
      <DatePickerDemo />
      <DialogDemo />
      <DropdownMenuDemo />
    </div>
  );
}
export default Home;


EOF


CONTEXT_PATH="./src/context"

if [ ! -d "$CONTEXT_PATH" ]; then
    mkdir "$CONTEXT_PATH"
    touch "$CONTEXT_PATH/theme-context.jsx"
fi



cat <<EOF > "$CONTEXT_PATH/theme-context.jsx"

import { createContext, useContext, useEffect, useState } from "react";

const initialState = {
  theme: "system",
  setTheme: () => null,
};

const ThemeProviderContext = createContext(initialState);

export function ThemeProvider(componentsProps) {
  const {
    children,
    defaultTheme = "system",
    storageKey = "vite-ui-theme",
    ...props
  } = componentsProps;
  const [theme, setTheme] = useState(
    () => localStorage.getItem(storageKey) || defaultTheme
  );

  useEffect(() => {
    const root = window.document.documentElement;

    root.classList.remove("light", "dark");

    if (theme === "system") {
      const systemTheme = window.matchMedia("(prefers-color-scheme: dark)")
        .matches
        ? "dark"
        : "light";

      root.classList.add(systemTheme);
      return;
    }

    root.classList.add(theme);
  }, [theme]);

  const value = {
    theme,
    setTheme: (theme) => {
      localStorage.setItem(storageKey, theme);
      setTheme(theme);
    },
  };

  return (
    <ThemeProviderContext.Provider {...props} value={value}>
      {children}
    </ThemeProviderContext.Provider>
  );
}

export const useTheme = () => {
  const context = useContext(ThemeProviderContext);

  if (context === undefined)
    throw new Error("useTheme must be used within a ThemeProvider");

  return context;
};


EOF


EXAMPLES_PATH="./src/components/examples"

if [ ! -d "$EXAMPLES_PATH" ]; then
       mkdir "$EXAMPLES_PATH"
fi



NAVBAR_PATH="./src/components/examples/navbar.jsx"

if [ ! -d "$NAVBAR_PATH" ]; then
       touch "$NAVBAR_PATH"
fi



cat <<EOF > "$NAVBAR_PATH"

import { Link } from "react-router-dom";

import { cn } from "@/lib/utils";
import { buttonVariants } from "@/components/ui/button";
import { ThemeToggle } from "@/components/theme-toggle";

const Navbar = () => {
  return (
    <nav className="border-b h-[6vh] flex gap-4 justify-between px-4 items-center py-4">
      <ul className="flex justify-center gap-4">
        <li className="hover:text-blue-500 cursor-pointer">
          <Link className={cn(buttonVariants({ variant: "link" }))} to="/">
            home
          </Link>
        </li>
      </ul>

      <ul className="flex justify-center gap-4">
        <li className="hover:text-blue-500 cursor-pointer">
          <ThemeToggle />
        </li>
      </ul>
    </nav>
  );
};

export default Navbar;



EOF


FOOTER_PATH="./src/components/examples/footer.jsx"

if [ ! -d "$FOOTER_PATH" ]; then
       touch "$FOOTER_PATH"
fi



cat <<EOF > "$FOOTER_PATH"

export default function Footer() {
  return <footer className="h-[4vh] border-t bg-violet-800">footer</footer>;
}

EOF


DropdownMenu_PATH="./src/components/examples/dropdown-menu.jsx"

if [ ! -d "$DropdownMenu_PATH" ]; then
       touch "$DropdownMenu_PATH"
fi



cat <<EOF > "$DropdownMenu_PATH"

import {
  Cloud,
  CreditCard,
  Github,
  Keyboard,
  LifeBuoy,
  LogOut,
  Mail,
  MessageSquare,
  Plus,
  PlusCircle,
  Settings,
  User,
  UserPlus,
  Users,
} from "lucide-react";

import { Button } from "@/components/ui/button";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuGroup,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuPortal,
  DropdownMenuSeparator,
  DropdownMenuShortcut,
  DropdownMenuSub,
  DropdownMenuSubContent,
  DropdownMenuSubTrigger,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";

export function DropdownMenuDemo() {
  return (
    <DropdownMenu>
      <DropdownMenuTrigger asChild>
        <Button variant="outline">Open</Button>
      </DropdownMenuTrigger>
      <DropdownMenuContent className="w-56">
        <DropdownMenuLabel>My Account</DropdownMenuLabel>
        <DropdownMenuSeparator />
        <DropdownMenuGroup>
          <DropdownMenuItem>
            <User className="mr-2 h-4 w-4" />
            <span>Profile</span>
            <DropdownMenuShortcut>⇧⌘P</DropdownMenuShortcut>
          </DropdownMenuItem>
          <DropdownMenuItem>
            <CreditCard className="mr-2 h-4 w-4" />
            <span>Billing</span>
            <DropdownMenuShortcut>⌘B</DropdownMenuShortcut>
          </DropdownMenuItem>
          <DropdownMenuItem>
            <Settings className="mr-2 h-4 w-4" />
            <span>Settings</span>
            <DropdownMenuShortcut>⌘S</DropdownMenuShortcut>
          </DropdownMenuItem>
          <DropdownMenuItem>
            <Keyboard className="mr-2 h-4 w-4" />
            <span>Keyboard shortcuts</span>
            <DropdownMenuShortcut>⌘K</DropdownMenuShortcut>
          </DropdownMenuItem>
        </DropdownMenuGroup>
        <DropdownMenuSeparator />
        <DropdownMenuGroup>
          <DropdownMenuItem>
            <Users className="mr-2 h-4 w-4" />
            <span>Team</span>
          </DropdownMenuItem>
          <DropdownMenuSub>
            <DropdownMenuSubTrigger>
              <UserPlus className="mr-2 h-4 w-4" />
              <span>Invite users</span>
            </DropdownMenuSubTrigger>
            <DropdownMenuPortal>
              <DropdownMenuSubContent>
                <DropdownMenuItem>
                  <Mail className="mr-2 h-4 w-4" />
                  <span>Email</span>
                </DropdownMenuItem>
                <DropdownMenuItem>
                  <MessageSquare className="mr-2 h-4 w-4" />
                  <span>Message</span>
                </DropdownMenuItem>
                <DropdownMenuSeparator />
                <DropdownMenuItem>
                  <PlusCircle className="mr-2 h-4 w-4" />
                  <span>More...</span>
                </DropdownMenuItem>
              </DropdownMenuSubContent>
            </DropdownMenuPortal>
          </DropdownMenuSub>
          <DropdownMenuItem>
            <Plus className="mr-2 h-4 w-4" />
            <span>New Team</span>
            <DropdownMenuShortcut>⌘+T</DropdownMenuShortcut>
          </DropdownMenuItem>
        </DropdownMenuGroup>
        <DropdownMenuSeparator />
        <DropdownMenuItem>
          <Github className="mr-2 h-4 w-4" />
          <span>GitHub</span>
        </DropdownMenuItem>
        <DropdownMenuItem>
          <LifeBuoy className="mr-2 h-4 w-4" />
          <span>Support</span>
        </DropdownMenuItem>
        <DropdownMenuItem disabled>
          <Cloud className="mr-2 h-4 w-4" />
          <span>API</span>
        </DropdownMenuItem>
        <DropdownMenuSeparator />
        <DropdownMenuItem>
          <LogOut className="mr-2 h-4 w-4" />
          <span>Log out</span>
          <DropdownMenuShortcut>⇧⌘Q</DropdownMenuShortcut>
        </DropdownMenuItem>
      </DropdownMenuContent>
    </DropdownMenu>
  );
}


EOF


Dialog_PATH="./src/components/examples/dialog.jsx"

if [ ! -d "$Dialog_PATH" ]; then
       touch "$Dialog_PATH"
fi



cat <<EOF > "$Dialog_PATH"

import { Button } from "@/components/ui/button";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";

export function DialogDemo() {
  return (
    <Dialog>
      <DialogTrigger asChild>
        <Button variant="outline">Edit Profile</Button>
      </DialogTrigger>
      <DialogContent className="sm:max-w-[425px]">
        <DialogHeader>
          <DialogTitle>Edit profile</DialogTitle>
          <DialogDescription>
            Make changes to your profile here. Click save when youre done.
          </DialogDescription>
        </DialogHeader>
        <div className="grid gap-4 py-4">
          <div className="grid grid-cols-4 items-center gap-4">
            <Label htmlFor="name" className="text-right">
              Name
            </Label>
            <Input
              id="name"
              defaultValue="Pedro Duarte"
              className="col-span-3"
            />
          </div>
          <div className="grid grid-cols-4 items-center gap-4">
            <Label htmlFor="username" className="text-right">
              Username
            </Label>
            <Input
              id="username"
              defaultValue="@peduarte"
              className="col-span-3"
            />
          </div>
        </div>
        <DialogFooter>
          <Button type="submit">Save changes</Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
}


EOF


DatePicker_PATH="./src/components/examples/date-picker.jsx"

if [ ! -d "$DatePicker_PATH" ]; then
       touch "$DatePicker_PATH"
fi



cat <<EOF > "$DatePicker_PATH"

import * as React from "react";
import { format } from "date-fns";
import { Calendar as CalendarIcon } from "lucide-react";

import { cn } from "@/lib/utils";
import { Button } from "@/components/ui/button";
import { Calendar } from "@/components/ui/calendar";
import {
  Popover,
  PopoverContent,
  PopoverTrigger,
} from "@/components/ui/popover";

export function DatePickerDemo() {
  const [date, setDate] = React.useState();

  return (
    <Popover>
      <PopoverTrigger asChild>
        <Button
          variant={"outline"}
          className={cn(
            "w-[280px] justify-start text-left font-normal",
            !date && "text-muted-foreground"
          )}
        >
          <CalendarIcon className="mr-2 h-4 w-4" />
          {date ? format(date, "PPP") : <span>Pick a date</span>}
        </Button>
      </PopoverTrigger>
      <PopoverContent className="w-auto p-0">
        <Calendar
          mode="single"
          selected={date}
          onSelect={setDate}
          initialFocus
        />
      </PopoverContent>
    </Popover>
  );
}


EOF


DataTable_PATH="./src/components/examples/data-table.jsx"

if [ ! -d "$DataTable_PATH" ]; then
       touch "$DataTable_PATH"
fi



cat <<EOF > "$DataTable_PATH"

import * as React from "react";
import {
  flexRender,
  getCoreRowModel,
  getFilteredRowModel,
  getPaginationRowModel,
  getSortedRowModel,
  useReactTable,
} from "@tanstack/react-table";
import { ArrowUpDown, ChevronDown, MoreHorizontal } from "lucide-react";

import { Button } from "@/components/ui/button";
import { Checkbox } from "@/components/ui/checkbox";
import {
  DropdownMenu,
  DropdownMenuCheckboxItem,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { Input } from "@/components/ui/input";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";

const data = [
  {
    id: "m5gr84i9",
    amount: 316,
    status: "success",
    email: "ken99@yahoo.com",
  },
  {
    id: "3u1reuv4",
    amount: 242,
    status: "success",
    email: "Abe45@gmail.com",
  },
  {
    id: "derv1ws0",
    amount: 837,
    status: "processing",
    email: "Monserrat44@gmail.com",
  },
  {
    id: "5kma53ae",
    amount: 874,
    status: "success",
    email: "Silas22@gmail.com",
  },
  {
    id: "bhqecj4p",
    amount: 721,
    status: "failed",
    email: "carmella@hotmail.com",
  },
];

export const columns = [
  {
    id: "select",
    header: ({ table }) => (
      <Checkbox
        checked={table.getIsAllPageRowsSelected()}
        onCheckedChange={(value) => table.toggleAllPageRowsSelected(!!value)}
        aria-label="Select all"
      />
    ),
    cell: ({ row }) => (
      <Checkbox
        checked={row.getIsSelected()}
        onCheckedChange={(value) => row.toggleSelected(!!value)}
        aria-label="Select row"
      />
    ),
    enableSorting: false,
    enableHiding: false,
  },
  {
    accessorKey: "status",
    header: "Status",
    cell: ({ row }) => (
      <div className="capitalize">{row.getValue("status")}</div>
    ),
  },
  {
    accessorKey: "email",
    header: ({ column }) => {
      return (
        <Button
          variant="ghost"
          onClick={() => column.toggleSorting(column.getIsSorted() === "asc")}
        >
          Email
          <ArrowUpDown className="ml-2 h-4 w-4" />
        </Button>
      );
    },
    cell: ({ row }) => <div className="lowercase">{row.getValue("email")}</div>,
  },
  {
    accessorKey: "amount",
    header: () => <div className="text-right">Amount</div>,
    cell: ({ row }) => {
      const amount = parseFloat(row.getValue("amount"));

      // Format the amount as a dollar amount
      const formatted = new Intl.NumberFormat("en-US", {
        style: "currency",
        currency: "USD",
      }).format(amount);

      return <div className="text-right font-medium">{formatted}</div>;
    },
  },
  {
    id: "actions",
    enableHiding: false,
    cell: ({ row }) => {
      const payment = row.original;

      return (
        <DropdownMenu>
          <DropdownMenuTrigger asChild>
            <Button variant="ghost" className="h-8 w-8 p-0">
              <span className="sr-only">Open menu</span>
              <MoreHorizontal className="h-4 w-4" />
            </Button>
          </DropdownMenuTrigger>
          <DropdownMenuContent align="end">
            <DropdownMenuLabel>Actions</DropdownMenuLabel>
            <DropdownMenuItem
              onClick={() => navigator.clipboard.writeText(payment.id)}
            >
              Copy payment ID
            </DropdownMenuItem>
            <DropdownMenuSeparator />
            <DropdownMenuItem>View customer</DropdownMenuItem>
            <DropdownMenuItem>View payment details</DropdownMenuItem>
          </DropdownMenuContent>
        </DropdownMenu>
      );
    },
  },
];

export function DataTableDemo() {
  const [sorting, setSorting] = React.useState([]);
  const [columnFilters, setColumnFilters] = React.useState([]);
  const [columnVisibility, setColumnVisibility] = React.useState({});
  const [rowSelection, setRowSelection] = React.useState({});

  const table = useReactTable({
    data,
    columns,
    onSortingChange: setSorting,
    onColumnFiltersChange: setColumnFilters,
    getCoreRowModel: getCoreRowModel(),
    getPaginationRowModel: getPaginationRowModel(),
    getSortedRowModel: getSortedRowModel(),
    getFilteredRowModel: getFilteredRowModel(),
    onColumnVisibilityChange: setColumnVisibility,
    onRowSelectionChange: setRowSelection,
    state: {
      sorting,
      columnFilters,
      columnVisibility,
      rowSelection,
    },
  });

  return (
    <div className="w-full">
      <div className="flex items-center py-4">
        <Input
          placeholder="Filter emails..."
          value={table.getColumn("email")?.getFilterValue() ?? ""}
          onChange={(event) =>
            table.getColumn("email")?.setFilterValue(event.target.value)
          }
          className="max-w-sm"
        />
        <DropdownMenu>
          <DropdownMenuTrigger asChild>
            <Button variant="outline" className="ml-auto">
              Columns <ChevronDown className="ml-2 h-4 w-4" />
            </Button>
          </DropdownMenuTrigger>
          <DropdownMenuContent align="end">
            {table
              .getAllColumns()
              .filter((column) => column.getCanHide())
              .map((column) => {
                return (
                  <DropdownMenuCheckboxItem
                    key={column.id}
                    className="capitalize"
                    checked={column.getIsVisible()}
                    onCheckedChange={(value) =>
                      column.toggleVisibility(!!value)
                    }
                  >
                    {column.id}
                  </DropdownMenuCheckboxItem>
                );
              })}
          </DropdownMenuContent>
        </DropdownMenu>
      </div>
      <div className="rounded-md border">
        <Table>
          <TableHeader>
            {table.getHeaderGroups().map((headerGroup) => (
              <TableRow key={headerGroup.id}>
                {headerGroup.headers.map((header) => {
                  return (
                    <TableHead key={header.id}>
                      {header.isPlaceholder
                        ? null
                        : flexRender(
                            header.column.columnDef.header,
                            header.getContext()
                          )}
                    </TableHead>
                  );
                })}
              </TableRow>
            ))}
          </TableHeader>
          <TableBody>
            {table.getRowModel().rows?.length ? (
              table.getRowModel().rows.map((row) => (
                <TableRow
                  key={row.id}
                  data-state={row.getIsSelected() && "selected"}
                >
                  {row.getVisibleCells().map((cell) => (
                    <TableCell key={cell.id}>
                      {flexRender(
                        cell.column.columnDef.cell,
                        cell.getContext()
                      )}
                    </TableCell>
                  ))}
                </TableRow>
              ))
            ) : (
              <TableRow>
                <TableCell
                  colSpan={columns.length}
                  className="h-24 text-center"
                >
                  No results.
                </TableCell>
              </TableRow>
            )}
          </TableBody>
        </Table>
      </div>
      <div className="flex items-center justify-end space-x-2 py-4">
        <div className="flex-1 text-sm text-muted-foreground">
          {table.getFilteredSelectedRowModel().rows.length} of{" "}
          {table.getFilteredRowModel().rows.length} row(s) selected.
        </div>
        <div className="space-x-2">
          <Button
            variant="outline"
            size="sm"
            onClick={() => table.previousPage()}
            disabled={!table.getCanPreviousPage()}
          >
            Previous
          </Button>
          <Button
            variant="outline"
            size="sm"
            onClick={() => table.nextPage()}
            disabled={!table.getCanNextPage()}
          >
            Next
          </Button>
        </div>
      </div>
    </div>
  );
}


EOF


ContextMenu_PATH="./src/components/examples/context-menu.jsx"

if [ ! -d "$ContextMenu_PATH" ]; then
       touch "$ContextMenu_PATH"
fi



cat <<EOF > "$ContextMenu_PATH"

import {
  ContextMenu,
  ContextMenuCheckboxItem,
  ContextMenuContent,
  ContextMenuItem,
  ContextMenuLabel,
  ContextMenuRadioGroup,
  ContextMenuRadioItem,
  ContextMenuSeparator,
  ContextMenuShortcut,
  ContextMenuSub,
  ContextMenuSubContent,
  ContextMenuSubTrigger,
  ContextMenuTrigger,
} from "@/components/ui/context-menu";

export function ContextMenuDemo() {
  return (
    <ContextMenu>
      <ContextMenuTrigger className="flex h-[150px] w-[300px] items-center justify-center rounded-md border border-dashed text-sm">
        Right click here
      </ContextMenuTrigger>
      <ContextMenuContent className="w-64">
        <ContextMenuItem inset>
          Back
          <ContextMenuShortcut>⌘[</ContextMenuShortcut>
        </ContextMenuItem>
        <ContextMenuItem inset disabled>
          Forward
          <ContextMenuShortcut>⌘]</ContextMenuShortcut>
        </ContextMenuItem>
        <ContextMenuItem inset>
          Reload
          <ContextMenuShortcut>⌘R</ContextMenuShortcut>
        </ContextMenuItem>
        <ContextMenuSub>
          <ContextMenuSubTrigger inset>More Tools</ContextMenuSubTrigger>
          <ContextMenuSubContent className="w-48">
            <ContextMenuItem>
              Save Page As...
              <ContextMenuShortcut>⇧⌘S</ContextMenuShortcut>
            </ContextMenuItem>
            <ContextMenuItem>Create Shortcut...</ContextMenuItem>
            <ContextMenuItem>Name Window...</ContextMenuItem>
            <ContextMenuSeparator />
            <ContextMenuItem>Developer Tools</ContextMenuItem>
          </ContextMenuSubContent>
        </ContextMenuSub>
        <ContextMenuSeparator />
        <ContextMenuCheckboxItem checked>
          Show Bookmarks Bar
          <ContextMenuShortcut>⌘⇧B</ContextMenuShortcut>
        </ContextMenuCheckboxItem>
        <ContextMenuCheckboxItem>Show Full URLs</ContextMenuCheckboxItem>
        <ContextMenuSeparator />
        <ContextMenuRadioGroup value="pedro">
          <ContextMenuLabel inset>People</ContextMenuLabel>
          <ContextMenuSeparator />
          <ContextMenuRadioItem value="pedro">
            Pedro Duarte
          </ContextMenuRadioItem>
          <ContextMenuRadioItem value="colm">Colm Tuite</ContextMenuRadioItem>
        </ContextMenuRadioGroup>
      </ContextMenuContent>
    </ContextMenu>
  );
}


EOF


Command_PATH="./src/components/examples/command.jsx"

if [ ! -d "$Command_PATH" ]; then
       touch "$Command_PATH"
fi



cat <<EOF > "$Command_PATH"

import {
  Calculator,
  Calendar,
  CreditCard,
  Settings,
  Smile,
  User,
} from "lucide-react";

import {
  Command,
  CommandEmpty,
  CommandGroup,
  CommandInput,
  CommandItem,
  CommandList,
  CommandSeparator,
  CommandShortcut,
} from "@/components/ui/command";

export function CommandDemo() {
  return (
    <Command className="rounded-lg border shadow-md">
      <CommandInput placeholder="Type a command or search..." />
      <CommandList>
        <CommandEmpty>No results found.</CommandEmpty>
        <CommandGroup heading="Suggestions">
          <CommandItem>
            <Calendar className="mr-2 h-4 w-4" />
            <span>Calendar</span>
          </CommandItem>
          <CommandItem>
            <Smile className="mr-2 h-4 w-4" />
            <span>Search Emoji</span>
          </CommandItem>
          <CommandItem>
            <Calculator className="mr-2 h-4 w-4" />
            <span>Calculator</span>
          </CommandItem>
        </CommandGroup>
        <CommandSeparator />
        <CommandGroup heading="Settings">
          <CommandItem>
            <User className="mr-2 h-4 w-4" />
            <span>Profile</span>
            <CommandShortcut>⌘P</CommandShortcut>
          </CommandItem>
          <CommandItem>
            <CreditCard className="mr-2 h-4 w-4" />
            <span>Billing</span>
            <CommandShortcut>⌘B</CommandShortcut>
          </CommandItem>
          <CommandItem>
            <Settings className="mr-2 h-4 w-4" />
            <span>Settings</span>
            <CommandShortcut>⌘S</CommandShortcut>
          </CommandItem>
        </CommandGroup>
      </CommandList>
    </Command>
  );
}


EOF




Combobox_PATH="./src/components/examples/combobox.jsx"

if [ ! -d "$Combobox_PATH" ]; then
       touch "$Combobox_PATH"
fi



cat <<EOF > "$Combobox_PATH"

"use client";

import * as React from "react";
import { Check, ChevronsUpDown } from "lucide-react";

import { cn } from "@/lib/utils";
import { Button } from "@/components/ui/button";
import {
  Command,
  CommandEmpty,
  CommandGroup,
  CommandInput,
  CommandItem,
} from "@/components/ui/command";
import {
  Popover,
  PopoverContent,
  PopoverTrigger,
} from "@/components/ui/popover";

const frameworks = [
  {
    value: "next.js",
    label: "Next.js",
  },
  {
    value: "sveltekit",
    label: "SvelteKit",
  },
  {
    value: "nuxt.js",
    label: "Nuxt.js",
  },
  {
    value: "remix",
    label: "Remix",
  },
  {
    value: "astro",
    label: "Astro",
  },
];

export function ComboboxDemo() {
  const [open, setOpen] = React.useState(false);
  const [value, setValue] = React.useState("");

  return (
    <Popover open={open} onOpenChange={setOpen}>
      <PopoverTrigger asChild>
        <Button
          variant="outline"
          role="combobox"
          aria-expanded={open}
          className="w-[200px] justify-between"
        >
          {value
            ? frameworks.find((framework) => framework.value === value)?.label
            : "Select framework..."}
          <ChevronsUpDown className="ml-2 h-4 w-4 shrink-0 opacity-50" />
        </Button>
      </PopoverTrigger>
      <PopoverContent className="w-[200px] p-0">
        <Command>
          <CommandInput placeholder="Search framework..." />
          <CommandEmpty>No framework found.</CommandEmpty>
          <CommandGroup>
            {frameworks.map((framework) => (
              <CommandItem
                key={framework.value}
                value={framework.value}
                onSelect={(currentValue) => {
                  setValue(currentValue === value ? "" : currentValue);
                  setOpen(false);
                }}
              >
                <Check
                  className={cn(
                    "mr-2 h-4 w-4",
                    value === framework.value ? "opacity-100" : "opacity-0"
                  )}
                />
                {framework.label}
              </CommandItem>
            ))}
          </CommandGroup>
        </Command>
      </PopoverContent>
    </Popover>
  );
}


EOF



Collapsible_PATH="./src/components/examples/collapsible.jsx"

if [ ! -d "$Collapsible_PATH" ]; then
       touch "$Collapsible_PATH"
fi



cat <<EOF > "$Collapsible_PATH"

import * as React from "react";
import { ChevronsUpDown } from "lucide-react";

import { Button } from "@/components/ui/button";
import {
  Collapsible,
  CollapsibleContent,
  CollapsibleTrigger,
} from "@/components/ui/collapsible";

export function CollapsibleDemo() {
  const [isOpen, setIsOpen] = React.useState(false);

  return (
    <Collapsible
      open={isOpen}
      onOpenChange={setIsOpen}
      className="w-[350px] space-y-2"
    >
      <div className="flex items-center justify-between space-x-4 px-4">
        <h4 className="text-sm font-semibold">
          @peduarte starred 3 repositories
        </h4>
        <CollapsibleTrigger asChild>
          <Button variant="ghost" size="sm" className="w-9 p-0">
            <ChevronsUpDown className="h-4 w-4" />
            <span className="sr-only">Toggle</span>
          </Button>
        </CollapsibleTrigger>
      </div>
      <div className="rounded-md border px-4 py-3 font-mono text-sm">
        @radix-ui/primitives
      </div>
      <CollapsibleContent className="space-y-2">
        <div className="rounded-md border px-4 py-3 font-mono text-sm">
          @radix-ui/colors
        </div>
        <div className="rounded-md border px-4 py-3 font-mono text-sm">
          @stitches/react
        </div>
      </CollapsibleContent>
    </Collapsible>
  );
}


EOF



Card_PATH="./src/components/examples/card.jsx"

if [ ! -d "$Card_PATH" ]; then
       touch "$Card_PATH"
fi



cat <<EOF > "$Card_PATH"

import { Button } from "@/components/ui/button";
import {
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";

export function CardWithForm() {
  return (
    <Card className="w-[350px]">
      <CardHeader>
        <CardTitle>Create project</CardTitle>
        <CardDescription>Deploy your new project in one-click.</CardDescription>
      </CardHeader>
      <CardContent>
        <form>
          <div className="grid w-full items-center gap-4">
            <div className="flex flex-col space-y-1.5">
              <Label htmlFor="name">Name</Label>
              <Input id="name" placeholder="Name of your project" />
            </div>
            <div className="flex flex-col space-y-1.5">
              <Label htmlFor="framework">Framework</Label>
              <Select>
                <SelectTrigger id="framework">
                  <SelectValue placeholder="Select" />
                </SelectTrigger>
                <SelectContent position="popper">
                  <SelectItem value="next">Next.js</SelectItem>
                  <SelectItem value="sveltekit">SvelteKit</SelectItem>
                  <SelectItem value="astro">Astro</SelectItem>
                  <SelectItem value="nuxt">Nuxt.js</SelectItem>
                </SelectContent>
              </Select>
            </div>
          </div>
        </form>
      </CardContent>
      <CardFooter className="flex justify-between">
        <Button variant="outline">Cancel</Button>
        <Button>Deploy</Button>
      </CardFooter>
    </Card>
  );
}


EOF



Calendar_PATH="./src/components/examples/calendar.jsx"

if [ ! -d "$Calendar_PATH" ]; then
       touch "$Calendar_PATH"
fi



cat <<EOF > "$Calendar_PATH"

import * as React from "react";

import { Calendar } from "@/components/ui/calendar";

export function CalendarDemo() {
  const [date, setDate] = React.useState(new Date());

  return (
    <Calendar
      mode="single"
      selected={date}
      onSelect={setDate}
      className="rounded-md border"
    />
  );
}


EOF


Button_PATH="./src/components/examples/button.jsx"

if [ ! -d "$Button_PATH" ]; then
       touch "$Button_PATH"
fi



cat <<EOF > "$Button_PATH"

import { Button } from "@/components/ui/button";

export function ButtonDemo() {
  return <Button>Button</Button>;
}


EOF


Avatar_PATH="./src/components/examples/avatar.jsx"

if [ ! -d "$Avatar_PATH" ]; then
       touch "$Avatar_PATH"
fi



cat <<EOF > "$Avatar_PATH"

import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";

export function AvatarDemo() {
  return (
    <Avatar>
      <AvatarImage src="https://github.com/shadcn.png" alt="@shadcn" />
      <AvatarFallback>CN</AvatarFallback>
    </Avatar>
  );
}


EOF




Alert_PATH="./src/components/examples/alert.jsx"

if [ ! -d "$Alert_PATH" ]; then
       touch "$Alert_PATH"
fi



cat <<EOF > "$Alert_PATH"

import { Terminal } from "lucide-react";

import { Alert, AlertDescription, AlertTitle } from "@/components/ui/alert";

export function AlertDemo() {
  return (
    <Alert>
      <Terminal className=" w-4" />
      <AlertTitle>Heads up!</AlertTitle>
      <AlertDescription>
        You can add components to your app using the cli.
      </AlertDescription>
    </Alert>
  );
}


EOF



AlertDialog_PATH="./src/components/examples/alert-dialog.jsx"

if [ ! -d "$AlertDialog_PATH" ]; then
       touch "$AlertDialog_PATH"
fi



cat <<EOF > "$AlertDialog_PATH"

import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
  AlertDialogTrigger,
} from "@/components/ui/alert-dialog";
import { Button } from "@/components/ui/button";

export function AlertDialogDemo() {
  return (
    <AlertDialog>
      <AlertDialogTrigger asChild>
        <Button variant="outline">Show Dialog</Button>
      </AlertDialogTrigger>
      <AlertDialogContent>
        <AlertDialogHeader>
          <AlertDialogTitle>Are you absolutely sure?</AlertDialogTitle>
          <AlertDialogDescription>
            This action cannot be undone. This will permanently delete your
            account and remove your data from our servers.
          </AlertDialogDescription>
        </AlertDialogHeader>
        <AlertDialogFooter>
          <AlertDialogCancel>Cancel</AlertDialogCancel>
          <AlertDialogAction>Continue</AlertDialogAction>
        </AlertDialogFooter>
      </AlertDialogContent>
    </AlertDialog>
  );
}


EOF



Accordion_PATH="./src/components/examples/accordion.jsx"

if [ ! -d "$Accordion_PATH" ]; then
       touch "$Accordion_PATH"
fi



cat <<EOF > "$Accordion_PATH"

import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from "@/components/ui/accordion";

export function AccordionDemo() {
  return (
    <Accordion type="single" collapsible className="w-full">
      <AccordionItem value="item-1">
        <AccordionTrigger>Is it accessible?</AccordionTrigger>
        <AccordionContent>
          Yes. It adheres to the WAI-ARIA design pattern.
        </AccordionContent>
      </AccordionItem>
      <AccordionItem value="item-2">
        <AccordionTrigger>Is it styled?</AccordionTrigger>
        <AccordionContent>
          Yes. It comes with default styles that matches the other
          components&apos; aesthetic.
        </AccordionContent>
      </AccordionItem>
      <AccordionItem value="item-3">
        <AccordionTrigger>Is it animated?</AccordionTrigger>
        <AccordionContent>
          Yes. It&apos;s animated by default, but you can disable it if you
          prefer.
        </AccordionContent>
      </AccordionItem>
    </Accordion>
  );
}


EOF


# *************************END OF EXAMPLES*************************

THEME_TOGGLE_PATH="./src/components/theme-toggle.jsx"

if [ ! -d "$THEME_TOGGLE_PATH" ]; then
       touch "$THEME_TOGGLE_PATH"
fi



cat <<EOF > "$THEME_TOGGLE_PATH"

import { Moon, Sun } from "lucide-react"

import { Button } from "@/components/ui/button"
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"
import { useTheme } from "@/context/theme-context"

export function ThemeToggle() {
  const { setTheme } = useTheme()

  return (
    <DropdownMenu>
      <DropdownMenuTrigger asChild>
        <Button variant="outline" size="icon">
          <Sun className="h-[1.2rem] w-[1.2rem] rotate-0 scale-100 transition-all dark:-rotate-90 dark:scale-0" />
          <Moon className="absolute h-[1.2rem] w-[1.2rem] rotate-90 scale-0 transition-all dark:rotate-0 dark:scale-100" />
          <span className="sr-only">Toggle theme</span>
        </Button>
      </DropdownMenuTrigger>
      <DropdownMenuContent align="end">
        <DropdownMenuItem onClick={() => setTheme("light")}>
          Light
        </DropdownMenuItem>
        <DropdownMenuItem onClick={() => setTheme("dark")}>
          Dark
        </DropdownMenuItem>
        <DropdownMenuItem onClick={() => setTheme("system")}>
          System
        </DropdownMenuItem>
      </DropdownMenuContent>
    </DropdownMenu>
  )
}


EOF


APP_CSS_PATH="./src/App.css"

if [ ! -d "$APP_CSS_PATH" ]; then
       touch "$APP_CSS_PATH"
fi



cat <<EOF > "$APP_CSS_PATH"

@tailwind base;
@tailwind components;
@tailwind utilities;
@layer base {
  :root {
    --background: 0 0% 100%;
    --foreground: 220 9.4% 12.5%;
    --card: 0 0% 100%;
    --card-foreground: 70 8.1% 12%;
    --popover: 0 0% 100%;
    --popover-foreground: 70 8.1% 12%;
    --primary: 212 100% 38.6%;
    --primary-foreground: 0 0% 100%;
    --secondary: 210 29% 97%;
    --secondary-foreground: 70 8.1% 12%;
    --muted: 0 0% 95%;
    --muted-foreground: 70 8.1% 50%;
    --accent: 0 0% 95%;
    --accent-foreground: 70 8.1% 12%;
    --destructive: 359 100% 43.7%;
    --destructive-foreground: 0 0% 100%;
    --border: 219 13.5% 89%;
    --input: 219 13.5% 71%;
    --ring: 212 100% 38.6%;
    --radius: 0.5rem;
    --live: 120 100% 27.8%;
  }

  .dark {
    --background: 70 8.1% 12%;
    --foreground: 60 36.4% 95.7%;
    --card: 70 8.1% 14.5%;
    --card-foreground: 60 36.4% 95.7%;
    --popover: 70 8.1% 14.5%;
    --popover-foreground: 60 36.4% 95.7%;
    --primary: 212 100% 38.6%;
    --secondary: 70 8.1% 7%;
    --secondary-foreground: 60 36.4% 95.7%;
    --muted: 70 8.1% 14.5%;
    --muted-foreground: 70 8.1% 45%;
    --accent: 70 8.1% 18%;
    --accent-foreground: 60 36.4% 95.7%;
    --destructive: 359 100% 43.7%;
    --destructive-foreground: 60 36.4% 95.7%;
    --border: 222 13.9% 28.2%;
    --input: 219 13.5% 71%;
    --ring: 224.3 76.3% 48%;
    --live: 120 100% 27.8%;
  }
}

@layer base {
  * {
    @apply border-border;
  }
  body {
    @apply bg-background text-foreground;
  }

  html {
    font-family: "Inter", sans-serif;
  }
}


EOF