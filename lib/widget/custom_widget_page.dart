import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';

mystylepoppins(double size,[Color ? clr,FontWeight?fw]){
  return GoogleFonts.poppins(
    fontSize: size,
    color: clr,
    fontWeight: fw,
  );
}
mystyleroboto(double size,[Color ? clr,FontWeight?fw]){
  return GoogleFonts.roboto(
    fontSize: size,
    color: clr,
    fontWeight: fw,
  );
}

const Color textClrLight=Color(0xffFFFFFF);
const Color textClrDart=Color(0xffA7A9AC);