import 'package:flutter/material.dart';
import 'package:untitled5/res/app_colors.dart';
import 'package:untitled5/res/app_icons.dart';
import 'package:untitled5/res/app_images.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  static const double IMAGE_HEIGHT = 300.0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: const BackButton(
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned.directional(
            top: 0.0,
            start: 0.0,
            end: 0.0,
            textDirection: Directionality.of(context),
            height: IMAGE_HEIGHT,
            child: Image.network(
              'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?q=80&w=2510&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.directional(
            top: IMAGE_HEIGHT - 16.0,
            start: 0.0,
            end: 0.0,
            textDirection: Directionality.of(context),
            child: Container(
              height: MediaQuery.sizeOf(context).height,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16.0),
                ),
              ),
              padding: const EdgeInsetsDirectional.only(
                top: 30.0,
                start: 20.0,
                end: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Petits pois et carottes',
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(
                    'Cassegrain',
                    style: theme.textTheme.displayMedium,
                  ),
                  const SizedBox(height: 20.0),
                  const ProductScores(),
                  const ProductDescription(
                    label: 'Quantité',
                    value: '200g',
                  ),
                  const ProductDescription(
                    label: 'Vendu',
                    value: 'France, Allemagne',
                    divider: false,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: ProductToggle(
                          label: 'Végétalien',
                          value: ProductInfoToggle.on,
                        ),
                      ),
                      Expanded(
                        child: ProductToggle(
                          label: 'Végatarien',
                          value: ProductInfoToggle.off,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProductScores extends StatelessWidget {
  const ProductScores({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 44,
                child: ProductNutriscore(),
              ),
              VerticalDivider(width: 1.0),
              Expanded(
                flex: 66,
                child: ProductNovaScore(),
              ),
            ],
          ),
        ),
        Divider(),
        ProductEcoScore(),
      ],
    );
  }
}

class ProductNutriscore extends StatelessWidget {
  const ProductNutriscore({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nutri-Score',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        FractionallySizedBox(
          widthFactor: 0.8,
          child: Image.asset(AppImages.nutriscoreA),
        ),
      ],
    );
  }
}

class ProductNovaScore extends StatelessWidget {
  const ProductNovaScore({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Groupe NOVA',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const Text('Produits alimentaires et boissons ultra-transformés'),
      ],
    );
  }
}

class ProductEcoScore extends StatelessWidget {
  const ProductEcoScore({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'EcoScore',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const Row(
          children: [
            Icon(
              AppIcons.ecoscore_d,
              color: AppColors.ecoScoreD,
            ),
            SizedBox(width: 10.0),
            Expanded(child: Text('Impact environnemental élevé')),
          ],
        )
      ],
    );
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    required this.label,
    required this.value,
    this.divider = true,
    super.key,
  });

  final String label;
  final String value;
  final bool divider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Text(label)),
            Expanded(
                child: Text(
              value,
              textAlign: TextAlign.end,
            )),
          ],
        ),
        if (divider) const Divider(),
      ],
    );
  }
}

class ProductToggle extends StatelessWidget {
  const ProductToggle({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final ProductInfoToggle value;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.blueLight,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Row(
        children: [
          Icon(icon),
          Text(label),
        ],
      ),
    );
  }

  IconData get icon => switch (value) {
        ProductInfoToggle.on => AppIcons.checkmark,
        ProductInfoToggle.off => AppIcons.close,
      };
}

enum ProductInfoToggle { on, off }
