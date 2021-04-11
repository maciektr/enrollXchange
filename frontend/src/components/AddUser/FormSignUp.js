import React from 'react';
import useForm from './useForm'
import validate from './validateInfo'
import '../../styles/Form.css'

const FormSingUp = ({submitForm}) => {
    const {handleChange, values, handleSubmit, errors} = useForm(submitForm, validate);
    return (
        <div className="form-content-right">
            <form className="form" onSubmit={handleSubmit}>
                <h1>Rejestracja</h1>
                <div className="form-inputs">
                    <label htmlFor="username" className="form-label">Imie</label>
                    <input
                        id='username'
                        type='username'
                        name='username'
                        className='form-input'
                        value={values.username}
                        onChange={handleChange}
                    />
                    {errors.username && <p>{errors.username}</p>}
                </div>
                <div className="form-inputs">
                    <label htmlFor="surname" className="form-label">Nazwisko</label>
                    <input
                        id={"surname"}
                        type='text'
                        name='surname'
                        className='form-input'
                        value={values.surname}
                        onChange={handleChange}/>
                    {errors.surname && <p>{errors.surname}</p>}
                </div>
                <div className="form-inputs">
                    <label htmlFor="email" className="form-label">Email z domeny agh</label>
                    <input
                        id={"email"}
                        type='email'
                        name='email'
                        className='form-input'
                        value={values.email}
                        onChange={handleChange}/>
                    {errors.email && <p>{errors.email}</p>}
                </div>
                <div className="form-inputs">
                    <label htmlFor="studentID" className="form-label">Numer indeksu</label>
                    <input
                        id={"studentID"}
                        type='number'
                        name='studentID'
                        className='form-input'
                        value={values.studentID}
                        onChange={handleChange}
                    />
                    {errors.studentID && <p>{errors.studentID}</p>}
                </div>
                <button className={"form-input-btn"} type={"submit"}>
                    Zarejestruj
                </button>
            </form>
        </div>
    );
};
export default FormSingUp;
