import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/builder_provider.dart';
import '../widgets/builder_card.dart';
import '../widgets/account_selector.dart';
import '../widgets/add_account_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'logo.png',
              height: 32,
              width: 32,
            ),
            const SizedBox(width: 12),
            const Text('CLOCK TOWER'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AddAccountDialog(),
              );
            },
            tooltip: 'Add Account',
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0A0A0A),
              Color(0xFF1A1A1A),
              Color(0xFF0A0A0A),
            ],
          ),
        ),
        child: SafeArea(
          child: Consumer<BuilderProvider>(
            builder: (context, builderProvider, child) {
              if (builderProvider.accounts.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }

              return Column(
                children: [
                  const AccountSelector(),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: builderProvider.builders.length + 1,
                      itemBuilder: (context, index) {
                        if (index == builderProvider.builders.length) {
                          return _buildBuilderControls(
                              context, builderProvider);
                        }

                        final builder = builderProvider.builders[index];
                        return BuilderCard(
                          builder: builder,
                          onStart: (workName, duration) {
                            builderProvider.startTimer(
                                builder.id, workName, duration);
                          },
                          onCancel: () {
                            builderProvider.cancelTimer(builder.id);
                          },
                          onRemove: builderProvider.builders.length > 2
                              ? () => builderProvider.removeBuilder(builder.id)
                              : null,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBuilderControls(BuildContext context, BuilderProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          if (provider.builders.length < 7)
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => provider.addBuilder(),
                icon: const Icon(Icons.add, size: 18),
                label: const Text(
                  'ADD BUILDER',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 13,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          if (provider.builders.length < 7 && provider.builders.length > 2)
            const SizedBox(width: 12),
          if (provider.builders.length > 2)
            Text(
              '${provider.builders.length}/7 Builders',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }
}
