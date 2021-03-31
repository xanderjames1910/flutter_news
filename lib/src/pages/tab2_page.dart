import 'package:flutter/material.dart';
import 'package:news_provider/src/models/category_model.dart';
import 'package:news_provider/src/services/news_service.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: _ListaCategorias(),
          ),
        ],
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        final cName = categories[index].name;

        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              _CategoryButton(categories[index]),
              SizedBox(height: 5.0),
              Text('${cName[0].toUpperCase()}${cName.substring(1)}')
            ],
          ),
        );
      },
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category categoria;

  const _CategoryButton(this.categoria);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Hola Mundo');
      },
      child: Container(
        width: 40.0,
        height: 40.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          categoria.icon,
          color: Colors.black54,
        ),
      ),
    );
  }
}
