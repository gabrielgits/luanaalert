class Entrega {
  int id;
  String referencia;
  String estado;
  String endereco;
  double valortotal;
  int forma_pagamento_id;
  int conta_id;
  int user_id;
  int restaurante_id;
  String created_at;

  Entrega(
      {required this.id,
      required this.referencia,
      required this.estado,
      required this.endereco,
      required this.valortotal,
      required this.forma_pagamento_id,
      required this.conta_id,
      required this.user_id,
      required this.restaurante_id,
      required this.created_at});

  factory Entrega.fromJson(Map<String, dynamic> json) {
    return Entrega(
      id: json['id'],
      referencia: json['referencia'],
      estado: json['estado'],
      endereco: json['endereco'],
      valortotal: json['valortotal'],
      forma_pagamento_id: json['forma_pagamento_id'],
      conta_id: json['conta_id'],
      user_id: json['user_id'],
      restaurante_id: json['restaurante_id'],
      created_at: json['created_at'],
    );
  }
}
