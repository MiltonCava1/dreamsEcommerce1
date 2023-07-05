import 'package:flutter/material.dart';

class AboutUsContenido extends StatelessWidget {
  const AboutUsContenido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 125,
              width: double.infinity,
              child: Opacity(
                opacity: 0.5,
                child: Image.asset(
                  "assets/img/backgraund3.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Sobre Nosotros",
                  style: TextStyle(
                    fontSize: 50,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 35,
        ),
        const Text(
          "¿Quienes somos?",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.pink,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 800,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                    image: AssetImage("assets/img/quienes_somos.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        const Text(
          "Nuestros Clientes: ",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.pink,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: 1000,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                    image: AssetImage("assets/img/clientes.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              
              const SizedBox(
                width: 30,
              ),

              const Expanded(
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                ),
              ),
              
            ],
          ),
        ),
      ],
    );
  }
}
