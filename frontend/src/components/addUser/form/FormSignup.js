import React from 'react';
import useForm from './useForm'
import validate from './validateInfo'
import '../../../styles/Form.css'

const FormSingup = ({submitForm}) => {
    const {handleChange, values, handleSubmit, errors} = useForm(submitForm, validate);
    return (
        <div className="form-content-right">
            <form className="form" onSubmit={handleSubmit}>
                <h1>Add the new user</h1>
                <div className="form-inputs">
                    <label htmlFor="username" className="form-label">Name</label>
                    <input
                        id='username'
                        type='username'
                        name='username'
                        className='form-input'
                        placeholder="Enter Your username"
                        value={values.username}
                        onChange={handleChange}
                    />
                    {errors.username && <p>{errors.username}</p>}
                </div>
                <div className="form-inputs">
                    <label htmlFor="surname" className="form-label">Surname</label>
                    <input
                        id={"surname"}
                        type='text'
                        name='surname'
                        className='form-input'
                        placeholder="Enter Your surname"
                        value={values.surname}
                        onChange={handleChange}/>
                    {errors.surname && <p>{errors.surname}</p>}
                </div>
                <div className="form-inputs">
                    <label htmlFor="email" className="form-label">Email</label>
                    <input
                        id={"email"}
                        type='email'
                        name='email'
                        className='form-input'
                        placeholder="Enter Your email"
                        value={values.email}
                        onChange={handleChange}/>
                    {errors.email && <p>{errors.email}</p>}
                </div>
                <div className="form-inputs">
                    <label htmlFor="studentID" className="form-label">Student ID</label>
                    <input
                        id={"studentID"}
                        type='number'
                        name='studentID'
                        className='form-input'
                        placeholder="Enter Your StudentID"
                        value={values.studentID}
                        onChange={handleChange}
                    />
                    {errors.studentID && <p>{errors.studentID}</p>}
                </div>
                <button className={"form-input-btn"} type={"submit"}>
                    Add user
                </button>
            </form>
        </div>
    );
};
export default FormSingup;