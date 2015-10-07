# NEXT: write a program to search for upper intervals of A_n

# Example: triple-winged almost-pentagon
G := SmallGroup(324,160);
ccsg:=ConjugacyClassesSubgroups(G);
List(ccsg, x->Index(G,Representative(x)));  # indicates the 3rd-6th classes have index 108
# checking various possibilities, we find the one we want is
H:=Representative(ccsg[6]);
intHG:=IntermediateSubgroups(G,H);  # a quadruple winged pentagon

omega:=RightCosets(G,H);
act:=Action(G, omega, OnRight);
blks:=AllBlocks(act);
C=["|1,2,3,7|4,8,11,20|5,9,12,21|6,10,13,22|14,23,29,42|15,24,30,43|16,25,31,44|17,26,32,45|18,27,33,46|19,28,34,47|35,48,55,68|36,49,56,69|37,50,57,70|62,75,81,90|38,51,58,71|39,52,59,72|40,53,60,73|67,80,86,95|41,54,61,74|63,76,82,91|64,77,83,92|65,78,84,93|87,96,99,103|89,98,101,105|66,79,85,94|102,106,107,108|88,97,100,104|", "|1,4,5,6,14,15,16,17,18,19,35,36,37,38,39,40,41,62,63,64,65,66,67,87,88,89,102|2,8,9,10,23,24,25,26,27,28,48,49,50,51,52,53,54,75,76,77,78,79,80,96,97,98,106|3,11,12,13,29,30,31,32,33,34,55,56,57,58,59,60,61,81,82,83,84,85,86,99,100,101,107|7,20,21,22,42,43,44,45,46,47,68,69,70,71,72,73,74,90,91,92,93,94,95,103,104,105,108|", "|1,27,30,44|2,59,67,70|3,49,62,73|4,51,55,69|5,53,57,71|6,54,58,72|7,48,61,64|8,83,89,90|9,19,20,85|10,11,17,93|12,14,22,76|13,77,87,95|25,29,37,103|15,78,81,91|16,79,82,92|26,41,43,101|32,35,46,96|18,80,84,94|28,31,40,105|21,75,86,88|24,39,42,100|23,34,45,102|33,36,47,97|52,56,65,108|50,66,68,107|38,98,99,104|60,63,74,106|", "|1,35,36,37,38,39,40,41,102|2,24,25,53,54,75,76,77,98|3,31,33,55,57,83,85,86,99|4,5,6,62,63,64,65,66,67|7,43,46,69,72,90,93,95,104|8,26,27,28,48,49,78,79,106|9,10,23,50,51,52,80,96,97|11,12,34,56,58,60,81,100,101|13,29,30,32,59,61,82,84,107|14,15,16,17,18,19,87,88,89|20,22,45,68,71,74,92,103,105|21,42,44,47,70,73,91,94,108|", "|1,38,102|2,76,98|3,85,99|4,63,67|5,64,65|6,62,66|7,93,104|8,27,106|9,52,96|10,50,97|11,60,100|12,56,101|13,30,107|29,61,84|14,18,89|15,19,87|16,17,88|26,49,79|32,59,82|28,48,78|20,74,103|21,44,108|22,68,105|42,73,94|23,51,80|24,53,77|25,54,75|45,71,92|31,55,86|33,57,83|47,70,91|34,58,81|35,39,40|36,37,41|43,69,95|46,72,90|", "|1,80,81,92|2,18,56,68|3,15,52,74|4,32,47,98|5,28,29,104|6,26,42,99|7,16,50,60|8,13,21,38|9,40,82,90|10,41,83,91|11,35,77,94|12,37,79,95|14,57,72,106|17,54,55,108|19,53,69,107|20,36,75,84|22,39,78,86|23,31,43,63|24,33,45,65|25,34,46,66|27,67,100,103|30,62,97,105|44,64,96,101|48,58,70,87|49,59,71,88|51,61,73,89|76,85,93,102|"];

  
# 0-offset  
  
