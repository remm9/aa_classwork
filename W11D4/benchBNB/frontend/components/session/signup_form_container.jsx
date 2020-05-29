import React from 'react';
import { connect } from 'react-redux';
import { signup } from '../../actions/session_actions';
import SessionForm from './session_form';
import { Link } from 'react-router-dom';

const mSTP = ({ errors }) => {
    return {
        formType: 'signup',
        errors: errors.session,
        navLink: <Link to="/login">Please login</Link>,
    } 
}

const mDTP = dispatch => ({
    processForm: user => dispatch(signup(user))
})

export default connect(mSTP, mDTP)(SessionForm)

