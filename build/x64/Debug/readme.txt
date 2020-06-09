1、先完成 config.json 配置
2、再执行 sqlcombine.exe


注：
1、请确保本地已安装mysql，并配置好环境变量。
2、config.json配置说明：
{
    // 需要合并的日志库信息集合
    "in":[
       {"ip":"192.168.6.238", "user":"root", "password":"654321", "dbname":"3dms_jf"},
       {"ip":"192.168.6.238", "user":"root", "password":"654321", "dbname":"3dms_jf"},
       {"ip":"192.168.6.238", "user":"root", "password":"654321", "dbname":"3dms_jf"},
       {"ip":"192.168.6.238", "user":"root", "password":"654321", "dbname":"3dms_jf"},
       {"ip":"192.168.6.238", "user":"root", "password":"654321", "dbname":"3dms_jf"},
       {"ip":"192.168.6.238", "user":"root", "password":"654321", "dbname":"3dms_jf"},
       {"ip":"192.168.6.238", "user":"root", "password":"654321", "dbname":"3dms_jf"},
       {"ip":"192.168.6.238", "user":"root", "password":"654321", "dbname":"3dms_jf"}   // 最后一行某位不要加逗号
    ],

    // 合并后的日志库信息
    "out":{"ip":"192.168.6.238", "user":"root", "password":"654321", "dbname":"3dms_jf_all", "time":1570000000}
}
3、jf.sql 为数据库结构