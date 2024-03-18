
class CardService {

  String cardIconData;
  String cardType;
  int cardID;

  CardService(this.cardIconData, this.cardType, this.cardID);

  static List<CardService> getListCardService() {
    return <CardService>[
      CardService('assets/icon_payment/image_icon_mada.png',
          'بطاقة مدى البنكية | Mada', 0),
      CardService('assets/icon_payment/image_icon_mastercard.png',
          'ماستر كارد | Master Card', 1),
      CardService('assets/icon_payment/image_icon_visa.png',
          'فيزا | Visa', 2),
      CardService('assets/icon_payment/image_icon_amex.png',
          'أميكس | AMEX', 3),
      // CardService('assets/icon_payment/image_icon_stc.png',
      //     'شركة الاتصالات السعودية | Stc Pay', 4),

    ];
  }

  static List<CardService> getListPaymentCardService() {
    return <CardService>[
      CardService('assets/icon_payment/image_icon_mada.png',
          'بطاقة مدى البنكية | Mada', 0),
      CardService('assets/icon_payment/image_icon_mastercard.png',
          'ماستر كارد | Master Card', 1),
      CardService('assets/icon_payment/image_icon_visa.png',
          'فيزا | Visa', 2),
      CardService('assets/icon_payment/image_icon_amex.png',
          'أميكس | AMEX', 3),
      // CardService('assets/icon_payment/image_icon_stc.png',
      //     'شركة الاتصالات السعودية | Stc Pay', 4),
    ];
  }

}