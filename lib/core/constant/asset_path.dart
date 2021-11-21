class AssetsPath {
  static final AssetsPath _instance = AssetsPath._init();
  AssetsPath._init();
  factory AssetsPath() {
    return _instance;
  }

  final String delSVG = 'assets/del.svg';
  final String illustrationSVG = 'assets/illustration.svg';
  final String logoSVG = 'assets/logo.svg';
  final String shapeSVG = 'assets/shape.svg';
}
