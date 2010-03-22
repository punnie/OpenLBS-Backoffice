// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function draw_qrcode(text) {
    var qr = new QRCode(6, QRErrorCorrectLevel.H);
    qr.addData(text);
    qr.make();
    document.write("<table style='border-width: 0px; border-style: none; border-color: #0000ff; border-collapse: collapse;'>");
    for (var r = 0; r < qr.getModuleCount(); r++) {
        document.write("<tr>");
        for (var c = 0; c < qr.getModuleCount(); c++) {
            if (qr.isDark(r, c) ) {
                document.write("<td style='border-width: 0px; border-style: none; border-color: #0000ff; border-collapse: collapse; padding: 0; margin: 0; width: 6px; height: 6px; background-color: #000000;'/>");
            } else {
                document.write("<td style='border-width: 0px; border-style: none; border-color: #0000ff; border-collapse: collapse; padding: 0; margin: 0; width: 6px; height: 6px; background-color: #ffffff;'/>");
            }
        }
        document.write("</tr>");
    }
    document.write("</table>");
}