C=["|0,1,2,6|3,7,10,19|4,8,11,20|5,9,12,21|13,22,28,41|14,23,29,42|15,24,30,43|16,25,31,44|17,26,32,45|18,27,33,46|34,47,54,67|35,48,55,68|36,49,56,69|61,74,80,89|37,50,57,70|38,51,58,71|39,52,59,72|66,79,85,94|40,53,60,73|62,75,81,90|63,76,82,91|64,77,83,92|86,95,98,102|88,97,100,104|65,78,84,93|101,105,106,107|87,96,99,103|", 
   "|0,26,29,43|1,58,66,69|2,48,61,72|3,50,54,68|4,52,56,70|5,53,57,71|6,47,60,63|7,82,88,89|8,18,19,84|9,10,16,92|11,13,21,75|12,76,86,94|24,28,36,102|14,77,80,90|15,78,81,91|25,40,42,100|31,34,45,95|17,79,83,93|27,30,39,104|20,74,85,87|23,38,41,99|22,33,44,101|32,35,46,96|51,55,64,107|49,65,67,106|37,97,98,103|59,62,73,105|", 
   "|0,79,80,91|1,17,55,67|2,14,51,73|3,31,46,97|4,27,28,103|5,25,41,98|6,15,49,59|7,12,20,37|8,39,81,89|9,40,82,90|10,34,76,93|11,36,78,94|13,56,71,105|16,53,54,107|18,52,68,106|19,35,74,83|21,38,77,85|22,30,42,62|23,32,44,64|24,33,45,65|26,66,99,102|29,61,96,104|43,63,95,100|47,57,69,86|48,58,70,87|50,60,72,88|75,84,92,101|", 
   "|0,3,4,5,13,14,15,16,17,18,34,35,36,37,38,39,40,61,62,63,64,65,66,86,87,88,101|1,7,8,9,22,23,24,25,26,27,47,48,49,50,51,52,53,74,75,76,77,78,79,95,96,97,105|2,10,11,12,28,29,30,31,32,33,54,55,56,57,58,59,60,80,81,82,83,84,85,98,99,100,106|6,19,20,21,41,42,43,44,45,46,67,68,69,70,71,72,73,89,90,91,92,93,94,102,103,104,107|",
  "|0,34,35,36,37,38,39,40,101|1,23,24,52,53,74,75,76,97|2,30,32,54,56,82,84,85,98|3,4,5,61,62,63,64,65,66|6,42,45,68,71,89,92,94,103|7,25,26,27,47,48,77,78,105|8,9,22,49,50,51,79,95,96|10,11,33,55,57,59,80,99,100|12,28,29,31,58,60,81,83,106|13,14,15,16,17,18,86,87,88|19,21,44,67,70,73,91,102,104|20,41,43,46,69,72,90,93,107|",
   "|0,37,101|1,75,97|2,84,98|3,62,66|4,63,64|5,61,65|6,92,103|7,26,105|8,51,95|9,49,96|10,59,99|11,55,100|12,29,106|28,60,83|13,17,88|14,18,86|15,16,87|25,48,78|31,58,81|27,47,77|19,73,102|20,43,107|21,67,104|41,72,93|22,50,79|23,52,76|24,53,74|44,70,91|30,54,85|32,56,82|46,69,90|33,57,80|34,38,39|35,36,40|42,68,94|45,71,89|"];

