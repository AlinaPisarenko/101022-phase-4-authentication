import { useState, useEffect } from 'react'

import Login from './Login'
import Signup from './Signup'
import Profile from './Profile'

function App() {

  const [user, setUser] =  useState({})

  useEffect(() => {
    fetch('/me')
    .then(res => {
      if (res.ok) {
        res.json()
        .then(data => {
          setUser(data)
        })
      }
    })
  }, [])

  const handleLogout = () => {
    setUser({})
    fetch('/logout', {
      method: 'DELETE'
    })
  }

  return (
    <div className="App">
      <Login user={user} setUser={setUser} />
      <Signup user={user} setUser={setUser} />
      <button onClick={handleLogout}>Logout</button>

      <Profile user={user} />

    </div>
  );
}


export default App;
