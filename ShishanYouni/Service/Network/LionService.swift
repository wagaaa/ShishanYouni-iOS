/**
 *  网络服务层
 *  使用Moya实现
 *  By JerryWang
 */

import Alamofire
import Moya

public enum Lion {
    //  获取轮播图
    case imgurl
    //  获取课表
    case timeTable
    case checkAccount(username: String, passwd: String)
}

extension Lion: TargetType{
    //  初始URL
    public var baseURL: URL{
        return URL(string: "https://lion.hzau.edu.cn")!
    }
    //  URL路径
    public var path: String{
        switch self {
        case .imgurl:
            return "/app/navImgs"
        case .timeTable:
            return "/app/ios/timetable"
        case .checkAccount(_: _:):
            return "/app/ios/bind"
        }
    }
    //  http方法
    public var method: Moya.Method{
        return .post
    }
    // headers
    public var headers: [String : String]? {
        return ["Content-Type":"application/json"]
    }
    //  示例数据
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    //  获取方法
    public var task: Task{
        switch self {
        //  轮播图，Params和请求
        case .imgurl:
            var params: [String: Any] = [:]
            params["platform"] = "voluptate"
            params["schoolId"] = "aliquip fugiat pariatur"
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        //  课表，Params和请求
        case .timeTable:
            var params: [String: Any] = [:]
            params["password"] = "88888888"
            params["term"] = "1"
            params["type"] = "0"
            params["username"] = "12345678"
            params["year"] = "2022"
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case let .checkAccount(username, passwd):
            var params: [String: Any] = [:]
            params["password"] = passwd
            params["type"] = "1"
            params["username"] = username
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        }
    }
}