# actually, we want to remove the top of the chain, so
C=["|0,1,2,6|3,7,10,19|4,8,11,20|5,9,12,21|13,22,28,41|14,23,29,42|15,24,30,43|16,25,31,44|17,26,32,45|18,27,33,46|34,47,54,67|35,48,55,68|36,49,56,69|61,74,80,89|37,50,57,70|38,51,58,71|39,52,59,72|66,79,85,94|40,53,60,73|62,75,81,90|63,76,82,91|64,77,83,92|86,95,98,102|88,97,100,104|65,78,84,93|101,105,106,107|87,96,99,103|", 
   "|0,26,29,43|1,58,66,69|2,48,61,72|3,50,54,68|4,52,56,70|5,53,57,71|6,47,60,63|7,82,88,89|8,18,19,84|9,10,16,92|11,13,21,75|12,76,86,94|24,28,36,102|14,77,80,90|15,78,81,91|25,40,42,100|31,34,45,95|17,79,83,93|27,30,39,104|20,74,85,87|23,38,41,99|22,33,44,101|32,35,46,96|51,55,64,107|49,65,67,106|37,97,98,103|59,62,73,105|", 
   "|0,79,80,91|1,17,55,67|2,14,51,73|3,31,46,97|4,27,28,103|5,25,41,98|6,15,49,59|7,12,20,37|8,39,81,89|9,40,82,90|10,34,76,93|11,36,78,94|13,56,71,105|16,53,54,107|18,52,68,106|19,35,74,83|21,38,77,85|22,30,42,62|23,32,44,64|24,33,45,65|26,66,99,102|29,61,96,104|43,63,95,100|47,57,69,86|48,58,70,87|50,60,72,88|75,84,92,101|", 
  "|0,34,35,36,37,38,39,40,101|1,23,24,52,53,74,75,76,97|2,30,32,54,56,82,84,85,98|3,4,5,61,62,63,64,65,66|6,42,45,68,71,89,92,94,103|7,25,26,27,47,48,77,78,105|8,9,22,49,50,51,79,95,96|10,11,33,55,57,59,80,99,100|12,28,29,31,58,60,81,83,106|13,14,15,16,17,18,86,87,88|19,21,44,67,70,73,91,102,104|20,41,43,46,69,72,90,93,107|",
   "|0,37,101|1,75,97|2,84,98|3,62,66|4,63,64|5,61,65|6,92,103|7,26,105|8,51,95|9,49,96|10,59,99|11,55,100|12,29,106|28,60,83|13,17,88|14,18,86|15,16,87|25,48,78|31,58,81|27,47,77|19,73,102|20,43,107|21,67,104|41,72,93|22,50,79|23,52,76|24,53,74|44,70,91|30,54,85|32,56,82|46,69,90|33,57,80|34,38,39|35,36,40|42,68,94|45,71,89|"];

  
B=["|0,1,2,6|3,7,10,19|4,8,11,20|5,9,12,21|13,22,28,41|14,23,29,42|15,24,30,43|16,25,31,44|17,26,32,45|18,27,33,46|34,47,54,67|35,48,55,68|36,49,56,69|61,74,80,89|37,50,57,70|38,51,58,71|39,52,59,72|66,79,85,94|40,53,60,73|62,75,81,90|63,76,82,91|64,77,83,92|86,95,98,102|88,97,100,104|65,78,84,93|101,105,106,107|87,96,99,103|", 
   "|0,26,29,43|1,58,66,69|2,48,61,72|3,50,54,68|4,52,56,70|5,53,57,71|6,47,60,63|7,82,88,89|8,18,19,84|9,10,16,92|11,13,21,75|12,76,86,94|24,28,36,102|14,77,80,90|15,78,81,91|25,40,42,100|31,34,45,95|17,79,83,93|27,30,39,104|20,74,85,87|23,38,41,99|22,33,44,101|32,35,46,96|51,55,64,107|49,65,67,106|37,97,98,103|59,62,73,105|", 
   "|0,79,80,91|1,17,55,67|2,14,51,73|3,31,46,97|4,27,28,103|5,25,41,98|6,15,49,59|7,12,20,37|8,39,81,89|9,40,82,90|10,34,76,93|11,36,78,94|13,56,71,105|16,53,54,107|18,52,68,106|19,35,74,83|21,38,77,85|22,30,42,62|23,32,44,64|24,33,45,65|26,66,99,102|29,61,96,104|43,63,95,100|47,57,69,86|48,58,70,87|50,60,72,88|75,84,92,101|", 
   "|0,3,4,5,13,14,15,16,17,18,34,35,36,37,38,39,40,61,62,63,64,65,66,86,87,88,101|1,7,8,9,22,23,24,25,26,27,47,48,49,50,51,52,53,74,75,76,77,78,79,95,96,97,105|2,10,11,12,28,29,30,31,32,33,54,55,56,57,58,59,60,80,81,82,83,84,85,98,99,100,106|6,19,20,21,41,42,43,44,45,46,67,68,69,70,71,72,73,89,90,91,92,93,94,102,103,104,107|",
   "|0,37,101|1,75,97|2,84,98|3,62,66|4,63,64|5,61,65|6,92,103|7,26,105|8,51,95|9,49,96|10,59,99|11,55,100|12,29,106|28,60,83|13,17,88|14,18,86|15,16,87|25,48,78|31,58,81|27,47,77|19,73,102|20,43,107|21,67,104|41,72,93|22,50,79|23,52,76|24,53,74|44,70,91|30,54,85|32,56,82|46,69,90|33,57,80|34,38,39|35,36,40|42,68,94|45,71,89|"];
  
