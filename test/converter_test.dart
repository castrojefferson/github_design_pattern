import 'package:flutter_test/flutter_test.dart';
import 'package:github_design_pattern/converter/solucao_comum/usuario.dart'
    as solucaoComum;
import 'package:github_design_pattern/converter/solucao_solid/etc.dart';
import 'package:github_design_pattern/converter/solucao_solid/usuario.dart';
import 'package:github_design_pattern/converter/solucao_solid/usuario_converter.dart';

void main() {
  const Map<String, dynamic> jsonUsuario = {
    "id": 1,
    "nome": "Jefferson",
  };

  test('converter/solucao_comum', () {
    solucaoComum.Usuario usuarioSolucaoComum =
        solucaoComum.Usuario.fromJson(jsonUsuario);
    expect(usuarioSolucaoComum.id, 1);
    expect(usuarioSolucaoComum.nome, "Jefferson");

    Map<String, dynamic> jsonComum =
        solucaoComum.Usuario.toJson(usuarioSolucaoComum);

    expect(jsonComum["id"], 1);
    expect(jsonComum["nome"], "Jefferson");
  });

  test('converter/solucao_solid', () {
    Usuario usuarioSolucaoSolid =
        UsuarioConverterDeJson().converter(jsonUsuario);

    expect(usuarioSolucaoSolid.id, 1);
    expect(usuarioSolucaoSolid.nome, "Jefferson");

    Map<String, dynamic> jsonSolid =
        UsuarioConverterParaJson().converter(usuarioSolucaoSolid);

    expect(jsonSolid["id"], 1);
    expect(jsonSolid["nome"], "Jefferson");
  });

  test('converter/etc', () {
    Usuario usuarioSolucaoSolid =
        UsuarioConverterDeJson().converter(jsonUsuario);

    expect(
        (converterObjeto(UsuarioConverterDeJson(), jsonUsuario) as Usuario).id,
        1);

    expect(
        (converterObjeto(UsuarioConverterParaJson(), usuarioSolucaoSolid)
            as Map<String, dynamic>)["id"],
        1);

    expect(converterObjeto(UsuarioConverterDeJson(), jsonUsuario).runtimeType,
        Usuario); // Retorna usuario

    expect(
        converterObjeto(UsuarioConverterParaJson(), usuarioSolucaoSolid)
            .runtimeType,
        Map<String, dynamic>().runtimeType); // Retorna Map<String, dynamic>
  });
}
