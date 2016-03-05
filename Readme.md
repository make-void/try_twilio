# Twilio 

An example of how to use a Voice API (scenario: you receive a call, an automated voice tells you to input a bitcoin address)




### about hjson

---

notes about the hjson format used for the configuration file:

<http://hjson.org>

    npm i hjson -g


```js
var Hjson = require('hjson');

var obj = Hjson.parse(hjsonText);
var text2 = Hjson.stringify(obj);
```

If you don't like hjson use json, but hjson is cooler! :p

---

The Hjson syntax is a superset of JSON (see json.org) but allows you to

    add #, // or /**/ comments,
    omit "" for keys,
    omit "" for strings,
    omit , at the end of a line and
    use multiline strings with proper whitespace handling.
