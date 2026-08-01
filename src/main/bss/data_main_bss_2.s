; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 21 .bss symbols, range 0x02105884..0x02105eb8.
; split from the original single-TU cluster to carve out matched symbols (fragment 2 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-3).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-5).

        .bss

        .global data_02105884
data_02105884:
        .space 0x80
        .global data_02105904
data_02105904:
        .space 0x38
        .global data_0210593c
data_0210593c:
        .space 0x10
        .global data_0210594c
data_0210594c:
        .space 0x3d
        .global data_02105989
data_02105989:
        .space 0x15
        .global data_0210599e
data_0210599e:
        .space 0x2
        .global data_021059a0
data_021059a0:
        .space 0x4
        .global data_021059a4
data_021059a4:
        .space 0x4
        .global data_021059a8
data_021059a8:
        .space 0x10
        .global data_021059b8
data_021059b8:
        .space 0xe
        .global data_021059c6
data_021059c6:
        .space 0x2
        .global data_021059c8
data_021059c8:
        .space 0x4
        .global data_021059cc
data_021059cc:
        .space 0x2
        .global data_021059ce
data_021059ce:
        .space 0x2
        .global data_021059d0
data_021059d0:
        .space 0x7c
        .global data_02105a4c
data_02105a4c:
        .space 0x1
        .global data_02105a4d
data_02105a4d:
        .space 0x1b
        .global data_02105a68
data_02105a68:
        .space 0x108
        .global data_02105b70
data_02105b70:
        .space 0x40
        .global data_02105bb0
data_02105bb0:
        .space 0x10
        .global data_02105bc0
data_02105bc0:
        .space 0x2f8
