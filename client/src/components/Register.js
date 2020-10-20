import React, { useState } from 'react'
import Axios from 'axios'
import { Redirect, } from 'react-router'

export default function Register() {
    const [fullName, setFullName] = useState("")
    const [organization, setOrganization] = useState("")
    const [timezone, setTimezone] = useState("AST")
    const [redirect, setRedirect] = useState(false)
    const [userId, setUserId] = useState("")

    function setStateSynchronous(stateUpdate) {
        return new Promise(resolve => {
            setUserId(id => stateUpdate);
            resolve()
        });
    }

    var id = null
    async function handleSubmit(e){
        try{
            e.preventDefault()
            const res =  await Axios.post('/api/users', {full_name: fullName, Organization: organization, timezone: timezone})
            console.log(res.data)
            await setStateSynchronous(res.data.id)
            setRedirect(true)
        } catch (err) {
            console.log(err)
        }
    }

    return redirect ?
        <Redirect to={{
            pathname:"/home",
            state:{ userId: userId, fullName: fullName, organization: organization, timezone: timezone }
        }}/>
        :
        (
        <div className="page">
            <form id="register" onSubmit={handleSubmit}>
                <h1>Register</h1>
                <section>
                    <label for="full_name">Full Name:</label>
                    <input
                    name="full_name"
                    value={fullName}
                    onChange={(e) => setFullName(e.target.value)}
                    />
                </section>
                <section>
                    <label for="organization">Organization:</label>
                    <input
                    name="organization"
                    value={organization}
                    onChange={(e) => setOrganization(e.target.value)}
                    />
                </section>
                <section>
                    <label for="timezone">Timezone:</label>
                    <select
                    name="timezone"
                    value={timezone}
                    onChange={(e) => setTimezone(e.target.value)}
                    >
                        <option selected name="Atlantic Standard Time" value="AST">Atlantic Standard Time</option>
                        <option name="Eastern Standard Time" value="EST">Eastern Standard Time</option>
                        <option name="Central Standard Time" value="CST">Central Standard Time</option>
                        <option name="Mountain Standard Time" value="MST">Mountain Standard Time</option>
                        <option name="Pacific Standard Time" value="PST">Pacific Standard Time</option>
                        <option name="Alaskan Standard Time" value="ALST">Alaskan Standard Time</option>
                        <option name="Hawaii-Aleutian Standard Time " value="HAST ">Hawaii-Aleutian Standard Time </option>
                        
                    </select>
                </section>
                <button type="submit">Register</button>
            </form>
        </div>
    )
}
