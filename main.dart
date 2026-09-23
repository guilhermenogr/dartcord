import 'models/usuario.dart';
import 'models/moderador.dart';
import 'models/mensagem.dart';
import 'models/canal.dart';

void main() {
  final usuario = Usuario(nome: 'Pedro', apelido: 'PG', online: true);
  final moderador = Moderador(nome: 'Ana', apelido: 'Ana', online: true);

  final usuarios = <Usuario>[usuario, moderador];

  final canalGeral = Canal(nome: 'geral');
  final canalDart = Canal(nome: 'dart');
  final canalFlutter = Canal(nome: 'Flutter');

  final canais = <Canal>[canalGeral, canalDart, canalFlutter];

  canalDart.adicionarMensagem(
    Mensagem(autor: usuario, texto: 'Olá, DartCord!'),
  );

  canalDart.adicionarMensagem(
    Mensagem(autor: moderador, texto: 'Continuem praticando'),
  );

  gerarRelatorio(
    usuarios: usuarios,
    canais: canais,
    canalSelecionado: canalDart,
  );
}

void gerarRelatorio({
  required List<Usuario> usuarios,
  required List<Canal> canais,
  required Canal canalSelecionado,
}) {
  print('DARTCORD');
  print('Servidor: Programação Mobile');

  print('\nUsuários online:');

  for (final usuario in usuarios) {
    if (usuario.online) {
      print(usuario.apelido);
    }
  }

  print('\nCanais:');

  for (final canal in canais) {
    print('#${canal.nome}');
  }

  print('\nExibindo mensagens do canal:');
  print('#${canalSelecionado.nome}');

  for (final mensagem in canalSelecionado.mensagens) {
    print('${mensagem.autor.apelido}: ${mensagem.texto}');
  }
}
