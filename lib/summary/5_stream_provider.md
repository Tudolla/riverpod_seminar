2.  #### StateProvider - Immutable:

    #### Denifition:

    Là 1 Provider tương tự như FutureProvider giúp quản lý dữ liệu luồng, liên tục.
    User for:
    Video, Chat , Call, List that changing.
    cấu trúc giống FutureProvider.

    ref.watch(streamProvider).when((data){
    return data;
    },
    error: (error, stackTrace){ // stackTrace giúp việc dò lỗi dễ hơn thì phải.
    return error;
    },
    loading: return loading();

    );

    #### P/S:

    StreamProvider đang được thay thế bởi AsyncNotifierProvider.
    AsyncNotifierProvider có thể làm hầu hết mọi việc của StreamProvider,với thao tác đơn giản hơn.