A=["|0,1,2,6|3,7,10,19|4,8,11,20|5,9,12,21|13,22,28,41|14,23,29,42|15,24,30,43|16,25,31,44|17,26,32,45|18,27,33,46|34,47,54,67|35,48,55,68|36,49,56,69|61,74,80,89|37,50,57,70|38,51,58,71|39,52,59,72|66,79,85,94|40,53,60,73|62,75,81,90|63,76,82,91|64,77,83,92|86,95,98,102|88,97,100,104|65,78,84,93|101,105,106,107|87,96,99,103|", 
   "|0,26,29,43|1,58,66,69|2,48,61,72|3,50,54,68|4,52,56,70|5,53,57,71|6,47,60,63|7,82,88,89|8,18,19,84|9,10,16,92|11,13,21,75|12,76,86,94|24,28,36,102|14,77,80,90|15,78,81,91|25,40,42,100|31,34,45,95|17,79,83,93|27,30,39,104|20,74,85,87|23,38,41,99|22,33,44,101|32,35,46,96|51,55,64,107|49,65,67,106|37,97,98,103|59,62,73,105|", 
   "|0,79,80,91|1,17,55,67|2,14,51,73|3,31,46,97|4,27,28,103|5,25,41,98|6,15,49,59|7,12,20,37|8,39,81,89|9,40,82,90|10,34,76,93|11,36,78,94|13,56,71,105|16,53,54,107|18,52,68,106|19,35,74,83|21,38,77,85|22,30,42,62|23,32,44,64|24,33,45,65|26,66,99,102|29,61,96,104|43,63,95,100|47,57,69,86|48,58,70,87|50,60,72,88|75,84,92,101|", 
   "|0,3,4,5,13,14,15,16,17,18,34,35,36,37,38,39,40,61,62,63,64,65,66,86,87,88,101|1,7,8,9,22,23,24,25,26,27,47,48,49,50,51,52,53,74,75,76,77,78,79,95,96,97,105|2,10,11,12,28,29,30,31,32,33,54,55,56,57,58,59,60,80,81,82,83,84,85,98,99,100,106|6,19,20,21,41,42,43,44,45,46,67,68,69,70,71,72,73,89,90,91,92,93,94,102,103,104,107|",
  "|0,34,35,36,37,38,39,40,101|1,23,24,52,53,74,75,76,97|2,30,32,54,56,82,84,85,98|3,4,5,61,62,63,64,65,66|6,42,45,68,71,89,92,94,103|7,25,26,27,47,48,77,78,105|8,9,22,49,50,51,79,95,96|10,11,33,55,57,59,80,99,100|12,28,29,31,58,60,81,83,106|13,14,15,16,17,18,86,87,88|19,21,44,67,70,73,91,102,104|20,41,43,46,69,72,90,93,107|"];
  
Orbit(act,blks[1],OnSets);
[ [ 1, 2, 3, 7 ], [ 4, 8, 11, 20 ], [ 5, 9, 12, 21 ], [ 6, 10, 13, 22 ], [ 14, 23, 29, 42 ], 
  [ 15, 24, 30, 43 ], [ 16, 25, 31, 44 ], [ 17, 26, 32, 45 ], [ 18, 27, 33, 46 ], [ 19, 28, 34, 47 ], 
  [ 35, 48, 55, 68 ], [ 36, 49, 56, 69 ], [ 37, 50, 57, 70 ], [ 62, 75, 81, 90 ], [ 38, 51, 58, 71 ], 
  [ 39, 52, 59, 72 ], [ 40, 53, 60, 73 ], [ 67, 80, 86, 95 ], [ 41, 54, 61, 74 ], [ 63, 76, 82, 91 ], 
  [ 64, 77, 83, 92 ], [ 65, 78, 84, 93 ], [ 87, 96, 99, 103 ], [ 89, 98, 101, 105 ], 
  [ 66, 79, 85, 94 ], [ 102, 106, 107, 108 ], [ 88, 97, 100, 104 ] ]
