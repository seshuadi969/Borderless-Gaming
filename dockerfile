# Build stage
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

# Copy solution and restore dependencies
COPY BorderlessGaming.sln ./
COPY BorderlessGaming/ ./BorderlessGaming/
RUN dotnet restore

# Build the app
RUN dotnet publish BorderlessGaming.sln -c Release -o out

# Runtime stage
FROM mcr.microsoft.com/dotnet/runtime:6.0
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "BorderlessGaming.dll"]

