import React from "react"
import PropTypes from "prop-types"

class Dashboard extends React.Component {
  render () {
    return (
      <div className="container">
        <div className="row">
          <div className="col">
            <h1>Dashboard</h1>
          </div>
        </div>
        <div className="row">
          {this.props.satellites.map(function(sat) {
            return (
              <div className="col">
                <div className="card text-center mx-auto" style={{width: '18rem'}}>
                  <div className="card-body">
                    <a href={"/satellites/" + sat.id}>
                      <h3>SAT {sat.id}</h3>
                      <h5>Last Timestamp: {sat.last_telemetry_timestamp}</h5>
                    </a>
                  </div>
                </div>
              </div>
            )
          })}
        </div>
      </div>
    );
  }
}

Dashboard.propTypes = {
  satellites: PropTypes.array
};

export default Dashboard
