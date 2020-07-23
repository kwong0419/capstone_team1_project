import React from "react";
import Modal from "react-modal";
import { Route } from "react-router-dom";
import NavBar from "./features/navbar/NavBar";
// import ClientSignUp from "./features/client/clientSignUp";
// import ArtistSignUpForm from "./features/Artist/ArtistSignUpForm";
import DisplaySignUp from './features/Display/DisplaySignUp'
import Login from "./features/login/Login";
import SearchResults from "./features/SearchResults/SearchResults"
import Home from "./features/Home/Home"
import AuthProvider from "./providers/AuthContext";
import { AuthRoute, ProtectedRoute } from "./util/routesUtil";


Modal.setAppElement('#root');

function App() {
  return (
    <div className="App">
      <AuthProvider>
        <NavBar />
        <Route exact path="/">
          <Home />
        </Route>
        <ProtectedRoute exact path="/users">
          Users
        </ProtectedRoute>
        <AuthRoute exact path="/signup">
          {/* <ArtistSignUpForm />
          <ClientSignUp /> */}
          <DisplaySignUp />
        </AuthRoute>
        <AuthRoute exact path="/login">
          <Login />

        </AuthRoute>
      </AuthProvider>
      <Route exact path={"/results"}>
        <SearchResults />
      </Route>
    </div>
  );
}

export default App;
