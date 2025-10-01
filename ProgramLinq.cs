namespace LinqLab
{
    internal class ProgramLinq
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Esempi per Linq!");
            var impiegatiList = new List<Impiegato>
            {

                new Impiegato("Sara", "Cinesca", "sara@gmail.com", 'f', new DateOnly(2001, 12, 21), 17000, "Informatico", "no dev"),
                new Impiegato("Miriam" ,"Cinesca", "sara@gmail.com",'f',new DateOnly(2002,12,21),20000,"Informatico","dev"),
                new Impiegato("Dario", "Lampa", "dario@gmail.com", 'm', new DateOnly(2000, 08, 21), 16500, "Finanza", "dev"),
                new Impiegato("Igor", "Miti", "igor@gmail.com", 'm', new DateOnly(1979, 12, 21),null,  "Informatico", "no dev"),
                new Impiegato("Maria", "Rossi", "maria@gmail.com", 'f', new DateOnly(2003, 08, 21), 17000, "Finanza", "dev")
            };


            var q1 = impiegatiList.Where(x => x.Ral >= 10000);
            q1.ToList().ForEach(n=>Console.WriteLine(n.Nome) );
            Console.WriteLine();

            var q2 = impiegatiList.Where(x => x.Genere == 'm');
            q2.ToList().ForEach(n => Console.WriteLine(n.Nome));
            Console.WriteLine();

            var q3 = impiegatiList.Where(x => x.Ral >= 15000 && x.Ral <= 20000);
            q3.ToList().ForEach(n => Console.WriteLine(n.Nome));
            Console.WriteLine();


            var q4 = impiegatiList.Where(x => x.Ral >= 15000 && x.Ral <= 20000 && x.Genere=='f');
            q4.ToList().ForEach(n => Console.WriteLine(n.Nome));
            Console.WriteLine();

            var q5 = impiegatiList.Where((a) => { return a.Ral==null; } );
            q5.ToList().ForEach(n => Console.WriteLine(n.Nome));
            Console.WriteLine();

            var q6 = impiegatiList.Average(n=>n.Ral);            
            Console.WriteLine("Ral media: "+ (int) q6 );

            var q7 = impiegatiList.First(x => x.DataNascita < new DateOnly(1980,1,1)  );
            Console.WriteLine("Il primo nato dopo 1980: " + q7.DataNascita  ) ;

            var q8 = impiegatiList.Last(x => x.DataNascita < new DateOnly(2000, 12, 12) && x.DataNascita > new DateOnly(2000, 1, 1));
            Console.WriteLine("Nati nel 2000 last: " + q8.DataNascita);

            var q9 = impiegatiList.Where(x => x.Mansione != null); // ritornare un bool
            q9.ToList().ForEach(n => Console.WriteLine(n.Nome));

            var q10 = impiegatiList.OrderBy(x=>x.DataNascita);
            q10.ToList().ForEach(n => Console.WriteLine(n.Nome +"  "+ n.DataNascita));

            Console.WriteLine ("--------------------------");
            var q11 = impiegatiList.OrderByDescending(x => x.DataNascita);
            q11.ToList().ForEach(n => Console.WriteLine(n.Nome + "  " + n.DataNascita));

            Console.WriteLine("--------------------------");
            var q12 = impiegatiList.OrderBy(x => x.Ral).OrderBy(y => y.DataNascita);
            q12.ToList().ForEach(n => Console.WriteLine(n.Nome + "  " + n.DataNascita+ "  "+n.Ral  ));

            Console.WriteLine("--------------------------");
            var q13 = impiegatiList.OrderBy(x => x.Ral).Where(f=>f.Ral is  not null).First();
            Console.WriteLine(q13.Nome);

            Console.WriteLine("--------------------------");
            var q14 = impiegatiList.OrderBy(x => x.Ral).Last();
            Console.WriteLine(q14.Nome);

            Console.WriteLine("--------------------------");
            var q15 = impiegatiList.Sum(x => x.Ral);
            Console.WriteLine("somma delle RAl: "+q15);

            Console.WriteLine("--------------------------");
            var q16 = impiegatiList.OrderByDescending(x => x.Ral).Where(f => f.Genere == 'f').Take(2);
            q16.ToList().ForEach(n => Console.WriteLine(n.Nome + "  " + n.DataNascita + "  " + n.Ral));

            Console.WriteLine("--------------------------");
            var q18 = impiegatiList.OrderByDescending(x => x.Ral).Where(f => f.Genere == 'f').Skip(1);
            q18.ToList().ForEach(n => Console.WriteLine("wiii->"+n.Nome + "  " + n.DataNascita + "  " + n.Ral));

            Console.WriteLine("--------------------------");
            var q19 = impiegatiList.OrderByDescending(x => x.Nome).DistinctBy(k=>k.Nome);
            q19.ToList().ForEach(n => Console.WriteLine(">>" + n.Nome + "  " + n.DataNascita + "  " + n.Ral));

            Console.WriteLine("--------------------------");
            //var q20 = impiegatiList.GroupBy(g => g.Mansione).Where(g => g.Count >= 2);
            //q20.ToList().ForEach(n => Console.WriteLine("--" + n.Nome + "  " + n.DataNascita + "  " + n.Ral));



        }



    }
}
