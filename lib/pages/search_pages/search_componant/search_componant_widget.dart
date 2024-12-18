import '/backend/api_requests/api_calls.dart';
import '/componants/blank_componant/blank_componant_widget.dart';
import '/componants/search_empty_componant/search_empty_componant_widget.dart';
import '/components/single_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shimmers/main_list_shimmer/main_list_shimmer_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_componant_model.dart';
export 'search_componant_model.dart';

class SearchComponantWidget extends StatefulWidget {
  const SearchComponantWidget({super.key});

  @override
  State<SearchComponantWidget> createState() => _SearchComponantWidgetState();
}

class _SearchComponantWidgetState extends State<SearchComponantWidget> {
  late SearchComponantModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchComponantModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
      () async {
        _model.focus = true;
        safeSetState(() {});
      },
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        wrapWithModel(
          model: _model.singleAppbarModel,
          updateCallback: () => safeSetState(() {}),
          child: SingleAppbarWidget(
            title: 'Search',
          ),
        ),
        Expanded(
          child: FutureBuilder<ApiCallResponse>(
            future: CarServiceGroup.currencyApiCall.call(),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: Container(
                    width: 0.0,
                    height: 0.0,
                    child: BlankComponantWidget(),
                  ),
                );
              }
              final containerCurrencyApiResponse = snapshot.data!;

