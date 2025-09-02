# Use Windows .NET Framework SDK to build
FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build
WORKDIR /src
COPY . .
RUN msbuild BorderlessGaming.sln /p:Configuration=Release /p:OutputPath=C:\out

# Use Windows .NET Framework runtime
FROM mcr.microsoft.com/dotnet/framework/runtime:4.8
WORKDIR /app
COPY --from=build C:\out .
ENTRYPOINT ["BorderlessGaming.exe"]
