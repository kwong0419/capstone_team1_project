import React from "react";
import { Route } from "react-router-dom";
import NavBar from "./features/navbar/NavBar";
import ClientSignUp from "./features/client/clientSignUp"
import ArtistSignUpForm from "./features/Artist/ArtistSignUpForm"

function App() {
  return (
    <div className="App">
      <NavBar />
      <Route exact path="/">
        HOME
      </Route>
      <Route exact path="/users">
        Get all users List
      </Route>
      <Route exact path="/signup">
        <ArtistSignUpForm />
        <ClientSignUp />
      </Route>
      <Route exact path="/login">
        Log in component here
      </Route>
    </div>
  );
}

export default App;