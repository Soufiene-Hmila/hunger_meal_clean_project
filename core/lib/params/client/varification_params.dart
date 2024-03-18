
class VerificationParams {

    final String? mobile;
    final String? code;

    const VerificationParams({this.mobile, this.code});

    Map<String, dynamic> toJson() => {
        'phone': mobile,
        'token_device': "",
        'verification_code': code,
    };

}