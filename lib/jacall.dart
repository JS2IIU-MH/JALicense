bool isJAcall(String callsign) {
  RegExp regJACall = RegExp(r'^[J78][A-S][0-9][A-Z]{2,3}$');
  RegExp regJAPortable = RegExp(r'^[J78][A-S][0-9][A-Z]{2,3}/\w$');
  RegExp regKinen = RegExp(r'[8J|8N][0-9]\w{1,5}$');
  callsign = callsign.toUpperCase();

  bool isJAcall = regJACall.hasMatch(callsign);
  bool isJAPortable = regJAPortable.hasMatch(callsign);
  bool isKinen = regKinen.hasMatch(callsign);

  return isJAcall || isJAPortable || isKinen;
}
