import 'package:github_design_pattern/converter/solucao_solid/converter.dart';
import 'package:github_design_pattern/converter/solucao_solid/usuario.dart';

class UsuarioConverterDeJson implements Converter<Map<String, dynamic>, Usuario> {
  @override
  Usuario converter(Map<String, dynamic> json) => Usuario(json["id"], json["nome"]);
}

class UsuarioConverterParaJson implements Converter<Usuario, Map<String, dynamic>> {
  @override
  Map<String, dynamic> converter(Usuario usuario) => {
    "id": usuario.id,
    "nome": usuario.nome
  };
}