; func_ov002_021d4804 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce870
        .extern data_ov002_022d008c
        .extern func_ov002_021ca710
        .extern func_ov002_021ca760
        .extern func_ov002_021caa50
        .extern func_ov002_021cab84
        .extern func_ov002_021cac10
        .extern func_ov002_021cae68
        .extern func_ov002_021cafa4
        .extern func_ov002_021cafcc
        .extern func_ov002_021cb094
        .extern func_ov002_021cb0e0
        .extern func_ov002_021cb15c
        .extern func_ov002_021cb190
        .extern func_ov002_021cb22c
        .extern func_ov002_021cb4a4
        .extern func_ov002_021cba94
        .extern func_ov002_021cc178
        .extern func_ov002_021cc55c
        .extern func_ov002_021cc8a4
        .extern func_ov002_021ccc98
        .extern func_ov002_021ccfd8
        .extern func_ov002_021cd334
        .extern func_ov002_021cd3cc
        .extern func_ov002_021cd430
        .extern func_ov002_021cd56c
        .extern func_ov002_021cd614
        .extern func_ov002_021cd6bc
        .extern func_ov002_021cd8f4
        .extern func_ov002_021cda84
        .extern func_ov002_021cdcec
        .extern func_ov002_021ce4bc
        .extern func_ov002_021cec68
        .extern func_ov002_021cf1ec
        .extern func_ov002_021cf77c
        .extern func_ov002_021cf9f0
        .extern func_ov002_021cfab4
        .extern func_ov002_021cfcc8
        .extern func_ov002_021cfe38
        .extern func_ov002_021cff48
        .extern func_ov002_021d0100
        .extern func_ov002_021d04c4
        .extern func_ov002_021d0780
        .extern func_ov002_021d0bec
        .extern func_ov002_021d0ccc
        .extern func_ov002_021d0d38
        .extern func_ov002_021d0df0
        .extern func_ov002_021d0e68
        .extern func_ov002_021d0ec0
        .extern func_ov002_021d0fb4
        .extern func_ov002_021d1108
        .extern func_ov002_021d1118
        .extern func_ov002_021d1128
        .extern func_ov002_021d1138
        .extern func_ov002_021d1148
        .extern func_ov002_021d1158
        .extern func_ov002_021d1168
        .extern func_ov002_021d119c
        .extern func_ov002_021d12d0
        .extern func_ov002_021d12f8
        .extern func_ov002_021d1364
        .extern func_ov002_021d13fc
        .extern func_ov002_021d1450
        .extern func_ov002_021d14c8
        .extern func_ov002_021d1530
        .extern func_ov002_021d15a8
        .extern func_ov002_021d1610
        .extern func_ov002_021d16bc
        .extern func_ov002_021d1738
        .extern func_ov002_021d17a0
        .extern func_ov002_021d1824
        .extern func_ov002_021d188c
        .extern func_ov002_021d196c
        .extern func_ov002_021d19d4
        .extern func_ov002_021d1a44
        .extern func_ov002_021d1a74
        .extern func_ov002_021d1a88
        .extern func_ov002_021d1afc
        .extern func_ov002_021d1b34
        .extern func_ov002_021d1c00
        .extern func_ov002_021d1c70
        .extern func_ov002_021d1e44
        .extern func_ov002_021d1eec
        .extern func_ov002_021d1fc8
        .extern func_ov002_021d2058
        .extern func_ov002_021d2124
        .extern func_ov002_021d21e0
        .extern func_ov002_021d2564
        .extern func_ov002_021d2930
        .extern func_ov002_021d2bb8
        .extern func_ov002_021d2c30
        .extern func_ov002_021d2ca0
        .extern func_ov002_021d2e9c
        .extern func_ov002_021d2fe0
        .extern func_ov002_021d3078
        .extern func_ov002_021d3338
        .extern func_ov002_021d33a0
        .extern func_ov002_021d3514
        .extern func_ov002_021d3b00
        .extern func_ov002_021d3d70
        .extern func_ov002_021d3eb4
        .extern func_ov002_021d44dc
        .extern func_ov002_021d44ec
        .extern func_ov002_021d44fc
        .extern func_ov002_021d4628
        .global func_ov002_021d4804
        .arm
