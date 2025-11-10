import 'package:flutter/material.dart';
import '../models/experience.dart';

class ExperienceStampCard extends StatelessWidget {
  final Experience experience;
  final bool selected;
  final VoidCallback onTap;
  const ExperienceStampCard({super.key, required this.experience, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(fit: StackFit.expand, children: [
          ColorFiltered(
            colorFilter: selected ? const ColorFilter.mode(Colors.transparent, BlendMode.multiply) : const ColorFilter.mode(Colors.grey, BlendMode.saturation),
            child: Image.network(experience.imageUrl, fit: BoxFit.cover),
          ),
          Positioned(bottom: 8, left: 8, right: 8, child: Container(color: Colors.black45, padding: const EdgeInsets.all(6), child: Text(experience.name, style: const TextStyle(color: Colors.white)))),
          if (selected) const Positioned(top: 8, right: 8, child: Icon(Icons.check_circle, color: Colors.greenAccent)),
        ]),
      ),
    );
  }
}
