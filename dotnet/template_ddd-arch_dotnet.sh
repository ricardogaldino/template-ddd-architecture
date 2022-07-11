#!/bin/bash

PROJECT="$1"

SRC="src"
TEST="test"

DDD_UI="UI"
DDD_APPLICATION="Application"
DDD_DOMAIN="Domain"
DDD_INFRASTRUCTURE="Infrastructure"

DEPENDENCY="Dependency"
INTERFACES="Interfaces"

TEST_UNITARY="UnitTest"
TEST_INTEGRATION="IntegTest"
TEST_ARCHITECTURE="ArchTest"

MODELS="Models"
ENUMS="Enums"
VALUE_OBJECTS="ValueObjects"
SERVICES="Services"
CONTROLLERS="Controllers"
DATABASE="Database"
REPOSITORIES="Repositories"
EXTERNALS="Externals"

# --------------------------------------------------

rm -Rf "$PROJECT"
mkdir "$PROJECT"
cd "$PROJECT"

mkdir "$SRC"
mkdir "$TEST"

# --------------------------------------------------

dotnet new sln -n "$PROJECT"

# --------------------------------------------------
cd "$SRC"
# --------------------------------------------------

dotnet new webapi -n "$PROJECT.$DDD_UI" --no-https

cd "$PROJECT.$DDD_UI"
dotnet add package Microsoft.Extensions.DependencyInjection
dotnet add package Microsoft.Extensions.DependencyInjection.Abstractions
cd ..

# --------------------------------------------------

dotnet new classlib -n "$PROJECT.$DDD_DOMAIN"

cd "$PROJECT.$DDD_DOMAIN"
mkdir "$MODELS"
touch "$MODELS/.gitkeep"
mkdir "$VALUE_OBJECTS"
touch "$VALUE_OBJECTS/.gitkeep"
mkdir "$ENUMS"
touch "$ENUMS/.gitkeep"
mkdir "$SERVICES"
touch "$SERVICES/.gitkeep"
cd ..

# --------------------------------------------------

dotnet new classlib -n "$PROJECT.$INTERFACES"

cd "$PROJECT.$INTERFACES"

mkdir "$DDD_APPLICATION"
cd "$DDD_APPLICATION"
mkdir "$SERVICES"
touch "$SERVICES/.gitkeep"
cd ..

mkdir "$DDD_INFRASTRUCTURE"
cd "$DDD_INFRASTRUCTURE"

mkdir "$DATABASE"
cd "$DATABASE"
mkdir "$REPOSITORIES"
touch "$REPOSITORIES/.gitkeep"
cd ..

mkdir "$EXTERNALS"
cd "$EXTERNALS"
mkdir "$SERVICES"
touch "$SERVICES/.gitkeep"
cd ..

# --------------------------------------------------
cd ..
# --------------------------------------------------
cd ..
# --------------------------------------------------

dotnet new classlib -n "$PROJECT.$DEPENDENCY"

cd "$PROJECT.$DEPENDENCY"
dotnet add package Microsoft.Extensions.DependencyInjection
dotnet add package Microsoft.Extensions.DependencyInjection.Abstractions

mkdir "$DDD_APPLICATION"
cd "$DDD_APPLICATION"
mkdir "$SERVICES"
touch "$SERVICES/.gitkeep"
cd ..

mkdir "$DDD_INFRASTRUCTURE"
cd "$DDD_INFRASTRUCTURE"

mkdir "$DATABASE"
cd "$DATABASE"
mkdir "$REPOSITORIES"
touch "$REPOSITORIES/.gitkeep"
cd ..

mkdir "$EXTERNALS"
cd "$EXTERNALS"
mkdir "$SERVICES"
touch "$SERVICES/.gitkeep"
cd ..

# --------------------------------------------------
cd ..
# --------------------------------------------------
cd ..
# --------------------------------------------------

dotnet new classlib -n "$PROJECT.$DDD_APPLICATION"

cd "$PROJECT.$DDD_APPLICATION"
dotnet add package AutoMapper
dotnet add package Newtonsoft.Json

mkdir "$SERVICES"
touch "$SERVICES/.gitkeep"
cd ..

# --------------------------------------------------

dotnet new classlib -n "$PROJECT.$DDD_INFRASTRUCTURE"

cd "$PROJECT.$DDD_INFRASTRUCTURE"
dotnet add package Dapper
dotnet add package Microsoft.EntityFrameworkCore
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet add package EFCore.NamingConventions

mkdir "$DATABASE"
cd "$DATABASE"
mkdir "$REPOSITORIES"
touch "$REPOSITORIES/.gitkeep"
cd ..

mkdir "$EXTERNALS"
cd "$EXTERNALS"
mkdir "$SERVICES"
touch "$SERVICES/.gitkeep"
cd ..

# --------------------------------------------------
cd ..
# --------------------------------------------------
cd ..
# --------------------------------------------------
cd "$TEST"
# --------------------------------------------------

dotnet new xunit -n "$PROJECT.$TEST_UNITARY"

cd "$PROJECT.$TEST_UNITARY"
dotnet add package Microsoft.NET.Test.Sdk
dotnet add package xunit
dotnet add package xunit.runner.console
dotnet add package xunit.runner.visualstudio
dotnet add package coverlet.collector
dotnet add package coverlet.msbuild
# dotnet add package Moq
dotnet add package FakeItEasy
dotnet add package FluentAssertions
dotnet add package NBuilder
dotnet add package Faker.Net
dotnet add package Bogus

mkdir "$DDD_DOMAIN"
cd "$DDD_DOMAIN"
mkdir "$SERVICES"
touch "$SERVICES/.gitkeep"
cd ..

mkdir "$DDD_APPLICATION"
cd "$DDD_APPLICATION"
mkdir "$SERVICES"
touch "$SERVICES/.gitkeep"
cd ..

# --------------------------------------------------
cd ..
# --------------------------------------------------

cd "$TEST"
dotnet new xunit -n "$PROJECT.$TEST_INTEGRATION"

cd "$PROJECT.$TEST_INTEGRATION"
dotnet add package Microsoft.NET.Test.Sdk
dotnet add package Microsoft.AspNetCore.Mvc.Testing
dotnet add package DotNet.Testcontainers
dotnet add package xunit
dotnet add package xunit.runner.console
dotnet add package xunit.runner.visualstudio
dotnet add package coverlet.collector
dotnet add package coverlet.msbuild
# dotnet add package Moq
dotnet add package FakeItEasy
dotnet add package FluentAssertions
dotnet add package NBuilder
dotnet add package Faker.Net
dotnet add package Bogus

mkdir "$DDD_UI"
cd "$DDD_UI"
mkdir "$CONTROLLERS"
touch "$CONTROLLERS/.gitkeep"
cd ..

mkdir "$DDD_INFRASTRUCTURE"
cd "$DDD_INFRASTRUCTURE"

mkdir "$DATABASE"
cd "$DATABASE"
mkdir "$REPOSITORIES"
touch "$REPOSITORIES/.gitkeep"
cd ..

mkdir "$EXTERNALS"
cd "$EXTERNALS"
mkdir "$SERVICES"
touch "$SERVICES/.gitkeep"
cd ..

# --------------------------------------------------
cd ..
cd ..
# --------------------------------------------------

dotnet new xunit -n "$PROJECT.$TEST_ARCHITECTURE"

cd "$PROJECT.$TEST_ARCHITECTURE"
dotnet add package Microsoft.NET.Test.Sdk
dotnet add package Microsoft.AspNetCore.Mvc.Testing
dotnet add package xunit
dotnet add package xunit.runner.console
dotnet add package xunit.runner.visualstudio
dotnet add package coverlet.collector
dotnet add package coverlet.msbuild
dotnet add package TngTech.ArchUnitNET
dotnet add package TngTech.ArchUnitNET.xUnit

mkdir "$DDD_UI"
cd "$DDD_UI"
mkdir "$CONTROLLERS"
touch "$CONTROLLERS/.gitkeep"
cd ..

mkdir "$DDD_DOMAIN"
cd "$DDD_DOMAIN"
mkdir "$SERVICES"
touch "$SERVICES/.gitkeep"
cd ..

mkdir "$DDD_APPLICATION"
cd "$DDD_APPLICATION"
mkdir "$SERVICES"
touch "$SERVICES/.gitkeep"
cd ..

mkdir "$DDD_INFRASTRUCTURE"
cd "$DDD_INFRASTRUCTURE"

mkdir "$DATABASE"
cd "$DATABASE"
mkdir "$REPOSITORIES"
touch "$REPOSITORIES/.gitkeep"
cd ..

mkdir "$EXTERNALS"
cd "$EXTERNALS"
mkdir "$SERVICES"
touch "$SERVICES/.gitkeep"
cd ..

# --------------------------------------------------
cd ..
cd ..
cd ..
# --------------------------------------------------

dotnet sln "$PROJECT.sln" add "$SRC/$PROJECT.$INTERFACES/$PROJECT.$INTERFACES.csproj"
dotnet sln "$PROJECT.sln" add "$SRC/$PROJECT.$DEPENDENCY/$PROJECT.$DEPENDENCY.csproj"

dotnet sln "$PROJECT.sln" add "$SRC/$PROJECT.$DDD_UI/$PROJECT.$DDD_UI.csproj"
dotnet sln "$PROJECT.sln" add "$SRC/$PROJECT.$DDD_DOMAIN/$PROJECT.$DDD_DOMAIN.csproj"
dotnet sln "$PROJECT.sln" add "$SRC/$PROJECT.$DDD_APPLICATION/$PROJECT.$DDD_APPLICATION.csproj"
dotnet sln "$PROJECT.sln" add "$SRC/$PROJECT.$DDD_INFRASTRUCTURE/$PROJECT.$DDD_INFRASTRUCTURE.csproj"

