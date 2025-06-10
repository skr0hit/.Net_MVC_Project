# Use the official .NET 8 SDK image for building the application
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy the csproj file and restore dependencies
COPY *.csproj ./
RUN dotnet restore

# Copy the entire application and build it
COPY . ./
RUN dotnet publish -c Release -o /app/publish

# Use the ASP.NET Core runtime image for running the application
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .

# Expose the application port and start it
EXPOSE 9090
CMD ["dotnet", "MVC Application.dll"]