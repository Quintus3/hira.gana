Lightweight Haskell wrapper to support writing in Hiragana.

See script.gana for an example script.

= TODOs
- execute translated script
- add ligatures, e.g. such that `su` can be written as `す` instead of `さう` (sa-u)
- add more natural "bridging letters". now, (almost) everything defaults to `-a`, e.g. `import` -> `i-ma-pa-o-ra-ta`, whereas `i-mo-po-ru-to` sounds more natural


= Translation
everything is fonetic, with the following translations:
= vowels
- a - "a" - あ
- e - "e" - え
- i - "i" - い
- o - "o" - お
- u - "u" - う

= base consonants:
- h - "ha" - は
- k - "ka" - か
- m - "ma" - ま
- n - "na" - な
- p - "pa" - ぱ
- r - "ra" - ら
- s - "sa"　- さ
- t - "ta" - た
- w - "wa" - わ
- y - "ya" - や

= dakuten consonants:
- b - "ba" - ば
- d - "da" - だ
- g - "ga" - が
- j - "ji" - じ
- z - "za" -　ざ

= others:
- c - "si" -　し
- f - "fu" - ふ
- l - "ri" - り
- q - "ku" - く
- v - "vu" - ゔ
- x - "su" - す

capitals are preceded by an `￥`:　`A - "\a" - ￥あ`