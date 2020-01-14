
enum ProductError: Error {
    case invalidPrice
    case invalidQuantity
}

enum DiscountError: Error {
    case invalidPrice
}

enum TaxError: Error {
    case invalidPrice
    case invalidState
}
