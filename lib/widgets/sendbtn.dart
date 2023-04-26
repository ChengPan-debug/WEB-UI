import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/utils/dio_utils.dart';
import 'package:flutter_web/utils/responsive_layout.dart';

class SendBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color(0xFFC86DD7),
              Color(0xFF3023AE),
            ], begin: Alignment.bottomRight, end: Alignment.topLeft),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                  color: const Color(0xFF6078ea).withOpacity(.3),
                  offset: const Offset(0.0, 8.0),
                  blurRadius: 8.0)
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              getUser();
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Notify",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: ResponsiveLayout.isSmallScreen(context)
                              ? 12
                              : ResponsiveLayout.isMediumScreen(context)
                                  ? 12
                                  : 16,
                          letterSpacing: 1.0)),
                  SizedBox(
                    width: ResponsiveLayout.isSmallScreen(context)
                        ? 4
                        : ResponsiveLayout.isMediumScreen(context)
                            ? 6
                            : 8,
                  ),
                  kIsWeb
                      ? Image.network(
                          'assets/send.png',
                          color: Colors.white,
                          width: ResponsiveLayout.isSmallScreen(context)
                              ? 12
                              : ResponsiveLayout.isMediumScreen(context)
                                  ? 12
                                  : 20,
                          height: ResponsiveLayout.isSmallScreen(context)
                              ? 12
                              : ResponsiveLayout.isMediumScreen(context)
                                  ? 12
                                  : 20,
                        )
                      : Image.asset(
                          'assets/send.png',
                          color: Colors.white,
                          width: ResponsiveLayout.isSmallScreen(context)
                              ? 12
                              : ResponsiveLayout.isMediumScreen(context)
                                  ? 12
                                  : 20,
                          height: ResponsiveLayout.isSmallScreen(context)
                              ? 12
                              : ResponsiveLayout.isMediumScreen(context)
                                  ? 12
                                  : 20,
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 获取权限列表
  getUser() async {
    /// 开启日志打印
    DioUtil.instance?.openLog();
    Map<String, Object> map = {};
    map['page'] = '1';
    map['limit'] = '100';
    map['work_type'] = '0';
    map['brand_id'] = '0';
    map['sort'] = '0';
    map['grade'] = '0';
    map['catena_id'] = '0';
    map['classify_id'] = '0';

    /// 发起网络接口请求
    var result = await DioUtil()
        .request('market/publishV2', method: DioMethod.post, params: map);
  }
}
