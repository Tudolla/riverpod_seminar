1.  Provider :
    ProviderRef cho phép tương tác giữa Provider - Provider
    WidgetRef là 1 object cho phép tương tác giữa Provider - Widget

    ConsumerWidget - ConsumerStatefulWidget:

    ConsumerWidget sử dụng khi chỉ lắng nghe sử thay đổi của Provider,
    ConsumerStatefulWidget vừa lắng nghe từ Provider, vừa có thể cập nhật nội bộ bằng setState, ...

    khi nào sử dụng Consumer, ConsumerWidget :

2.  StateProvider:
    Cho phép cập nhật state bên ngoài StateProvider, nhưng chỉ cho quản lý những dữ
    liệu đơn giản

3.  StateNotifer - StateNotifierProvider

    Cho phép cập nhật State và quản lý dữ liệu phức tạp như Object gồm nhiều trường thông tin
    StateNotifierProvider sử dụng class StateNotifier là quản lí các logic, giúp dễ kiểm thử

4.  ChangeNofierProvider: Không được khuyến khích sử dụng,
    vì nó hiệu suất kém, khó kiểm thử, mutable.
    Lí do nó được tạo ra bởi vì: giúp ltv dễ làm quen với ChangeNotifier từ Provider sang Riverpod.
    TH đặc biệt cần sử dụng ChangeNotiferProvider : thư viện thứ 3 yêu cầu sử dụng với ChangeNotifier.

5.  Future Provider:
    Là phiên bản tốt hơn của FutureBuilder,
    trả về AsyncValue - tốt hơn AsyncSnapshot:
    return FutureBuilder(
    future: Future,
    initialData: InitialData,
    builder: (BuildContext context, AsyncSnapshot snapshot){
    if(snapshot.connectionState == ConnectionState.waiting){

          }
          if(snapshot.hasData){

          }else{

          }

          if(snapshot.hasError){

          }
          return ;

    }
    )

    ở đây, ref.watch đặt ngoài hàm build(), có thể linh động trong các trường hợp khác nhau.

    .family giúp truy xuất, thêm 1 parameter trong hàm . nhược điểm là chỉ có 1 tham số input

6.  useful method on ProviderRef : keepAlive(), onDispose() , onCancel(),
    onResume(), onRemoveListener(), onAddListener().

7.  ProviderObsever
