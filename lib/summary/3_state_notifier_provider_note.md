3.  #### StateNotifierProvider - Immutable:

    #### Denifition:

    StateNotifierProvider là 1 Provider giúp xử lý những trạng thái phức tạp,
    nó thường đi cùng với StateNotifier là đối tượng để xử lý logic, và một 'State' là
    đối tượng được quản lý.
    VD:
    class UserProvider extends StateNotifier<User>{
    super(); // giá trị truyền bên trong super() là giá trị khởi tạo của 'state' : User

        // những logic phức tạp đặt trong StateNotifier, điều mà StateProvider khó làm hơn.
        void updateUserInfor(){};
        // sử dụng StateNotifier giúp dễ kiểm thử.
        void findUser(){};

    }

    final user = StateNotifierProvider<UserProvider, User>(
    (ref) = UserProvider( truyền vào initial state nha);
    );
    Như đã nói, StateNotifierProvider bao gồm:

    - UserProvider - để xử lý logic cho 'state'
    - User - 'state' được quản lý.

    Việc tạo final user ở đây, nó như 1 instance đã bao gồm nhiều phương thức xử lý bên trong,
    như updateUserInfor(), findUser() ,... vì trong StateNotifier có thể gồm 20-30 phương thức xử lý
    logic. Điều này giúp hiệu suất hơn, dễ kiểm thử vì tất cả logic nằm trong 1 đống rồi.
    => đoán thế :((())).

    #### User for:

    Những 'state' phức tạp, có thể thay đổi

    P/S:
