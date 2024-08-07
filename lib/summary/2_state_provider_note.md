2.  #### StateProvider - Immutable:

    #### Denifition:

    StateProvider là 1 Object giống Provider, nhưng có thể cập nhật 'state' của của Provider.

    #### User for:

    Những 'state' đơn giản có thể thay đổi 'state'.
    VD: final nameStateProvider = StateProvider((ref)=> "Ngoc Ngan"); // ref ở đây là ProvideRef

    ref.read(nameStateProvider.notifier).update((state) => "Ronando"); // 'state' mới là "Ronando". Được cập nhật, chứ không thay đổi,
    Trong đó :
    -notifier thông báo tới Provider là trạng thái có thể thay đổi
    -update là hàm có sẵn
    -state: là trạng thái hiện tại.

    Tuy nhiên, StateProvider dùng quản lý những 'state' đơn giản như String, num,..., nó vẫn có thể
    quản lí kiểu dữ liệu Object, nhưng xử lý sẽ cồng kềnh. Từ đó StateNotifierProvier ra đời.

    #### P/S:

    Tại sao StaeProvider là Immutable, nghĩa là bất biến, nhưng ta thấy name lại thay đổi
    từ "Ngoc Ngan" sang "Ronado" kìa??

    - ở đây, 'state' đã cập nhật thành state mới và gán 'state' mới là "Ronando",
      còn giá trị của name ban đầu vẫn là "Ngoc Ngan". Nên chỉ cập nhật, tạo ra 1 'state' mới,
      chứ giá trị vẫn không đổi nhé.

    #### useful method on ProviderRef for manage life circle.

    # ref.keepAlive():

    cái này buộc phải đi với .autoDispose()
    VD: final fetchUser = FutureProvider.autoDispose((ref) { // .autoDispose() là khi rời khỏi Screen A, thì dữ liệu bị hủy

    ref.keepAlive(); // sử dụng .keepAlive(), là khi Screen A chuyển sang Screen B, thì dữ liệu ở Screen A vẫn được giữ lại

    final userRepository = ref.watch(userRepositoryProvider);
    return userRepository.getAllUser();
    });

    # onDispose()

    Giống với dispose() trong StatefulWidget, nhưng là trong context của Riverpod, chứ không phải context
    của Widget Tree. Giúp giải phóng tài nguyên khi không sử dụng ngay trong màn hình, chứ không cần
    phải rời màn hình như .autoDispose().

    Có thể đăng ký nhiều hàm trong onDispose().

    VD: ref.onDispose(){
    textController.dispose(); // giải phóng tài nguyên trong trường nhập.
    channle.sink.close(); // đóng kết nối khi không thực hiện Chat nữa.
    }

    # onCancel(),

    Có thể đăng kí nhiều hàm Callback trong onCancel(), thường dùng trong Async.

    # onResume(), onRemoveListener(), onAddListener().

    #### ProviderObsever : giúp quan sát những thay đổi của Provider, dễ kiểm thử.

    Chính vì các Provider là Global, vượt tầm kiểm soát của Widget Tree, nên ProviderObserver như người giám sát 24/7.
    Dễ kiểm soát Provider trong các ứng dụng lớn.
