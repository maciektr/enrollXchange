export default function validateInfo(values) {
    let errors = {}

    if(!values.username.trim()) {
        errors.username = "Imie wymagane"
    }

    if(!values.surname.trim()) {
        errors.surname = "Nazwisko wymagane"
    }

    if(!values.email) {
        errors.email = "Email wymagany"
    }

    if(!values.studentID) {
        errors.studentID = "Numer indeksu wymagany"
    }
    return errors;
}