dotnet sln "$PROJECT.sln" add "$TEST/$PROJECT.$TEST_UNITARY/$PROJECT.$TEST_UNITARY.csproj"
dotnet sln "$PROJECT.sln" add "$TEST/$PROJECT.$TEST_INTEGRATION/$PROJECT.$TEST_INTEGRATION.csproj"
dotnet sln "$PROJECT.sln" add "$TEST/$PROJECT.$TEST_ARCHITECTURE/$PROJECT.$TEST_ARCHITECTURE.csproj"

# --------------------------------------------------

dotnet add  "$SRC/$PROJECT.$INTERFACES/$PROJECT.$INTERFACES.csproj" reference "$SRC/$PROJECT.$DDD_DOMAIN/$PROJECT.$DDD_DOMAIN.csproj"

dotnet add  "$SRC/$PROJECT.$DEPENDENCY/$PROJECT.$DEPENDENCY.csproj" reference "$SRC/$PROJECT.$INTERFACES/$PROJECT.$INTERFACES.csproj"
dotnet add  "$SRC/$PROJECT.$DEPENDENCY/$PROJECT.$DEPENDENCY.csproj" reference "$SRC/$PROJECT.$DDD_APPLICATION/$PROJECT.$DDD_APPLICATION.csproj"
dotnet add  "$SRC/$PROJECT.$DEPENDENCY/$PROJECT.$DEPENDENCY.csproj" reference "$SRC/$PROJECT.$DDD_INFRASTRUCTURE/$PROJECT.$DDD_INFRASTRUCTURE.csproj"

dotnet add  "$SRC/$PROJECT.$DDD_UI/$PROJECT.$DDD_UI.csproj" reference "$SRC/$PROJECT.$DEPENDENCY/$PROJECT.$DEPENDENCY.csproj"

dotnet add  "$SRC/$PROJECT.$DDD_APPLICATION/$PROJECT.$DDD_APPLICATION.csproj" reference "$SRC/$PROJECT.$INTERFACES/$PROJECT.$INTERFACES.csproj"
dotnet add  "$SRC/$PROJECT.$DDD_INFRASTRUCTURE/$PROJECT.$DDD_INFRASTRUCTURE.csproj" reference "$SRC/$PROJECT.$INTERFACES/$PROJECT.$INTERFACES.csproj"

dotnet add  "$TEST/$PROJECT.$TEST_ARCHITECTURE/$PROJECT.$TEST_ARCHITECTURE.csproj" reference "$SRC/$PROJECT.$INTERFACES/$PROJECT.$INTERFACES.csproj"
dotnet add  "$TEST/$PROJECT.$TEST_ARCHITECTURE/$PROJECT.$TEST_ARCHITECTURE.csproj" reference "$SRC/$PROJECT.$DDD_UI/$PROJECT.$DDD_UI.csproj"
dotnet add  "$TEST/$PROJECT.$TEST_ARCHITECTURE/$PROJECT.$TEST_ARCHITECTURE.csproj" reference "$SRC/$PROJECT.$DDD_DOMAIN/$PROJECT.$DDD_DOMAIN.csproj"
dotnet add  "$TEST/$PROJECT.$TEST_ARCHITECTURE/$PROJECT.$TEST_ARCHITECTURE.csproj" reference "$SRC/$PROJECT.$DDD_APPLICATION/$PROJECT.$DDD_APPLICATION.csproj"
dotnet add  "$TEST/$PROJECT.$TEST_ARCHITECTURE/$PROJECT.$TEST_ARCHITECTURE.csproj" reference "$SRC/$PROJECT.$DDD_INFRASTRUCTURE/$PROJECT.$DDD_INFRASTRUCTURE.csproj"

dotnet add  "$TEST/$PROJECT.$TEST_INTEGRATION/$PROJECT.$TEST_INTEGRATION.csproj" reference "$SRC/$PROJECT.$INTERFACES/$PROJECT.$INTERFACES.csproj"
dotnet add  "$TEST/$PROJECT.$TEST_INTEGRATION/$PROJECT.$TEST_INTEGRATION.csproj" reference "$SRC/$PROJECT.$DDD_UI/$PROJECT.$DDD_UI.csproj"
dotnet add  "$TEST/$PROJECT.$TEST_INTEGRATION/$PROJECT.$TEST_INTEGRATION.csproj" reference "$SRC/$PROJECT.$DDD_INFRASTRUCTURE/$PROJECT.$DDD_INFRASTRUCTURE.csproj"

dotnet add  "$TEST/$PROJECT.$TEST_UNITARY/$PROJECT.$TEST_UNITARY.csproj" reference "$SRC/$PROJECT.$INTERFACES/$PROJECT.$INTERFACES.csproj"
dotnet add  "$TEST/$PROJECT.$TEST_UNITARY/$PROJECT.$TEST_UNITARY.csproj" reference "$SRC/$PROJECT.$DDD_DOMAIN/$PROJECT.$DDD_DOMAIN.csproj"
dotnet add  "$TEST/$PROJECT.$TEST_UNITARY/$PROJECT.$TEST_UNITARY.csproj" reference "$SRC/$PROJECT.$DDD_APPLICATION/$PROJECT.$DDD_APPLICATION.csproj"

# --------------------------------------------------
