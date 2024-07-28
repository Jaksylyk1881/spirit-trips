import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';

import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';

class AddressSearchModal extends StatefulWidget {
  final bool reverse;
  final Function(Prediction prediction) callback;
  const AddressSearchModal({
    super.key,
    this.reverse = false,
    required this.callback,
  });

  static Future<void> show(
    BuildContext context, {
    String? title,
    required Function(Prediction prediction) callback,
  }) async =>
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        useRootNavigator: true,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        builder: (_) => AddressSearchModal(
          callback: callback,
        ),
      );
  @override
  State<AddressSearchModal> createState() => _AddressSearchModalState();
}

class _AddressSearchModalState extends State<AddressSearchModal> {
  // final _prefs = locator<Prefs>();
  final apiKey = '';
  // late GooglePlace googlePlace;
  // List<AutocompletePrediction> predictions = [];
  // DetailsResult? detailsResult;
  TextEditingController searchController = TextEditingController();
  FocusNode searchNode = FocusNode();
  ScrollController scrollController = ScrollController();
  String address = '';
  String? currentAddress;
  // Position? currentPosition;

  // Future<void> autoCompleteSearch(String value) async {
  //   final result = await googlePlace.autocomplete.get(value, language: 'ru', region: 'KZ', radius: 50000);
  //   if (result != null && result.predictions != null && mounted) {
  //     setState(() {
  //       predictions = result.predictions!;
  //       predictions += predictions;
  //     });
  //   }
  // }

  // Future<void> getDetails(String placeId) async {
  //   final result = await googlePlace.details.get(placeId);
  //   debugPrint('getDetails result ::: ${result?.result}');
  //   if (result != null) {
  //     detailsResult = result.result;
  //   }
  //   // if (result != null && result.result != null && mounted) {
  //   //   setState(() {
  //   //     detailsResult = result.result;
  //   //   });
  //   // }
  // }

  // Future<void> checkLocations() async {
  //   final address = await _prefs.getAddress();
  //   setState(() {
  //     this.address = address!;
  //   });
  // }

  // Future<void> getCurrentAddressAndPosition() async {
  //   try {
  //     Position? tempPostion;
  //     await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high,
  //     ).then((Position position) async {
  //       tempPostion = position;
  //       currentPosition = position;
  //       log('🌐🌐🌐🌐🌐##### getCurrentAddressAndPosition::: $currentPosition');
  //     }).catchError((e) {
  //       log('$e');
  //     });

  //     if (tempPostion == null) return;
  //     final List<Placemark> p = await placemarkFromCoordinates(
  //       tempPostion!.latitude,
  //       tempPostion!.longitude,
  //     );

  //     final Placemark place = p[0];

  //     setState(() {
  //       currentAddress = '${place.name}, ${place.locality}';
  //       // "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
  //     });
  //     log('🌐🌐🌐🌐🌐##### getCurrentAddressAndPosition ::: $currentAddress');
  //   } catch (e) {
  //     log('$e');
  //   }
  // }

  @override
  void initState() {
    // googlePlace = GooglePlace(apiKey);
    // getCurrentAddressAndPosition();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    searchNode.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GooglePlaceAutoCompleteTextField(
                  textEditingController: searchController,
                  googleAPIKey: apiKey,
                  debounceTime: 800, // default 600 ms,
                  countries: const ["kz", "sa"], // optional by default null is set
                  getPlaceDetailWithLatLng: (Prediction prediction) {
                    // this method will return latlng with place detail

                    log("placeDetails${prediction.lng}");
                    widget.callback.call(prediction);
                    context.router.maybePop();
                  }, // this callback is called when isLatLngRequired is true
                  itemClick: (Prediction prediction) {
                    // context.router.maybePop();
                    // searchController.text = prediction.description ?? '';
                    // searchController.selection =
                    //     TextSelection.fromPosition(TextPosition(offset: prediction.description?.length ?? 1));
                  },
                  // if we want to make custom list item builder
                  // itemBuilder: (context, index, Prediction prediction) {
                  //   return Container(
                  //     decoration: const BoxDecoration(color: Colors.amber),
                  //     padding: const EdgeInsets.all(10),
                  //     child: Text(prediction.placeId ?? ""),
                  //   );
                  // },
                  // if you want to add seperator between list items
                  // seperatedBuilder: const Divider(),
                  // optional container padding
                  containerHorizontalPadding: 10,
                  // place type
                  placeType: PlaceType.geocode,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
