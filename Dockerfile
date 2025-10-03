# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# copy source của project và restore
COPY Products_Management/ ./Products_Management/
RUN dotnet restore "Products_Management/Products_Management.csproj"

# nếu có file solution, copy để future-proof (không bắt buộc)
COPY Products_Management.sln .

# publish
WORKDIR /src/Products_Management
RUN dotnet publish "Products_Management.csproj" -c Release -o /app/publish

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
EXPOSE 80
ENV ASPNETCORE_URLS=http://+:80
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "Products_Management.dll"]