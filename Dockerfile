FROM nginx:latest
# 포트 80을 노출하여 HTTP 트래픽 허용
EXPOSE 80
# 컨테이너 시작 시 NGINX 실행
CMD ["nginx", "-g", "daemon off;"]

