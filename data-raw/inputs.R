inputs <-
    list(
##    IN.n IN.capa IN.dups IN.even GS.status GS.iterations MTGS.status MTGS.iterations DP.status DP.iterations DP.solutions DP.density type
## 1     6      43       0    TRUE      TRUE             6        TRUE               1      TRUE             5            2  0.3636364    1
## 2     6      48       0    TRUE      TRUE             6        TRUE               1      TRUE             5            2  0.3061224    1
## 3     6      42       0    TRUE      TRUE             6        TRUE               1      TRUE             5            2  0.3953488    1
## 4     9      46       0    TRUE      TRUE             9        TRUE               1      TRUE             7            6  0.7872340    1
## 5     9      49       0    TRUE      TRUE             9        TRUE               1      TRUE             7            6  0.6800000    1
## 6     9      50       0    TRUE      TRUE             9        TRUE               1      TRUE             7            6  0.7450980    1
## 7    12      74       0    TRUE      TRUE            12        TRUE               1      TRUE             6           54  0.5200000    1
## 8    12      73       0    TRUE      TRUE            11        TRUE               1      TRUE             8           56  0.7702703    1
## 9    15     116       0    TRUE      TRUE            14        TRUE               1      TRUE             9          378  0.7948718    1
## 10   15     100       0    TRUE      TRUE            14        TRUE               1      TRUE             7          422  0.6039604    1
        c(25L, 22L, 14L, 12L, 9L, 4L),
        c(25L, 24L, 18L, 13L, 11L, 5L),
        c(23L, 20L, 18L, 13L, 9L, 1L),
        c(21L, 17L, 15L, 13L, 9L, 6L, 5L, 4L, 2L),
        c(25L, 20L, 19L, 11L, 8L, 6L, 5L, 3L, 1L),
        c(24L, 18L, 15L, 14L, 13L, 7L, 6L, 2L, 1L),
        c(24L, 20L, 19L, 17L, 16L, 15L, 10L, 9L, 8L, 7L, 2L, 1L),
        c(25L, 23L, 22L, 20L, 13L, 11L, 9L, 7L, 6L, 5L, 3L, 2L),
        c(25L, 24L, 23L, 21L, 20L, 19L, 18L, 17L, 16L, 15L, 14L, 9L, 7L, 3L, 1L),
        c(25L, 23L, 22L, 20L, 19L, 18L, 16L, 15L, 12L, 11L, 8L, 5L, 3L, 2L, 1L),
##    IN.n IN.capa IN.dups IN.even GS.status GS.iterations MTGS.status MTGS.iterations DP.status DP.iterations DP.solutions DP.density type
## 11    6      45       0   FALSE     FALSE             6        TRUE               2      TRUE             6            1  0.5217391    2
## 12    6      47       0   FALSE     FALSE             6        TRUE               2      TRUE             6            1  0.4583333    2
## 13    6      50       0    TRUE     FALSE             6        TRUE               2      TRUE             5            2  0.3529412    2
## 14    9      49       0    TRUE     FALSE             9        TRUE               3      TRUE             7            6  0.8000000    2
## 15    9      48       0    TRUE     FALSE             9        TRUE               3      TRUE             7            6  0.7551020    2
## 16    9      50       0   FALSE     FALSE             9        TRUE               2      TRUE             4           10  0.2352941    2
## 17   12      74       0    TRUE     FALSE            12        TRUE               4      TRUE             8           56  0.7733333    2
## 18   12      75       0   FALSE     FALSE            12        TRUE               3      TRUE             5           65  0.3684211    2
## 19   15     100       0    TRUE     FALSE            15        TRUE               3      TRUE             6          436  0.4653465    2
## 20   15      98       0   FALSE     FALSE            15        TRUE               3      TRUE             6          449  0.4242424    2
        c(25L, 22L, 19L, 14L, 7L, 4L),
        c(24L, 22L, 19L, 15L, 9L, 6L),
        c(23L, 20L, 18L, 17L, 12L, 10L),
        c(22L, 20L, 17L, 13L, 9L, 6L, 5L, 4L, 2L),
        c(22L, 19L, 15L, 13L, 12L, 6L, 4L, 3L, 2L),
        c(21L, 20L, 16L, 14L, 8L, 7L, 6L, 5L, 4L),
        c(25L, 23L, 21L, 19L, 14L, 13L, 10L, 8L, 6L, 4L, 3L, 2L),
        c(24L, 20L, 18L, 17L, 16L, 15L, 11L, 10L, 8L, 6L, 5L, 1L),
        c(25L, 23L, 21L, 19L, 18L, 17L, 15L, 14L, 13L, 10L, 7L, 6L, 5L, 4L, 3L),
        c(23L, 22L, 21L, 19L, 18L, 17L, 15L, 12L, 11L, 9L, 8L, 7L, 6L, 5L, 4L),
##    IN.n IN.capa IN.dups IN.even GS.status GS.iterations MTGS.status MTGS.iterations DP.status DP.iterations DP.solutions DP.density type
## 21    6      47       0   FALSE     FALSE             6       FALSE               4      TRUE             6            1  0.4166667    3
## 22    6      46       0   FALSE     FALSE             6       FALSE               4      TRUE             6            1  0.5531915    3
## 23    6      45       0    TRUE     FALSE             6       FALSE               4      TRUE             5            2  0.3913043    3
## 24    9      49       0   FALSE     FALSE             9       FALSE               4      TRUE             5            7  0.3600000    3
## 25    9      50       0    TRUE     FALSE             9       FALSE               4      TRUE             7            8  0.7254902    3
## 26    9      49       0    TRUE     FALSE             9       FALSE               4      TRUE             6            8  0.6400000    3
## 27   12      75       0    TRUE     FALSE            12       FALSE               5      TRUE             8           58  0.8026316    3
## 28   12      68       0    TRUE     FALSE            12       FALSE               6      TRUE             8           72  0.8260870    3
## 29   15     100       0    TRUE     FALSE            15       FALSE               6      TRUE             7          444  0.6039604    3
## 30   15      98       0    TRUE     FALSE            15       FALSE               6      TRUE             7          446  0.7272727    3
        c(25L, 20L, 17L, 14L, 11L, 8L),
        c(21L, 20L, 17L, 14L, 13L, 8L),
        c(23L, 20L, 17L, 13L, 12L, 5L),
        c(25L, 21L, 15L, 10L, 9L, 7L, 6L, 5L, 1L),
        c(22L, 19L, 15L, 14L, 12L, 10L, 4L, 3L, 1L),
        c(25L, 19L, 13L, 12L, 10L, 8L, 7L, 3L, 1L),
        c(21L, 20L, 18L, 17L, 15L, 14L, 13L, 10L, 8L, 7L, 4L, 3L),
        c(20L, 17L, 16L, 14L, 13L, 12L, 11L, 10L, 9L, 6L, 5L, 3L),
        c(23L, 22L, 21L, 19L, 18L, 17L, 16L, 14L, 13L, 11L, 8L, 7L, 5L, 4L, 2L),
        c(25L, 22L, 20L, 19L, 18L, 15L, 14L, 13L, 11L, 10L, 9L, 7L, 6L, 5L, 2L),
##    IN.n IN.capa IN.dups IN.even GS.status GS.iterations MTGS.status MTGS.iterations DP.status DP.iterations DP.solutions DP.density type
## 31    6      46       0    TRUE     FALSE             6       FALSE               4     FALSE             6            0  0.4893617    4
## 32    6      46       0    TRUE     FALSE             6       FALSE               3     FALSE             6            0  0.4042553    4
## 33    6      42       0   FALSE     FALSE             6       FALSE               3     FALSE             6            0  0.5813953    4
## 34    9      60       0    TRUE     FALSE             9       FALSE               4     FALSE             9            0  0.7540984    4
## 35    9      58       0   FALSE     FALSE             9       FALSE               4     FALSE             9            0  0.7457627    4
## 36    9      59       0   FALSE     FALSE             9       FALSE               4     FALSE             9            0  0.8000000    4
## 37   10      73       0    TRUE     FALSE            10       FALSE               5     FALSE            10            0  0.4729730    4
## 38   10      81       0    TRUE     FALSE            10       FALSE               5     FALSE            10            0  0.7682927    4
## 39   11      77       0    TRUE     FALSE            11       FALSE               5     FALSE            11            0  0.4871795    4
## 40   11      69       0    TRUE     FALSE            11       FALSE               5     FALSE            11            0  0.5000000    4
        c(24L, 21L, 19L, 15L, 9L, 4L),
        c(25L, 22L, 20L, 17L, 5L, 3L),
        c(25L, 22L, 15L, 13L, 9L, 1L),
        c(25L, 23L, 18L, 15L, 13L, 10L, 8L, 5L, 3L),
        c(25L, 24L, 15L, 14L, 13L, 12L, 11L, 2L, 1L),
        c(25L, 23L, 22L, 20L, 19L, 4L, 3L, 2L, 1L),
        c(24L, 22L, 20L, 18L, 16L, 14L, 12L, 10L, 6L, 4L),
        c(25L, 24L, 23L, 22L, 21L, 20L, 19L, 5L, 2L, 1L),
        c(24L, 22L, 20L, 18L, 16L, 14L, 12L, 10L, 8L, 6L, 4L),
        c(24L, 22L, 20L, 16L, 14L, 12L, 10L, 8L, 6L, 4L, 2L)
    )
usethis::use_data(inputs, overwrite = TRUE)
