//
//import model.Unitlogin;
//import org.springframework.validation.Errors;
//import org.springframework.validation.ValidationUtils;
//import org.springframework.validation.Validator;
//
//public class PasswordValidator implements Validator {
//
//    @Override
//    public boolean supports(Class<?> paramClass) {
//        return Unitlogin.class.equals(paramClass);
//    }
//
//    @Override
//    public void validate(Object obj, Errors errors) {
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "valid.password");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "passwordConf", "valid.passwordConf");
//        Unitlogin password = (Unitlogin) obj;
//        if (!password.getUnitpwd().equals(password.getUnitpwd())) {
//            errors.rejectValue("passwordConf", "valid.passwordConfDiff");
//        }
//    }
//}