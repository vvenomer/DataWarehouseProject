select PS.Time as T1, P.Time as T2, 
convert(bigint, DATEDIFF_BIG(SECOND,PS.Time,P.Time))
	from PackageStatuses as PS
	join Packages as P
		on PackageId = P.Id