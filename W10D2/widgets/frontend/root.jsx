import React from "react";
import Clock from "./clock";
import Tabs from "./tabs";

class Root extends React.Component {
  constructor() {
    super();
    this.tabsArray = [{one: "this is first"},{two: "this is two",},{three: "this is three"}]
  }

  render() {
    return (
      <>
        {<Clock />}
        {<Tabs tabsArray={this.tabsArray}/>}
      </>
    );
  }
}

export default Root;