Orbit(act,blks[2],OnSets);
[ [ 1, 4, 5, 6, 14, 15, 16, 17, 18, 19, 35, 36, 37, 38, 39, 40, 41, 62, 63, 64, 65, 66, 67, 87, 88, 
      89, 102 ], [ 2, 8, 9, 10, 23, 24, 25, 26, 27, 28, 48, 49, 50, 51, 52, 53, 54, 75, 76, 77, 78, 
      79, 80, 96, 97, 98, 106 ], [ 3, 11, 12, 13, 29, 30, 31, 32, 33, 34, 55, 56, 57, 58, 59, 60, 61, 
      81, 82, 83, 84, 85, 86, 99, 100, 101, 107 ], 
  [ 7, 20, 21, 22, 42, 43, 44, 45, 46, 47, 68, 69, 70, 71, 72, 73, 74, 90, 91, 92, 93, 94, 95, 103, 
      104, 105, 108 ] ]
Orbit(act,blks[3],OnSets);
[ [ 1, 27, 30, 44 ], [ 2, 59, 67, 70 ], [ 3, 49, 62, 73 ], [ 4, 51, 55, 69 ], [ 5, 53, 57, 71 ], 
  [ 6, 54, 58, 72 ], [ 7, 48, 61, 64 ], [ 8, 83, 89, 90 ], [ 9, 19, 20, 85 ], [ 10, 11, 17, 93 ], 
  [ 12, 14, 22, 76 ], [ 13, 77, 87, 95 ], [ 25, 29, 37, 103 ], [ 15, 78, 81, 91 ], [ 16, 79, 82, 92 ], 
  [ 26, 41, 43, 101 ], [ 32, 35, 46, 96 ], [ 18, 80, 84, 94 ], [ 28, 31, 40, 105 ], [ 21, 75, 86, 88 ],
  [ 24, 39, 42, 100 ], [ 23, 34, 45, 102 ], [ 33, 36, 47, 97 ], [ 52, 56, 65, 108 ], 
  [ 50, 66, 68, 107 ], [ 38, 98, 99, 104 ], [ 60, 63, 74, 106 ] ]
Orbit(act,blks[4],OnSets);
[ [ 1, 35, 36, 37, 38, 39, 40, 41, 102 ], [ 2, 24, 25, 53, 54, 75, 76, 77, 98 ], 
  [ 3, 31, 33, 55, 57, 83, 85, 86, 99 ], [ 4, 5, 6, 62, 63, 64, 65, 66, 67 ], 
  [ 7, 43, 46, 69, 72, 90, 93, 95, 104 ], [ 8, 26, 27, 28, 48, 49, 78, 79, 106 ], 
  [ 9, 10, 23, 50, 51, 52, 80, 96, 97 ], [ 11, 12, 34, 56, 58, 60, 81, 100, 101 ], 
  [ 13, 29, 30, 32, 59, 61, 82, 84, 107 ], [ 14, 15, 16, 17, 18, 19, 87, 88, 89 ], 
  [ 20, 22, 45, 68, 71, 74, 92, 103, 105 ], [ 21, 42, 44, 47, 70, 73, 91, 94, 108 ] ]
