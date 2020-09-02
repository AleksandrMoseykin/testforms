import React from "react"
import PropTypes from "prop-types"
import Notes from "./Notes"
import { withoutIndex } from "./utils"

class HelloWorld extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      notes: [
        "1. Пункт",
        "2. Пункт",
        "3. Пункт"
      ]
    };
  }

  onNoteDelete = (indexToRemove) => {
    this.setState(oldState => {
      return {
        notes: withoutIndex(oldState.notes, indexToRemove)
      }
    })
  }

  render () {
    return (
      <React.Fragment>
      <Notes notes = {this.state.notes} onDelete = {this.onNoteDelete}/>
      </React.Fragment>
    );
  }
}

HelloWorld.propTypes = {
  greeting: PropTypes.string
};
export default HelloWorld
