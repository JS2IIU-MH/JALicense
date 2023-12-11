bool isJAcall(String callsign) {
  RegExp regJACall = RegExp(r'^[J78][A-S][0-9][A-Z]{2,3}$');

  return regJACall.hasMatch(callsign);
}
