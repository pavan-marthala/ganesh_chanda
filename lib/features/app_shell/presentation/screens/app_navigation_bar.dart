import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ganesh_chanda/core/theme/app_colors.dart';
import 'package:ganesh_chanda/core/theme/app_theme.dart';
import 'package:ganesh_chanda/core/utils/sized_context.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.unreadCount,
    required this.onTabSelected,
  });

  final int selectedIndex;
  final int unreadCount;
  final Function(int index) onTabSelected;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final items = [
      NavigationItem(
        title: 'Dashboard',
        unreadCount: unreadCount,
        icon: Icon(
          CupertinoIcons.home,
          color: colors.textPrimary,
          size: 24,
        ),
      ),
      NavigationItem(
        title: 'Donations',
        unreadCount: 0,
        icon: Icon(Icons.currency_rupee, color: colors.textPrimary, size: 24),
      ),
      NavigationItem(
        title: 'Expense',
        unreadCount: 0,
        icon: Icon(Icons.money, color: colors.textPrimary, size: 24),
      ),
      NavigationItem(
        title: 'Events',
        unreadCount: 0,
        icon: Icon(CupertinoIcons.calendar, color: colors.textPrimary, size: 24),
      ),
      // NavigationItem(
      //   title: 'Profile',
      //   unreadCount: 0,
      //   icon: Icon(CupertinoIcons.person, color: colors.textPrimary, size: 24),
      // ),
    ];
    return Align(
      alignment: Alignment.bottomCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: context.isMobile ? context.widthPx : 450),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final size = Size(constraints.maxWidth, constraints.maxHeight);
            return SafeArea(
              top: false,
              child: NavBar(
                colors: colors,
                items: items,
                selectedIndex: selectedIndex,
                onTabSelected: onTabSelected,
                size: size,
              ),
            );
          },
        ),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.colors,
    required this.items,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.size,
  });

  final AppColors colors;
  final List<NavigationItem> items;
  final int selectedIndex;
  final Function(int index) onTabSelected;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: colors.textPrimary.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              color: colors.background.withValues(alpha: 0.75),
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: colors.textPrimary.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(items.length, (index) {
                final item = items[index];
                final isSelected = index == selectedIndex;
                return Expanded(
                  child: NavBarItem(
                    onTabSelected: () {
                      onTabSelected(index);
                    },
                    size: size,
                    isSelected: isSelected,
                    colors: colors,
                    item: item,
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.onTabSelected,
    required this.size,
    required this.isSelected,
    required this.colors,
    required this.item,
  });

  final VoidCallback onTabSelected;
  final Size size;
  final bool isSelected;
  final AppColors colors;
  final NavigationItem item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTabSelected,
      child: Container(
        width: double.infinity,
        height: 48,
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: isSelected ? colors.primary : Colors.transparent,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    isSelected ? colors.white : colors.textPrimary,
                    BlendMode.srcIn,
                  ),
                  child: item.icon,
                ),
                if (item.unreadCount > 0)
                  Positioned(
                    top: -4,
                    right: -4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 1.5,
                      ),
                      decoration: BoxDecoration(
                        color: colors.error,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        item.unreadCount > 99 ? '99+' : '${item.unreadCount}',
                        style: context.theme.appTypography.bodySmall.copyWith(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Text(
                item.title,
                style: context.theme.appTypography.labelSmall.copyWith(
                  color: isSelected ? colors.white : colors.textPrimary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationItem {
  String title;
  Widget icon;
  int unreadCount;

  NavigationItem({
    required this.title,
    required this.icon,
    this.unreadCount = 0,
  });
}
