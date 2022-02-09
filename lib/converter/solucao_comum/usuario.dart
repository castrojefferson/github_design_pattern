class Usuario {
  final int id;
  final String nome;

  Usuario(this.id, this.nome);

  static Usuario fromJson(Map<String, dynamic> json) {
    return Usuario(json["id"], json["nome"]);
  }

  static Map<String, dynamic> toJson(Usuario usuario) => {
        "id": usuario.id,
        "nome": usuario.nome,
      };
}
