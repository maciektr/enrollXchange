export default function validateInfo(values) {
    let errors = {}

    if(!values.username.trim()) {
        errors.username = "Username required"
    }

    if(!values.surname.trim()) {
        errors.surname = "Surname required"
    }

    if(!values.email) {
        errors.email = "Email required"
    } else if (!/\S+@\S+\.\S+/.test(values.email)) {
        errors.email = 'Email address is invalid';
    }

    if(!values.studentID) {
        errors.studentID = "Student ID required"
    }
    return errors;
}