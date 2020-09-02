import React from "react"
import PropTypes from "prop-types"

class Note extends React.Component {
  render(){
    return (
      <div className = "Notes-Note">{this.props.text}
        <span className = "Notes-Note-Delete" onClick = {this.props.onDelete}>&times;</span>
      </div>
  );
  }
}

class Notes extends React.Component {
  render(){
    return <div className = "Notes">
      {this.props.notes.map((text, index) => {
        return <Note text = {text} key = {index} onDelete = {() => this.props.onDelete(index)}/>
      }
    )}
    </div>
  }
}

export default Notes
