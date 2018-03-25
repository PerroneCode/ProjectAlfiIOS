//
//  Constants.swift
//  SeroundIOS
//
//  Created by Luis Perrone on 4/2/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import Foundation

class Constants {
    
    static let startUpColors                = [0xFCFCFA,0x007AFF,0xFF3B30,0xFFCC00,0xFF2D55]
    static let themeColor                   = 0xFCFCFA
    static let categoryArray                = ["Academics","Sports & Fitness","Technology","Aquatics","Arts","HandyWork","Beauty","Auto", "Care","Financial","Health","Other"]

    
    static let categoryColors               = [0xFF3B30,0x47D464,0x007AFF,0x5AC8FA,0xFFCC00,0xFF9500,0xFF2D55,0xA0601E,0xFE74B2,0x68FB86,0x5856D6,0x8E8E93]
    
    public static var API_KEY               = "AIzaSyCtm0kNy_msT7NL87tKneqLZYFcI2apKYk"
    
    //////////***********  Error Alert Messages ***************////////
    
    // alert string
    static let TITLE_WARNING                =       "Warning"
    static let TITLE_ERROR                  =       "Error"
    
    //error messages
    
    static let CHECK_EMAIL_EMPTY            = "Please input your email"
    static let CHECK_PASSWORD_EMPTY         = "Please input your password"
    static let CHECK_EMAIL_INVALID          = "Please input valid email"
    static let CHECK_FIRSTNAME_EMPTY        = "Please input your firstname"
    static let CHECK_LASTNAME_EMPTY         = "Please input your lastname"
    static let CHECK_AGE_EMPTY              = "Please input your age"
    static let CHECK_WEIGHT_EMPTY           = "Please input your weight"
    static let CHECK_FIRST_AND_LAST_NAME    = "Please input your first and last name"
    static let CHECK_PASSWORD_FORMAT        = "Password must be strong with minimum 8 characters"
    static let CHECK_PHONENUMBER_FORMAT     = "Please input a 10 digit phone number"
    static let CHECK_PHONENUMBER_EMPTY      = "Please input your phone number"
    
    //PROCESS VALUES
    
    static let PROCESS_SUCCESS              = "success"
    static let PROCESS_FAIL                 = "fail"
    
    static let ERROR_CONFIRM_PASSWORD       = "Password does not match"
    static let ERROR_EMPTY_USERNAME         = "Please input username"
    static let ERROR_NO_PROFILEIMAGE        = "Please select profile iamge"
    static let ERROR_EMPTY_NAME             = "Please input your name"
    static let ERROR_EMPTY_BUSINESS_VALUE   = "Please input the business detail"
    static let ERROR_EMPTY_BUSINESS_NAME    = "Please input the business name"
    static let ERROR_EMPTY_BUSINESS_REWARD  = "Please input the business reward"
    static let ERROR_EMPTY_LOGO             = "Please input the logo"
    static let ERROR_EMPTY_BACKGROUND       = "Please input the background"
    
    static let ERROR_INVALID_BUSINESSEMAIL  = "Please input valid business email address"
    static let ERROR_INVALID_CUSTOMEREMAIL  = "Please input valid customer email address"
    static let ERROR_NOENOUGHCARD           = "You have no enough cards!"
    static let ERROR_NOENOUGHPUNCHES        = "You have no enough punches for free!"
    
    
    static let ERROR_REGISTRATION_FAIL      = "User registration failed"
    static let ERROR_REGISTRATION_ALREADY_EXISTS = "The email address is already registered"
    
    static let SUCCESS_PROCESS              = "success"
    
    static let ERROR_FAIL_NETWORK           = "Network error has occurred. Please try again."
    
    
    ///////////////////
    //Server URL
    
 
    static let BASE_URL                     = "http://seround.herokuapp.com/"
    
    static let SERVER_URL = BASE_URL // + "/api/"
    
    
    /////////////////////
    //Request Strings
    
    static let REQ_SEARCH                   = SERVER_URL + "search"
    static let REQ_SEARCH_POPULAR           = SERVER_URL + "search_popular"
    static let REQ_SEARCH_CATEGORIZED       = SERVER_URL + "search_categorized"
    static let REQ_SEND_SMS_CODE            = SERVER_URL + "sms_send_code"
    static let REQ_VERIFY_SMS_CODE          = SERVER_URL + "sms_verify_code"
    static let REQ_FIND_EMAIL               = SERVER_URL + "find_email"
    static let REQ_REGISTER                 = SERVER_URL + "register"
    static let REQ_LOGIN                    = SERVER_URL + "login"
    static let REQ_VIEW_PROFILE             = SERVER_URL + "view_profile"
    static let REQ_LOAD_CONVERSATIONS       = SERVER_URL + "load_conversations"
    static let REQ_FAVORITE                 = SERVER_URL + "favorite"
    static let REQ_GET_APPOINTMENTS         = SERVER_URL + "get_appointments"
    static let REQ_GET_FAVORITES            = SERVER_URL + "getfavorites"
    static let REQ_GET_REQUESTS             = SERVER_URL + "get_requests"
    static let REQ_REQUEST_SERVICE          = SERVER_URL + "request"
    static let REQ_UPDATE_BADGE             = SERVER_URL + "update_badge"
    static let REQ_UPLOAD_AVATAR            = SERVER_URL + "v1/get_signed_url"
    static let REQ_CREATE_APPOINTMENT       = SERVER_URL + "create_appointment"
    static let REQ_COMPLETE_APPOINTMENT     = SERVER_URL + "complete_appointment"
    static let REQ_CANCEL_APPOINTMENT       = SERVER_URL + "cancel_appointment"
    static let REQ_DECLINE_APPOINTMENT      = SERVER_URL + "decline_appointment"
    static let REQ_DIRECT_MESSAGE           = SERVER_URL + "direct_message"
    static let REQ_RATE_PROVIDER            = SERVER_URL + "rate_provider"
    static let REQ_RATE_CUSTOMER            = SERVER_URL + "rate_customer"
    static let REQ_USER_CHECK               = SERVER_URL + "user_check"

