import 'package:flutter/material.dart';
import 'package:qrlog_frontend/app/core/values/colors.dart';
import 'package:qrlog_frontend/app/data/models/item_select.dart';
import 'package:qrlog_frontend/app/global_widgets/molecules/molecule_dropdown_content.dart';

import '../../core/theme/text_theme.dart';

class OrganismDropdown extends StatefulWidget {
  const OrganismDropdown({
    Key? key,
    this.initValue,
    required this.items,
    this.hintText = "",
    this.withScroll = true,
    this.padding = 0,
    this.onChange,
  }) : super(key: key);

  final dynamic initValue;
  final String hintText;
  final List<ItemSelect> items;
  final bool withScroll;
  final double padding;
  final void Function(ItemSelect item)? onChange;

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<OrganismDropdown> with RouteAware {
  GlobalKey key = GlobalKey();
  OverlayEntry? _overlayEntry;
  OverlayState? _overlayState;
  bool _isVisible = false;
  ItemSelect? value;
  late LayerLink layerLink;

  @override
  void initState() {
    layerLink = LayerLink();
    value = widget.initValue;
    super.initState();
  }

  @override
  void dispose() {
    closeOverlay();
    super.dispose();
  }

  @override
  void didPush() {
    closeOverlay();
  }

  @override
  void didPopNext() {}

  @override
  Widget build(BuildContext context) {
    Icon arrowIcon = Icon(
      _isVisible ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
      color: black,
      size: 16,
    );
    return SizedBox(
      key: key,
      height: 51,
      width: double.infinity,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: CompositedTransformTarget(
          link: layerLink,
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: !_isVisible
                    ? null
                    : const Border(
                        bottom: BorderSide(
                          color: primaryColor,
                          width: 2.0,
                        ),
                      ),
              ),
              child: InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    if (!_isVisible) {
                      _isVisible = true;
                      _overlayEntry = _createOverlayEntry();
                      _overlayState = Overlay.of(context)!;
                      _overlayState!.insert(_overlayEntry!);
                    } else {
                      closeOverlay();
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        value != null ? value!.label : widget.hintText,
                        style: styleBlackLightFontRobotoW400Size16,
                      ),
                      arrowIcon
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);
    Widget body = MoleculeDropdownContent(
      onTap: (item) {
        setState(() {
          if (widget.onChange != null) {
            widget.onChange!(item);
          }
          value = item;
          closeOverlay();
        });
      },
      items: widget.items,
    );
    return OverlayEntry(
      builder: (context) => FittedBox(
        fit: BoxFit.fill,
        child: InkWell(
          onTap: () => closeOverlay(),
          child: CompositedTransformFollower(
            link: layerLink,
            followerAnchor:
                position.dy + 200 < MediaQuery.of(context).size.height
                    ? Alignment.topLeft
                    : Alignment.bottomLeft,
            offset: Offset(
                -4,
                position.dy + 200 < MediaQuery.of(context).size.height
                    ? box.size.height
                    : 0),
            child: FittedBox(
              fit: BoxFit.none,
              child: SizedBox(
                height: widget.withScroll ? 200 : null,
                width: box.size.width + 8,
                child: Card(
                  child: widget.withScroll
                      ? SingleChildScrollView(
                          clipBehavior: Clip.antiAlias,
                          child: body,
                        )
                      : body,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void closeOverlay() {
    if (_overlayEntry != null) {
      _isVisible = false;
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}
