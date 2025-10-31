/* QUERY 1
 
Trova tutti gli album usciti dopo il 2020  
Le colonne estratte devono essere:  
 
1. Il titolo (tutto in maiuscolo) - Alias: LowerCaseTitle  
2. L’anno di pubblicazione */


SELECT lower (a.AlbumTitle) as LowerCaseTitle, a.ReleaseYear
from music.Albums a
where a.ReleaseYear >2020 

/*QUERY 2
 
Trova tutti gli utenti nati dopo il 2000  
Le colonne estratte devono essere   
 
1. Nome + Cognome in una sola colonna, separate da “ ” - Alias: “Utenti 
Junior”  
2. Anno di nascita - Alias: "Anno di Nascita" 
3. Se la data di nascita è < 31/12/2004, scrivi "Giovani", se è oltre il 
1/1/2005 scrivi "Giovanissimi" - Alias: "Classificazione"
*/

select CONCAT(u.FirstName,'+',u.LastName) as [Utente Junior],
u.BirthDate as [Anno di Nascita]
,iif(u.BirthDate<'2004-12-31','Giovani','Giovanissimi') as [Classificazione]
from pers.Users u
where u.BirthDate >'2000'

/*QUERY 3
Conta quanti utenti hanno attivato un abbonamento nel 2023 e che hanno 
il cognome che comincia per 'B' o 'S'  
Le colonne estratte devono essere  
 
1. Conteggio totale - Alias: "Abbonati2023" 
*/

select count(*) as [Abbonati2023]
from pers.Users u join pers.SubscriptionTypes on u.SubscriptionTypeId=u.SubscriptionTypeId
where u.SubscriptionDate like '2023%' and u.LastName like 'B%' or u.LastName like 'S%'



/* QUERY 4
Trova i primi cinque utenti con più follower, tenendo in considerazione che 
l'id di chi segue è la colonna "FollowerId", mentre l'id di chi è seguito è la 
colonna "FollowingId".  
 
Se due utenti hanno lo stesso numero di follower, mostra i primi in ordine 
alfabetico per cognome 
Le colonne estratte devono essere   
 
1. Nome utente  
2. Cognome utente 
3. Numero dei followers - alias: “Num_followers” 
*/


select top(5) u.FirstName as [Nome utente], u.LastName as [Cognome utente], count (1) as Num_followers
from  pers.Users u join pers.Followers f on u.UserId = f.FollowerId
group by u.UserId, u.FirstName, u.LastName
order by Num_followers desc


/*QUERY  5
Trova tutte le canzoni che sono state composte da più persone      
Le colonne estratte devono essere:   
 
1. Titolo della canzone   

 2. elenco degli autori separato da “, ” - Alias: Autori 
Ordina per titolo decrescente 

*/

select t.TrackId,t.TrackTitle,  string_Agg(a.ArtistName,',') as [Autori ]
from music.Tracks t 
join music.TrackAuthors ta on ta.TrackId = t.TrackId 
join music.Artists a on a.ArtistId= ta.ArtistId
group by t.TrackId,t.TrackTitle
having COUNT (1)>1
order by t.TrackTitle desc


/*QUERY  6
Trova le prime tre playlist con più brani.  
Le colonne estratte devono essere:   
 
1. Nome della playlist  
2. numero dei brani - Alias: NumBrani 
*/

select top(3) p.PlaylistId , p.PlaylistName as playlist,count (1)  as numeroBrani
from usercontent.Playlists p 
	join usercontent.PlaylistTracks pt on pt.PlaylistId=p.PlaylistId
	join music.Tracks t on t.TrackId = pt.TrackId
group by p.PlaylistId, p.PlaylistName
order by numeroBrani desc


/* QUERY 7
Trova tutti gli album in cui la media delle recensioni è maggiore o uguale a 
4.5  
Le colonne estratte devono essere:   
 
1. Titolo album  ok
2. Anno di uscita dell'album 
3. Media delle votazioni con almeno due cifre decimali di precisione - 
Alias: AvgRating 
4. Se la media è = 5 scrivi "Eccellente", 
se è = 4.5 scrivi "Buono", 
negli 
altri casi (quindi tra 4.5 e 5 estremi esclusi) scrivi "Ottimo" - Alias: 
"Valutazione" 
Ordina in base a chi ha la media più alta (ordinamento discendente), a 
parità di media, ordina per anno di uscita (ordinamento discendente)  
  
N.B. Considera che alcuni album potrebbero avere lo stesso titolo e 
anno di uscita
*/
select a.AlbumId , a.AlbumTitle as [Titolo album], a.ReleaseYear ,avg(r.Rating) as AvgRating,
CASE
	WHEN (avg(r.Rating) = 5) THEN 'Eccellente'
	WHEN (avg(r.Rating) = 4.5) THEN 'Buono'
	ELSE 'Ottimo'
END AS Valutazione

from music.Albums a join usercontent.Reviews r on r.AlbumId = a.AlbumId
group by a.AlbumId,a.AlbumTitle, a.ReleaseYear 
order by Valutazione asc


/* QUERY 8 
Trova la traccia che è stata ascoltata più volte da una singola persona  
Le colonne estratte devono essere:  
 
1. Titolo della traccia  
2. Nome della persona 
3. Cognome della persona 
  
N.B. Considera che alcune tracce musicali potrebbero avere lo stesso 
titolo 
*/
with cte_contatore as (
	select  u.UserId utente_id,t.TrackId ,COUNT(t.TrackId) quantitaTraccia
	from pers.Users u 
	join activity.Listens l on l.UserId = u.UserId
	join music.Tracks t on t.TrackId = l.TrackId
	group by u.UserId,t.TrackId
)
select utente_id, max(quantitaTraccia)
from cte_contatore 
group by utente_id




/* qury 15
Trova il sistema operativo più usato per ascoltare musica nel 2024 
(basandosi sul numero di tracce ascoltate).  
Le colonne estratte devono essere  
 
1. Il nome del sistema operativo 
2. Il numero di tracce ascoltate - Alias: TrackCount */

select top (1) o.OperatingSystemId, o.OperatingSystem,COUNT(1) as TrackCount
from activity.OperatingSystems o 
join activity.Devices d on d.OperatingSystemId = o.OperatingSystemId
join activity.Listens l on l.DeviceId = d.DeviceId 
join music.Tracks t on t.TrackId = l.TrackId
WHERE l.ListenDate >= '2024-01-01' AND l.ListenDate < '2025-01-01'
group by o.OperatingSystemId,o.OperatingSystem
order by o.OperatingSystemId, o.OperatingSystem,COUNT(1) desc










