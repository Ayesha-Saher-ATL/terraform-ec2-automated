# STAGE 1: Build the application
# We use the 'SDK' image because it has the tools to compile code
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy the project file and restore dependencies
COPY ["MyWeatherApi.csproj", "./"]
RUN dotnet restore

# Copy everything else and build the release version
COPY . .
RUN dotnet build "MyWeatherApi.csproj" -c Release -o /app/build

# STAGE 2: Publish
# This creates a slim version of the app ready for production
FROM build AS publish
RUN dotnet publish "MyWeatherApi.csproj" -c Release -o /app/publish

# STAGE 3: Final Production Image
# We use the 'aspnet' image because it's tiny and only has the 'Runtime'
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MyWeatherApi.dll"]