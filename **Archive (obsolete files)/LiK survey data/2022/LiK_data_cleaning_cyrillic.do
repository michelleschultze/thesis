*use "/Users/michelle/Documents/thesis/LiK survey data/2022/hh6a.dta"

*if rerunning:
drop h606_latin

* Create a new column to store the Latinized version of h606
gen h606_latin = h606

* Replacing Cyrillic characters with their Latin equivalents (for Russian Cyrillic letters, including Soft and Hard signs)

* Uppercase Cyrillic characters:
replace h606_latin = subinstr(h606_latin, "А", "A", .)
replace h606_latin = subinstr(h606_latin, "Б", "B", .)
replace h606_latin = subinstr(h606_latin, "В", "V", .)
replace h606_latin = subinstr(h606_latin, "Г", "G", .)
replace h606_latin = subinstr(h606_latin, "Д", "D", .)
replace h606_latin = subinstr(h606_latin, "Е", "E", .)
replace h606_latin = subinstr(h606_latin, "Ё", "Yo", .)  // Russian "Yo"
replace h606_latin = subinstr(h606_latin, "Ж", "Zh", .)
replace h606_latin = subinstr(h606_latin, "З", "Z", .)
replace h606_latin = subinstr(h606_latin, "И", "I", .)
replace h606_latin = subinstr(h606_latin, "Й", "Y", .)
replace h606_latin = subinstr(h606_latin, "К", "K", .)
replace h606_latin = subinstr(h606_latin, "Л", "L", .)
replace h606_latin = subinstr(h606_latin, "М", "M", .)
replace h606_latin = subinstr(h606_latin, "Н", "N", .)
replace h606_latin = subinstr(h606_latin, "О", "O", .)
replace h606_latin = subinstr(h606_latin, "П", "P", .)
replace h606_latin = subinstr(h606_latin, "Р", "R", .)
replace h606_latin = subinstr(h606_latin, "С", "S", .)
replace h606_latin = subinstr(h606_latin, "Т", "T", .)
replace h606_latin = subinstr(h606_latin, "У", "U", .)
replace h606_latin = subinstr(h606_latin, "Ф", "F", .)
replace h606_latin = subinstr(h606_latin, "Х", "Kh", .)
replace h606_latin = subinstr(h606_latin, "Ц", "Ts", .)
replace h606_latin = subinstr(h606_latin, "Ч", "Ch", .)
replace h606_latin = subinstr(h606_latin, "Ш", "Sh", .)
replace h606_latin = subinstr(h606_latin, "Щ", "Shch", .)
replace h606_latin = subinstr(h606_latin, "Ы", "Y", .)
replace h606_latin = subinstr(h606_latin, "Э", "E", .)
replace h606_latin = subinstr(h606_latin, "Ю", "Yu", .)
replace h606_latin = subinstr(h606_latin, "Я", "Ya", .)

* Lowercase Cyrillic characters:
replace h606_latin = subinstr(h606_latin, "а", "a", .)
replace h606_latin = subinstr(h606_latin, "б", "b", .)
replace h606_latin = subinstr(h606_latin, "в", "v", .)
replace h606_latin = subinstr(h606_latin, "г", "g", .)
replace h606_latin = subinstr(h606_latin, "д", "d", .)
replace h606_latin = subinstr(h606_latin, "е", "e", .)
replace h606_latin = subinstr(h606_latin, "ё", "yo", .)  // Russian "yo"
replace h606_latin = subinstr(h606_latin, "ж", "zh", .)
replace h606_latin = subinstr(h606_latin, "з", "z", .)
replace h606_latin = subinstr(h606_latin, "и", "i", .)
replace h606_latin = subinstr(h606_latin, "й", "y", .)
replace h606_latin = subinstr(h606_latin, "к", "k", .)
replace h606_latin = subinstr(h606_latin, "л", "l", .)
replace h606_latin = subinstr(h606_latin, "м", "m", .)
replace h606_latin = subinstr(h606_latin, "н", "n", .)
replace h606_latin = subinstr(h606_latin, "о", "o", .)
replace h606_latin = subinstr(h606_latin, "п", "p", .)
replace h606_latin = subinstr(h606_latin, "р", "r", .)
replace h606_latin = subinstr(h606_latin, "с", "s", .)
replace h606_latin = subinstr(h606_latin, "т", "t", .)
replace h606_latin = subinstr(h606_latin, "у", "u", .)
replace h606_latin = subinstr(h606_latin, "ф", "f", .)
replace h606_latin = subinstr(h606_latin, "х", "kh", .)
replace h606_latin = subinstr(h606_latin, "ц", "ts", .)
replace h606_latin = subinstr(h606_latin, "ч", "ch", .)
replace h606_latin = subinstr(h606_latin, "ш", "sh", .)
replace h606_latin = subinstr(h606_latin, "щ", "shch", .)
replace h606_latin = subinstr(h606_latin, "ы", "y", .)
replace h606_latin = subinstr(h606_latin, "э", "e", .)
replace h606_latin = subinstr(h606_latin, "ю", "yu", .)
replace h606_latin = subinstr(h606_latin, "я", "ya", .)

* Remove soft and hard signs 
replace h606_latin = "" if h606_latin == "99"  // Replace with NA (missing)
replace h606_latin = subinstr(h606_latin, "PODMOSKOVЬE", "PODMOSKOVE", .)
replace h606_latin = subinstr(h606_latin, "TYuMENЬ", "TYuMEN", .)
replace h606_latin = subinstr(h606_latin, "PERMЬ", "PERM", .)

* Optional: Trimming any leading/trailing whitespaces
replace h606_latin = trim(h606_latin)

* List the updated column to inspect some of the transformations
list h606 h606_latin in 1/20

*Export
save "/Users/michelle/Documents/thesis/LiK survey data/2022/hh6a_modified.dta", replace
