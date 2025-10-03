# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# copy toàn bộ source của project
COPY Products_Management/ ./Products_Management/

# restore từ bên trong thư mục project để tránh sai tên file
WORKDIR /src/Products_Management
RUN dotnet restore

# publish
RUN dotnet publish -c Release -o /app/publish

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
EXPOSE 80
ENV ASPNETCORE_URLS=http://+:80
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "Products_Management.dll"]