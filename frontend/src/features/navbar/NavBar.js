import React, { useContext } from "react";
import { NavLink } from "react-router-dom";
import { toggleModalState } from "../Artist/modalSlice";
import { toggleLoginModalState } from "../login/loginModalSlice"
import { clientLogout } from "../token/clientTokenSlice";
import { artistLogout } from "../token/artistTokenSlice";
import { recieveToken } from "../token/tokenSlice";
import { useDispatch, useSelector } from "react-redux";
import "../../css/NavBar.css";
import logo from "../../RoadieLogo.png";
import { logout } from "../../util/firebaseFunctions";
import { AuthContext } from "../../providers/AuthContext";

const NavBar = () => {
  const { currentUser } = useContext(AuthContext);
  const user = useSelector((state) => state.userToken);
  const artist = useSelector((state) => state.artist);
  const client = useSelector((state) => state.client);
  const dispatch = useDispatch();

  let routeExt = () => {
    
    if (client === null && artist !== null) {
      return (
        <NavLink
          exact
          to={`/artist/${currentUser.id}`}
          activeClassName={"navItem"}
          className="inactive"
        >
          Profile
        </NavLink>
      );
    } else if (client !== null && artist === null) {
      return (
        <NavLink
          exact
          to={`/client/${currentUser.id}`}
          activeClassName={"navItem"}
          className="inactive"
        >
          Profile
        </NavLink>
      );
    }
  };

  const userLogout = () => {
    dispatch(clientLogout());
    dispatch(artistLogout());
    dispatch(recieveToken(null));
    logout();
  };
  const displayButtons = () => {
    console.log(currentUser, "currentUser")
    if (currentUser) {
      return (
        <>
          {routeExt()}
          <button className="logoutBttn" onClick={userLogout}>
            Logout
          </button>
        </>
      );
    } else {
      return (
        <>
          <NavLink
            className="inactive"
            activeClassName="active"
            exact
            to={"/login"}
            onClick={() => dispatch(toggleLoginModalState())}
          >
            Login
          </NavLink>
          <NavLink
            className="inactive"
            activeClassName="active"
            id="signUpLink"
            to={"/signup"}
            onClick={() => dispatch(toggleModalState())}
          >
            Sign Up
          </NavLink>
        </>
      );
    }
  };
  return (
    <nav>
      <NavLink className="inactive" activeClassName="active" exact to={"/"}>
        <img src={logo} alt="logo" className="navLogo" id="roadieLogo" />
      </NavLink>
      <NavLink className="inactive" activeClassName="active" exact to={"/"}>
        Home
      </NavLink>
      {displayButtons()}
    </nav>
  );
};

export default NavBar;
