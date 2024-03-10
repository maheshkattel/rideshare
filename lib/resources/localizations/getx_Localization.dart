import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hint': 'Enter Email',
          'enable_location': 'Enable your Location',
          'enable_location_request':
              'Choose your location to start find the request around you',
          'use_my_location': 'Use my Location',
          'skip': 'skip for now',
          'privacy_policy':
              'At Rideshare, accessible from rideshare.com, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by rideshare and how we use it.If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in rideshare. This policy is not applicable to any information collected offline or via channels other than this website. Our Privacy Policy was created with the help of the Free Privacy Policy Generator.',
          'email_already_used':
              '[firebase_auth/email-already-in-use] The email address is already in use by another account.',
          'weak_password':
              '[firebase_auth/weak-password] Password should be at least 6 characters',
          'no_internet':
              '[firebase_auth/network-request-failed] A network error (such as timeout, interrupted connection or unreachable host) has occurred.',
          'badly_formatted_email':
              '[firebase_auth/invalid-email] The email address is badly formatted.',
          'invalid_credentials':
              '[firebase_auth/invalid-credential] The supplied auth credential is incorrect, malformed or has expired.',
          'request_timeout':
              'TimeoutException after 0:00:10.000000: Future not completed',
          'request_block':
              '[firebase_auth/too-many-requests] We have blocked all requests from this device due to unusual activity. Try again later.'
        }
      };
}
