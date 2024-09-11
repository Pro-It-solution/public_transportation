class MOCR {
  String? carNumber;

  String? getCarNumber() {
    return this.carNumber;
  }

  @override
  String toString() {
    return 'MOCR{carNumber=$carNumber}';
  }

  void setCarNumber(String? carNumber) => this.carNumber = carNumber;
}
