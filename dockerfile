FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build
WORKDIR /app
COPY . .
RUN msbuild BorderlessGaming.sln /p:Configuration=Release /p:OutputPath=out

FROM mcr.microsoft.com/dotnet/framework/runtime:4.8
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["BorderlessGaming.exe"]
