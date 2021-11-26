import 'package:flutter/material.dart';

class DiferentReactions extends StatefulWidget {
  const DiferentReactions({Key? key}) : super(key: key);

  @override
  State<DiferentReactions> createState() => _DiferentReactionsState();
}

class _DiferentReactionsState extends State<DiferentReactions> {
  bool isSelectedEnojado = false;
  bool isSelectedRisa = false;
  bool isSelectedLike = false;
  bool isSelectedLove = false;
  bool isSelectedTriste = false;
  bool isSelectedSorprendido = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 50,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.5)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          // Icono de enojado
          Tooltip(
            message: 'Hoy no tenemos un buen dia',
            child: MouseRegion(
              onEnter: (event) => setState(() { this.isSelectedEnojado = true; }),
              onExit: (event) => setState(() { this.isSelectedEnojado = false; }),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.white,
                  side: BorderSide.none, 
                  elevation: 0,
                  primary: Colors.white,
                  padding: EdgeInsets.all(0)
                ),
                onPressed: (){},
                child: Image.asset(this.isSelectedEnojado ? 'assets/angry.gif' : 'assets/angry2.png', height: 40, width: 40)
              ),
            ),
          ),
          
          // Icono de risa
          Tooltip(
            message: 'Que bien la pasamos en ZOE',
            child: MouseRegion(
              onEnter: (event) => setState(() { this.isSelectedRisa = true; }),
              onExit: (event) => setState(() { this.isSelectedRisa = false; }),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.white,
                  side: BorderSide.none, 
                  elevation: 0,
                  primary: Colors.white,
                  padding: EdgeInsets.all(0)
                ),
                onPressed: (){},
                child: Image.asset(this.isSelectedRisa ? 'assets/haha.gif' : 'assets/haha2.png', height: 40, width: 40)
              ),
            ),
          ),
          
          // Icono like
          Tooltip(
            message: 'Nos encanta esta publicación',
            child: MouseRegion(
              onEnter: (event) => setState(() { this.isSelectedLike = true; }),
              onExit: (event) => setState(() { this.isSelectedLike = false; }),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.white,
                  side: BorderSide.none, 
                  elevation: 0,
                  primary: Colors.white,
                  padding: EdgeInsets.all(0)
                ),
                onPressed: (){},
                child: Image.asset(this.isSelectedLike ? 'assets/like.gif' : 'assets/ic_like_fill.png', height: 40, width: 40)
              ),
            ),
          ),
          
          // Icono amor
          Tooltip(
            message: 'Amamos la comunidad ZOE',
            child: MouseRegion(
              onEnter: (event) => setState(() { this.isSelectedLove = true; }),
              onExit: (event) => setState(() { this.isSelectedLove = false; }),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.white,
                  side: BorderSide.none, 
                  elevation: 0,
                  primary: Colors.white,
                  padding: EdgeInsets.all(0)
                ),
                onPressed: (){},
                child: Image.asset(this.isSelectedLove ? 'assets/love.gif' : 'assets/love2.png', height: 40, width: 40)
              ),
            ),
          ),
          
          // Icono triste
          Tooltip(
            message: 'Hoy no estamos en un gran dia',
            child: MouseRegion(
              onEnter: (event) => setState(() { this.isSelectedTriste = true; }),
              onExit: (event) => setState(() { this.isSelectedTriste = false; }),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.white,
                  side: BorderSide.none, 
                  elevation: 0,
                  primary: Colors.white,
                  padding: EdgeInsets.all(0)
                ),
                onPressed: (){},
                child: Image.asset(this.isSelectedTriste ? 'assets/sad.gif' : 'assets/sad2.png', height: 40, width: 40)
              ),
            ),
          ),

          // Icono sorprendido
          Tooltip(
            message: 'Sorprendido',
            child: MouseRegion(
              onEnter: (event) => setState(() { this.isSelectedSorprendido = true; }),
              onExit: (event) => setState(() { this.isSelectedSorprendido = false; }),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.white,
                  side: BorderSide.none, 
                  elevation: 0,
                  primary: Colors.white,
                  padding: EdgeInsets.all(0)
                ),
                onPressed: (){},
                child: Image.asset(this.isSelectedSorprendido ? 'assets/wow.gif' : 'assets/wow2.png', height: 40, width: 40)
              ),
            ),
          ),
        ]
      ),
    );
  }
}