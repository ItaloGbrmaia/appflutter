const _imgsRoot = 'assets/img';
// const _svgsRoot = 'assets/svg';
// const _iconsRoot = 'assets/img/icons';

enum AppImages {
  // logoSvg('$_svgsRoot/logo_svg.svg'),
  logo('$_imgsRoot/logo.png'),

  // Icons
  settingsIcon('$_imgsRoot/settings_icon.png'),

  whatsappLogo('$_imgsRoot/whatsapp_logo.png'),
  appleLogo('$_imgsRoot/apple_logo.png'),
  facebookLogo('$_imgsRoot/facebook_logo.png'),
  googleLogo('$_imgsRoot/google_logo.png'),
  ;

  const AppImages(this.path);

  final String path;
}
