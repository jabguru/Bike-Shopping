// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bike1.png
  AssetGenImage get bike1 => const AssetGenImage('assets/images/bike1.png');

  /// File path: assets/images/bike2.png
  AssetGenImage get bike2 => const AssetGenImage('assets/images/bike2.png');

  /// File path: assets/images/bike3.png
  AssetGenImage get bike3 => const AssetGenImage('assets/images/bike3.png');

  /// File path: assets/images/helmet1.png
  AssetGenImage get helmet1 => const AssetGenImage('assets/images/helmet1.png');

  /// Directory path: assets/images/icons
  $AssetsImagesIconsGen get icons => const $AssetsImagesIconsGen();

  /// Directory path: assets/images/nav-bar-icons
  $AssetsImagesNavBarIconsGen get navBarIcons =>
      const $AssetsImagesNavBarIconsGen();

  /// List of all assets
  List<AssetGenImage> get values => [bike1, bike2, bike3, helmet1];
}

class $AssetsImagesIconsGen {
  const $AssetsImagesIconsGen();

  /// File path: assets/images/icons/accessory.svg
  SvgGenImage get accessory =>
      const SvgGenImage('assets/images/icons/accessory.svg');

  /// File path: assets/images/icons/bike.svg
  SvgGenImage get bike => const SvgGenImage('assets/images/icons/bike.svg');

  /// File path: assets/images/icons/mountain.svg
  SvgGenImage get mountain =>
      const SvgGenImage('assets/images/icons/mountain.svg');

  /// File path: assets/images/icons/road.svg
  SvgGenImage get road => const SvgGenImage('assets/images/icons/road.svg');

  /// List of all assets
  List<SvgGenImage> get values => [accessory, bike, mountain, road];
}

class $AssetsImagesNavBarIconsGen {
  const $AssetsImagesNavBarIconsGen();

  /// File path: assets/images/nav-bar-icons/bicycle.svg
  SvgGenImage get bicycle =>
      const SvgGenImage('assets/images/nav-bar-icons/bicycle.svg');

  /// File path: assets/images/nav-bar-icons/cart.svg
  SvgGenImage get cart =>
      const SvgGenImage('assets/images/nav-bar-icons/cart.svg');

  /// File path: assets/images/nav-bar-icons/doc.svg
  SvgGenImage get doc =>
      const SvgGenImage('assets/images/nav-bar-icons/doc.svg');

  /// File path: assets/images/nav-bar-icons/map.svg
  SvgGenImage get map =>
      const SvgGenImage('assets/images/nav-bar-icons/map.svg');

  /// File path: assets/images/nav-bar-icons/person.svg
  SvgGenImage get person =>
      const SvgGenImage('assets/images/nav-bar-icons/person.svg');

  /// List of all assets
  List<SvgGenImage> get values => [bicycle, cart, doc, map, person];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
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
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
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
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
