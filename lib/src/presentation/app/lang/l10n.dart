// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `SEO WebMas`
  String get appName {
    return Intl.message(
      'SEO WebMas',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Versión`
  String get version {
    return Intl.message(
      'Versión',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `No se puedo realizar la llamada`
  String get callCouldNotBeMade {
    return Intl.message(
      'No se puedo realizar la llamada',
      name: 'callCouldNotBeMade',
      desc: '',
      args: [],
    );
  }

  /// `No se puedo enviar el email`
  String get emailCouldNotBeSend {
    return Intl.message(
      'No se puedo enviar el email',
      name: 'emailCouldNotBeSend',
      desc: '',
      args: [],
    );
  }

  /// `No se puedo abrir la URL`
  String get urlCouldNotBeOpen {
    return Intl.message(
      'No se puedo abrir la URL',
      name: 'urlCouldNotBeOpen',
      desc: '',
      args: [],
    );
  }

  /// `Ajustes`
  String get settings {
    return Intl.message(
      'Ajustes',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Opciones de desarrollo`
  String get developmentOptions {
    return Intl.message(
      'Opciones de desarrollo',
      name: 'developmentOptions',
      desc: '',
      args: [],
    );
  }

  /// `No hay datos`
  String get noData {
    return Intl.message(
      'No hay datos',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Ocurrió un error`
  String get errorOcurred {
    return Intl.message(
      'Ocurrió un error',
      name: 'errorOcurred',
      desc: '',
      args: [],
    );
  }

  /// `Sitios web`
  String get webSites {
    return Intl.message(
      'Sitios web',
      name: 'webSites',
      desc: '',
      args: [],
    );
  }

  /// `Suscripciones`
  String get subscriptions {
    return Intl.message(
      'Suscripciones',
      name: 'subscriptions',
      desc: '',
      args: [],
    );
  }

  /// `Salir`
  String get logout {
    return Intl.message(
      'Salir',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Calcular`
  String get calculate {
    return Intl.message(
      'Calcular',
      name: 'calculate',
      desc: '',
      args: [],
    );
  }

  /// `Cancelar`
  String get cancel {
    return Intl.message(
      'Cancelar',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Seleccione el plan`
  String get selectPackage {
    return Intl.message(
      'Seleccione el plan',
      name: 'selectPackage',
      desc: '',
      args: [],
    );
  }

  /// `Cantidad de sitios web`
  String get websitesAmount {
    return Intl.message(
      'Cantidad de sitios web',
      name: 'websitesAmount',
      desc: '',
      args: [],
    );
  }

  /// `Cantidad de meses`
  String get monthsAmount {
    return Intl.message(
      'Cantidad de meses',
      name: 'monthsAmount',
      desc: '',
      args: [],
    );
  }

  /// `Analiza con `
  String get analyzeWith {
    return Intl.message(
      'Analiza con ',
      name: 'analyzeWith',
      desc: '',
      args: [],
    );
  }

  /// `Copyright © 2023 Universidad de las Ciencias Informáticas. Todos los derechos reservados.`
  String get copyright {
    return Intl.message(
      'Copyright © 2023 Universidad de las Ciencias Informáticas. Todos los derechos reservados.',
      name: 'copyright',
      desc: '',
      args: [],
    );
  }

  /// ` el estado de indicadores que tributan a elevar la calidad de un sitio web y obtén datos asociados al tráfico que se genera hacia el sitio web captados por la herramienta`
  String get status {
    return Intl.message(
      ' el estado de indicadores que tributan a elevar la calidad de un sitio web y obtén datos asociados al tráfico que se genera hacia el sitio web captados por la herramienta',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// ` TELUS.`
  String get telusPoint {
    return Intl.message(
      ' TELUS.',
      name: 'telusPoint',
      desc: '',
      args: [],
    );
  }

  /// `Todo desde una única plataforma.`
  String get onlyPlatform {
    return Intl.message(
      'Todo desde una única plataforma.',
      name: 'onlyPlatform',
      desc: '',
      args: [],
    );
  }

  /// `Conoce el estado de tu sitio`
  String get knowYourSite {
    return Intl.message(
      'Conoce el estado de tu sitio',
      name: 'knowYourSite',
      desc: '',
      args: [],
    );
  }

  /// `https://www.ejemplo.cu`
  String get urlExample {
    return Intl.message(
      'https://www.ejemplo.cu',
      name: 'urlExample',
      desc: '',
      args: [],
    );
  }

  /// `Pruebe aquí`
  String get testHere {
    return Intl.message(
      'Pruebe aquí',
      name: 'testHere',
      desc: '',
      args: [],
    );
  }

  /// `Válido por un período de 7 días`
  String get validSevenDays {
    return Intl.message(
      'Válido por un período de 7 días',
      name: 'validSevenDays',
      desc: '',
      args: [],
    );
  }

  /// `Explora tu sitio web y descubre su nivel de optimización.`
  String get exploreYourWebsite {
    return Intl.message(
      'Explora tu sitio web y descubre su nivel de optimización.',
      name: 'exploreYourWebsite',
      desc: '',
      args: [],
    );
  }

  /// `Recibe alertas ante la caída del sitio web o tiempos de respuestas elevados.`
  String get alertsWebSite {
    return Intl.message(
      'Recibe alertas ante la caída del sitio web o tiempos de respuestas elevados.',
      name: 'alertsWebSite',
      desc: '',
      args: [],
    );
  }

  /// `Sigue de cerca a tu audiencia mediante el uso de TELUS.`
  String get telusWebSite {
    return Intl.message(
      'Sigue de cerca a tu audiencia mediante el uso de TELUS.',
      name: 'telusWebSite',
      desc: '',
      args: [],
    );
  }

  /// `Acompañamientos profesionales.`
  String get professionalWebSite {
    return Intl.message(
      'Acompañamientos profesionales.',
      name: 'professionalWebSite',
      desc: '',
      args: [],
    );
  }

  /// `Nuestros servicios `
  String get oursServices {
    return Intl.message(
      'Nuestros servicios ',
      name: 'oursServices',
      desc: '',
      args: [],
    );
  }

  /// `Nuestros `
  String get ours {
    return Intl.message(
      'Nuestros ',
      name: 'ours',
      desc: '',
      args: [],
    );
  }

  /// `Servicios`
  String get services {
    return Intl.message(
      'Servicios',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// ` Ver más...`
  String get seeMore {
    return Intl.message(
      ' Ver más...',
      name: 'seeMore',
      desc: '',
      args: [],
    );
  }

  /// `Planes`
  String get plans {
    return Intl.message(
      'Planes',
      name: 'plans',
      desc: '',
      args: [],
    );
  }

  /// `Estimar cotización`
  String get estimate {
    return Intl.message(
      'Estimar cotización',
      name: 'estimate',
      desc: '',
      args: [],
    );
  }

  /// `Suscribirse`
  String get subscribe {
    return Intl.message(
      'Suscribirse',
      name: 'subscribe',
      desc: '',
      args: [],
    );
  }

  /// `Campo requerido`
  String get requiredField {
    return Intl.message(
      'Campo requerido',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Usuario`
  String get user {
    return Intl.message(
      'Usuario',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña`
  String get password {
    return Intl.message(
      'Contraseña',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Entrar`
  String get login {
    return Intl.message(
      'Entrar',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Autenticarse`
  String get authenticate {
    return Intl.message(
      'Autenticarse',
      name: 'authenticate',
      desc: '',
      args: [],
    );
  }

  /// `Reintentar`
  String get retry {
    return Intl.message(
      'Reintentar',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Importe total`
  String get totalAmount {
    return Intl.message(
      'Importe total',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Descuento por cantidad de sitios`
  String get discountForNumberOfSites {
    return Intl.message(
      'Descuento por cantidad de sitios',
      name: 'discountForNumberOfSites',
      desc: '',
      args: [],
    );
  }

  /// `Descuento por cantidad de meses`
  String get discountForNumberOfMonths {
    return Intl.message(
      'Descuento por cantidad de meses',
      name: 'discountForNumberOfMonths',
      desc: '',
      args: [],
    );
  }

  /// `Importe a pagar`
  String get amountToPay {
    return Intl.message(
      'Importe a pagar',
      name: 'amountToPay',
      desc: '',
      args: [],
    );
  }

  /// `Actualmente no tiene ningún sitio web. Suscríbase a uno de nuestros planes para que puede agregar sus sitios web.`
  String get youDoNotHaveWebSite {
    return Intl.message(
      'Actualmente no tiene ningún sitio web. Suscríbase a uno de nuestros planes para que puede agregar sus sitios web.',
      name: 'youDoNotHaveWebSite',
      desc: '',
      args: [],
    );
  }

  /// `Presione nuevamente para salir`
  String get pressAgainToExit {
    return Intl.message(
      'Presione nuevamente para salir',
      name: 'pressAgainToExit',
      desc: '',
      args: [],
    );
  }

  /// `Acerca de`
  String get aboutUs {
    return Intl.message(
      'Acerca de',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `seowebmas.redcuba.cu`
  String get website {
    return Intl.message(
      'seowebmas.redcuba.cu',
      name: 'website',
      desc: '',
      args: [],
    );
  }

  /// `monitorredcuba@uci.cu`
  String get email {
    return Intl.message(
      'monitorredcuba@uci.cu',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `(07) 8373710`
  String get phoneNumber {
    return Intl.message(
      '(07) 8373710',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Carretera a San Antonio de los Baños, km 2 ½. Torrens. La Habana. Cuba.`
  String get address {
    return Intl.message(
      'Carretera a San Antonio de los Baños, km 2 ½. Torrens. La Habana. Cuba.',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `https://twitter.com/MonitorW3b`
  String get twitterLink {
    return Intl.message(
      'https://twitter.com/MonitorW3b',
      name: 'twitterLink',
      desc: '',
      args: [],
    );
  }

  /// `https://www.facebook.com/MonitorW3b`
  String get facebookLink {
    return Intl.message(
      'https://www.facebook.com/MonitorW3b',
      name: 'facebookLink',
      desc: '',
      args: [],
    );
  }

  /// `https://t.me/MonitorW3b`
  String get telegramLink {
    return Intl.message(
      'https://t.me/MonitorW3b',
      name: 'telegramLink',
      desc: '',
      args: [],
    );
  }

  /// `Síguenos en`
  String get followUsOn {
    return Intl.message(
      'Síguenos en',
      name: 'followUsOn',
      desc: '',
      args: [],
    );
  }

  /// `Mostrar menú`
  String get showMenuTooltip {
    return Intl.message(
      'Mostrar menú',
      name: 'showMenuTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Recomendaciones`
  String get recommendations {
    return Intl.message(
      'Recomendaciones',
      name: 'recommendations',
      desc: '',
      args: [],
    );
  }

  /// `Evaluación detallada`
  String get detailedEvaluation {
    return Intl.message(
      'Evaluación detallada',
      name: 'detailedEvaluation',
      desc: '',
      args: [],
    );
  }

  /// `Impacto`
  String get impact {
    return Intl.message(
      'Impacto',
      name: 'impact',
      desc: '',
      args: [],
    );
  }

  /// `Dificultad`
  String get difficulty {
    return Intl.message(
      'Dificultad',
      name: 'difficulty',
      desc: '',
      args: [],
    );
  }

  /// `Evaluación Seo`
  String get seoEvaluation {
    return Intl.message(
      'Evaluación Seo',
      name: 'seoEvaluation',
      desc: '',
      args: [],
    );
  }

  /// `Indicadores Seo`
  String get seoIndicators {
    return Intl.message(
      'Indicadores Seo',
      name: 'seoIndicators',
      desc: '',
      args: [],
    );
  }

  /// `Indicadores Telus`
  String get telusIndicators {
    return Intl.message(
      'Indicadores Telus',
      name: 'telusIndicators',
      desc: '',
      args: [],
    );
  }

  /// `Estadísticas generales del día anterior`
  String get dayBeforeStats {
    return Intl.message(
      'Estadísticas generales del día anterior',
      name: 'dayBeforeStats',
      desc: '',
      args: [],
    );
  }

  /// `Estadísticas generales de la última semana`
  String get weekBeforeStats {
    return Intl.message(
      'Estadísticas generales de la última semana',
      name: 'weekBeforeStats',
      desc: '',
      args: [],
    );
  }

  /// `Estadísticas generales`
  String get generalStats {
    return Intl.message(
      'Estadísticas generales',
      name: 'generalStats',
      desc: '',
      args: [],
    );
  }

  /// `Total de visitas`
  String get visitsAmount {
    return Intl.message(
      'Total de visitas',
      name: 'visitsAmount',
      desc: '',
      args: [],
    );
  }

  /// `Cantidad de acciones`
  String get visitsActions {
    return Intl.message(
      'Cantidad de acciones',
      name: 'visitsActions',
      desc: '',
      args: [],
    );
  }

  /// `Promedio de acciones por visitas`
  String get visitsActionsAverage {
    return Intl.message(
      'Promedio de acciones por visitas',
      name: 'visitsActionsAverage',
      desc: '',
      args: [],
    );
  }

  /// `Tasa de rebote`
  String get bounceRate {
    return Intl.message(
      'Tasa de rebote',
      name: 'bounceRate',
      desc: '',
      args: [],
    );
  }

  /// `Tasa de rebote (%)`
  String get bounceRatePercent {
    return Intl.message(
      'Tasa de rebote (%)',
      name: 'bounceRatePercent',
      desc: '',
      args: [],
    );
  }

  /// `Visitantes únicos`
  String get visitsSingles {
    return Intl.message(
      'Visitantes únicos',
      name: 'visitsSingles',
      desc: '',
      args: [],
    );
  }

  /// `Dirección de la página`
  String get pageAddress {
    return Intl.message(
      'Dirección de la página',
      name: 'pageAddress',
      desc: '',
      args: [],
    );
  }

  /// `Visitas`
  String get visits {
    return Intl.message(
      'Visitas',
      name: 'visits',
      desc: '',
      args: [],
    );
  }

  /// `Hits`
  String get hits {
    return Intl.message(
      'Hits',
      name: 'hits',
      desc: '',
      args: [],
    );
  }

  /// `Análisis de tráfico / Telus`
  String get telusEvaluation {
    return Intl.message(
      'Análisis de tráfico / Telus',
      name: 'telusEvaluation',
      desc: '',
      args: [],
    );
  }

  /// `Rebote (en %)`
  String get bouncePercentaje {
    return Intl.message(
      'Rebote (en %)',
      name: 'bouncePercentaje',
      desc: '',
      args: [],
    );
  }

  /// `Histórico de visitas`
  String get visitsHistorical {
    return Intl.message(
      'Histórico de visitas',
      name: 'visitsHistorical',
      desc: '',
      args: [],
    );
  }

  /// `Visitas por hora del día`
  String get hourlyVisits {
    return Intl.message(
      'Visitas por hora del día',
      name: 'hourlyVisits',
      desc: '',
      args: [],
    );
  }

  /// `Origen del tráfico`
  String get trafficOrigin {
    return Intl.message(
      'Origen del tráfico',
      name: 'trafficOrigin',
      desc: '',
      args: [],
    );
  }

  /// `Visitas por localización`
  String get localizationsVisits {
    return Intl.message(
      'Visitas por localización',
      name: 'localizationsVisits',
      desc: '',
      args: [],
    );
  }

  /// `Visitas desde navegadores`
  String get browserVisits {
    return Intl.message(
      'Visitas desde navegadores',
      name: 'browserVisits',
      desc: '',
      args: [],
    );
  }

  /// `Visitas desde Sistemas Operativos`
  String get operativeSystemVisits {
    return Intl.message(
      'Visitas desde Sistemas Operativos',
      name: 'operativeSystemVisits',
      desc: '',
      args: [],
    );
  }

  /// `Visitas por modelo de dispositivos`
  String get devicesModelVisits {
    return Intl.message(
      'Visitas por modelo de dispositivos',
      name: 'devicesModelVisits',
      desc: '',
      args: [],
    );
  }

  /// `Visitas por tipo de dispositivos`
  String get devicesTypeVisits {
    return Intl.message(
      'Visitas por tipo de dispositivos',
      name: 'devicesTypeVisits',
      desc: '',
      args: [],
    );
  }

  /// `Ranking de URLs visitadas`
  String get urlRankings {
    return Intl.message(
      'Ranking de URLs visitadas',
      name: 'urlRankings',
      desc: '',
      args: [],
    );
  }

  /// `Examina fácilmente el estado SEO de tu sitio web y obtén datos de tráfico captados por la herramienta Telus. Todo desde una única plataforma.`
  String get testEasySeoAndTelus {
    return Intl.message(
      'Examina fácilmente el estado SEO de tu sitio web y obtén datos de tráfico captados por la herramienta Telus. Todo desde una única plataforma.',
      name: 'testEasySeoAndTelus',
      desc: '',
      args: [],
    );
  }

  /// `Haciendo más fácil tu vida.`
  String get makingMoreEasyYourLife {
    return Intl.message(
      'Haciendo más fácil tu vida.',
      name: 'makingMoreEasyYourLife',
      desc: '',
      args: [],
    );
  }

  /// `Por una web #visible, #segura y #optimizada.`
  String get forWebMoreOptimal {
    return Intl.message(
      'Por una web #visible, #segura y #optimizada.',
      name: 'forWebMoreOptimal',
      desc: '',
      args: [],
    );
  }

  /// `Contáctenos`
  String get contactUs {
    return Intl.message(
      'Contáctenos',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Aplicación informática que pertenece al Proyecto Monitor de sitios web cubanos. El proyecto tiene como objetivo principal potenciar la visibilidad en Internet de los contenidos digitales a partir de técnicas de posicionamiento que influyen directamente en el mejoramiento de la relevancia y popularidad de los sitios web. \nLa aplicación móvil fue desarrollada por el proyecto LexCuba que forma parte del Centro de Gobierno Electrónico desde la Universidad de las Ciencias Informáticas (UCI).`
  String get about {
    return Intl.message(
      'Aplicación informática que pertenece al Proyecto Monitor de sitios web cubanos. El proyecto tiene como objetivo principal potenciar la visibilidad en Internet de los contenidos digitales a partir de técnicas de posicionamiento que influyen directamente en el mejoramiento de la relevancia y popularidad de los sitios web. \nLa aplicación móvil fue desarrollada por el proyecto LexCuba que forma parte del Centro de Gobierno Electrónico desde la Universidad de las Ciencias Informáticas (UCI).',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Toque para reintentar`
  String get tapToRetry {
    return Intl.message(
      'Toque para reintentar',
      name: 'tapToRetry',
      desc: '',
      args: [],
    );
  }

  /// `Introduzca una URL`
  String get enterAnUrl {
    return Intl.message(
      'Introduzca una URL',
      name: 'enterAnUrl',
      desc: '',
      args: [],
    );
  }

  /// `La URL no es válida`
  String get invalidUrl {
    return Intl.message(
      'La URL no es válida',
      name: 'invalidUrl',
      desc: '',
      args: [],
    );
  }

  /// `Respuesta nula desde el servidor`
  String get nullResponseForServer {
    return Intl.message(
      'Respuesta nula desde el servidor',
      name: 'nullResponseForServer',
      desc: '',
      args: [],
    );
  }

  /// `Token invalido`
  String get invalidToken {
    return Intl.message(
      'Token invalido',
      name: 'invalidToken',
      desc: '',
      args: [],
    );
  }

  /// `No se encontraron resultados`
  String get nothingFound {
    return Intl.message(
      'No se encontraron resultados',
      name: 'nothingFound',
      desc: '',
      args: [],
    );
  }

  /// `Usuario y o contraseña incorrectos`
  String get invalidUserOrPassword {
    return Intl.message(
      'Usuario y o contraseña incorrectos',
      name: 'invalidUserOrPassword',
      desc: '',
      args: [],
    );
  }

  /// `Error desconocido de conexión desde el servidor`
  String get unknownConnectionErrorFromApi {
    return Intl.message(
      'Error desconocido de conexión desde el servidor',
      name: 'unknownConnectionErrorFromApi',
      desc: '',
      args: [],
    );
  }

  /// `Error desconocido en el servidor`
  String get unknownFailureOnApiCall {
    return Intl.message(
      'Error desconocido en el servidor',
      name: 'unknownFailureOnApiCall',
      desc: '',
      args: [],
    );
  }

  /// `Desde el servidor`
  String get fromApi {
    return Intl.message(
      'Desde el servidor',
      name: 'fromApi',
      desc: '',
      args: [],
    );
  }

  /// `Tema oscuro`
  String get darkTheme {
    return Intl.message(
      'Tema oscuro',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Tamaño de letra`
  String get fontSize {
    return Intl.message(
      'Tamaño de letra',
      name: 'fontSize',
      desc: '',
      args: [],
    );
  }

  /// `Examina fácilmente el estado SEO de tu sitio web y obtén datos de tráfico captados por la herramienta Telus. Todo desde una única plataforma.`
  String get seoChangeFontSizeText {
    return Intl.message(
      'Examina fácilmente el estado SEO de tu sitio web y obtén datos de tráfico captados por la herramienta Telus. Todo desde una única plataforma.',
      name: 'seoChangeFontSizeText',
      desc: '',
      args: [],
    );
  }

  /// `Disponibilidad`
  String get availability {
    return Intl.message(
      'Disponibilidad',
      name: 'availability',
      desc: '',
      args: [],
    );
  }

  /// `del día anterior`
  String get ofTheDayBefore {
    return Intl.message(
      'del día anterior',
      name: 'ofTheDayBefore',
      desc: '',
      args: [],
    );
  }

  /// `segundos`
  String get seconds {
    return Intl.message(
      'segundos',
      name: 'seconds',
      desc: '',
      args: [],
    );
  }

  /// `Tiempo promedio de respuesta`
  String get averageResponseTime {
    return Intl.message(
      'Tiempo promedio de respuesta',
      name: 'averageResponseTime',
      desc: '',
      args: [],
    );
  }

  /// `de las últimas 24 horas`
  String get ofTheLast24Hours {
    return Intl.message(
      'de las últimas 24 horas',
      name: 'ofTheLast24Hours',
      desc: '',
      args: [],
    );
  }

  /// `Verifique su conexión a internet`
  String get checkYourInternetConnection {
    return Intl.message(
      'Verifique su conexión a internet',
      name: 'checkYourInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Error interno del servidor`
  String get internalServerError {
    return Intl.message(
      'Error interno del servidor',
      name: 'internalServerError',
      desc: '',
      args: [],
    );
  }

  /// `Error en la puerta de enlace del servidor`
  String get badGateway {
    return Intl.message(
      'Error en la puerta de enlace del servidor',
      name: 'badGateway',
      desc: '',
      args: [],
    );
  }

  /// `Servicio no disponible`
  String get serviceUnavailable {
    return Intl.message(
      'Servicio no disponible',
      name: 'serviceUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `Tiempo de espera excedido`
  String get gatewayTimeOut {
    return Intl.message(
      'Tiempo de espera excedido',
      name: 'gatewayTimeOut',
      desc: '',
      args: [],
    );
  }

  /// `La cantidad de sitios debe ser menor o igual que 500`
  String get sitesLessOrEqual500 {
    return Intl.message(
      'La cantidad de sitios debe ser menor o igual que 500',
      name: 'sitesLessOrEqual500',
      desc: '',
      args: [],
    );
  }

  /// `La cantidad de meses debe ser menor o igual que 12`
  String get monthsLessOrEqual12 {
    return Intl.message(
      'La cantidad de meses debe ser menor o igual que 12',
      name: 'monthsLessOrEqual12',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
