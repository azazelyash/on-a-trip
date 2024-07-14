/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Accessibilty.png
  AssetGenImage get accessibilty =>
      const AssetGenImage('assets/images/Accessibilty.png');

  /// File path: assets/images/Breakfast.png
  AssetGenImage get breakfast =>
      const AssetGenImage('assets/images/Breakfast.png');

  /// File path: assets/images/Entertainmernt.png
  AssetGenImage get entertainmernt =>
      const AssetGenImage('assets/images/Entertainmernt.png');

  /// File path: assets/images/Parking.png
  AssetGenImage get parking => const AssetGenImage('assets/images/Parking.png');

  /// File path: assets/images/Restaurant.png
  AssetGenImage get restaurant =>
      const AssetGenImage('assets/images/Restaurant.png');

  /// File path: assets/images/Wifi.png
  AssetGenImage get wifi => const AssetGenImage('assets/images/Wifi.png');

  /// File path: assets/images/business_user.png
  AssetGenImage get businessUser =>
      const AssetGenImage('assets/images/business_user.png');

  /// File path: assets/images/holiday_package.jpg
  AssetGenImage get holidayPackage =>
      const AssetGenImage('assets/images/holiday_package.jpg');

  /// File path: assets/images/hotelier.png
  AssetGenImage get hotelier =>
      const AssetGenImage('assets/images/hotelier.png');

  /// File path: assets/images/hotels.jpg
  AssetGenImage get hotels => const AssetGenImage('assets/images/hotels.jpg');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/onboarding_1.png
  AssetGenImage get onboarding1 =>
      const AssetGenImage('assets/images/onboarding_1.png');

  /// File path: assets/images/onboarding_2.png
  AssetGenImage get onboarding2 =>
      const AssetGenImage('assets/images/onboarding_2.png');

  /// File path: assets/images/onboarding_3.png
  AssetGenImage get onboarding3 =>
      const AssetGenImage('assets/images/onboarding_3.png');

  /// File path: assets/images/show_all.jpg
  AssetGenImage get showAll =>
      const AssetGenImage('assets/images/show_all.jpg');

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  /// File path: assets/images/splash_bg.png
  AssetGenImage get splashBg =>
      const AssetGenImage('assets/images/splash_bg.png');

  /// File path: assets/images/splash_logo.png
  AssetGenImage get splashLogo =>
      const AssetGenImage('assets/images/splash_logo.png');

  /// File path: assets/images/transporter.png
  AssetGenImage get transporter =>
      const AssetGenImage('assets/images/transporter.png');

  /// File path: assets/images/transports.jpg
  AssetGenImage get transports =>
      const AssetGenImage('assets/images/transports.jpg');

  /// File path: assets/images/travel_agent.png
  AssetGenImage get travelAgent =>
      const AssetGenImage('assets/images/travel_agent.png');

  /// File path: assets/images/traveller.png
  AssetGenImage get traveller =>
      const AssetGenImage('assets/images/traveller.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        accessibilty,
        breakfast,
        entertainmernt,
        parking,
        restaurant,
        wifi,
        businessUser,
        holidayPackage,
        hotelier,
        hotels,
        logo,
        onboarding1,
        onboarding2,
        onboarding3,
        showAll,
        splash,
        splashBg,
        splashLogo,
        transporter,
        transports,
        travelAgent,
        traveller
      ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/bid.svg
  SvgGenImage get bid => const SvgGenImage('assets/svg/bid.svg');

  /// File path: assets/svg/google.svg
  SvgGenImage get google => const SvgGenImage('assets/svg/google.svg');

  /// File path: assets/svg/home.svg
  SvgGenImage get home => const SvgGenImage('assets/svg/home.svg');

  /// File path: assets/svg/key.svg
  SvgGenImage get key => const SvgGenImage('assets/svg/key.svg');

  /// File path: assets/svg/map.svg
  SvgGenImage get map => const SvgGenImage('assets/svg/map.svg');

  /// File path: assets/svg/notification.svg
  SvgGenImage get notification =>
      const SvgGenImage('assets/svg/notification.svg');

  /// File path: assets/svg/phone.svg
  SvgGenImage get phone => const SvgGenImage('assets/svg/phone.svg');

  /// File path: assets/svg/profile.svg
  SvgGenImage get profile => const SvgGenImage('assets/svg/profile.svg');

  /// List of all assets
  List<SvgGenImage> get values =>
      [bid, google, home, key, map, notification, phone, profile];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final BytesLoader loader;
    if (_isVecFormat) {
      loader = AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
