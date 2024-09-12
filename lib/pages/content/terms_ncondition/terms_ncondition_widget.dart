import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'terms_ncondition_model.dart';
export 'terms_ncondition_model.dart';

class TermsNconditionWidget extends StatefulWidget {
  const TermsNconditionWidget({super.key});

  @override
  State<TermsNconditionWidget> createState() => _TermsNconditionWidgetState();
}

class _TermsNconditionWidgetState extends State<TermsNconditionWidget> {
  late TermsNconditionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsNconditionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 45.0,
                            icon: Icon(
                              Icons.chevron_left,
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              if (isWeb) {
                                FFAppState().expDay = functions
                                    .setExpiryTime(getCurrentTimestamp);
                                safeSetState(() {});
                              } else {
                                context.pop();
                                return;
                              }

                              context.pop();
                            },
                          ),
                          AutoSizeText(
                            'Company Details',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineMediumFamily),
                                ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 45.0,
                            icon: Icon(
                              Icons.chevron_left,
                              color: Colors.transparent,
                              size: 30.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 26,
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              height: MediaQuery.sizeOf(context).height * 0.75,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Html(
                                      data:
                                          '<h2><br />\nTerms &amp; Conditions</h2>\n\n<h4><br />\n<span style=\"font-size:14px\">INTRODUCTION :</span></h4>\n\n<p><span style=\"font-size:12px\">&nbsp; &nbsp; Founded in 2016, Sensible Connect Solutions Pvt. Ltd. has become a highly regarded entity involved in manufacturing and wholesaling best series of Billing Machine, POS Machine, Weighing Scale, Weighing Systems and many more.&nbsp;</span></p>\n\n<p><span style=\"font-size:12px\">&nbsp; &nbsp; These are widely acknowledged for their application specific design, accurate dimension, high performance, lightweight and durable finish standard.</span></p>\n\n<h4><span style=\"font-size:14px\">SUBSCRIPTION :</span></h4>\n\n<p><span style=\"font-size:12px\">&nbsp; &nbsp; To use the support &amp; services provided by the Sensible Connect Pvt Ltd you have to renew Subscription every year. Subscriptions packages and price may also vary with time.</span></p>\n\n<p><span style=\"font-size:12px\">&nbsp; &nbsp; If your subscription has been expiered then untill you do the payment/renew subscription, software services will be terminated</span></p>\n\n<h4><span style=\"font-size:14px\">PAYMENT :</span></h4>\n\n<p><span style=\"font-size:12px\">&nbsp; &nbsp; When you purchase a subscription, you must provide us with complete and accurate payment information.If we do not receive payment authorization or any authorization is subsequently cancelled, we may immediately terminate or suspend your access to your subscription.</span></p>\n\n<h4><span style=\"font-size:14px\">SERVICES :</span><br />\n&nbsp;&nbsp; &nbsp;<br />\n<span style=\"font-size:12px\">&nbsp; &nbsp; We provide you our serives &amp; support 24*7 to you. When new update is available ,it will be informed you.</span></h4>\n\n<p><span style=\"font-size:12px\">@Sensible Connect Solutions Pvt Ltd. All Rights Reserved (Terms &amp; Conditins,Privarcy Policy Link)</span></p>\n',
                                      onLinkTap: (url, _, __) =>
                                          launchURL(url!),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.05,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sensible Connect Solution Pvt Ltd',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Text(
                              'All Rights Reserved',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 11.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
