; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 27 .bss symbols, range 0x021a8308..0x021a8b00.
; split from the original single-TU cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 6 of 8, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-5).

        .bss

        .global data_021a8308
data_021a8308:
        .space 0x4
        .global data_021a830c
data_021a830c:
        .space 0xc
        .global data_021a8318
data_021a8318:
        .space 0x4
        .global data_021a831c
data_021a831c:
        .space 0x4
        .global data_021a8320
data_021a8320:
        .space 0x4
        .global data_021a8324
data_021a8324:
        .space 0x8
        .global data_021a832c
data_021a832c:
        .space 0x8
        .global data_021a8334
data_021a8334:
        .space 0x5c
        .global data_021a8390
data_021a8390:
        .space 0x4
        .global data_021a8394
data_021a8394:
        .space 0x18
        .global data_021a83ac
data_021a83ac:
        .space 0x20
        .global data_021a83cc
data_021a83cc:
        .space 0x4
        .global data_021a83d0
data_021a83d0:
        .space 0x4
        .global data_021a83d4
data_021a83d4:
        .space 0x4
        .global data_021a83d8
data_021a83d8:
        .space 0x4
        .global data_021a83dc
data_021a83dc:
        .space 0x4
        .global data_021a83e0
data_021a83e0:
        .space 0x4
        .global data_021a83e4
data_021a83e4:
        .space 0x10
        .global data_021a83f4
data_021a83f4:
        .space 0x18
        .global data_021a840c
data_021a840c:
        .space 0x4
        .global data_021a8410
data_021a8410:
        .space 0x24
        .global data_021a8434
data_021a8434:
        .space 0x4
        .global data_021a8438
data_021a8438:
        .space 0x24
        .global data_021a845c
data_021a845c:
        .space 0x4
        .global data_021a8460
data_021a8460:
        .space 0x60
        .global data_021a84c0
data_021a84c0:
        .space 0x620
        .global data_021a8ae0
data_021a8ae0:
        .space 0x20