              return Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          Duration(milliseconds: 200),
                          () async {
                            if (_model.textController.text == null ||
                                _model.textController.text == '') {
                              _model.focus = false;
                              safeSetState(() {});
                              safeSetState(
                                  () => _model.apiRequestCompleter = null);
                              await _model.waitForApiRequestCompleted();
                            } else {
                              _model.focus = true;
                              safeSetState(() {});
                              safeSetState(
                                  () => _model.apiRequestCompleter = null);
                              await _model.waitForApiRequestCompleted();
                            }
                          },
                        ),
                        onFieldSubmitted: (_) async {
                          safeSetState(() => _model.apiRequestCompleter = null);
                          await _model.waitForApiRequestCompleted();
                          FFAppState()
                              .addToSearchList(_model.textController.text);
                          safeSetState(() {});
                          safeSetState(() {
                            _model.textController?.clear();
                          });
                        },
                        autofocus: false,
                        textInputAction: TextInputAction.search,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 17.0, 16.0, 17.0),
                          prefixIcon: Icon(
                            Icons.search,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'SF Pro Display',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: ListView(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              16.0,
                            ),
                            scrollDirection: Axis.vertical,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (_model.focus == false) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        if (FFAppState().searchList.isNotEmpty)
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Recent search',
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState().searchList = [];
                                                  safeSetState(() {});
                                                },
                                                child: Text(
                                                  'Clear all',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.5,
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                        Builder(
                                          builder: (context) {
                                            final searchList = FFAppState()
                                                .searchList
                                                .toList();

                                            return ListView.separated(
                                              padding: EdgeInsets.fromLTRB(
                                                0,
                                                24.0,
                                                0,
                                                24.0,
                                              ),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: searchList.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 16.0),
                                              itemBuilder:
                                                  (context, searchListIndex) {
                                                final searchListItem =
                                                    searchList[searchListIndex];
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/search.svg',
                                                          width: 24.0,
                                                          height: 24.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      searchListItem,
                                                      maxLines: 1,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight: 1.2,
                                                              ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ]
                                          .addToStart(SizedBox(height: 24.0))
                                          .addToEnd(SizedBox(height: 24.0)),
                                    );
                                  } else {
                                    return Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: (_model.apiRequestCompleter ??=
                                                Completer<ApiCallResponse>()
                                                  ..complete(CarServiceGroup
                                                      .searchServiceApiCall
                                                      .call(
                                                    search: _model
                                                        .textController.text,
                                                  )))
                                            .future,
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: MainListShimmerWidget(),
                                            );
                                          }
                                          final columnSearchServiceApiResponse =
                                              snapshot.data!;

                                          return Builder(
                                            builder: (context) {
                                              final searchItemList =
                                                  CarServiceGroup
                                                          .searchServiceApiCall
                                                          .packageDetails(
                                                            columnSearchServiceApiResponse
                                                                .jsonBody,
                                                          )
                                                          ?.toList() ??
                                                      [];
                                              if (searchItemList.isEmpty) {
                                                return Center(
                                                  child: Container(
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.6,
                                                    child:
                                                        SearchEmptyComponantWidget(),
                                                  ),
                                                );
                                              }

                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: List.generate(
                                                        searchItemList.length,
                                                        (searchItemListIndex) {
                                                  final searchItemListItem =
                                                      searchItemList[
                                                          searchItemListIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'AllCarDetailsPage',
                                                        queryParameters: {
                                                          'packageId':
                                                              serializeParam(
                                                            getJsonField(
                                                              searchItemListItem,
                                                              r'''$.id''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                          'packageName':
                                                              serializeParam(
                                                            getJsonField(
                                                              searchItemListItem,
                                                              r'''$.title''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                          'packageImage':
                                                              serializeParam(
                                                            getJsonField(
                                                              searchItemListItem,
                                                              r'''$.image''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                          'price':
                                                              serializeParam(
                                                            getJsonField(
                                                              searchItemListItem,
                                                              r'''$.price''',
                                                            ),
                                                            ParamType.double,
                                                          ),
                                                          'serviceId':
                                                              serializeParam(
                                                            getJsonField(
                                                              searchItemListItem,
                                                              r'''$.serviceDetails._id''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                          'serviceName':
                                                              serializeParam(
                                                            getJsonField(
                                                              searchItemListItem,
                                                              r'''$.serviceDetails.name''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                          'serviceImage':
                                                              serializeParam(
                                                            getJsonField(
                                                              searchItemListItem,
                                                              r'''$.serviceDetails.image''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                          'currencySymbol':
                                                              serializeParam(
                                                            CarServiceGroup
                                                                .currencyApiCall
                                                                .currency(
                                                              containerCurrencyApiResponse
                                                                  .jsonBody,
                                                            ),
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 345.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        16.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        16.0),
                                                              ),
                                                              child:
                                                                  CachedNetworkImage(
                                                                fadeInDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            200),
                                                                fadeOutDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            200),
                                                                imageUrl:
                                                                    '${FFAppConstants.imageUrl}${getJsonField(
                                                                  searchItemListItem,
                                                                  r'''$.image''',
                                                                ).toString()}',
                                                                width: double
                                                                    .infinity,
                                                                height: 174.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                                alignment:
                                                                    Alignment(
                                                                        -1.0,
                                                                        -1.0),
                                                              ),
                                                            ),
                                                            Expanded(
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
                                                                  Text(
                                                                    getJsonField(
                                                                      searchItemListItem,
                                                                      r'''$.title''',
                                                                    ).toString(),
                                                                    maxLines: 1,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'SF Pro Display',
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              false,
                                                                          lineHeight:
                                                                              1.5,
                                                                        ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              6.0),
                                                                          child:
                                                                              custom_widgets.GetCurrencySymboolBold(
                                                                            width:
                                                                                15.0,
                                                                            height:
                                                                                20.0,
                                                                            isSimbool:
                                                                                CarServiceGroup.currencyApiCall.currency(
                                                                              containerCurrencyApiResponse.jsonBody,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                18.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        getJsonField(
                                                                          searchItemListItem,
                                                                          r'''$.price''',
                                                                        ).toString(),
                                                                        maxLines:
                                                                            1,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'SF Pro Display',
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Expanded(
                                                                        child: custom_widgets
                                                                            .ReadMoreHtml(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              50.0,
                                                                          htmlContent:
                                                                              getJsonField(
                                                                            searchItemListItem,
                                                                            r'''$.description''',
                                                                          ).toString(),
                                                                          maxLength:
                                                                              60,
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              8.0,
                                                                              8.0),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(26.0, 12.0, 26.0, 12.0),
                                                                              child: Text(
                                                                                'Book now',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'SF Pro Display',
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  ),
                                                                ]
                                                                    .divide(SizedBox(
                                                                        height:
                                                                            1.0))
                                                                    .addToStart(
                                                                        SizedBox(
                                                                            height:
                                                                                2.0)),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                })
                                                    .divide(
                                                        SizedBox(height: 16.0))
                                                    .addToStart(
                                                        SizedBox(height: 24.0))
                                                    .addToEnd(
                                                        SizedBox(height: 24.0)),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
