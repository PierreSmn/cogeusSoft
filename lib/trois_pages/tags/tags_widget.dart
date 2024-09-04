import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/navbarnav/navbarnav_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'tags_model.dart';
export 'tags_model.dart';

class TagsWidget extends StatefulWidget {
  const TagsWidget({super.key});

  @override
  State<TagsWidget> createState() => _TagsWidgetState();
}

class _TagsWidgetState extends State<TagsWidget> {
  late TagsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TagsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(GetValidSubsCall.call(
              brand: FFAppState().activeBrand,
              limit: 9,
              offset: (_model.pageselect!) * 9,
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: SpinKitRing(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50,
                ),
              ),
            ),
          );
        }
        final tagsGetValidSubsResponse = snapshot.data!;

        return Title(
            title: 'tags',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: SafeArea(
                  top: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height * 1,
                        decoration: const BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.navbarnavModel,
                              updateCallback: () => safeSetState(() {}),
                              child: const NavbarnavWidget(
                                selectedIndex: 2,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).revoBG,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0, 32, 0, 20),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Flexible(
                                                    flex: 3,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        50,
                                                                        0,
                                                                        50,
                                                                        0),
                                                            child:
                                                                SingleChildScrollView(
                                                              controller: _model
                                                                  .columnController1,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.9,
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      controller:
                                                                          _model
                                                                              .columnController2,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).revoWhite,
                                                                              borderRadius: BorderRadius.circular(16),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(16, 28, 16, 16),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    'Tags',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          color: FlutterFlowTheme.of(context).revoCardTextColor,
                                                                                          fontSize: 40,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      context.pushNamed('invalids');
                                                                                    },
                                                                                    text: 'Vidéos exclues',
                                                                                    options: FFButtonOptions(
                                                                                      height: 26,
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                      color: const Color(0xFFD2D2D2),
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            fontSize: 13,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                      elevation: 0,
                                                                                      borderSide: const BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(16),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(const SizedBox(height: 12)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(const SizedBox(height: 24)),
                                                                      ),
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
                                                  Expanded(
                                                    flex: 12,
                                                    child:
                                                        SingleChildScrollView(
                                                      controller:
                                                          _model.scroll1,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        50,
                                                                        0,
                                                                        50,
                                                                        0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final validItem =
                                                                    tagsGetValidSubsResponse
                                                                        .jsonBody
                                                                        .toList();

                                                                return Wrap(
                                                                  spacing: 16,
                                                                  runSpacing:
                                                                      16,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      WrapCrossAlignment
                                                                          .start,
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  runAlignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  verticalDirection:
                                                                      VerticalDirection
                                                                          .down,
                                                                  clipBehavior:
                                                                      Clip.none,
                                                                  children: List.generate(
                                                                      validItem
                                                                          .length,
                                                                      (validItemIndex) {
                                                                    final validItemItem =
                                                                        validItem[
                                                                            validItemIndex];
                                                                    return Container(
                                                                      width:
                                                                          330,
                                                                      height:
                                                                          530,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .revoWhite,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            16,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children:
                                                                              [
                                                                            Flexible(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  FlutterFlowVideoPlayer(
                                                                                    path: getJsonField(
                                                                                      validItemItem,
                                                                                      r'''$.media_link''',
                                                                                    ).toString(),
                                                                                    videoType: VideoType.network,
                                                                                    width: 260,
                                                                                    height: 430,
                                                                                    autoPlay: false,
                                                                                    looping: true,
                                                                                    showControls: true,
                                                                                    allowFullScreen: true,
                                                                                    allowPlaybackSpeedMenu: false,
                                                                                    lazyLoad: false,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: 300,
                                                                              decoration: const BoxDecoration(),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      validItemItem,
                                                                                      r'''$.submitter_name''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          fontSize: 16,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                  RichText(
                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                    text: TextSpan(
                                                                                      children: [
                                                                                        const TextSpan(
                                                                                          text: 'Projet concerné : \n',
                                                                                          style: TextStyle(),
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: getJsonField(
                                                                                            validItemItem,
                                                                                            r'''$.slugDone''',
                                                                                          ).toString(),
                                                                                          style: const TextStyle(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontSize: 14,
                                                                                          ),
                                                                                        )
                                                                                      ],
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            fontSize: 12,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  SelectionArea(
                                                                                      child: Text(
                                                                                    getJsonField(
                                                                                      validItemItem,
                                                                                      r'''$.transcription''',
                                                                                    ).toString(),
                                                                                    maxLines: 4,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          fontSize: 12,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  )),
                                                                                ].divide(const SizedBox(height: 12)).addToStart(const SizedBox(height: 12)),
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          await launchURL('${getJsonField(
                                                                                            validItemItem,
                                                                                            r'''$.media_link''',
                                                                                          ).toString()}?download=${getJsonField(
                                                                                            validItemItem,
                                                                                            r'''$.slugDone''',
                                                                                          ).toString()}.mp4');
                                                                                        },
                                                                                        text: 'Télécharger',
                                                                                        icon: const Icon(
                                                                                          Icons.download_rounded,
                                                                                          size: 15,
                                                                                        ),
                                                                                        options: FFButtonOptions(
                                                                                          width: 200,
                                                                                          height: 30,
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                                                                          iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                          color: FlutterFlowTheme.of(context).cogeusNavSelected,
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                fontFamily: 'Manrope',
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                          elevation: 0,
                                                                                          borderSide: const BorderSide(
                                                                                            color: Colors.transparent,
                                                                                            width: 0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(16),
                                                                                        ),
                                                                                      ),
                                                                                      FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          await RejectedSubsTable().insert({
                                                                                            'submitter_name': getJsonField(
                                                                                              validItemItem,
                                                                                              r'''$.submitter_name''',
                                                                                            ).toString(),
                                                                                            'media_link': getJsonField(
                                                                                              validItemItem,
                                                                                              r'''$.media_link''',
                                                                                            ).toString(),
                                                                                            'brand_name': getJsonField(
                                                                                              validItemItem,
                                                                                              r'''$.brand_name''',
                                                                                            ).toString(),
                                                                                            'slugDone': getJsonField(
                                                                                              validItemItem,
                                                                                              r'''$.slugDone''',
                                                                                            ).toString(),
                                                                                            'email': getJsonField(
                                                                                              validItemItem,
                                                                                              r'''$.email''',
                                                                                            ).toString(),
                                                                                            'submitter_surname': getJsonField(
                                                                                              validItemItem,
                                                                                              r'''$.submitter_name''',
                                                                                            ).toString(),
                                                                                            'transcription': getJsonField(
                                                                                              validItemItem,
                                                                                              r'''$.transcription''',
                                                                                            ).toString(),
                                                                                            'rating': getJsonField(
                                                                                              validItemItem,
                                                                                              r'''$.rating''',
                                                                                            ),
                                                                                            'boolMail': getJsonField(
                                                                                              validItemItem,
                                                                                              r'''$.boolMail''',
                                                                                            ),
                                                                                            'question': getJsonField(
                                                                                              validItemItem,
                                                                                              r'''$.question''',
                                                                                            ).toString(),
                                                                                          });
                                                                                          await ValidSubsTable().delete(
                                                                                            matchingRows: (rows) => rows.eq(
                                                                                              'id',
                                                                                              getJsonField(
                                                                                                validItemItem,
                                                                                                r'''$.id''',
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                          safeSetState(() => _model.apiRequestCompleter = null);
                                                                                          await _model.waitForApiRequestCompleted();
                                                                                        },
                                                                                        text: 'Exclure',
                                                                                        icon: const Icon(
                                                                                          Icons.close_sharp,
                                                                                          size: 15,
                                                                                        ),
                                                                                        options: FFButtonOptions(
                                                                                          width: 200,
                                                                                          height: 25,
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                                                                          iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                          color: const Color(0xFFD2D2D2),
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                fontFamily: 'Manrope',
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                fontSize: 14,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                          elevation: 0,
                                                                                          borderSide: const BorderSide(
                                                                                            color: Colors.transparent,
                                                                                            width: 0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(16),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(const SizedBox(height: 8)).addToEnd(const SizedBox(height: 16)),
                                                                                  ),
                                                                                ),
                                                                              ].divide(const SizedBox(width: 8)),
                                                                            ),
                                                                          ].divide(const SizedBox(height: 12)),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            16,
                                                                            0,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    if (_model
                                                                            .pageselect !=
                                                                        0)
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          _model.pageselect =
                                                                              _model.pageselect! + -1;
                                                                          safeSetState(
                                                                              () {});
                                                                          await _model
                                                                              .scroll1
                                                                              ?.animateTo(
                                                                            0,
                                                                            duration:
                                                                                const Duration(milliseconds: 1),
                                                                            curve:
                                                                                Curves.ease,
                                                                          );
                                                                          safeSetState(() =>
                                                                              _model.apiRequestCompleter = null);
                                                                          await _model
                                                                              .waitForApiRequestCompleted();
                                                                        },
                                                                        text:
                                                                            'Page précedente',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              40,
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              24,
                                                                              0,
                                                                              24,
                                                                              0),
                                                                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          color:
                                                                              const Color(0xFFEEE8FC),
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Manrope',
                                                                                color: const Color(0xFF5E35B1),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                          elevation:
                                                                              0,
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(16),
                                                                        ),
                                                                      ),
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        _model.pageselect =
                                                                            _model.pageselect! +
                                                                                1;
                                                                        safeSetState(
                                                                            () {});
                                                                        await _model
                                                                            .scroll1
                                                                            ?.animateTo(
                                                                          0,
                                                                          duration:
                                                                              const Duration(milliseconds: 1),
                                                                          curve:
                                                                              Curves.ease,
                                                                        );
                                                                        safeSetState(() =>
                                                                            _model.apiRequestCompleter =
                                                                                null);
                                                                        await _model
                                                                            .waitForApiRequestCompleted();
                                                                      },
                                                                      text:
                                                                          'Page suivante',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            40,
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            24,
                                                                            0,
                                                                            24,
                                                                            0),
                                                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        color: const Color(
                                                                            0xFFEEE8FC),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'Manrope',
                                                                              color: const Color(0xFF5E35B1),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                        elevation:
                                                                            0,
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(16),
                                                                      ),
                                                                    ),
                                                                  ].divide(
                                                                      const SizedBox(
                                                                          width:
                                                                              16)),
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Affichage par : ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Manrope',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      FFAppState()
                                                                          .listQuantitySHow = 9;
                                                                      safeSetState(
                                                                          () {});
                                                                      safeSetState(() =>
                                                                          _model.apiRequestCompleter =
                                                                              null);
                                                                      await _model
                                                                          .waitForApiRequestCompleted();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: FFAppState().listQuantitySHow ==
                                                                              9
                                                                          ? 50.0
                                                                          : 25.0,
                                                                      height:
                                                                          30,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .revoWhite,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            '9',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      FFAppState()
                                                                          .listQuantitySHow = 18;
                                                                      safeSetState(
                                                                          () {});
                                                                      safeSetState(() =>
                                                                          _model.apiRequestCompleter =
                                                                              null);
                                                                      await _model
                                                                          .waitForApiRequestCompleted();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: FFAppState().listQuantitySHow ==
                                                                              18
                                                                          ? 50.0
                                                                          : 25.0,
                                                                      height:
                                                                          30,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .revoWhite,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            '18',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      FFAppState()
                                                                          .listQuantitySHow = 36;
                                                                      safeSetState(
                                                                          () {});
                                                                      safeSetState(() =>
                                                                          _model.apiRequestCompleter =
                                                                              null);
                                                                      await _model
                                                                          .waitForApiRequestCompleted();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: FFAppState().listQuantitySHow ==
                                                                              36
                                                                          ? 50.0
                                                                          : 25.0,
                                                                      height:
                                                                          30,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .revoWhite,
                                                                        borderRadius:
                                                                            BorderRadius.circular(16),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            '36',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(
                                                                    const SizedBox(
                                                                        width:
                                                                            6)),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(height: 16)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}