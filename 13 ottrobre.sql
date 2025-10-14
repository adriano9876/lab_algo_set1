/*select  distinct Cognome
from lotr.Hobbits
order by Nome*/

/*select nome,isnull(cognome,'-')

from lotr.Hobbits
where isnull(cognome,'-')<> 'Baggins'*/

/*select  distinct Cognome,Nome
from lotr.Hobbits
order by Nome*/
/*select distinct cognome as surname
from lotr.Hobbits 
where cognome<='Brandybuck'*/
--order by surname
/**top (4)*/

/*select nome,cognome
from lotr.Hobbits
where cognome like '%a%' and like %e%*/

/*select nome,cognome
from lotr.Hobbits*/
/*
with CTE_hobbits
as ( select nome,cognome,
	CASE 	
	when cognome='Baggins' then 'Buono'
	when nome= 'Sam' then 'Buonissimo'
	when nome = 'Gollum' then 'Cattivo'
	else 'buonino99'
	end  as buonezza
from lotr.hobbits)

select nome,cognome,buonezza
from CTE_hobbits
--where buonezza = 'buonino99'
order by 1 desc

*/

--select 
--nome,
--cognome,
--iif (cognome = 'Baggins' ,1,0)
--as isbaggins
--from lotr.Hobbits
--select * from lotr.Hobbits
--select count (*) from lotr.hobbits
--select count (1) from lotr.hobbits
--select count ( nome) from lotr.hobbits
--select count (distinct isnull(  cognome,'--')) from lotr.hobbits

--select nome, count(cognome) as conteggio
--from lotr.Hobbits
--group by cognome,nome

--nome e sulla destra un conteggio 1 e 0 se è null 

--select nome,cognome, iif(cognome is not null ,1,0 )
--from lotr.Hobbits

--select nome ,
--case 
--when cognome is not null then 1 else 0 
--end as contacognomi
--from lotr.Hobbits

/*conteggio dei congomi da analizzare bene */
--select cognome , 1 as conteggio
--from lotr.Hobbits

--select cognome , count (1) as conteggio
--from lotr.Hobbits
--group by cognome

--select cognome , count (cognome) as conteggio
--from lotr.Hobbits
--group by cognome

--nome ,cognome == beggins o tuck e conteggio quanti ci sono 
-- a parita di congome 
--select cognome,min(nome) as minimo,MAX ( nome) as massimo
--from lotr.Hobbits
--group by cognome 
--order by cognome desc;

--group by nome
--order by nome;
--select Cognome,  count(Cognome) as conteggio
--from lotr.Hobbits
--where Cognome = 'Baggins' or Cognome = 'Took'
--group by Cognome
--order by Cognome desc;


--with CTE_hobbits
--as ( select nome,cognome,
--	CASE 	
--	when cognome='Baggins' then 'Buono'
--	when nome= 'Sam' then 'Buonissimo'
--	when nome = 'Gollum' then 'Cattivo'
--	else 'buonino99'
--	end  as buonezza
--from lotr.hobbits)




--select cognome , count (cognome) as conteggio
--from lotr.Hobbits
--where (cognome between 'baggins' and 'took') or nome like 'D%'
--group by cognome
--order by cognome asc;

--;with dup1 as (
--select	cognome,
--		count (cognome) as contatore
--from lotr.Hobbits
--group by cognome
--having count (cognome)>1)

--select nome, cognome 
--from lotr.Hobbits
--where Cognome in (select cognome from dup1)




SELECT CAST (GETDATE () AS nvarchar (50))
SELECT CONVERT (nvarchar(50) ,GETDATE(),112)
SELECT CONVERT (nvarchar(50) ,GETDATE(),12)










