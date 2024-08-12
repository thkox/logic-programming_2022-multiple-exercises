family(person(tom, fox, date(7, may, 1950), works(bbc, 15200)),
	person(ann, fox, date(9, may, 1951), unemployed),
	[person(pat, fox, date(5, may, 1973), unemployed),
	person(jim, fox, date(5, may, 1973), unemployed)]).

family(person(makis, papadopoulos, date(5, june, 1973), works(ikea, 13400)),
	person(eleni, markopoulou, date(10, july, 1980), works(sklavenitis, 25000)),
	[person(kostas, markopoulou, date(25, september, 1999), unemployed)]).
	
family(person(stefanos, papadakis, date(9, january, 1967), unemployed),
	person(sofia, argiriou, date(9, march, 1970), unemployed),
	[person(alexandros, papadakis, date(24, february, 1996), works(udraulika, 12100)),
	person(alexandra, papadakis, date(17, april, 1997), works(romeo, 95000)),
	person(andreas, papadakis, date(19, june, 1999), unemployed)]).
	
family(person(loukas, nikiforos, date(12, june, 1996), works(ab, 10000)),
	person(emelie, sotiropoulou, date(23, october, 1997), works(steam, 80000)),
	[]).

family(person(aimilios, siampanis, date(19, december, 2000), works(apple, 50000)),
	person(stefania, papakonstantinou, date(24, december, 1999), unemployed),
	[person(iraklis, siampanis, date(20, december, 2022), works(google, 80000))]).
	
family(person(baggelis, monabis, date(14, june, 1980), works(microsoft, 10000)),
	person(danai, kostantinou, date(24, august, 1983), unemployed),
	[]).

%child/1 rule
child(X) :- family(_,_, Children), member(X, Children).

%dateofbirth/2 complex term
dateofbirth(person(_,_,date(_,_,Year),_), Year).

%children_year/2 rule
children_year(X,Y) :- child(X), dateofbirth(X, Y).

