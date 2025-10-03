# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# copy csproj và restore (csproj nằm trong thư mục Products_Management)
COPY Products_Management/Products_Management.csproj Products_Management/
RUN dotnet restore "Products_Management/Products_Management.csproj"

# copy toàn bộ source
COPY . .
# đặt lại workdir vào thư mục project và publish
WORKDIR /src/Products_Management
RUN dotnet publish "Products_Management.csproj" -c Release -o /app/publish

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
EXPOSE 80
ENV ASPNETCORE_URLS=http://+:80
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "Products_Management.dll"]