import 'package:github_design_pattern/converter/solucao_solid/converter.dart';

Object converterObjeto(Converter converter, Object object) {
  return converter.converter(object);
}