Orbit(act,blks[5],OnSets);
[ [ 1, 38, 102 ], [ 2, 76, 98 ], [ 3, 85, 99 ], [ 4, 63, 67 ], [ 5, 64, 65 ], [ 6, 62, 66 ], 
  [ 7, 93, 104 ], [ 8, 27, 106 ], [ 9, 52, 96 ], [ 10, 50, 97 ], [ 11, 60, 100 ], [ 12, 56, 101 ], 
  [ 13, 30, 107 ], [ 29, 61, 84 ], [ 14, 18, 89 ], [ 15, 19, 87 ], [ 16, 17, 88 ], [ 26, 49, 79 ], 
  [ 32, 59, 82 ], [ 28, 48, 78 ], [ 20, 74, 103 ], [ 21, 44, 108 ], [ 22, 68, 105 ], [ 42, 73, 94 ], 
  [ 23, 51, 80 ], [ 24, 53, 77 ], [ 25, 54, 75 ], [ 45, 71, 92 ], [ 31, 55, 86 ], [ 33, 57, 83 ], 
  [ 47, 70, 91 ], [ 34, 58, 81 ], [ 35, 39, 40 ], [ 36, 37, 41 ], [ 43, 69, 95 ], [ 46, 72, 90 ] ]
Orbit(act,blks[6],OnSets);
[ [ 1, 80, 81, 92 ], [ 2, 18, 56, 68 ], [ 3, 15, 52, 74 ], [ 4, 32, 47, 98 ], [ 5, 28, 29, 104 ], 
  [ 6, 26, 42, 99 ], [ 7, 16, 50, 60 ], [ 8, 13, 21, 38 ], [ 9, 40, 82, 90 ], [ 10, 41, 83, 91 ], 
  [ 11, 35, 77, 94 ], [ 12, 37, 79, 95 ], [ 14, 57, 72, 106 ], [ 17, 54, 55, 108 ], 
  [ 19, 53, 69, 107 ], [ 20, 36, 75, 84 ], [ 22, 39, 78, 86 ], [ 23, 31, 43, 63 ], [ 24, 33, 45, 65 ], 
  [ 25, 34, 46, 66 ], [ 27, 67, 100, 103 ], [ 30, 62, 97, 105 ], [ 44, 64, 96, 101 ], 
  [ 48, 58, 70, 87 ], [ 49, 59, 71, 88 ], [ 51, 61, 73, 89 ], [ 76, 85, 93, 102 ] ]
  
  
actgen:=GeneratorsOfGroup(act);
sym:=SymmetricGroup(Size(omega));



cnt:=0;
for f in sym do
    if f in act then
        # do nothing 
    else
        Gf:=Group(Concatenation(actgen,[f]));
        blks:=AllBlocks(Gf);
        if Size(blks)>1 then
           if Size(blks)=3 then
              cnt:=cnt+1;
           fi;
           Print(cnt, ":  f = ", f, " blocks: ", blks, "\n");
       fi;
   fi;
od;





# returns, alternately,
# Group([ (1,11,4,8)(2,10,5,7)(3,12,6,9)(14,17,16,15), (2,3)(4,7)(5,9)(6,8)(11,12)(13,16)(14,18)(15,17) ])
g{1} = '(1,11,4,8)(2,10,5,7)(3,12,6,9)(14,17,16,15)';
g{2} = '(2,3)(4,7)(5,9)(6,8)(11,12)(13,16)(14,18)(15,17)';
GAPperms2uacalc(g, 18, 'intransS4HK');
# This produces a file called intransS4HK.ua which can be read into uacalc,
# producing an algebra called intransS4HK with two unary operations g1 and g2.




# To describe the action of S2 on G1xG2, we need the generators of S2
s2:=SymmetricGroup(2);;
s2gens:=GeneratorsOfGroup(s2);;
# Actions of S2 on G1xG2:
actions:=List(s2gens, i->ConjugatorAutomorphism(G1xG2,i));
alpha:=GroupHomomorphismByImages(S3, Group(actions), s3gens, actions);        

# Now we can form a corresponding semidirect product
G:=SemidirectProduct(S3,alpha,M);


# Let's try to construct SDP of M with (1,2)
S2:=SymmetricGroup(2);
s2gens:=GeneratorsOfGroup(S2);
  
# Actions of S2 on M:
actions:=List(s2gens, i->ConjugatorAutomorphism(M,i));
alpha:=GroupHomomorphismByImages(S2, Group(actions), s2gens, actions);        

# Now we can form a corresponding semidirect product
G:=SemidirectProduct(S2,alpha,M);  # <<=== this produces out-of-memory error



