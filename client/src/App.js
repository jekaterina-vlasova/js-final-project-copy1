import React, { useContext, useEffect, useState } from "react";
import {BrowserRouter} from "react-router-dom";
import AppRouter from "./components/AppRouter";
import NavBar from "./components/NavBar";
import { Context } from ".";
import { observer } from "mobx-react-lite";
import { check } from "./http/userAPI";
import { Spinner } from "react-bootstrap";

const App = observer (() => {
  const {client} = useContext(Context)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
      check().then(data => {
        client.setClient(true)
        client.setIsAuth(true)
      }).finally(() => setLoading(false))
  }, [])

  if (loading) {
    return <Spinner animation={"grow"}/>
  }

  return (
    <BrowserRouter>
      <NavBar />
      <AppRouter />
    </BrowserRouter>
  );
});

export default App;