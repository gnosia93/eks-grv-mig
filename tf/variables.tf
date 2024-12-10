variable "key_pair" {
    type = string
    default = "aws-kp-2"                ## 콘솔에서 생성한 키페어 명칭으로 변경.
}

variable "your_ip_addr" {
    type = string
    default = "218.48.121.0/24"       ## 네이버에서 "내아이피" 로 검색한 후, 결과값을 CIDR 형태로 입력.
}

# https://search.naver.com/search.naver?where=nexearch&sm=top_sug.pre&fbm=0&acr=1&acq=%EB%82%B4%EC%95%84%EC%9D%B4%ED%94%BC&qdt=0&ie=utf8&query=%EB%82%B4%EC%95%84%EC%9D%B4%ED%94%BC
