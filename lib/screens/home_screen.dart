import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_x/providers/rocket_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch rockets when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RocketProvider>(context, listen: false).fetchRockets();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpaceX Rockets'),
        centerTitle: true,
      ),
      body: Consumer<RocketProvider>(
        builder: (context, rocketProvider, child) {
          if (rocketProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (rocketProvider.errorMessage.isNotEmpty) {
            return Center(child: Text(rocketProvider.errorMessage));
          } else if (rocketProvider.rockets.isEmpty) {
            return const Center(child: Text('No rockets available'));
          } else {
            return ListView.builder(
              itemCount: rocketProvider.rockets.length,
              itemBuilder: (context, index) {
                final rocket = rocketProvider.rockets[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: rocket.flickrImage.isNotEmpty
                              ? Image.network(
                                  rocket.flickrImage,
                                  width: size.width * 0.23,
                                  height: size.height * 0.12,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  width: size.width * 0.23,
                                  height: size.height * 0.2,
                                  color: Colors.grey,
                                  child: const Icon(
                                    Icons.image,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                rocket.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Country: ${rocket.country}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Engines: ${rocket.enginesCount}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