func_ov002_021d4804:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    mov r2, #0x1
    ldr r0, _LIT1
    str r2, [r1, #0xd3c]
    ldrh r1, [r0]
    rsb r0, r2, #0x1000
    and r0, r1, r0
    cmp r0, #0x67
    addls pc, pc, r0, lsl #0x2
    b .L_504
    b .L_504
    b .L_1cc
    b .L_1d4
    b .L_1dc
    b .L_1e4
    b .L_1ec
    b .L_1f4
    b .L_1fc
    b .L_204
    b .L_20c
    b .L_214
    b .L_21c
    b .L_224
    b .L_22c
    b .L_234
    b .L_23c
    b .L_244
    b .L_24c
    b .L_254
    b .L_25c
    b .L_264
    b .L_26c
    b .L_274
    b .L_27c
    b .L_284
    b .L_28c
    b .L_294
    b .L_29c
    b .L_2a4
    b .L_2ac
    b .L_2b4
    b .L_2bc
    b .L_2c4
    b .L_2cc
    b .L_2d4
    b .L_2dc
    b .L_2e4
    b .L_2ec
    b .L_2f4
    b .L_2fc
    b .L_304
    b .L_30c
    b .L_314
    b .L_31c
    b .L_324
    b .L_32c
    b .L_334
    b .L_33c
    b .L_344
    b .L_34c
    b .L_354
    b .L_35c
    b .L_364
    b .L_36c
    b .L_374
    b .L_37c
    b .L_384
    b .L_38c
    b .L_394
    b .L_39c
    b .L_3a4
    b .L_3ac
    b .L_3b4
    b .L_3bc
    b .L_3c4
    b .L_3cc
    b .L_3d4
    b .L_3dc
    b .L_3e4
    b .L_3ec
    b .L_3f4
    b .L_3fc
    b .L_404
    b .L_40c
    b .L_414
    b .L_41c
    b .L_424
    b .L_42c
    b .L_434
    b .L_43c
    b .L_444
    b .L_44c
    b .L_454
    b .L_45c
    b .L_464
    b .L_46c
    b .L_474
    b .L_47c
    b .L_484
    b .L_48c
    b .L_494
    b .L_49c
    b .L_4a4
    b .L_4ac
    b .L_4b4
    b .L_4bc
    b .L_4c4
    b .L_4cc
    b .L_4d4
    b .L_4dc
    b .L_4e4
    b .L_4ec
    b .L_4f4
    b .L_4fc
.L_1cc:
    bl func_ov002_021d0e68
    ldmia sp!, {r3, pc}
.L_1d4:
    bl func_ov002_021d1168
    ldmia sp!, {r3, pc}
.L_1dc:
    bl func_ov002_021d119c
    ldmia sp!, {r3, pc}
.L_1e4:
    bl func_ov002_021d0fb4
    ldmia sp!, {r3, pc}
.L_1ec:
    bl func_ov002_021d0ec0
    ldmia sp!, {r3, pc}
.L_1f4:
    bl func_ov002_021d1738
    ldmia sp!, {r3, pc}
.L_1fc:
    bl func_ov002_021d188c
    ldmia sp!, {r3, pc}
.L_204:
    bl func_ov002_021d196c
    ldmia sp!, {r3, pc}
.L_20c:
    bl func_ov002_021d12f8
    ldmia sp!, {r3, pc}
.L_214:
    bl func_ov002_021d12d0
    ldmia sp!, {r3, pc}
.L_21c:
    bl func_ov002_021d19d4
    ldmia sp!, {r3, pc}
.L_224:
    bl func_ov002_021d1108
    ldmia sp!, {r3, pc}
.L_22c:
    bl func_ov002_021d1118
    ldmia sp!, {r3, pc}
.L_234:
    bl func_ov002_021d1128
    ldmia sp!, {r3, pc}
.L_23c:
    bl func_ov002_021d1138
    ldmia sp!, {r3, pc}
.L_244:
    bl func_ov002_021d1148
    ldmia sp!, {r3, pc}
.L_24c:
    bl func_ov002_021d1158
    ldmia sp!, {r3, pc}
.L_254:
    bl func_ov002_021d1530
    ldmia sp!, {r3, pc}
.L_25c:
    bl func_ov002_021d15a8
    ldmia sp!, {r3, pc}
.L_264:
    bl func_ov002_021d1450
    ldmia sp!, {r3, pc}
.L_26c:
    bl func_ov002_021ca710
    ldmia sp!, {r3, pc}
.L_274:
    bl func_ov002_021cafa4
    ldmia sp!, {r3, pc}
.L_27c:
    bl func_ov002_021cab84
    ldmia sp!, {r3, pc}
.L_284:
    bl func_ov002_021cac10
    ldmia sp!, {r3, pc}
.L_28c:
    bl func_ov002_021ca760
    ldmia sp!, {r3, pc}
.L_294:
    bl func_ov002_021caa50
    ldmia sp!, {r3, pc}
.L_29c:
    bl func_ov002_021cae68
    ldmia sp!, {r3, pc}
.L_2a4:
    bl func_ov002_021cafcc
    ldmia sp!, {r3, pc}
.L_2ac:
    bl func_ov002_021cb094
    ldmia sp!, {r3, pc}
.L_2b4:
    bl func_ov002_021cb0e0
    ldmia sp!, {r3, pc}
.L_2bc:
    bl func_ov002_021cb15c
    ldmia sp!, {r3, pc}
.L_2c4:
    bl func_ov002_021cb190
    ldmia sp!, {r3, pc}
.L_2cc:
    bl func_ov002_021cb22c
    ldmia sp!, {r3, pc}
.L_2d4:
    bl func_ov002_021d1364
    ldmia sp!, {r3, pc}
.L_2dc:
    bl func_ov002_021d3eb4
    ldmia sp!, {r3, pc}
.L_2e4:
    bl func_ov002_021d44dc
    ldmia sp!, {r3, pc}
.L_2ec:
    bl func_ov002_021d44ec
    ldmia sp!, {r3, pc}
.L_2f4:
    bl func_ov002_021d44fc
    ldmia sp!, {r3, pc}
.L_2fc:
    bl func_ov002_021d4628
    ldmia sp!, {r3, pc}
.L_304:
    bl func_ov002_021cd8f4
    ldmia sp!, {r3, pc}
.L_30c:
    bl func_ov002_021cda84
    ldmia sp!, {r3, pc}
.L_314:
    bl func_ov002_021d13fc
    ldmia sp!, {r3, pc}
.L_31c:
    bl func_ov002_021d1a44
    ldmia sp!, {r3, pc}
.L_324:
    bl func_ov002_021d33a0
    ldmia sp!, {r3, pc}
.L_32c:
    bl func_ov002_021d3514
    ldmia sp!, {r3, pc}
.L_334:
    bl func_ov002_021cf77c
    ldmia sp!, {r3, pc}
.L_33c:
    bl func_ov002_021cf9f0
    ldmia sp!, {r3, pc}
.L_344:
    bl func_ov002_021cfab4
    ldmia sp!, {r3, pc}
.L_34c:
    bl func_ov002_021cdcec
    ldmia sp!, {r3, pc}
.L_354:
    bl func_ov002_021ce4bc
    ldmia sp!, {r3, pc}
.L_35c:
    bl func_ov002_021cf1ec
    ldmia sp!, {r3, pc}
.L_364:
    bl func_ov002_021ccc98
    ldmia sp!, {r3, pc}
.L_36c:
    bl func_ov002_021ccfd8
    ldmia sp!, {r3, pc}
.L_374:
    bl func_ov002_021cd334
    ldmia sp!, {r3, pc}
.L_37c:
    bl func_ov002_021cd430
    ldmia sp!, {r3, pc}
.L_384:
    bl func_ov002_021cd3cc
    ldmia sp!, {r3, pc}
.L_38c:
    bl func_ov002_021cd56c
    ldmia sp!, {r3, pc}
.L_394:
    bl func_ov002_021cd614
    ldmia sp!, {r3, pc}
.L_39c:
    bl func_ov002_021cff48
    ldmia sp!, {r3, pc}
.L_3a4:
    bl func_ov002_021cd6bc
    ldmia sp!, {r3, pc}
.L_3ac:
    bl func_ov002_021cc55c
    ldmia sp!, {r3, pc}
.L_3b4:
    bl func_ov002_021cc8a4
    ldmia sp!, {r3, pc}
.L_3bc:
    bl func_ov002_021cb4a4
    ldmia sp!, {r3, pc}
.L_3c4:
    bl func_ov002_021cba94
    ldmia sp!, {r3, pc}
.L_3cc:
    bl func_ov002_021cc178
    ldmia sp!, {r3, pc}
.L_3d4:
    bl func_ov002_021cfe38
    ldmia sp!, {r3, pc}
.L_3dc:
    bl func_ov002_021cfcc8
    ldmia sp!, {r3, pc}
.L_3e4:
    bl func_ov002_021d0100
    ldmia sp!, {r3, pc}
.L_3ec:
    bl func_ov002_021d2930
    ldmia sp!, {r3, pc}
.L_3f4:
    bl func_ov002_021cec68
    ldmia sp!, {r3, pc}
.L_3fc:
    bl func_ov002_021d3d70
    ldmia sp!, {r3, pc}
.L_404:
    bl func_ov002_021d3b00
    ldmia sp!, {r3, pc}
.L_40c:
    bl func_ov002_021d3078
    ldmia sp!, {r3, pc}
.L_414:
    bl func_ov002_021d2bb8
    ldmia sp!, {r3, pc}
.L_41c:
    bl func_ov002_021d2c30
    ldmia sp!, {r3, pc}
.L_424:
    bl func_ov002_021d2ca0
    ldmia sp!, {r3, pc}
.L_42c:
    bl func_ov002_021d2e9c
    ldmia sp!, {r3, pc}
.L_434:
    bl func_ov002_021d1eec
    ldmia sp!, {r3, pc}
.L_43c:
    bl func_ov002_021d21e0
    ldmia sp!, {r3, pc}
.L_444:
    bl func_ov002_021d2564
    ldmia sp!, {r3, pc}
.L_44c:
    bl func_ov002_021d2058
    ldmia sp!, {r3, pc}
.L_454:
    bl func_ov002_021d2124
    ldmia sp!, {r3, pc}
.L_45c:
    bl func_ov002_021d1fc8
    ldmia sp!, {r3, pc}
.L_464:
    bl func_ov002_021d0bec
    ldmia sp!, {r3, pc}
.L_46c:
    bl func_ov002_021d04c4
    ldmia sp!, {r3, pc}
.L_474:
    bl func_ov002_021d0780
    ldmia sp!, {r3, pc}
.L_47c:
    bl func_ov002_021d0d38
    ldmia sp!, {r3, pc}
.L_484:
    bl func_ov002_021d0df0
    ldmia sp!, {r3, pc}
.L_48c:
    bl func_ov002_021d0ccc
    ldmia sp!, {r3, pc}
.L_494:
    bl func_ov002_021d1c70
    ldmia sp!, {r3, pc}
.L_49c:
    bl func_ov002_021d1e44
    ldmia sp!, {r3, pc}
.L_4a4:
    bl func_ov002_021d1610
    ldmia sp!, {r3, pc}
.L_4ac:
    bl func_ov002_021d16bc
    ldmia sp!, {r3, pc}
.L_4b4:
    bl func_ov002_021d17a0
    ldmia sp!, {r3, pc}
.L_4bc:
    bl func_ov002_021d1824
    ldmia sp!, {r3, pc}
.L_4c4:
    bl func_ov002_021d2fe0
    ldmia sp!, {r3, pc}
.L_4cc:
    bl func_ov002_021d3338
    ldmia sp!, {r3, pc}
.L_4d4:
    bl func_ov002_021d14c8
    ldmia sp!, {r3, pc}
.L_4dc:
    bl func_ov002_021d1a74
    ldmia sp!, {r3, pc}
.L_4e4:
    bl func_ov002_021d1a88
    ldmia sp!, {r3, pc}
.L_4ec:
    bl func_ov002_021d1afc
    ldmia sp!, {r3, pc}
.L_4f4:
    bl func_ov002_021d1b34
    ldmia sp!, {r3, pc}
.L_4fc:
    bl func_ov002_021d1c00
    ldmia sp!, {r3, pc}
.L_504:
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022ce870
