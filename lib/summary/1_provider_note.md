1.  #### Provider - Immutable:

    Denifition:
    Provider là 1 Object dùng để đóng gói các trạng thái của (state - bất kì dữ liệu nào trong ứng dụng)
    và lắng nghe sự thay đổi của state đó.

    Use for:
    Quản lí dữ liệu là bất biến.
    VD: final name = StateProvider<String>((ref)=> "Ngoc Ngan"); //ref ở đây là ProvideRef

    dữ liệu của biến name luôn luôn là "Ki Duyen", không thể thay đổi trong ứng dụng.

    Tuy nhiên, Provider không thể cập nhật 'state', và StateProvider sinh ra:

    #### Đừng xem thường Provider:

    Đôi khi, thấy Provider chỉ làm được công việc là mang dữ liệu từ 1 nơi, sau đó truyền cho các Widget
    con, mình thấy nó làm được việc quá đơn giản(thay thế bằng quản lý 'state nội bộ trong StatefulWidget cũng được), kiểu ít công dụng.
    Nhưng nếu quay về thời điểm: Các widget trao đổi chiêu thức với nhau thông qua Constructor Injection rất cồng kềnh,
    VD: Widget 'Cháu' cần dữ liệu từ Widget 'Ông Cố' thì nó phải trao đổi thông qua 4 đời Constructor Widget.
    Nhưng, khi có Provider thì nó có thể mang dữ liệu đi khắp nơi, vượt tầm kiểm soát của Widget Tree,
    và trong Project lớn, sử dụng Provider dễ kiểm soát hơn,

    Đoạn sau: Provider có thể quản lý được dữ liệu Object nữa, vì thế có thể coi Provider là Người vận chuyển.

    #### P/S: Những định nghĩa cơ bản:

    ProviderRef: cho phép tương tác giữa Provider - Provider
    WidgetRef: cho phép tương tác giữa Provider - Widget

    ConsumerWidget - ConsumerStatefulWidget:

    ConsumerWidget sử dụng khi chỉ lắng nghe sử thay đổi của Provider, sau đó cập nhật sự thay đổi 'state' tới các Widget.
    ConsumerStatefulWidget vừa lắng nghe từ Provider, vừa có thể cập nhật nội bộ bằng setState, ...
    VD: trường nhập TextField() cần sử dụng, vì cần quản lý nội bộ trạng thái dispose() cho các TextField() sau khi không sử dụng tới - tránh rò rỉ.

    ##### BASIC

    # ref.read():

    khuyến khích sử dụng bên ngoài build(), vì nó chỉ đọc 1 lần,
    hoặc sử dụng trong các Function(), initState().

    # ref.watch() :

    khuyến khích sử dụng trong build(), vì nó lắng nghe sự thay đổi của state trong Provider, khi có sự thay đổi, Widget trong build() sẽ được cập nhật. Tuy nhiên, có trường hợp dùng
    ngoài build().

    # ref.listen():

    luôn lắng nghe sự thay đổi của 'state' trong Provider - giống ref.watch() .
    nhưng ref.listen() hơn chỗ, nó có thể thực hiện thêm 1 hành động cụ thể, như showSnackBar().
    VD: khi người dùng chơi game quá 180p/ ngày. ref.listen() khi lắng nghe tới thời gian 180p, nó
    sẽ showSnackBar("Stop").

    # ref.invalidate()

    sử dụng để refresh lại 'state' của Provider, trả về trạng thái ban đầu, thường sử dụng future, stream.
    VD: khi người dùng load sản phẩm tới cuối trang rồi, mà không muốn kéo lên mất time.

    ## modifier

    # .autoDispose() :

    khi rời khỏi widget, autoDispose() sẽ xóa hết những trạng thái đã có, trở về mặc định. VD: Khi người dùng nhận API, sau khi rời Widget, sẽ giải phóng dữ liệu, tránh rò rỉ bộ nhớ.

    # .family():

    Khi 1 Provider quản lý 'state' và Provider kia nhận kết quả, thì thì nhận thông qua tên
    Provider gửi đi, mà không có tham số gì.
    Nếu cần thực hiện chức năng lấy danh sách User.
    final userProvider = Provider((ref)=> UserRepository()); // bên gửi

    final getAllUser = FutureProvider((ref){ // bên nhận
    final userRepository = ref.watch(userProvider);
    return userRepository.getAllUser();
    });

    Có thể thấy, 'bên nhận' thì nhận tất cả những gì từ 'bên gửi', vậy TH cần nhận 1 User cụ thể,
    thì làm thế nào. Ta sẽ cần 1 tham số truyền vào trong 'bên nhận', do đó, cần sử dụng .family().

    final getOneUser = FutureProvider.family((ref, input){ // input là tham số đầu vào.

    })

    # .select()

    cải thiện tốt hiệu năng trong 1 số TH chỉ cần rebuild 1 Widget con, chứ không phải rebuild toàn bộ
    Widget cha.
