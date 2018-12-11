CREATE TABLE ODJEL(
    OdjelID integer primary key,
    Naziv_odjela varchar(50),
    SefID integer
    );
    
CREATE TABLE UGOVOR(
    UgovorID integer primary key,
    Datum_zakljucivanje date,
    Datum_raskidanja date
);

CREATE TABLE UPOSLENIK(
    UposlenikID integer primary key,
    Ime_i_prezime varchar(100),
    Datum_zaposlenja date,
    Plata integer,
    Broj_bankovnog_racuna integer,
    OdjelID integer references ODJEL(OdjelID),
    UgovorID integer references ugovor(UgovorID)
    );
    
CREATE TABLE PRAVNO_LICE(
    PravnoliceID integer primary key,
    Ime_i_prezime varchar(100),
    Adresa varchar(50),
    Grad varchar(50),
    Broj_ugovora integer
);

CREATE TABLE UGOVOR_PRAVNO_LICE(
    UgovorPravnoLiceID integer primary key,
    PravnoliceID integer references pravno_lice(PravnoliceID),
    UgovorID integer references ugovor(UgovorID)
);

CREATE TABLE KONTINENT(
    KontinentID integer primary key,
    Naziv_kontinenta varchar(50)
);

CREATE TABLE DRZAVA(
    DrzavaID integer primary key,
    Naziv_drzave varchar(50),
    KontinentID integer references kontinent(KontinentID)
);

CREATE TABLE SKLADISTE(
    SkladisteID integer primary key,
    Naziv_skladista varchar(50),
    Adresa varchar(50),
    Grad varchar(50),
    DrzavaID integer references drzava(DrzavaID),
    Odgovorna_osobaID integer references uposlenik(UposlenikID)
);

CREATE TABLE KATEGORIJA(
    KategorijaID integer primary key,
    Naziv_kategorije varchar(50),
    NadkategorijaID integer references kategorija(KategorijaID)
);

CREATE TABLE GARANCIJA(
    GarancijaID integer primary key,
    Datum_iskeka date
); 

CREATE TABLE POPUST(
    PopustID integer primary key,
    Postotak integer
);

CREATE TABLE PROIZVOD(
    ProizvodID integer primary key,
    Naziv_proizvoda varchar(50),
    Cijena integer,
    KategorijaID integer references kategorija(KategorijaID),
    PopustID integer references popust(PopustID),
    GarancijaID integer references garancija(GarancijaID)
);

CREATE TABLE KURIRSKA_SLUZBA(
    Kurirska_sluzbaID integer primary key,
    Naziv_kurirske_sluzbe varchar(50)
);

CREATE TABLE FIZICKO_LICE(
    Fizicko_liceID integer primary key,
    Ime_i_prezime varchar(50),
    Adresa varchar(50),
    Grad varchar(50),
    Datum_rodjenja date,
    Kurirska_sluzbaID integer references kurirska_sluzba(Kurirska_sluzbaID)
);

CREATE TABLE FAKTURA(
    FakturaID integer primary key,
    Datum date,
    Iznos_za_platiti integer
);

CREATE TABLE FAKTURA_FIZICKO_LICE(
    Faktura_fizicko_liceID integer primary key,
    FakturaID integer references faktura(FakturaID),
    Fizicko_liceID integer references fizicko_lice(Fizicko_liceID)
);

CREATE TABLE FAKTURA_PROIZVOD(
    Faktura_proizvodID integer primary key,
    FakturaID integer references faktura(FakturaID),
    ProizvodID integer references proizvod(ProizvodID)
);


   
    