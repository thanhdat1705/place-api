//server local
//const URLSERVER = "http://192.168.1.77:9000";
// const URLSERVER = "http://192.168.43.45:9000";
//const URLSERVER = "http://192.168.43.45:9000";
// const URLSERVER = "http://192.168.1.77:9000";
//const URLSERVER = "http://192.168.43.45:9000";
//const URLSERVER = "http://192.168.137.1:9000";

//const URLSERVER = "https://places-information-backend.herokuapp.com";
//server main

const URLSERVER = "https://places-information-backend.azurewebsites.net";
const APIUSERAUTHORIZE = URLSERVER + "/api/v1/Accounts/SocialAuthentication";
const APIGETUSERPROFILE = URLSERVER + '/api/v1/Accounts/Profile';
const APIUPDATEUSERPROFILE = URLSERVER + '/api/v1/Accounts/ProfileUpdate';
const APISEARCHBRAND = URLSERVER + '/api/v1/Brands/Searching';
const APISEARCHFIELD = URLSERVER + '/api/v1/Fields/Searching';
const APISEARCHZONE = URLSERVER + '/api/v1/Zones/Searching';
const APISEARCHPROVINCE = URLSERVER + '/api/v1/Provinces/Searching';
const APISEARCHSTORE = URLSERVER + '/api/v1/Stores/Searching';
const APISTOREDETAIL = URLSERVER + '/api/v1/Stores';
const APIFOLLOWINGSTORE = URLSERVER + '/api/v1/Accounts/following/stores';
const APIGETFOLLOWINGSTORE = URLSERVER + '/api/v1/Accounts/followingStore';
const APISEARCHSTREET = URLSERVER + "/api/v1/Streets/Searching";
const APISEARCHSTREETSEGMENT = URLSERVER + "/api/v1/StreetSegments/Searching";
const APIGETSTREETSEGMENT = URLSERVER + "/api/v1/StreetSegments";
