# 1. 베이스 이미지 설정
FROM python:3.10-slim

# 2. 환경 변수 설정
ENV PYTHONUNBUFFERED=1

# 3. 작업 디렉토리 설정
WORKDIR /app

# 4. 소스 코드 및 의존성 복사
COPY ./app ./app
COPY ./requirements.txt .

# 5. 패키지 설치
RUN pip install --no-cache-dir -r requirements.txt

# 6. 앱 루트로 워킹 디렉토리 변경
WORKDIR /app/app

# 7. 애플리케이션 실행
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "9007"]

# 8. 포트 노출
EXPOSE 9007
