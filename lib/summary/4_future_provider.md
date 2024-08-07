4.  FutureProvider - Immutable:

    Denifition:
    Là Provider sử dụng để xử lý dữ liệu bất đồng bộ,

    User for:
    Async Data

    P/S:

    #### Các xử lý logic thường đặt trong riêng 1 nơi là repository : để tác động vật lý với Data,

    #### lấy Data về ấy. VD: tên class là :

    UserRepository(){

    - getAllUser();
    - getUserByName();
      }

    #### ProviderRef giúp trao đổi giữa Provider với Provider khác, nó đóng gói UserRepository(),

    #### trả về instance, giúp tối ưu memory, vì trong UserRepository có thể gồm 20 function,

    #### khi sử dụng mà cứ phải khai báo UserRepository ở các class khác thì sẽ tốn công tốn của,

    #### mà như đã nói : Provider nằm ngoài các Widget, nghĩa là Global, nên ở đây, chỉ cần khởi

    #### tạo 1 instance của UserRepository trong 'user' như bên dưới là tốt.

    #### có điểm hay ở đây, là Provider không chỉ quản lý dữ liệu đơn giản, mà có thể đóng gói

    #### dữ liệu phức tạo như UserRepository(), dĩ nhiên, nó chỉ là người vận chuyển, chứ không phải

    #### người xử lý logic, dữ liệu phức tạp.

    final userRepository = Provider((ref) = UserRepository());

    #### lấy giá trị từ FutureProvider , mang về cho các Widget, đừng mang ưu phiền về cho Widget.

    final getUser = FutureProvider((ref){
    final userFuture = ref.watch(userRepository);
    return userFuture.getAllUser();
    });

    #### CÓ THẤY GÌ ĐÁNG NGHI KHÔNG, ref.watch thường yêu cầu khai báo trong build(), để các Widget lắng

    #### nghe sự thay đổi , nhưng ở đây, lại đặt ngoài build() ???

    FutureProvider liên quan nhiều tới networking, learn it by yourself.

    #### Compare:

    FutureProvider là phiên bản tốt hơn của FutureBuilder,
    FutureProvider trả về AsyncValue - tốt hơn AsyncSnapshot của FutureBuilder:

    Ví dự, đây là cách sử dụng FutureBuilder(), các tham số bên trong khá cồng kềnh,
    return FutureBuilder(
    future: Future,
    initialData: InitialData,
    builder: (BuildContext context, AsyncSnapshot snapshot){
    if(snapshot.connectionState == ConnectionState.waiting){
    }
    if(snapshot.hasData){}
    else{}
    if(snapshot.hasError){
    }
    return ;
    }
    )

    Còn với FutureProvider, cung cấp 3 Case giá trị trả về là : Data, Loading, Error, có thể quản lý
    hầu hết các trường hợp gặp phải khi nhận về giá trị Future.

    ref.watch(futureProvider).when((data){
    return data;
    },
    error: (error, stackTrace){
    return error;
    },
    loading: return Loading();
    )
    => Perfect.
