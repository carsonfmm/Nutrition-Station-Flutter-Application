import 'package:flutter/material.dart';
import 'package:group8/temp_food_items.dart';
import 'package:provider/provider.dart';
import 'package:group8/foodItem.dart';
import 'foodItemList.dart';
import 'foodItem.dart';
import 'foodEntryList.dart';
import 'foodEntry.dart';

class AddFoodPage extends StatefulWidget {
  const AddFoodPage({super.key});
  @override
  State<StatefulWidget> createState() => _AddFoodPageState();
}

class _AddFoodPageState extends State<AddFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [FoodInfo(), NutritionInfo()],
    );
  }
}

class FoodInfo extends StatelessWidget {
  const FoodInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var foodEntries = context.watch<FoodEntryListModel>();

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 5,
                  fit: FlexFit.tight,
                  child: Column(
                    children: const [
                      Text(
                        "Food",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: Column(
                    children: const [
                      Text(
                        "Serving",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Column(
                    children: const [
                      Text(
                        "Cal",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: foodEntries.foodEntries.length + 1,
              itemBuilder: ((context, index) {
                if (index == foodEntries.foodEntries.length) {
                  return Row(
                    children: [
                      const Expanded(
                          child: Text("Total:",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                      Text("\t${foodEntries.getTotalCal()}",
                          style: const TextStyle(fontSize: 18))
                    ],
                  );
                } else {
                  return FoodItemEntry(foodEntries.foodEntries[index]);
                }
              }),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 5,
              ),
            ),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // showModalBottomSheet(context: context, builder: (context) {
                    //   return Consumer<FoodEntryListModel>(builder: (_, value, __) => AddFoodServingForm());
                    // },);
                    foodEntries.removeAll();
                  },
                  icon: const Icon(Icons.edit, size: 24),
                  label: const Text("Clear Entries"),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Consumer<FoodEntryListModel>(
                            builder: (_, value, __) =>
                                const AddFoodServingForm());
                      },
                    );
                  },
                  icon: const Icon(Icons.add, size: 24),
                  label: const Text("Add Entry"),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class AddFoodServingForm extends StatefulWidget {
  const AddFoodServingForm({super.key});

  @override
  AddFoodServingFormState createState() => AddFoodServingFormState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class AddFoodServingFormState extends State<AddFoodServingForm> {
  final _formKey = GlobalKey<FormState>();
  var dropdownValue = TempFoodItems.tempFoodItems.first;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text("Add Food",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                DropdownButtonFormField(
                  elevation: 16,
                  icon: const Icon(Icons.fastfood),
                  value: dropdownValue,
                  items: TempFoodItems.tempFoodItems
                      .map<DropdownMenuItem<FoodItem>>((FoodItem val) {
                    return DropdownMenuItem<FoodItem>(
                      value: val,
                      child: Row(
                        children: [
                          Text(val.name),
                          Text(
                            " ${val.calories}cal/${val.singular}",
                            style: const TextStyle(color: Colors.grey),
                            textAlign: TextAlign.end,
                          )
                        ],
                      ),
                    );
                  }).toList(),
                  onSaved: (FoodItem? value) {},
                  onChanged: (FoodItem? value) {
                    if (value != null) dropdownValue = value;
                    setState(() {});
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.pie_chart_outline_outlined),
                    hintText: 'How many ${dropdownValue.plural}?',
                    labelText: '${dropdownValue.plural} *',
                  ),
                  onSaved: (String? value) {
                    //this is run when the form is saved. THis is how we save entries. Not currently used.
                    if (value != null) {
                      context.read<FoodEntryListModel>().add(FoodEntry(
                          item: dropdownValue, servings: double.parse(value)));
                      print(context.read<FoodEntryListModel>());
                    }
                  },
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains(RegExp(r'^-?\d+\.?\d*$'))) {
                      return 'Please enter a number';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    FormState? form = _formKey.currentState;
                    if (form != null) {
                      if (form.validate()) {
                        form.save();
                        Navigator.pop(context);
                      }
                    }
                  },
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    FormState? form = _formKey.currentState;
                    if (form != null) {
                      if (form.validate()) {
                        form.save();
                        Navigator.pop(context);
                      }
                    }
                  },
                  icon: const Icon(Icons.add, size: 24),
                  label: const Text("Add"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddFoodForm extends StatefulWidget {
  const AddFoodForm({super.key});

  @override
  AddFoodFormState createState() => AddFoodFormState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class AddFoodFormState extends State<AddFoodForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text("Add Food",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.fastfood),
                    hintText: 'What is the food called?',
                    labelText: 'Food Name *',
                  ),
                  onSaved: (String? value) {
                    //this is run when the form is saved. THis is how we save entries. Not currently used.
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.pie_chart_outline_outlined),
                    hintText: 'In what units is this food measured?',
                    labelText: 'Unit Name *',
                  ),
                  onSaved: (String? value) {
                    //this is run when the form is saved. THis is how we save entries. Not currently used.
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.bar_chart_outlined),
                    hintText: 'How many calories per serving?',
                    labelText: 'Calories *',
                  ),
                  onSaved: (String? value) {
                    //this is run when the form is saved. THis is how we save entries. Not currently used.
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add, size: 24),
                  label: const Text("Add"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FoodItemEntry extends StatelessWidget {
  var foodEntry;

  FoodItemEntry(this.foodEntry, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 5,
          fit: FlexFit.tight,
          child: Column(
            children: [
              Text(
                foodEntry.item.name,
                style: const TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
        Flexible(
          flex: 3,
          fit: FlexFit.tight,
          child: Column(
            children: [
              Text(
                "${foodEntry.servings} ${foodEntry.units}",
                style: const TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: Column(
            children: [
              Text(
                "${foodEntry.item.calories * foodEntry.servings}",
                style: const TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class NutritionInfo extends StatefulWidget {
  const NutritionInfo({super.key});

  @override
  State<StatefulWidget> createState() => _NutritionInfoState();
}

class _NutritionInfoState extends State<NutritionInfo> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
