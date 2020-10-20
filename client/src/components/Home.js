import React, { useState, useEffect } from 'react'
import Axios from 'axios'

export default function Home(props) {
    const [goals, setGoals] = useState([])
    const getGoals = (user_id) => {
        Axios.get(`/api/users/${user_id}/goals`)
        .then(res => setGoals(res.data))
        .catch(err => console.log(err))
    } 
    useEffect(()=>{
        getGoals(props.location.state.userId)
    },[])

    const renderTimezone = (tz) => {
        switch (tz){
            case "AST":
                return "America/Halifax"
                break;
            case "EST":
                return "America/New_York"
                break;
            case "CST":
                return "America/Chicago"
                break;
            case "MST":
                return "America/Denver"
                break;
            case "PST":
                return "America/Los_Angeles"
                break;
            case "ALST":
                return "America/Juneau"
                break;
            case "HST":
                return "America/Honolulu"
                break;
        }
    }

    const renderGoals = () => {
        return goals.map(goal => (
            <tr><td>{goal.name}</td> <td>{new Date(goal.date).toLocaleString('en-US', { timeZone: renderTimezone(props.location.state.timezone) })}</td></tr>
        ))
    }
    return (
        <div>
            <h3>Upcoming Activities</h3>
            {goals.length > 0 ? (
            <table id="goals">
                <tr>
                    <th>Event Name</th>
                    <th>Due Date</th>
                </tr>
                <tbody>
                     {renderGoals()} 
                </tbody>
            </table>
            ) : "no goals"}
        </div>
    )
}
