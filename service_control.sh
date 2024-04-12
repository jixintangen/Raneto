#!/bin/bash

start_service() {
    # 执行npm run start_win命令并在后台运行
    nohup npm run start_win &
}

stop_service() {
    # 在 Windows 中没有类似于 pkill 或者 killall 的命令，因此需要采用其他方法来停止进程
    # 这里我们假设 npm run start_win 会启动一个 node 进程，因此可以使用 taskkill 来结束进程
    taskkill /F /IM node.exe
    echo "服务已停止"
}

stop_service() {
    # 使用 taskkill 命令终止 node.exe 进程
    taskkill //F //IM node.exe
    echo "服务已停止"
}


# 检查命令行参数
case "$1" in
    start)
        start_service
        ;;
    stop)
        stop_service
        ;;
    restart)
        stop_service
        start_service
        ;;
    *)
        echo "用法: $0 {start|stop|restart}"
        exit 1
        ;;
esac
