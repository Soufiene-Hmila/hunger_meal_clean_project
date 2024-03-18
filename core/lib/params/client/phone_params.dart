
class PhoneParams {

    final String? mobile;

    const PhoneParams({this.mobile});

    Map<String, dynamic> toJson() => {
        'phone': mobile
    };

}