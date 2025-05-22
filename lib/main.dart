import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      /*theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),*/
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
   late PageController _pageController;
  int totalPage = 4;

  void _onScroll() {
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);

    super.initState();
  } 

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

@override
  Widget build(BuildContext context) {
 
    return Scaffold(
      /*appBar: AppBar(
    
        backgroundColor: Colors.red,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('a'),
      ),*/
      body: PageView(
        controller: _pageController,
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        children: <Widget>[
          makePage(
            page: 1,
            image: 'https://th.bing.com/th/id/R.f74dbc77c53359971babcff061a75e7c?rik=IRSmyLK50Db1eA&pid=ImgRaw&r=0',
            title: 'Clarinete',
            description: 'Clarinete en si bemol perfecto para estudiantes nuevos.'
          ),
          makePage(
            page: 2,
            image: 'https://alamomusical.com/wp-content/uploads/2020/07/a2-57-1024x1024.jpg',
            title: 'Trompeta',
            description: 'Trompeta en si bemol ideal para estudiantes nuevos.'
          ),
          makePage(
            page: 3,
            image: 'https://th.bing.com/th/id/R.3bae45904dd93dea39bbf30afde672f3?rik=qfUrGp6kht319g&pid=ImgRaw&r=0',
            title: 'Tarola',
            description: "Tarola nueva en perfecto estado, ideal para estudiantes."
          ),
          makePage(
            page: 4,
            image: 'https://th.bing.com/th/id/OIP.XHCQtanNXgdkvvWeckZdgwHaLH?rs=1&pid=ImgDetMain',
            title: 'Violin',
            description: "Violin en nuevo en perfecto estado."
          ),
        ],
          
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Widget makePage({image, title, description, page}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image.startsWith('http')
              ? Image.network(
                  image,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(child: CircularProgressIndicator(value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null));
                  }).image
              : AssetImage(image) as ImageProvider,
          fit: BoxFit.cover
        ),
    ),
    
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: [0.3, 0.9],
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.2),
            ]
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[FadeInUp(child: Text(page.toString(), style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),
                  Text('/' + totalPage.toString(), style: TextStyle(color: Colors.white, fontSize: 15),
                  )],),
                  
                
              
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeInUp(child:
                      Text(title, style: TextStyle(color: Colors.white, fontSize: 50, height: 1.2, fontWeight: FontWeight.bold),)
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeInUp(child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(Icons.star, color: Colors.grey, size: 15,),
                        ),
                        Text('4.0', style: TextStyle(color: Colors.white70),),
                        Text('(2300)', style: TextStyle(color: Colors.white38, fontSize: 12),)
                      ],
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    FadeInUp(child: Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Text(description, style: TextStyle(color: Colors.white.withOpacity(.7), height: 1.9, fontSize: 15),),
                    )),
                    SizedBox(height: 20,),
                    FadeInUp(child: Text('READ MORE', style: TextStyle(color: Colors.white),)),
                    SizedBox(height: 30,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
    
  }
}


