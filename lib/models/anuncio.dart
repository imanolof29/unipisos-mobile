class Anuncio{
  final int id;
  final String titulo;
  final String descripcion;
  final List<String> imagenes;

  Anuncio({required this.id, required this.titulo, required this.descripcion, required this.imagenes});

  Anuncio.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        titulo = json['titulo'],
        descripcion = json['descripcion'],
        imagenes = json['imagenes'].cast<String>();

}