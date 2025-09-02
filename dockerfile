
# Use Microsoft .NET Framework SDK image
FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build
WORKDIR /src
COPY . .
RUN msbuild BorderlessGaming/BorderlessGaming.csproj /p:Configuration=Release /p:OutputPath=c:\app

# Runtime image
FROM mcr.microsoft.com/dotnet/framework/runtime:4.8
WORKDIR /app
COPY --from=build C:\app .
ENTRYPOINT ["BorderlessGaming.exe"]
