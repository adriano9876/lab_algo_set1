using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinqLab
{
    public class Impiegato
    {
        public string  Nome{get;set;}
        public string Cognome { get; set; }
        public string Mail { get; set; }
        public char Genere { get; set; }
        public DateOnly DataNascita { get; set; }
        public int? Ral { get; set; }
        public string? Dipartimento { get; set; }
        public string? Mansione { get; set; }

        public Impiegato(string nome, string cognome, string mail, char genere, DateOnly dataNascita, int? ral, string? dipartimento, string? mansione)
        {
            Nome = nome;
            Cognome = cognome;
            Mail = mail;
            Genere = genere;
            DataNascita = dataNascita;
            Ral = ral;
            Dipartimento = dipartimento;
            Mansione = mansione;
        }
    }
}
