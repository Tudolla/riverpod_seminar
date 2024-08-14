2.  AsyncNotifierProvider - Immutable:

    Denifition:
    AsyncNotifierProvider là sự lựa chọn thay thế cho Future, StreamProvider trong đa số trường hợp.
    Và nó có thể Mutable State. Mục đích cho Mutable là để đơn giản hóa code hơn,
    đồng thời, với việc immutable là khi cứ phải tạo ra 1 bản sao mới của state => sẽ dẫn tới hiệu suất
    kém hơn.

    VIP Provider.
    User for:
    P/S:
