#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
#WORKDIR /app
#EXPOSE 80
#EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
#WORKDIR /src
#COPY ["FinalProjectgRPC/FinalProjectgRPC.csproj", "FinalProjectgRPC/"]
#RUN dotnet restore "FinalProjectgRPC/FinalProjectgRPC.csproj"
#COPY . .
#WORKDIR "/src/FinalProjectgRPC"
#RUN dotnet build "FinalProjectgRPC.csproj" -c Release -o /app/build

FROM build AS publish
#RUN dotnet publish "FinalProjectgRPC.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY . .
ENTRYPOINT ["dotnet", "FinalProjectgRPC.dll"]