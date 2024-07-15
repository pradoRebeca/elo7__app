import 'package:elo7_app/layers/presentation/components/image_card.dart';
import 'package:elo7_app/layers/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellerStatement extends StatelessWidget {
  const SellerStatement({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      color: Theme.of(context).colorScheme.secondary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildImageSection(),
          const SizedBox(height: 40),
          _buildTitle(context),
          _buildSellerTitle(context),
          const SizedBox(height: 24),
          _buildSellerDetail(context),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return const SizedBox(
      height: 260,
      child: ImageCard(
        pathImage: 'assets/images/sellers/seller_artisan.png',
        borderRadius: 16,
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'Palavra da vendedora',
      style: Theme.of(context).textTheme.titleMedium,
    );
  }

  Widget _buildSellerTitle(BuildContext context) {
    return Obx(
      () => Text(
        controller.sellerStatementSection.value.title ?? '',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSellerDetail(BuildContext context) {
    return Obx(
      () => Text(
        controller.sellerStatementSection.value.detail ?? '',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
