/* uso del between , solo 2 estremi */
select *
from ang.Persone p
where p.DataDiNascita between '2000-1-1' and '2029-1-1'

SELECT *
FROM ang.Persone p
WHERE p.Cognome BETWEEN 'M' AND 'T';

/* uso del in - puo essere una tabella  */
SELECT *
FROM ang.Persone p
WHERE p.Altezza in (1.5, 1.7, 1.8)

/* ordinamento */
SELECT *
FROM ang.Persone p
order by p.Nome asc

/* concatenazione colonne , il arder by agisce anche sui valori che non ci 
sono in mostra dati di select , fa un cast implicito sui valore null */
SELECT top (10) CONCAT(p.Cognome ,'->',p.Nome) as concatenato,*
FROM ang.Persone p
order by p.Nome asc

/* isnull trafomazione  e sostituisce il valore */
SELECT *, ISNULL(s2.SecondoNomeId,-1) as nullo
FROM ang.SecondiNomi s1 full join ang.SecondiNomi s2 on s1.SecondoNomeId=s2.PersonaId  
order by nullo desc

/* uso corretto del order, farlo per valori presenti nel selct
non da errore per deve essere chiaro */
SELECT p.Cognome
FROM ang.Persone p
order by p.Nome asc

/*like con [a-c]% iniziano con a b,c + % altri cose uso con not ^  */
SELECT *
FROM ang.Persone p
where p.Nome like '[a-b]%'


/*case when 
case
	when cond1 then 'risultato1'	
	when cond2 then 'risultato2'
	else 'valore_default'
end
*/

SELECT *,
CASE
	WHEN p.PersonaId > 30 THEN 'The quantity is greater than 30'
	WHEN p.PersonaId = 30 THEN 'The quantity is 30'
	ELSE 'The quantity is under 30'
END AS QuantityText
FROM ang.Persone p;

/* funzioni iff */

SELECT *, IIF(p.CittaId  > 5, 'MORE', 'LESS') AS QuantityStatus
FROM ang.Persone p;

/*contare con grup by, se nullll non lo conta attento 
con count (distinct conta le uniche)
*/
; with cte_mio as (
	SELECT s1.SecondoNome nome12,s1.SecondoNomeId, ISNULL(s1.SecondoNomeId,-1) as nullo
	FROM ang.SecondiNomi s1 full join ang.SecondiNomi s2 
	on s1.SecondoNomeId=s2.PersonaId  
)
select count (1)
from cte_mio


/*usa il group by sempre con i valore nella slect, poi fai funzioni di calcolo
raggrupa i casi null cmq quindi interesante*/

; with cte_mio as (
	SELECT s1.SecondoNome nome12,s1.SecondoNomeId, ISNULL(s1.SecondoNomeId,-1) as nullo
	FROM ang.SecondiNomi s1 full join ang.SecondiNomi s2 
	on s1.SecondoNomeId=s2.PersonaId  
)
select nome12,count(1)
from cte_mio
group by nome12
having count(1) <4

/* FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY */

/* uso del convert */
SELECT *, CONVERT (int,p.Altezza) tutti 
FROM ang.Persone p
WHERE p.Cognome BETWEEN 'M' AND 'T';


/* uso del cast */
SELECT *, CAST(YEAR(p.DataDiNascita) AS INT) intero
FROM ang.Persone p
WHERE p.Cognome BETWEEN 'M' AND 'T';

/*aggiungere dati*/
UPDATE lotr.Hobbits
SET IsActive = 0
WHERE Cognome = 'Baggins';


/* substring */
SELECT *, CAST(YEAR(p.DataDiNascita) AS INT) intero,SUBSTRING(p.Cognome,1,1)
FROM ang.Persone p
WHERE p.Cognome BETWEEN 'M' AND 'T';

/* string_agg */
select n.NomeNazione, COUNT(1) as numero, string_Agg(c.NomeCitta,' ')
from geo.Citta c join geo.Nazioni n on c.NazioneId = n.NazioneId
group by n.NomeNazione


/* */
select CONCAT(p.nome , isnull(s.SecondoNome,'x') , p.cognome) as FirstLastName from
ang.Persone p left join ang.SecondiNomi s on p.PersonaId = s.PersonaId where p.Nome in
( 'Giovanni', 'Alessandro ', 'Adriano') 































