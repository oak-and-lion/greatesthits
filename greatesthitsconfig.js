// check for https protocol
if (location.protocol !== 'https:') {
    location.replace(`https:${location.href.substring(location.protocol.length)}`);
} else {
    // set the backend API
    greatest.apiUrl = "https://childsheartyoga.com/BandFunctions.aspx";
}

console.log("using Prod config");

greatestLoad.loadScript();
