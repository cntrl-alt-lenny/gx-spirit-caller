; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 92 .bss symbols, range 0x021a5800..0x021a8288.
; split from the original single-TU cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 6 of 8, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-5).

        .bss

        .global data_021a5800
data_021a5800:
        .space 0x4
        .global data_021a5804
data_021a5804:
        .space 0x3c
        .global data_021a5840
data_021a5840:
        .space 0x4
        .global data_021a5844
data_021a5844:
        .space 0x4d4
        .global data_021a5d18
data_021a5d18:
        .space 0x18
        .global data_021a5d30
data_021a5d30:
        .space 0xc
        .global data_021a5d3c
data_021a5d3c:
        .space 0x5c0
        .global data_021a62fc
data_021a62fc:
        .space 0x4
        .global data_021a6300
data_021a6300:
        .space 0x4
        .global data_021a6304
data_021a6304:
        .space 0x2
        .global data_021a6306
data_021a6306:
        .space 0x2
        .global data_021a6308
data_021a6308:
        .space 0x2
        .global data_021a630a
data_021a630a:
        .space 0x2
        .global data_021a630c
data_021a630c:
        .space 0x2
        .global data_021a630e
data_021a630e:
        .space 0x2
        .global data_021a6310
data_021a6310:
        .space 0x2
        .global data_021a6312
data_021a6312:
        .space 0x2
        .global data_021a6314
data_021a6314:
        .space 0x2
        .global data_021a6316
data_021a6316:
        .space 0x2
        .global data_021a6318
data_021a6318:
        .space 0x2
        .global data_021a631a
data_021a631a:
        .space 0x2
        .global data_021a631c
data_021a631c:
        .space 0x4
        .global data_021a6320
data_021a6320:
        .space 0x4
        .global data_021a6324
data_021a6324:
        .space 0x4
        .global data_021a6328
data_021a6328:
        .space 0x4
        .global data_021a632c
data_021a632c:
        .space 0x4
        .global data_021a6330
data_021a6330:
        .space 0x4
        .global data_021a6334
data_021a6334:
        .space 0x4
        .global data_021a6338
data_021a6338:
        .space 0x4
        .global data_021a633c
data_021a633c:
        .space 0x4
        .global data_021a6340
data_021a6340:
        .space 0x4
        .global data_021a6344
data_021a6344:
        .space 0x4
        .global data_021a6348
data_021a6348:
        .space 0x4
        .global data_021a634c
data_021a634c:
        .space 0x4
        .global data_021a6350
data_021a6350:
        .space 0x4
        .global data_021a6354
data_021a6354:
        .space 0x4
        .global data_021a6358
data_021a6358:
        .space 0x4
        .global data_021a635c
data_021a635c:
        .space 0x28
        .global data_021a6384
data_021a6384:
        .space 0x4
        .global data_021a6388
data_021a6388:
        .space 0x4
        .global data_021a638c
data_021a638c:
        .space 0x28
        .global data_021a63b4
data_021a63b4:
        .space 0x4
        .global data_021a63b8
data_021a63b8:
        .space 0x4
        .global data_021a63bc
data_021a63bc:
        .space 0x4
        .global data_021a63c0
data_021a63c0:
        .space 0x4
        .global data_021a63c4
data_021a63c4:
        .space 0x4
        .global data_021a63c8
data_021a63c8:
        .space 0x4
        .global data_021a63cc
data_021a63cc:
        .space 0x4
        .global data_021a63d0
data_021a63d0:
        .space 0x4
        .global data_021a63d4
data_021a63d4:
        .space 0xc
        .global data_021a63e0
data_021a63e0:
        .space 0xc0
        .global data_021a64a0
data_021a64a0:
        .space 0x188
        .global data_021a6628
data_021a6628:
        .space 0x4
        .global data_021a662c
data_021a662c:
        .space 0x4
        .global data_021a6630
data_021a6630:
        .space 0x4
        .global data_021a6634
data_021a6634:
        .space 0x4
        .global data_021a6638
data_021a6638:
        .space 0x4
        .global data_021a663c
data_021a663c:
        .space 0x80
        .global data_021a66bc
data_021a66bc:
        .space 0x4
        .global data_021a66c0
data_021a66c0:
        .space 0x4
        .global data_021a66c4
data_021a66c4:
        .space 0x4
        .global data_021a66c8
data_021a66c8:
        .space 0x8
        .global data_021a66d0
data_021a66d0:
        .space 0x4
        .global data_021a66d4
data_021a66d4:
        .space 0x8
        .global data_021a66dc
data_021a66dc:
        .space 0x4
        .global data_021a66e0
data_021a66e0:
        .space 0x4
        .global data_021a66e4
data_021a66e4:
        .space 0x4
        .global data_021a66e8
data_021a66e8:
        .space 0x8
        .global data_021a66f0
data_021a66f0:
        .space 0x4
        .global data_021a66f4
data_021a66f4:
        .space 0x4
        .global data_021a66f8
data_021a66f8:
        .space 0x4
        .global data_021a66fc
data_021a66fc:
        .space 0x14
        .global data_021a6710
data_021a6710:
        .space 0x20
        .global data_021a6730
data_021a6730:
        .space 0x4
        .global data_021a6734
data_021a6734:
        .space 0x18
        .global data_021a674c
data_021a674c:
        .space 0x4
        .global data_021a6750
data_021a6750:
        .space 0x4
        .global data_021a6754
data_021a6754:
        .space 0x4
        .global data_021a6758
data_021a6758:
        .space 0x4
        .global data_021a675c
data_021a675c:
        .space 0x4
        .global data_021a6760
data_021a6760:
        .space 0x4
        .global data_021a6764
data_021a6764:
        .space 0x4
        .global data_021a6768
data_021a6768:
        .space 0x4
        .global data_021a676c
data_021a676c:
        .space 0x4
        .global data_021a6770
data_021a6770:
        .space 0x30
        .global data_021a67a0
data_021a67a0:
        .space 0x280
        .global data_021a6a20
data_021a6a20:
        .space 0x1000
        .global data_021a7a20
data_021a7a20:
        .space 0x7e8
        .global data_021a8208
data_021a8208:
        .space 0x18
        .global data_021a8220
data_021a8220:
        .space 0x60
        .global data_021a8280
data_021a8280:
        .space 0x4
        .global data_021a8284
data_021a8284:
        .space 0x4
