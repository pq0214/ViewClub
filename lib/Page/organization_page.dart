import 'package:flutter/material.dart';
import 'package:clubproject/models/organizational.dart';
import 'package:clubproject/Component/organize_tile.dart';

class OrganisationPage extends StatefulWidget {
  const OrganisationPage({super.key});

  @override
  State<OrganisationPage> createState() => _OrganisationPageState();
}

class _OrganisationPageState extends State<OrganisationPage> {
  late final Org _org; // Declare _org as late final

  @override
  void initState() {
    super.initState();
    _org = Org(); // Initialize _org
    _org.addOrg(); // Optionally, add organization data here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Center(
          child: Column(
            children: [
              const Text(
                "Organization Chart",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount:
                      _org.org.length, // Use _org.org instead of widget.org.org
                  itemBuilder: (context, index) {
                    OrganizationalDisplay eachorg = _org.org[index];
                    return OrganizeTile(
                      org: eachorg,
                      //  onPressed: () => addOrg(eachorg),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
