# cordova-plugin-phone-dialer
Plugin for **cordova greater or equal than v3.0.0_** to enable to call Mobile.

##Installation

Just type the following statement in your cli Cordova for install.

`cordova plugin add https://github.com/CetasLakshman/cordova-plugin-phone-dialer.git`

if you want to install a specific version just add `#v<version>` to the link

Example:

`cordova plugin add https://github.com/CetasLakshman/cordova-plugin-phone-dialer.git#v0.0.1`

Description
===========
Enables Cordova apps on the iPhone and Android platforms
to dial a phone number without requireing additional user
interaction (such as the 'Call / Cancel' popup that ordinarilly 
would occur when using window.location.href = "tel:2125551212".


Usage
=====

```javascript

Error return by the plugin : ["feature","empty"]

phonedialer.dial(
  "2125551212", 
  function(err) {
    if (err == "empty") alert("Unknown phone number");
    else alert("Dialer Error:" + err);    
  },
  function(success) { alert('Dialing succeeded'); }
 );

```

##License

This plugin was created under the MIT license.