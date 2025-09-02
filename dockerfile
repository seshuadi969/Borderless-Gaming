# =========================
# Build stage
# =========================
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

# Copy only solution and csproj files first (layer caching)
COPY BorderlessGaming.sln ./
COPY BorderlessGaming/*.csproj BorderlessGaming/
COPY BorderlessGaming.Logic/*.csproj BorderlessGaming.Logic/

# Restore dependencies
RUN dotnet restore

# Copy the rest of the source code
COPY . .

# Build the application in Release mode
RUN dotnet build -c Release -o /app/build


# =========================
# Publish stage
# =========================
FROM build AS publish
RUN dotnet publish -c Release -o /app/publish /p:UseAppHost=false


# =========================
# Runtime stage
# =========================
FROM mcr.microsoft.com/dotnet/runtime:6.0 AS runtime
WORKDIR /app

# Copy published files
COPY --from=publish /app/publish .

# Set entrypoint
ENTRYPOINT ["dotnet", "BorderlessGaming.dll"]


