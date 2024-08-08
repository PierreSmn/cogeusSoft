import '/backend/supabase/supabase.dart';
import '/components/change_color_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/trois_pages/navbarnav/navbarnav_widget.dart';
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'harvesters_model.dart';
export 'harvesters_model.dart';

class HarvestersWidget extends StatefulWidget {
  const HarvestersWidget({super.key});

  @override
  State<HarvestersWidget> createState() => _HarvestersWidgetState();
}

class _HarvestersWidgetState extends State<HarvestersWidget>
    with TickerProviderStateMixin {
  late HarvestersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasCheckboxTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HarvestersModel());

    animationsMap.addAll({
      'checkboxOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 720.0.ms,
            begin: const Offset(0.7, 0.7),
            end: const Offset(1.2, 1.2),
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

    return Title(
        title: 'harvesters',
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
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: const BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.navbarnavModel,
                          updateCallback: () => setState(() {}),
                          child: const NavbarnavWidget(
                            selectedIndex: 10,
                          ),
                        ),
                        Expanded(
                          child: FutureBuilder<List<LiveFlowsRow>>(
                            future: (_model.requestCompleter ??=
                                    Completer<List<LiveFlowsRow>>()
                                      ..complete(LiveFlowsTable().queryRows(
                                        queryFn: (q) => q.eq(
                                          'brand_name',
                                          FFAppState().activeBrand,
                                        ),
                                      )))
                                .future,
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitRing(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<LiveFlowsRow> containerLiveFlowsRowList =
                                  snapshot.data!;

                              return Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).revoBG,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      50.0, 0.0, 0.0, 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                    .fromSTEB(
                                                        0.0, 32.0, 0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final flows =
                                                        containerLiveFlowsRowList
                                                            .toList();

                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            flows.length,
                                                            (flowsIndex) {
                                                          final flowsItem =
                                                              flows[flowsIndex];
                                                          return Container(
                                                            width: 800.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .revoWhite,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                          32.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            380.0,
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              60.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  flowsItem.slug,
                                                                                  'noneFound',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Manrope',
                                                                                      color: FlutterFlowTheme.of(context).revoCardTextColorUnselected,
                                                                                      fontSize: 34.72,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                                                                                child: FutureBuilder<List<WebAppActivationsRow>>(
                                                                                  future: WebAppActivationsTable().queryRows(
                                                                                    queryFn: (q) => q
                                                                                        .eq(
                                                                                          'brandName',
                                                                                          FFAppState().activeBrand,
                                                                                        )
                                                                                        .eq(
                                                                                          'slug',
                                                                                          flowsItem.slug,
                                                                                        ),
                                                                                  ),
                                                                                  builder: (context, snapshot) {
                                                                                    // Customize what your widget looks like when it's loading.
                                                                                    if (!snapshot.hasData) {
                                                                                      return Center(
                                                                                        child: SizedBox(
                                                                                          width: 50.0,
                                                                                          height: 50.0,
                                                                                          child: SpinKitRing(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            size: 50.0,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                    List<WebAppActivationsRow> richTextWebAppActivationsRowList = snapshot.data!;

                                                                                    return RichText(
                                                                                      textScaler: MediaQuery.of(context).textScaler,
                                                                                      text: TextSpan(
                                                                                        children: [
                                                                                          const TextSpan(
                                                                                            text: 'Question :',
                                                                                            style: TextStyle(),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: flowsItem.expla2!,
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Manrope',
                                                                                              fontSize: 18.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              FutureBuilder<List<WebAppActivationsRow>>(
                                                                                future: WebAppActivationsTable().queryRows(
                                                                                  queryFn: (q) => q
                                                                                      .eq(
                                                                                        'brandName',
                                                                                        FFAppState().activeBrand,
                                                                                      )
                                                                                      .eq(
                                                                                        'slug',
                                                                                        flowsItem.slug,
                                                                                      ),
                                                                                ),
                                                                                builder: (context, snapshot) {
                                                                                  // Customize what your widget looks like when it's loading.
                                                                                  if (!snapshot.hasData) {
                                                                                    return Center(
                                                                                      child: SizedBox(
                                                                                        width: 50.0,
                                                                                        height: 50.0,
                                                                                        child: SpinKitRing(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 50.0,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  List<WebAppActivationsRow> richTextWebAppActivationsRowList = snapshot.data!;

                                                                                  return RichText(
                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                    text: TextSpan(
                                                                                      children: [
                                                                                        const TextSpan(
                                                                                          text: 'Démarrages : ',
                                                                                          style: TextStyle(),
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: richTextWebAppActivationsRowList.length.toString(),
                                                                                          style: const TextStyle(
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                        )
                                                                                      ],
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            fontSize: 18.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                              FutureBuilder<List<SubmittersNewRow>>(
                                                                                future: SubmittersNewTable().queryRows(
                                                                                  queryFn: (q) => q
                                                                                      .eq(
                                                                                        'brand_name',
                                                                                        FFAppState().activeBrand,
                                                                                      )
                                                                                      .eq(
                                                                                        'flow_done',
                                                                                        flowsItem.slug,
                                                                                      ),
                                                                                ),
                                                                                builder: (context, snapshot) {
                                                                                  // Customize what your widget looks like when it's loading.
                                                                                  if (!snapshot.hasData) {
                                                                                    return Center(
                                                                                      child: SizedBox(
                                                                                        width: 50.0,
                                                                                        height: 50.0,
                                                                                        child: SpinKitRing(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 50.0,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  List<SubmittersNewRow> richTextSubmittersNewRowList = snapshot.data!;

                                                                                  return RichText(
                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                    text: TextSpan(
                                                                                      children: [
                                                                                        const TextSpan(
                                                                                          text: 'Vidéos reçues : ',
                                                                                          style: TextStyle(),
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: richTextSubmittersNewRowList.length.toString(),
                                                                                          style: const TextStyle(
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                        )
                                                                                      ],
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            fontSize: 18.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                              FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  await Clipboard.setData(ClipboardData(text: 'app.cogeus.com/home?slug=${flowsItem.slug}'));
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        'Lien copié',
                                                                                        style: GoogleFonts.getFont(
                                                                                          'Manrope',
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                      ),
                                                                                      duration: const Duration(milliseconds: 4000),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).tertiary,
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                text: 'Copier le lien',
                                                                                icon: const Icon(
                                                                                  Icons.content_copy,
                                                                                  size: 15.0,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  height: 40.0,
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: const Color(0xFFEEE8FC),
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Manrope',
                                                                                        color: const Color(0xFF5E35B1),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                  elevation: 0.0,
                                                                                  borderSide: const BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 0.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(16.0),
                                                                                ),
                                                                              ),
                                                                              Builder(
                                                                                builder: (context) => FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    FFAppState().colorChange = false;
                                                                                    setState(() {});
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (dialogContext) {
                                                                                        return Dialog(
                                                                                          elevation: 0,
                                                                                          insetPadding: EdgeInsets.zero,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          child: GestureDetector(
                                                                                            onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                            child: SizedBox(
                                                                                              height: 450.0,
                                                                                              width: 750.0,
                                                                                              child: ChangeColorWidget(
                                                                                                title: flowsItem.colorTitle!,
                                                                                                text: flowsItem.colorText!,
                                                                                                button: flowsItem.colorButton!,
                                                                                                buttonTxt: flowsItem.colorButtonText!,
                                                                                                id: flowsItem.id,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );

                                                                                    if (FFAppState().colorChange) {
                                                                                      setState(() => _model.requestCompleter = null);
                                                                                      await _model.waitForRequestCompleted();
                                                                                    } else {
                                                                                      return;
                                                                                    }
                                                                                  },
                                                                                  text: 'Modifier les couleurs',
                                                                                  icon: const Icon(
                                                                                    Icons.mode_edit,
                                                                                    size: 15.0,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    height: 40.0,
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: const Color(0xFFEEE8FC),
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          color: const Color(0xFF5E35B1),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                    elevation: 0.0,
                                                                                    borderSide: const BorderSide(
                                                                                      color: Colors.transparent,
                                                                                      width: 0.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(const SizedBox(height: 12.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                310.0,
                                                                            height:
                                                                                640.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(40.0),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                width: 5.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                              child: SingleChildScrollView(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 50.0, 0.0),
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: Image.network(
                                                                                          valueOrDefault<String>(
                                                                                            flowsItem.logoUrl,
                                                                                            'https://99designs-blog.imgix.net/blog/wp-content/uploads/2016/08/featured.png?auto=format&q=60&w=2060&h=1158.75&fit=crop&crop=faces',
                                                                                          ),
                                                                                          width: 300.0,
                                                                                          height: 90.0,
                                                                                          fit: BoxFit.contain,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    RichText(
                                                                                      textScaler: MediaQuery.of(context).textScaler,
                                                                                      text: TextSpan(
                                                                                        children: [
                                                                                          TextSpan(
                                                                                            text: valueOrDefault<String>(
                                                                                              flowsItem.giftName,
                                                                                              'noGift',
                                                                                            ),
                                                                                            style: const TextStyle(),
                                                                                          )
                                                                                        ],
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Manrope',
                                                                                              fontSize: 27.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: Image.network(
                                                                                        valueOrDefault<String>(
                                                                                          flowsItem.giftImageLink,
                                                                                          'https://pifcxlqwffdrqcwggoqb.supabase.co/storage/v1/object/public/conversations/ffUploads/1723027782863000.jpg',
                                                                                        ),
                                                                                        width: 300.0,
                                                                                        height: 250.0,
                                                                                        fit: BoxFit.contain,
                                                                                      ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                          child: Theme(
                                                                                            data: ThemeData(
                                                                                              checkboxTheme: CheckboxThemeData(
                                                                                                visualDensity: VisualDensity.compact,
                                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                                ),
                                                                                              ),
                                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                            ),
                                                                                            child: Checkbox(
                                                                                              value: _model.checkboxValueMap[flowsItem] ??= true,
                                                                                              onChanged: (newValue) async {
                                                                                                setState(() => _model.checkboxValueMap[flowsItem] = newValue!);
                                                                                              },
                                                                                              side: BorderSide(
                                                                                                width: 2,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              ),
                                                                                              activeColor: FlutterFlowTheme.of(context).tertiary,
                                                                                              checkColor: FlutterFlowTheme.of(context).success,
                                                                                            ),
                                                                                          ).animateOnActionTrigger(animationsMap['checkboxOnActionTriggerAnimation']!, hasBeenTriggered: hasCheckboxTriggered),
                                                                                        ),
                                                                                        Flexible(
                                                                                          child: RichText(
                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                            text: TextSpan(
                                                                                              children: [
                                                                                                const TextSpan(
                                                                                                  text: 'J\'accepte les ',
                                                                                                  style: TextStyle(),
                                                                                                ),
                                                                                                TextSpan(
                                                                                                  text: 'Conditions Générales',
                                                                                                  style: TextStyle(
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  ),
                                                                                                  mouseCursor: SystemMouseCursors.click,
                                                                                                  recognizer: TapGestureRecognizer()
                                                                                                    ..onTap = () async {
                                                                                                      await launchURL('https://www.cogeus.com/terms-of-use');
                                                                                                    },
                                                                                                ),
                                                                                                const TextSpan(
                                                                                                  text: ' et que ma vidéo apparaisse dans les communications de ',
                                                                                                  style: TextStyle(),
                                                                                                ),
                                                                                                const TextSpan(
                                                                                                  text: 'MARQUE',
                                                                                                  style: TextStyle(),
                                                                                                )
                                                                                              ],
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    FFButtonWidget(
                                                                                      onPressed: () {
                                                                                        print('Button pressed ...');
                                                                                      },
                                                                                      text: 'J\'enregistre ma vidéo',
                                                                                      options: FFButtonOptions(
                                                                                        width: 260.0,
                                                                                        height: 38.0,
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: flowsItem.colorButton != null && flowsItem.colorButton != ''
                                                                                            ? colorFromCssString(
                                                                                                flowsItem.colorButton!,
                                                                                                defaultColor: FlutterFlowTheme.of(context).primary,
                                                                                              )
                                                                                            : FlutterFlowTheme.of(context).primary,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'Manrope',
                                                                                              color: flowsItem.colorButtonText != null && flowsItem.colorButtonText != ''
                                                                                                  ? colorFromCssString(
                                                                                                      flowsItem.colorButtonText!,
                                                                                                      defaultColor: FlutterFlowTheme.of(context).primary,
                                                                                                    )
                                                                                                  : FlutterFlowTheme.of(context).primaryBackground,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        elevation: 0.0,
                                                                                        borderSide: const BorderSide(
                                                                                          color: Colors.transparent,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(7.0),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(const SizedBox(height: 16.0)).addToStart(const SizedBox(height: 12.0)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    height:
                                                                        12.0)),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
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
  }
}
