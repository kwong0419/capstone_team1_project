import React from "react";
import { useSelector } from "react-redux";
import "../../css/NotificationContainer.css";

import NotificationItem from "./NotificationItem";

const NotificationDisplay = () => {
  const notifications = useSelector((state) => state.notifications);
  const loading = useSelector((state) => state.loading);
  const userNotifications = notifications.map((notification) => {
    return (
      <li key={notification.id}>
        <NotificationItem notification={notification} />
      </li>
    );
  });

  return (
    <>
      {loading ? (
        <div>Loading</div>
      ) : (
        <div class="jumbotron-fluid notificationContainer text-center">
          <h1 class="display-4">Notifications</h1>
          <ul>{userNotifications}</ul>
        </div>
      )}
    </>
  );
};

export default NotificationDisplay;
