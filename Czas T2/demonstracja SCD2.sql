use HD_Transportex
-- zaktualizowanie cen i opisów typów przesyłek dla Slowly Changing Dimension
update dbo.PackageTypes set Description='Polecona przesyłka za pobraniem2', Price='16.99' where Name='polecona pobraniowa'
update dbo.PackageTypes set Description='Polecona przesyłka opłacona z góry2', Price='14.99' where Name='polecona opłacona'
update dbo.PackageTypes set Description='Priorytetowa przesyłka za pobraniem3', Price='15.99' where Name='priorytetowa pobraniowa'
update dbo.PackageTypes set Description='Priorytetowa przesyłka opłacona z góry4', Price='13.99' where Name='priorytetowa opłacona'
update dbo.PackageTypes set Description='Zwykła przesyłka za pobraniem5', Price='12.99' where Name='zwykła pobraniowa'
update dbo.PackageTypes set Description='Zwykła przesyłka opłacona z góry6', Price='8.99' where Name='zwykła opłacona'

-- zaktualizowanie atrybutów magazynów dla Slowly Changing Dimension