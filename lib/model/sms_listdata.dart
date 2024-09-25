import 'package:flutter/foundation.dart';

import 'sms_data.dart';

class SMSListdata {
  final List<SMSData> dataList;
  final int total;
  SMSListdata({required this.dataList, required this.total});

  SMSListdata copyWith({
    List<SMSData>? dataList,
    int? total,
  }) {
    return SMSListdata(
      dataList: dataList ?? this.dataList,
      total: total ?? this.total,
    );
  }

  @override
  String toString() => 'SMSListdata(dataList: $dataList, total: $total)';

  @override
  bool operator ==(covariant SMSListdata other) {
    if (identical(this, other)) return true;

    return listEquals(other.dataList, dataList) && other.total == total;
  }

  @override
  int get hashCode => dataList.hashCode ^ total.hashCode;
}
