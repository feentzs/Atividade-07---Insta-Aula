import 'package:flutter/material.dart';
import 'package:instagram_flutter/pages/home_page.dart';
import 'package:instagram_flutter/utils/mensagem_util.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  bool esconderSenha = true;

  Future<void> entrar() async {
    String usuario = usuarioController.text.trim();
    String senha = senhaController.text;

    if(usuario.isEmpty || senha.isEmpty){
      mostrarMensagem(context, 'Preencha os campos.');
      return;
    }
  }

  void abrirHome(){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage())
    );
  }

  @override
  void dispose(){
    usuarioController.dispose();
    senhaController.dispose();

    super.dispose();
  }
    
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
              'InstaAula',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40,),

            const Icon(
              Icons.flutter_dash,
              size: 100,
            ),

            const SizedBox(height: 20,),

            const Text('Bem vindo', textAlign: TextAlign.center, 
             style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              ),

              const SizedBox(height: 30,),

              TextField(
                controller: usuarioController,
                decoration: const InputDecoration(
                  hintText: 'Entre com o seu usuário',
                  labelText: 'Usuário',
                  prefixIcon: Icon(Icons.alternate_email),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15,),

              TextField(
                controller: senhaController,
                obscureText: esconderSenha,
                decoration: InputDecoration(
                  hintText: 'Entre com a sua senha',
                  labelText: 'Senha',
                  prefixIcon: const Icon(Icons.lock),
                  border: const OutlineInputBorder(),

                  suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      esconderSenha = !esconderSenha;
                    });
                  }, 
                  icon: Icon(
                    esconderSenha ? Icons.visibility : Icons.visibility_off
                  )
                ),
                ),
              ),

              const SizedBox(height: 17,),

              ElevatedButton.icon(
              onPressed: () async {
                await entrar();
                if (usuarioController.text.trim().isNotEmpty &&
                    senhaController.text.isNotEmpty) {
                  abrirHome();
                }
              }, 
              label: const Text('Entrar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 138, 186, 231),
                foregroundColor: Colors.black
              ),
            ),              
          ],
        ),
      ),
    );
  }

}