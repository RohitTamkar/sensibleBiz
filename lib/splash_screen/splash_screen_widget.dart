import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'splash_screen_model.dart';
export 'splash_screen_model.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget>
    with TickerProviderStateMixin {
  late SplashScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 1000));
      if (!isWeb) {
        if (FFAppState().loggedIn) {
          if (FFAppState().outletId != null && FFAppState().outletId != '') {
            context.pushNamed('Dashboard');
          } else {
            context.pushNamed('OutletListPage');
          }
        } else {
          context.pushNamed('Login');

          return;
        }

        return;
      }
      setState(() {
        FFAppState().setDay = getCurrentTimestamp;
        FFAppState().expDay = functions.setExpiryTime(FFAppState().setDay!);
      });
      if (FFAppState().loggedIn) {
        if (FFAppState().outletId != null && FFAppState().outletId != '') {
          context.pushNamed('Dashboard');
        } else {
          context.pushNamed('OutletListPage');
        }
      } else {
        context.pushNamed('Login');
      }
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: Offset(0.0, -300.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Image.asset(
                'assets/images/Sensible_Logo_Large.png',
                width: MediaQuery.sizeOf(context).width * 0.65,
                height: MediaQuery.sizeOf(context).height * 0.3,
                fit: BoxFit.contain,
              ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.58,
                height: MediaQuery.sizeOf(context).height * 0.07,
                decoration: BoxDecoration(),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.3,
              height: MediaQuery.sizeOf(context).height * 0.06,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'Version 1.0.0',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Lora',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Lora'),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
