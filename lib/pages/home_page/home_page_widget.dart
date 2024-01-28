import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'imageOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 4500.ms,
          begin: const Offset(0.0, 0.0),
          end: const Offset(-392.5, 0.0),
        ),
      ],
    ),
    'imageOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 4500.ms,
          begin: const Offset(392.5, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            _model.playerInitialY.toString(),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('setting');
              },
              child: Icon(
                Icons.settings_outlined,
                color: FlutterFlowTheme.of(context).accent4,
                size: 34.0,
              ),
            ),
            FlutterFlowIconButton(
              borderColor: FlutterFlowTheme.of(context).primary,
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              fillColor: FlutterFlowTheme.of(context).accent1,
              icon: Icon(
                Icons.settings_sharp,
                color: FlutterFlowTheme.of(context).accent4,
                size: 34.0,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              setState(() {
                _model.jumpIsAscending = true;
              });
              _model.playerJump = InstantTimer.periodic(
                duration: const Duration(milliseconds: 20),
                callback: (timer) async {
                  if (_model.jumpIsAscending!) {
                    setState(() {
                      _model.playerYAlignment = _model.playerYAlignment + -0.05;
                    });
                    if (_model.playerYAlignment <= _model.jumpPeakHeight) {
                      setState(() {
                        _model.jumpIsAscending = false;
                      });
                    }
                  } else {
                    setState(() {
                      _model.playerYAlignment = _model.playerYAlignment + 0.05;
                    });
                    if (_model.playerYAlignment >= _model.playerInitialY) {
                      setState(() {
                        _model.jumpIsAscending = false;
                        _model.playerYAlignment = _model.playerInitialY;
                      });
                      _model.playerJump?.cancel();
                    }
                  }
                },
                startImmediately: true,
              );
            },
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.8,
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/vanz3160_a_rectangular_tile_with_sky_birds_clouds_and_grass_in__d7f9cab1-3484-46f8-94bf-e09412d5aaeb.PNG',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        alignment: const Alignment(1.0, 0.7),
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['imageOnActionTriggerAnimation1']!,
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/vanz3160_a_rectangular_tile_with_sky_birds_clouds_and_grass_in__d7f9cab1-3484-46f8-94bf-e09412d5aaeb.PNG',
                      width: 4096.0,
                      height: 4096.0,
                      fit: BoxFit.fitHeight,
                      alignment: const Alignment(-1.0, 0.7),
                    ),
                  ).animateOnActionTrigger(
                    animationsMap['imageOnActionTriggerAnimation2']!,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(
                      -1.0,
                      valueOrDefault<double>(
                        _model.playerYAlignment,
                        0.0,
                      )),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 75.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Untitled_-_25_January_2024_22.29.45_2.png',
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(
                      valueOrDefault<double>(
                        _model.cactusXAlignment,
                        0.0,
                      ),
                      1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 75.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Untitled_-_25_January_2024_22.32.08.PNG',
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: 213.0,
                    height: 59.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'PlayerYAlignment: ${_model.playerYAlignment.toString()}',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        Text(
                          'cactusXAlignment: ${_model.cactusXAlignment.toString()}',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (animationsMap['imageOnActionTriggerAnimation1'] !=
                          null) {
                        animationsMap['imageOnActionTriggerAnimation1']!
                            .controller
                          ..reset()
                          ..repeat();
                      }
                      if (animationsMap['imageOnActionTriggerAnimation2'] !=
                          null) {
                        animationsMap['imageOnActionTriggerAnimation2']!
                            .controller
                          ..reset()
                          ..repeat();
                      }
                      _model.CactusMovement = InstantTimer.periodic(
                        duration: const Duration(milliseconds: 5),
                        callback: (timer) async {
                          setState(() {
                            _model.cactusXAlignment =
                                _model.cactusXAlignment + -0.05;
                            _model.backgroundXAlignment =
                                _model.backgroundXAlignment + -0.01;
                          });
                          if ((_model.cactusXAlignment <= -0.64) &&
                              (_model.cactusXAlignment >= -1.3) &&
                              (_model.playerYAlignment <= 1.0) &&
                              (_model.playerYAlignment >=
                                  _model.playerInitialY)) {
                            _model.playerJump?.cancel();
                            _model.CactusMovement?.cancel();
                            if (animationsMap[
                                    'imageOnActionTriggerAnimation1'] !=
                                null) {
                              animationsMap['imageOnActionTriggerAnimation1']!
                                  .controller
                                  .reset();
                            }
                            if (animationsMap[
                                    'imageOnActionTriggerAnimation2'] !=
                                null) {
                              animationsMap['imageOnActionTriggerAnimation2']!
                                  .controller
                                  .reset();
                            }
                          }
                          if (_model.cactusXAlignment <= -1.5) {
                            setState(() {
                              _model.cactusXAlignment = _model.cactusInitialX;
                              _model.backgroundXAlignment =
                                  _model.backgroundinitialX;
                            });
                          }
                        },
                        startImmediately: true,
                      );
                    },
                    text: 'Start Game !',
                    options: FFButtonOptions(
                      width: 200.0,
                      height: 60.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      setState(() {
                        _model.cactusXAlignment = 1.0;
                        _model.playerYAlignment = 1.0;
                      });
                      _model.CactusMovement?.cancel();
                      if (animationsMap['imageOnActionTriggerAnimation1'] !=
                          null) {
                        animationsMap['imageOnActionTriggerAnimation1']!
                            .controller
                            .reset();
                      }
                      if (animationsMap['imageOnActionTriggerAnimation2'] !=
                          null) {
                        animationsMap['imageOnActionTriggerAnimation2']!
                            .controller
                            .reset();
                      }
                    },
                    text: 'End Game',
                    options: FFButtonOptions(
                      width: 130.0,
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).tertiary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
