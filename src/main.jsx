import React from "react";
import ReactDOM from "react-dom/client";
import { Button } from "./index";
import "./index.css";
import { Alert, AlertDescription, AlertTitle } from "../package/dist/ui";

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <Button>Click me</Button>
    <Alert>
      <AlertTitle>Heads up!</AlertTitle>
      <AlertDescription>
        You can add components and dependencies to your app using the cli.
      </AlertDescription>
    </Alert>
  </React.StrictMode>
);
