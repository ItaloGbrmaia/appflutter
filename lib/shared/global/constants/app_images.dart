const _imgsRoot = 'assets/img';
// const _svgsRoot = 'assets/svg';
// const _iconsRoot = 'assets/img/icons';

enum AppImages {
  // logoSvg('$_svgsRoot/logo_svg.svg'),
  logo('$_imgsRoot/logo.png'),

  // Icons
  settingsIcon('$_imgsRoot/settings_icon.png'),

  agenteIconColor('$_imgsRoot/agente_icon_color.png'),
  agenteIconWhite('$_imgsRoot/agente_icon_white.png'),
  agenteLogoColor('$_imgsRoot/agente_logo_color.png'),
  agenteLogoWhite('$_imgsRoot/agente_logo_white.png'),
  agenteLogoComplColor('$_imgsRoot/agente_logo_comp_color.png'),
  agenteLogoComplWhite('$_imgsRoot/agente_logo_comp_white.png'),

  loginImage1('$_imgsRoot/login_image_1.png'),
  loginImage2('$_imgsRoot/login_image_2.png'),
  loginImage3('$_imgsRoot/login_image_3.png'),

  whatsappLogo('$_imgsRoot/whatsapp_logo.png'),
  appleLogo('$_imgsRoot/apple_logo.png'),
  facebookLogo('$_imgsRoot/facebook_logo.png'),
  googleLogo('$_imgsRoot/google_logo.png'),

  // Dix
  dixLogo('$_imgsRoot/dix/dix_logo.png');

  const AppImages(this.path);

  final String path;
}
