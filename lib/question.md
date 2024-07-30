P/S:
final nameProvider = StateNotifier<String?>((ref) => null);
=> nếu không có kiểu dữ liệu trong <> thì mặc định trả về Null

Trong StateNotifierProvider, state trong đó là immutable bên ngoài class, còn trong class thì mutable

// -----------------------------------------------------

1. Nên đặt ref.read, ref.watch bên trong hay ngoài build.

2. Sự khác biệt giữa StateNotifierProvider với StateProvider là gì :
   StateNotifierProvider có thể tạo nhiều phương thức trong 1 class - dễ test . Thường được sử dụng nhiều hơn StateProvider
3. ConsumerWidget kế thừa từ StatelessWidget hay ConsumerStatfulWidget?
