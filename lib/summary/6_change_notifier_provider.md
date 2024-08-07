6.  #### ChangeNotifierProvider - Only Mutable Provider: Not Recommend!

    #### Denifition:

    ChangeNotifierProvider tương tự, có thể làm được những điều mà StateNotifierProvider làm được,
    tuy nhiên : nó hiệu suất kém, khó kiểm thử, mutable - nguy hiểm vì khó kiểm soát sự thay đổi

    User for:
    Giống StateNotifierProvider.

    P/S:
    Tại sao ChangeNotifierProvider là Mutable:
    VD:

    #### ChangeNotifier xử lý logic

    class UserChangeNotifier extends ChangeNotifier {
    User user = const User(name: '', age: 18); // ở đây, giá trị khởi tạo chính là đối tượng User,
    không phải 'state'

    void updateNameChange(String n) {
    user = user.copyWith(name: n);
    notifyListeners();
    }

    void updateAgeChange(int a) {
    user = user.copyWith(age: a);
    notifyListeners();
    }
    }

    #### trả về đối tượng ChangeNotifierProvider, sử dụng cho các Widget

    final userProvider =
    ChangeNotifierProvider<UserChangeNotifier>((ref) => UserChangeNotifier());

    #### Khi các widget nhận dữ liệu từ ChangeNotifierProvider, có thể thay đổi trực tiếp dữ liệu.

    final getUser = ref.watch(userProvider).user;
    ở đây, getUser trả về trực tiếp là giá trị hiện tại của Model User, nó không phải là 'state'
    và mình có thể thay đổi giá trị của getUser này.

    getUser = User(name : "Hello", age: 20); // giá trị getUser đã nhận giá trị mới

    #### Vậy Riverpod không khuyến khích sử dụng ChangeNotifierProvider, thế thì tạo ra nó làm gì,

    Trước Riverpod là thư viện Provider , và khi chuyển sang Riverpod, trong dự án vẫn còn tồn đọng 1 số
    cách quản lý của thư viện Provider. Nên để người dùng không bị thay đổi đột ngột, nên ChangeNotifierProvider là cầu nối cho sự nâng cấp.

    Bên cạnh đó, 1 số thư viện bên thứ 3 chỉ dùng được với ChangeNotifierProvider.
