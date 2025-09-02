
# Use official .NET SDK image for build
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

# Copy everything
COPY . .

# Restore dependencies
RUN dotnet restore

# Build app
RUN dotnet publish -c Release -o /app

# Runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app .

# Expose port (adjust if needed)
EXPOSE 5000

# Run the app
ENTRYPOINT ["dotnet", "Borderless-Gaming.dll"]
