const initialState = {
  city: "Please Select",
  jobs: []
};

const reducer = (state = initialState, action) => {
  switch(action.type) {
    case "SWITCH_LOCATION":
    return {
      city: action.city,
      jobs: action.jobs
    };
    default:
      return state;
  } // remove this and fill out the body of the reducer function
};

export default reducer;
