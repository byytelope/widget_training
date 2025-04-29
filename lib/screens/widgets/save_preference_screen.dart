import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

enum PetType { dog, cat, other }

class UserPreferences {
  static final _preferences = SharedPreferencesAsync();

  Future<String> get name async => await _preferences.getString("name") ?? "";
  Future<void> updateName(String newValue) async {
    await _preferences.setString("name", newValue);
  }

  Future<DateTime> get birthDate async {
    String? dateString = await _preferences.getString("birthDate");
    return dateString != null ? DateTime.parse(dateString) : DateTime(2000);
  }

  Future<void> updateBirthDate(DateTime newDate) async {
    await _preferences.setString("birthDate", newDate.toIso8601String());
  }

  Future<Set<PetType>> get pets async {
    List<String>? petsList = await _preferences.getStringList("pets");
    return petsList != null
        ? petsList.map((pet) => PetType.values[int.parse(pet)]).toSet()
        : {PetType.other};
  }

  Future<void> updatePet(Set<PetType> newPets) async {
    await _preferences.setStringList(
      "pets",
      newPets.map((pet) => pet.index.toString()).toList(),
    );
  }
}

class SavePreferenceScreen extends StatefulWidget {
  const SavePreferenceScreen({super.key});

  @override
  State<SavePreferenceScreen> createState() => _SavePreferenceScreenState();
}

class _SavePreferenceScreenState extends State<SavePreferenceScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _birthDateController;
  String _name = "";
  DateTime _birthDate = DateTime(2000);
  Set<PetType> _pets = {PetType.cat};

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: _name);
    _birthDateController = TextEditingController(
      text: _birthDate.toString().split(" ")[0],
    );

    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final name = await UserPreferences().name;
    final birthDate = await UserPreferences().birthDate;
    final pets = await UserPreferences().pets;

    if (mounted) {
      setState(() {
        _name = name;
        _birthDate = birthDate;
        _pets = pets;
        _nameController.text = _name;
        _birthDateController.text =
            birthDate.toLocal().toString().split(" ")[0];
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Save Preference")),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Form(
              key: _formKey,
              child: Column(
                spacing: 16.0,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _name = value ?? "";
                      });
                    },
                  ),
                  TextFormField(
                    controller: _birthDateController,
                    decoration: const InputDecoration(
                      labelText: "Birth Date",
                      border: OutlineInputBorder(),
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: _birthDate,
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null &&
                          pickedDate !=
                              DateTime.parse(_birthDateController.text)) {
                        setState(() {
                          _birthDateController.text =
                              pickedDate.toLocal().toString().split(" ")[0];
                          _birthDate = pickedDate;
                        });
                      }
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Please select your birth date";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    "Select your favorite pets",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: SegmentedButton<PetType>(
                      segments: [
                        ButtonSegment(
                          value: PetType.cat,
                          label: const Text("Cat"),
                        ),
                        ButtonSegment(
                          value: PetType.dog,
                          label: const Text("Dog"),
                        ),
                        ButtonSegment(
                          value: PetType.other,
                          label: const Text("Others"),
                        ),
                      ],
                      selected: _pets,
                      onSelectionChanged: (p0) {
                        setState(() {
                          _pets = p0;
                        });
                      },
                      multiSelectionEnabled: true,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          await UserPreferences().updateName(_name);
                          await UserPreferences().updateBirthDate(_birthDate);
                          await UserPreferences().updatePet(_pets);

                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Preferences saved successfully!"),
                            ),
                          );
                        }
                      },
                      child: const Text("Save Preferences"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Add this helper extension if not already present in your project
extension Spacing on List<Widget> {
  List<Widget> spaced(double spacing) {
    if (isEmpty) return [];
    final result = <Widget>[first];
    for (int i = 1; i < length; i++) {
      result.add(SizedBox(height: spacing));
      result.add(this[i]);
    }
    return result;
  }
}

extension SpacedColumn on Column {
  Column spaced(double spacing) {
    return Column(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: children.spaced(spacing),
    );
  }
}
