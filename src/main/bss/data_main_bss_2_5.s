; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 2 .bss symbols, range 0x02105bb0..0x02105eb8.
; split from the original single-TU cluster to carve out matched symbols (fragment 2 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-3).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-5).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-8).

        .bss

        .global data_02105bb0
data_02105bb0:
        .space 0x10
        .global data_02105bc0
data_02105bc0:
        .space 0x2f8
