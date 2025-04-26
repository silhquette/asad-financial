class Bank {
  final String name;
  final String imagePath;
  final int minimumTransaction;

  Bank({
    required this.name,
    required this.imagePath,
    required this.minimumTransaction,
  });

  String getMinimumRupiah() {
    return 'Rp ${minimumTransaction.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.',
    )}';
  }
}

List bankOptions = [
  Bank(name: 'BRI', imagePath: 'assets/icons/bank-bri.png', minimumTransaction: 100000),
  Bank(name: 'BNI', imagePath: 'assets/icons/bank-bni.png', minimumTransaction: 100000),
  Bank(name: 'BCA', imagePath: 'assets/icons/bank-bca.png', minimumTransaction: 50000),
];