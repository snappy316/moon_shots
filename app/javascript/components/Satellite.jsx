import React from "react"
import PropTypes from "prop-types"
class Satellite extends React.Component {
  render () {
    return (
      <div className="container">
        <div className="row">
          <div className="col">
            <h1>SAT {this.props.satellite.id}</h1>
            <h3>Last Telemetry Timestamp: {this.props.satellite.last_telemetry_timestamp}</h3>
          </div>
        </div>

        <div className="row">
          {this.props.barrels.map(function(bar) {
            let styleClass = '';
            if (bar.status == 'ready') {
              styleClass = 'text-success';
            } else if (bar.status == 'error') {
              styleClass = 'text-danger';
            } else {
              styleClass = 'text-primary';
            }
            return (
              <div className="col-sm-4">
                <div className="card mx-auto" style={{width: '18rem'}}>
                  <div className="card-body">
                    <h3 className={styleClass}>Batch {bar.id}</h3>
                    <p>Last Flavor Sensor Result: {bar.last_flavor_sensor_result}</p>
                    <p>Status: {bar.status}</p>
                    <p>Errors: {bar.barrel_errors}</p>
                  </div>
                </div>
              </div>
            )
          })}
        </div>

        <div className="row">
          <div className="col">
            <div className="card text-center mx-auto" style={{width: '18rem'}}>
              <div className="card-body">
                <h3>Re-Entry</h3>
                <button className="btn btn-primary">Trigger Deorbit Burn</button>
                <button className="btn btn-danger">Detonate</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

Satellite.propTypes = {
  satellite: PropTypes.object,
  barrels: PropTypes.array
};
export default Satellite
