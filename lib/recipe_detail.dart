import 'package:flutter/material.dart';
import 'package:recipes/recipe_model.dart';

class RecipeDetail extends StatefulWidget{

  final Recipe recipe;

  const RecipeDetail({Key ? key, required this.recipe}) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    return _RecipeDetailState();
  }

}

class _RecipeDetailState extends State<RecipeDetail> {

  double multiplier = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recipe Detail'),
        ),
        body: SafeArea(child: Column(
          children: [
            SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.asset(widget.recipe.imageUrl)),
            const SizedBox(
              height: 16,
            ),
            Text(widget.recipe.label),

            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: widget.recipe.ingredients.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ingredient = widget.recipe.ingredients[index];
                    return Text("${ingredient.quantity * multiplier} ${ingredient.name} ${ingredient.measure}");
              }),
            ),
            Slider(
                value: multiplier,
                label: "${(widget.recipe.serving * multiplier).toInt()}인분",
                min: 1,
                max: 10,
                divisions: 9,
                onChanged: (value) {

              setState(() {});
                multiplier = value;
            })
          ],
        )));
  }
  
}