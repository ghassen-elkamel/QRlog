abstract class BaseLanguage {
  String get back;

  String get ok;

  String get invalidCredentials;

  String get jwtTokenNotFound;

  String get emptyList;

  String get theField;

  String get thisField;

  String get isRequired;

  String get homeTitle;

  String get homeIsWorking;

  String get connection;

  String get email;

  String get password;

  String get forgotPasswordQuestion;

  String get login;

  String get register;

  String get myProfile;

  String get myHistory;

  String get promoCode;

  String get meansOfPayment;

  String get frequentQuestions;

  String get contactUs;

  String get logout;

  String get registration;

  String get firstName;

  String get lastName;

  String get phone;

  String get createPassword;

  String get confirmPassword;

  String get twoFactorAuthentication;

  String get msgTwoFactorAuthentication;

  String get securityCode;

  String get confirm;

  String get resend;

  String get codeConfirmed;

  String get wrongCode;

  String get next;

  String get retry;

  String get forgotPassword;

  String get forgotPasswordDescription;

  String get send;

  String get mailSent;

  String get seeMail;

  String get newPassword;

  String get validate;

  String get newProgram;

  String get skip;

  String get yourOrder;

  String get pay;

  String get all;

  String get promo;

  String get apply;

  String get choiceService;

  String get washing;

  String get drying;

  String get chooseWeight;

  String get addOn;

  String get selectOption;

  String get temperature;

  String get duration;

  String get low;

  String get medium;

  String get high;

  String get temp15;

  String get temp40;

  String get temp60;

  String get prewash;

  String get softener;

  String get sanitizer;

  String get time20;

  String get time40;

  String get time60;

  String get time80;

  String get descriptionPrewash;

  String get descriptionSoftener;

  String get descriptionSanitizer;

  String get legalMentions;

  String get emergencyContactUs;

  String get reportProblemOrSuggestion;

  String get address;

  String get postalCode;

  String get ville;

  String get pays;

  String get messageObject;

  String get yourMessage;

  String get seeEverything;

  String get update;

  String get updatePassword;

  String get deleteAccount;

  String get cancel;

  String get confirmDeleteAccount;

  String get accountDeleted;

  String get backHome;

  String get programsOffered;

  String get yourPromoCode;

  String get text;

  String get currentlyActive;

  String get immediateReduction;

  String get until;

  String get addMeansOfPayment;

  String get addMeansOfPaymentToUseTheApplication;

  String get bankCardNumber;

  String get bankCard;

  String get cardExpirationDate;

  String get twoMinuteToDeclineThePayment;

  String get fillMachineNumber;

  String get closeHublot;

  String get pressStartButton;

  String get startCycle;

  String get warning;

  String get breakdownsRepairs;

  String get washingMachine;

  String get twoMinuteToStartTheProgram;

  String get iUnderstand;

  String get minutesRemaining;

  String get yourCurrentProgram;

  String get programFinished;

  String get pleaseCollectYourLaundry;

  String get rateTheService;

  String get wouldYouLikeReceiveInformationPromotions;

  String get iAccept;

  String get iRefuse;

  String get successMessage;

  String get thankYou;

  String get currentPassword;

  String get thePasswordsDoNotMatch;

  String get successfullyPaymentStripe;

  String get paymentVerificationSuccessfulStripe;

  String get errorStripe;

  String get errorStripeUnexpected;

  String get errorStripePaymentCanceled;

  String get error;

  String get errx01;

  String get errx02;

  String get errx03;

  String get errx04;

  String get errx05;

  String get errx06;

  String get errx07;

  String get errx09;

  String get errx10;

  String get errx11;

  String get errx12;

  String get errx13;

  String get errx14;

  String get errx15;

  String get errx16;

  String get errx17;

  String get errx18;

  String get errx19;

  String get errx20;

  String get errx21;

  String get errx22;

  String get errx23;

  String get errx01xx;

  String get errx02xx;

  String get errx03xx;

  String get errx04xx;

  String get errx05xx;

  String get errx06xx;

  String get errx07xx;

  String get errx08xx;

  String get errx09xx;

  String get err9020x;

  String get err9021x;

  String get err9090x;

  String get passwordUpdatedFromForget;

  String get chooseYourReductionOffer;

  String get findLaundryImage;

  String get enterValidMobileNumber;

  String get pleaseEnterValidMobileNumber;

  String get enterValidEmail;

  String get pleaseEnterValidEmail;

  String get search;

  String get youAreOffline;

  String get receivePromotionsAndInformation;

  String get iAcceptThe;

  String get generalTermsConditions;

  String get youMustAcceptConditionsToContinue;

  String get wouldYouLikeToAccept;

  String get accept;

  String get orderStatus;

  String get yourOrderIsBeingProcessed;

  String get yourRequestHasNotBeenTakenIntoAccount;

  String get connectionProblemWithEvermaps;

  String get internalServerError;

  String get languageFr;

  String get languageEn;

  String get languageDe;

  String get language;

  String get parking;

  String get open24;

  Map<String, String> toJson() {
    return {
      //global
      'back': back,
      'ok': ok,
      'Invalid credentials.': invalidCredentials,
      'JWT Token not found': jwtTokenNotFound,

      //atom select
      'empty-list': emptyList,

      //atom text field
      'the-field': theField,
      'this-field': thisField,
      'is-required': isRequired,

      //Home Page
      'home-title': homeTitle,
      'home-is-working': homeIsWorking,

      //Login Page
      'connection': connection,
      'email': email,
      'password': password,
      'forgot-password-q': forgotPasswordQuestion,
      'login': login,
      'register': register,

      //Menu
      'my-profile': myProfile,
      'my-history': myHistory,
      'promo-code': promoCode,
      'means-of-payment': meansOfPayment,
      'frequent-questions': frequentQuestions,
      'contact-us': contactUs,
      'legal-mentions': legalMentions,
      'logout': logout,

      //Register page
      'registration': registration,
      'first-name': firstName,
      'last-name': lastName,
      'phone': phone,
      'create-password': createPassword,
      'confirm-password': confirmPassword,
      'two-factor-authentication': twoFactorAuthentication,
      'msg-two-factor-authentication': msgTwoFactorAuthentication,
      'security-code': securityCode,
      'confirm': confirm,
      'resend': resend,
      'code-confirmed': codeConfirmed,
      'wrong-code': wrongCode,
      'next': next,
      'retry': retry,

      //forgot password page
      'forgot-password': forgotPassword,
      'forgot-password-description': forgotPasswordDescription,
      'send': send,
      'mail-sent': mailSent,
      'see-mail': seeMail,
      'new-password': newPassword,
      'validate': validate,

      //new program page
      'nouveau-programme': newProgram,
      'skip': skip,
      'your-order': yourOrder,
      'pay': pay,
      'all': all,
      'promo': promo,
      'apply': apply,
      'choice-service': choiceService,
      'washing': washing,
      'drying': drying,
      'choose-weight': chooseWeight,
      'addOn': addOn,
      'select-option': selectOption,
      'temperature': temperature,
      'duration': duration,
      'low': low,
      'medium': medium,
      'high': high,
      'temp15': temp15,
      'temp40': temp40,
      'temp60': temp60,
      'prewash': prewash,
      'softener': softener,
      'sanitizer': sanitizer,
      'time20': time20,
      'time40': time40,
      'time60': time60,
      'time80': time80,
      'description-prewash': descriptionPrewash,
      'description-softener': descriptionSoftener,
      'description-sanitizer': descriptionSanitizer,

      //contact us page
      'emergency-contact-us': emergencyContactUs,
      'report-problem-or-suggestion': reportProblemOrSuggestion,
      'address': address,
      'postal-code': postalCode,
      'ville': ville,
      'pays': pays,
      'message-object': messageObject,
      'your-message': yourMessage,
      'see-everything': seeEverything,

      //my profile page
      'update': update,
      'update-password': updatePassword,
      'delete-account': deleteAccount,
      'cancel': cancel,
      'confirm-delete-account': confirmDeleteAccount,
      'account-deleted': accountDeleted,
      'back-home': backHome,

      //promo code page
      'programs-offered': programsOffered,
      'your-promo-code': yourPromoCode,
      'text': text,
      'currently-active': currentlyActive,
      'immediate-reduction': immediateReduction,
      'until': until,

      //means of payment page
      'add-means-of-payment': addMeansOfPayment,
      'add-means-of-payment-to-use-the-application':
          addMeansOfPaymentToUseTheApplication,
      'bank-card-number': bankCardNumber,

      //new means of payment page
      'bank-card': bankCard,
      'MM/YY': cardExpirationDate,

      //payment accpted page
      'two-minute-to decline-the-payment': twoMinuteToDeclineThePayment,
      'fill-machine-number': fillMachineNumber,
      'close-hublot': closeHublot,
      'press-start-button': pressStartButton,

      //map information modal
      'start-cycle': startCycle,
      'warning': warning,
      'breakdowns-repairs': breakdownsRepairs,
      'washing-machine': washingMachine,
      'two-minute-to-start-the-program': twoMinuteToStartTheProgram,
      'i-understand': iUnderstand,
      'parking': parking,
      '24:00': open24,

      //home page
      'minutes-remaining': minutesRemaining,
      'your-current-program': yourCurrentProgram,
      'program-finished': programFinished,
      'please-collect-your-laundry': pleaseCollectYourLaundry,
      'rate-the-service': rateTheService,
      'would-you-like-receive-information-promotions':
          wouldYouLikeReceiveInformationPromotions,
      'i-accept': iAccept,
      'i-refuse': iRefuse,

      //contact us success snackbar
      'success_message': successMessage,
      'thank-you': thankYou,

      //update password
      'current-password': currentPassword,
      'the-passwords-do-not-match': thePasswordsDoNotMatch,

      //payment
      'successfully-payment-stripe': successfullyPaymentStripe,
      'payment-verification-successful-stripe':
          paymentVerificationSuccessfulStripe,
      'error-stripe': errorStripe,
      'error-stripe-unexpected': errorStripeUnexpected,
      'error-stripe-payment-canceled': errorStripePaymentCanceled,
      'error': error,

      //error messages
      'x01': errx01,
      'x02': errx02,
      'x03': errx03,
      'x04': errx04,
      'x05': errx05,
      'x06': errx06,
      'x07': errx07,
      'x09': errx09,
      'x10': errx10,
      'x11': errx11,
      'x12': errx12,
      'x13': errx13,
      'x14': errx14,
      'x15': errx15,
      'x16': errx16,
      'x17': errx17,
      'x18': errx18,
      'x19': errx19,
      'x20': errx20,
      'x21': errx21,
      'x22': errx22,
      'x23': errx23,
      'x01xx': errx01xx,
      'x02xx': errx02xx,
      'x03xx': errx03xx,
      'x04xx': errx04xx,
      'x05xx': errx05xx,
      'x06xx': errx06xx,
      'x07xx': errx07xx,
      'x08xx': errx08xx,
      'x09xx': errx09xx,
      '9020x': err9020x,
      '9021x': err9021x,
      '9090x': err9090x,
      'password-updated-from-forget': passwordUpdatedFromForget,

      //choose reduction offer alert dialog
      "choose-your-reduction-offer": chooseYourReductionOffer,

      //laundry picture alert dialog
      "find-laundry-image": findLaundryImage,

      //form validator
      'enter-valid-mobile-number': enterValidMobileNumber,
      'please-enter-a-valid-mobile-number': pleaseEnterValidMobileNumber,
      'enter-valid-email': enterValidEmail,
      'please-enter-a-valid-email': pleaseEnterValidEmail,

      //research page
      'search': search,

      //offline alert
      "you-are-offline": youAreOffline,

      //check boxes
      "receive-promotions-and-information": receivePromotionsAndInformation,
      "i-accept-the": iAcceptThe,
      "general-terms-conditions": generalTermsConditions,

      // general conditions alert
      "you-must-accept-conditions-to-continue":
          youMustAcceptConditionsToContinue,
      "would-you-like-to-accept": wouldYouLikeToAccept,
      "accept": accept,

      // order status
      "order-status": orderStatus,
      "Your-order-is-being-processed": yourOrderIsBeingProcessed,
      "your-request-has-not-been-taken-into-account":
          yourRequestHasNotBeenTakenIntoAccount,

      //ever maps
      "connection-problem-with-evermaps": connectionProblemWithEvermaps,

      //app errors
      "internal-server-error": internalServerError,

      //multi-language
      "fr_FR": languageFr,
      "en_EN": languageEn,
      "de_DE": languageDe,
      "language": language,
    };
  }
}