    // Create Account Keys
    static let KEY_USER_FIRSTNAME           = "user_firstname"
    static let KEY_USER_LASTNAME            = "user_lastname"
    static let KEY_EMAIL                    = "email"
    static let KEY_PASSWORD                 = "password"
    static let KEY_PHONE_NUMBER             = "phone_number"
    static let KEY_IMAGE_DATA               = "data"
    static let KEY_DEVICE_ID                = "device_id"
    static let KEY_DEVICE_TOKEN             = "device_token"
    
    //Search Keys
    static let KEY_SERVICE                  = "service"
    static let KEY_CATEGORY                 = "category"
    static let KEY_LONGITUDE                = "longitude"
    static let KEY_LATITUDE                 = "latitude"
    static let KEY_MAXDISTANCE              = "maxDistance"
    
    // SMS Verification Keys
    static let KEY_PHONENUMBER              = "number"
    static let KEY_SMS_CODE                 = "code"
    
    // Direct Message Keys
    static let KEY_SENDER_ID                = "sender_id"
    static let KEY_SENDER_NAME              = "sender_name"
    static let KEY_RECIPIENT_ID             = "recipient_id"
    static let KEY_RECIPIENT_NAME           = "recipient_name"
    static let KEY_DATA                     = "data"
    
    // Favorite Keys
    static let KEY_POSTID                   = "postID"
    static let KEY_USERID                   = "userID"
    static let KEY_UNFAVORITE               = "unFavorite"
    
    // Request Keys
    static let KEY_CUSTOMER_NAME            = "customer_name"
    static let KEY_SERVICE_ID               = "service_id"
    static let KEY_SERVICE_PRIORITY         = "service_priority"
    static let KEY_CUSTOMER_AVATAR          = "customer_avatar"
    static let KEY_REQUEST_ID               = "request_id"
    
    // Appointment Keys
    static let KEY_APPOINTMENT_ID           = "appointment_id"
    static let KEY_USER_NAME                = "user_name"
    static let KEY_CUSTOMER_ID              = "customer_id"
    static let KEY_PROVIDER_NAME            = "provider_name"
    
    // Rating Keys
    static let KEY_PROVIDER_ID              = "provider_id"
    static let KEY_COMMENT                  = "comment"
    static let KEY_RATING                   = "rating"
    
    // Update Badge Keys
    static let KEY_CLEAR_BADGE              = "clear_badge"
    static let KEY_USER_ID                  = "user_id"
    
    //Response Results key.
    static let RES_SUCCESS                  = "success"
    
    static let RES_RESPONSE                 = "response"
    static let RES_RESULT                   = "res"
    static let RES_SERVICEPOSTS             = "serviceposts"
    static let RES_REQUESTS                 = "requests"
    static let RES_APPOINTMENTS             = "appointments"
    //static let RES_TRUE = "true"
    //static let RES_FALSE = "false"
    
    static let RES_ID                       = "_id"
    static let RES_POST_NAME                = "post_name"
    static let RES_PROVIDER_ID              = "provider_id"
    static let RES_PROVIDER_NAME            = "provider_name"
    static let RES_CUSTOMER_ID              = "customer_id"
    static let RES_COMMENT                  = "comment"
    static let RES_EMAIL                    = "email"
    static let RES_SERVICE                  = "service"
    static let RES_SERVICE_ID               = "service_id"
    static let RES_SERVICES                 = "services"
    static let RES_SERVICE_LOWER            = "service_lower"
    static let RES_SERVICE_LOWER_STR1       = "service_lower_str1"
    static let RES_SERVICE_LOWER_STR2       = "service_lower_str2"
    static let RES_CATEGORY                 = "category"
    static let RES_CERTIFIED                = "certified"
    static let RES_PRICE                    = "price"
    static let RES_V                        = "__v"
    static let RES_TOKEN                    = "token"
    static let RES_AVATAR                   = "avatar"
    static let RES_POST_DESCRIPTION         = "post_description"
    static let RES_RATINGS                  = "ratings"
    static let RES_RATINGS_SCORE            = "ratingsScore"
    static let RES_RATING                   = "rating"
    static let RES_REVIEWS                  = "reviews"
    static let RES_LOCATION                 = "location"
    static let RES_MEMBER_SINCE             = "memberSince"
    static let RES_AGE                      = "age"
    static let RES_WORK                     = "work"
    static let RES_LANGUAGES                = "languages"
    static let RES_OVERALL_RATING           = "overallRatings"
    static let RES_ABOUT_ME                 = "aboutMe"
    static let RES_SCHOOL                   = "school"
    static let RES_FAVORITE_SERVICES        = "favoriteServices"
    static let RES_EXPIRE_AT                = "expireAt"
    static let RES_CREATED                  = "created"
    static let RES_PENDING_REVIEWS          = "pending_reviews"
    static let RES_PROVIDER_AVATAR          = "provider_avatar"
    
    // NOTIFICATION CATEGORIES
    static let NEW_MESSAGE_CATEGORY         = "NEW_MESSAGE_CATEGORY"
    static let REQUEST_CATEGORY             = "REQUEST_CATEGORY"
    static let APPOINTMENT_CATEGORY         = "APPOINTMENT_CATEGORY"
    static let BADGE_CATEGORY               = "BADGE_CATEGORY"
 
}
