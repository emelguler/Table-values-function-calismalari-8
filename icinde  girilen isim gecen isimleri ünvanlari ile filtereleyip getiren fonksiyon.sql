USE [Okul]

use Okul


--icinde  girilen isim gecen isimleri ünvanlari ile filtereleyip getiren fonksiyon:

ALTER FUNCTION [dbo].[FN$OgretmenOgrenciAdaGoreFiltrele]
(
  @Metin nvarchar(20)
)
    RETURNS @contacts TABLE (
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        person_type VARCHAR(20)
    )
AS
BEGIN
    INSERT INTO @contacts(first_name,last_name,person_type)
    SELECT 
        Adi as first_name, 
        SoyAdi as last_name, 
        'Ogrenci' as person_type
    FROM
       dbo.Ogrenci
	   where ltrim(rtrim(Adi))+' '+ltrim(rtrim(SoyAdi)) like '%'+@Metin+'%'

    INSERT INTO @contacts(first_name,last_name,person_type)
    SELECT 
        Adi as first_name, 
        SoyAdi as last_name, 
        'Ogretmen' as person_type
    FROM
        dbo.Ogretmen
		where ltrim(rtrim(Adi))+' '+ltrim(rtrim(SoyAdi)) like '%'+@Metin+'%'
    RETURN;
END;



--cagiralim:
select * from dbo.FN$OgretmenOgrenciAdaGoreFiltrele('Emel Güler')



