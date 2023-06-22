import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/theme.dart';

class TitleBar extends SliverPersistentHeaderDelegate {
  TitleBar({
    required this.value,
    required this.onPressed,
    required this.isDoneVisible,
  });
  final int value;
  final Function onPressed;
  final bool isDoneVisible;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final theme = AppTheme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return Material(
      elevation: min(4, shrinkOffset / 20),
      color: theme.backPrimary,
      child: Stack(
        children: [
          Positioned(
            left: 60 - min(44, shrinkOffset),
            bottom: 16 + max(0, 24 - shrinkOffset / 2),
            child: Text(
              l10n.appTitle,
              style: theme.largeTitle.copyWith(
                fontSize: max(20, 32 - shrinkOffset),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: 60,
            bottom: 16,
            child: Opacity(
              opacity: 1 - min(1, shrinkOffset / 20),
              child: Text(
                l10n.tasksCompleted(value),
                style: theme.body.copyWith(color: theme.labelTertiary),
              ),
            ),
          ),
          Positioned(
            right: 8,
            bottom: 8,
            child: InkWell(
              borderRadius: BorderRadius.circular(32),
              onTap: () => onPressed(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  isDoneVisible ? Icons.visibility : Icons.visibility_off,
                  color: theme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 120;

  @override
  double get minExtent => 56;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
