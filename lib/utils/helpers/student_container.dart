import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:presenci/utils/shared.dart';

class StudentContainer extends StatefulWidget {
  const StudentContainer({super.key, required this.index});
  final int index;
  @override
  State<StudentContainer> createState() => _StudentContainerState();
}

class _StudentContainerState extends State<StudentContainer> {
  bool _state = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: transparent,
      highlightColor: transparent,
      splashColor: transparent,
      onTap: () {},
      onHover: (bool value) => setState(() => _state = value),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 8,
        shadowColor: dark,
        color: white,
        child: AnimatedContainer(
          duration: 300.ms,
          padding: EdgeInsets.all(_state ? 8 : 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedContainer(
                duration: 300.ms,
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: settingsBox!.get("presence") _users[index].userAvatar.isEmpty
                      ? const DecorationImage(
                          image: AssetImage("assets/icons/logo.png"),
                          fit: BoxFit.contain,
                        )
                      : DecorationImage(
                          image: NetworkImage(_users[index].userAvatar),
                          fit: BoxFit.cover,
                        ),
                  border: Border.all(width: 2, color: pink),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(color: purple, borderRadius: BorderRadius.circular(5)),
                    child: Text("UID".tr, style: GoogleFonts.abel(fontSize: 14, color: white, fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(width: 10),
                  Flexible(child: Text(_users[index].userID, style: GoogleFonts.abel(fontSize: 12, color: dark, fontWeight: FontWeight.w500))),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(color: purple, borderRadius: BorderRadius.circular(5)),
                    child: Text("USERNAME".tr, style: GoogleFonts.abel(fontSize: 14, color: white, fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(width: 10),
                  Flexible(child: Text(_users[index].username, style: GoogleFonts.abel(fontSize: 12, color: dark, fontWeight: FontWeight.w500))),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(color: purple, borderRadius: BorderRadius.circular(5)),
                    child: Text("E-MAIL".tr, style: GoogleFonts.abel(fontSize: 14, color: white, fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(width: 10),
                  Flexible(child: Text(_users[index].email.isEmpty ? "NOT SET" : _users[index].email, style: GoogleFonts.abel(fontSize: 12, color: dark, fontWeight: FontWeight.w500))),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(color: purple, borderRadius: BorderRadius.circular(5)),
                    child: Text("PHONE NUMBER".tr, style: GoogleFonts.abel(fontSize: 14, color: white, fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(width: 10),
                  Flexible(child: Text(_users[index].phoneNumber, style: GoogleFonts.abel(fontSize: 12, color: dark, fontWeight: FontWeight.w500))),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(color: purple, borderRadius: BorderRadius.circular(5)),
                    child: Text("TYPE(S)".tr, style: GoogleFonts.abel(fontSize: 14, color: white, fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(width: 10),
                  for (final String type in _users[index].userType) ...<Widget>[
                    const SizedBox(width: 10),
                    Text(type.toUpperCase().tr, style: GoogleFonts.abel(fontSize: 12, color: dark, fontWeight: FontWeight.w500)),
                  ]
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
