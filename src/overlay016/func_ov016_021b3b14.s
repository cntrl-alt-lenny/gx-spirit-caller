; func_ov016_021b3b14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c90
        .extern data_02104f4c
        .extern data_02105b70
        .extern data_ov016_021b8e14
        .extern data_ov016_021b921c
        .extern data_ov016_021b9238
        .extern data_ov016_021b9258
        .extern data_ov016_021b927c
        .extern data_ov016_021b9298
        .extern data_ov016_021babec
        .extern func_02001bc8
        .extern func_02001d0c
        .extern func_02004f58
        .extern func_02005088
        .extern func_020054a4
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0201e7e0
        .extern func_0201ef90
        .extern func_0202c0c0
        .extern func_02052ecc
        .extern func_0208df0c
        .extern func_0208df60
        .extern func_0208e1cc
        .extern func_02094504
        .extern func_02094550
        .extern func_020b3808
        .extern func_020b3814
        .global func_ov016_021b3b14
        .arm
func_ov016_021b3b14:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x70
    ldr r1, _LIT0
    mov sl, r0
    mov r0, #0x0
    mov r2, #0x40
    bl func_02094504
    mov r0, #0x3
    str r0, [sl, #0x1c]
    ldr r2, _LIT1
    add r0, sp, #0x48
    ldrh r1, [r2]
    and r1, r1, #0x43
    orr r1, r1, #0x384
    orr r1, r1, #0x4000
    strh r1, [r2]
    bl func_0201d47c
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldrh r1, [sp, #0x6e]
    str r0, [sp, #0x48]
    ldrh r2, [sp, #0x5c]
    bic r0, r1, #0xff
    orr r0, r0, #0x20
    bic r1, r2, #0xf
    orr r1, r1, #0x2
    strh r1, [sp, #0x5c]
    ldrh r1, [sp, #0x6c]
    strh r0, [sp, #0x6e]
    ldrh r2, [sp, #0x5c]
    bic r0, r1, #0xff
    strh r0, [sp, #0x6c]
    ldrh r0, [sp, #0x6e]
    ldr r1, [sp, #0x60]
    bic r1, r1, #0x1c000
    bic r0, r0, #0xff00
    orr r0, r0, #0x900
    orr r1, r1, #0x8000
    strh r0, [sp, #0x6e]
    bic r0, r1, #0x3f80
    orr r0, r0, #0x200
    str r0, [sp, #0x60]
    ldrh r1, [sp, #0x6c]
    orr r0, r2, #0x10
    strh r0, [sp, #0x5c]
    bic r1, r1, #0xff00
    ldrh r0, [sp, #0x5e]
    strh r1, [sp, #0x6c]
    orr r1, r0, #0x4000
    mov r0, #0x1ec0
    str r0, [sp, #0x54]
    mov r0, #0x200
    strh r0, [sp, #0x58]
    add r0, sp, #0x48
    strh r1, [sp, #0x5e]
    bl func_0201e5b8
    ldr r0, [sp, #0x48]
    bl func_02006e1c
    add r0, sp, #0x48
    bl func_0201d47c
    ldr r0, _LIT3
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x48]
    ldr r0, _LIT4
    ldrh r1, [sp, #0x5c]
    str r0, [sp, #0x54]
    bic r0, r1, #0xf
    orr r0, r0, #0x2
    strh r0, [sp, #0x5c]
    ldrh r0, [sp, #0x5c]
    orr r0, r0, #0x10
    strh r0, [sp, #0x5c]
    ldrh r0, [sp, #0x6e]
    ldr r2, [sp, #0x60]
    ldrh r1, [sp, #0x6c]
    bic r0, r0, #0xff
    orr r0, r0, #0x20
    strh r0, [sp, #0x6e]
    bic r0, r1, #0xff
    strh r0, [sp, #0x6c]
    bic r2, r2, #0x1c000
    ldrh r0, [sp, #0x6e]
    orr r4, r2, #0x8000
    mov r5, #0x400
    bic r2, r0, #0xff00
    ldrh r3, [sp, #0x6c]
    bic r0, r4, #0x3f80
    ldrh r1, [sp, #0x5e]
    bic r4, r3, #0xff00
    orr r3, r2, #0x800
    orr r2, r1, #0x4000
    orr r1, r0, #0x680
    add r0, sp, #0x48
    strh r5, [sp, #0x58]
    strh r4, [sp, #0x6c]
    strh r3, [sp, #0x6e]
    strh r2, [sp, #0x5e]
    str r1, [sp, #0x60]
    bl func_0201e5b8
    ldr r0, [sp, #0x48]
    bl func_02006e1c
    bl func_0208df60
    add r1, r0, #0x40
    mov r0, #0x0
    mov r2, #0x580
    bl func_02094504
    ldr r0, _LIT5
    mov r1, #0x16
    mov r2, #0x2
    bl func_02001d0c
    ldr r0, _LIT6
    bl func_0202c0c0
    mov r5, r0
    bl func_0208df60
    mov r4, r0
    ldr r0, _LIT6
    bl func_0202c0c0
    mov r1, #0xc
    bl func_020054a4
    rsb r0, r0, #0xb0
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    add r3, r0, #0x1
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT5
    mov r1, r5
    add r2, r4, #0x40
    bl func_02005088
    bl func_0208df0c
    add r0, r0, #0x2f40
    add r1, r0, #0x4000
    mov r0, #0x0
    mov r2, #0x780
    bl func_02094504
    ldr r0, _LIT5
    mov r1, #0x14
    mov r2, #0x3
    bl func_02001d0c
    ldr r0, _LIT7
    bl func_0202c0c0
    mov r4, r0
    bl func_0208df0c
    add r2, r0, #0x2f40
    mov r3, #0x6
    mov r1, r4
    str r3, [sp]
    mov r4, #0xc
    ldr r0, _LIT5
    add r2, r2, #0x4000
    mov r3, #0x2
    str r4, [sp, #0x4]
    bl func_02004f58
    bl func_0208e1cc
    mov r5, #0x0
    ldr r2, _LIT8
    add r4, r0, #0x148
    mov r3, r5
.L_32c:
    mov r6, r3
.L_330:
    add r0, r2, #0x1
    mov r1, r6, lsl #0x1
    orr r2, r2, #0x4000
    mov r0, r0, lsl #0x10
    add r6, r6, #0x1
    strh r2, [r4, r1]
    cmp r6, #0x14
    mov r2, r0, lsr #0x10
    blt .L_330
    add r5, r5, #0x1
    cmp r5, #0x3
    add r4, r4, #0x40
    blt .L_32c
    bl func_0208df0c
    add r0, r0, #0x36c0
    add r1, r0, #0x4000
    mov r0, #0x0
    mov r2, #0x6c0
    bl func_02094504
    ldr r0, _LIT5
    mov r1, #0x1b
    mov r2, #0x2
    bl func_02001d0c
    ldr r0, _LIT9
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    cmp r0, #0x4
    ldr r0, _LIT10
    bcs .L_3e0
    bl func_0202c0c0
    mov r4, r0
    bl func_0208df0c
    add r2, r0, #0x36c0
    mov r3, #0x4
    mov r1, r4
    str r3, [sp]
    mov r4, #0xc
    ldr r0, _LIT5
    add r2, r2, #0x4000
    mov r3, #0x2
    str r4, [sp, #0x4]
    bl func_02004f58
    b .L_414
.L_3e0:
    bl func_0202c0c0
    mov r4, r0
    bl func_0208df0c
    add r2, r0, #0x36c0
    mov r3, #0x5
    mov r1, r4
    str r3, [sp]
    mov r4, #0xa
    ldr r0, _LIT5
    add r2, r2, #0x4000
    mov r3, #0x2
    str r4, [sp, #0x4]
    bl func_02004f58
.L_414:
    bl func_0208e1cc
    mov r4, #0x0
    ldr r2, _LIT11
    add r6, r0, #0x388
    mov r3, r4
.L_428:
    mov r5, r3
.L_42c:
    add r0, r2, #0x1
    mov r1, r5, lsl #0x1
    orr r2, r2, #0x5000
    mov r0, r0, lsl #0x10
    add r5, r5, #0x1
    strh r2, [r6, r1]
    cmp r5, #0x1b
    mov r2, r0, lsr #0x10
    blt .L_42c
    add r4, r4, #0x1
    cmp r4, #0x2
    add r6, r6, #0x40
    blt .L_428
    ldr r1, _LIT12
    ldr r2, _LIT13
    add r0, sp, #0x28
    bl func_02001bc8
    ldr r1, _LIT14
    add r0, sp, #0x28
    mov r2, #0x20
    bl func_02094550
    ldr r1, _LIT12
    ldr r2, _LIT15
    add r0, sp, #0x28
    bl func_02001bc8
    ldr r1, _LIT16
    add r0, sp, #0x28
    mov r2, #0x20
    bl func_02094550
    ldr r2, _LIT17
    add r0, sp, #0x48
    ldrh r1, [r2]
    and r1, r1, #0x43
    orr r1, r1, #0x104
    orr r1, r1, #0x400
    strh r1, [r2]
    bl func_0201d47c
    ldr r0, _LIT18
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x48]
    mov r0, #0x5700
    ldrh r1, [sp, #0x5c]
    str r0, [sp, #0x54]
    bic r0, r1, #0xf
    orr r0, r0, #0x7
    strh r0, [sp, #0x5c]
    mov r0, #0x20
    strh r0, [sp, #0x58]
    add r0, sp, #0x48
    bl func_0201e5b8
    ldr r0, [sp, #0x48]
    bl func_02006e1c
    ldr r0, _LIT19
    add r4, sp, #0x18
    ldmia r0, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    bl func_0201e7e0
    mov r3, #0x0
    str r3, [sp]
    mov r2, #0x1
    str r2, [sp, #0x4]
    mov r1, r4
    str r1, [sp, #0x8]
    str r2, [sp, #0xc]
    mov r0, #0x200
    str r0, [sp, #0x10]
    add r0, sl, #0x38
    str r0, [sp, #0x14]
    add r0, sl, #0x24
    add r1, sl, #0x28
    add r2, sl, #0x2c
    bl func_0201ef90
    add r0, sp, #0x48
    bl func_0201d47c
    ldr r0, _LIT20
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldrh r1, [sp, #0x5c]
    str r0, [sp, #0x48]
    mov r2, #0x4000
    bic r0, r1, #0xf
    orr r3, r0, #0x4
    mov r1, #0x0
    add r0, sp, #0x48
    strh r3, [sp, #0x5c]
    str r2, [sp, #0x54]
    strh r1, [sp, #0x58]
    bl func_0201e5b8
    ldr r0, [sp, #0x48]
    bl func_02006e1c
    add r0, sp, #0x48
    bl func_0201d47c
    ldr r0, _LIT21
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x48]
    mov r0, #0x15400
    ldrh r1, [sp, #0x5c]
    str r0, [sp, #0x54]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x5c]
    mov r0, #0x80
    ldrh r1, [sp, #0x5c]
    strh r0, [sp, #0x58]
    bic r0, r1, #0x10
    strh r0, [sp, #0x5c]
    add r0, sp, #0x48
    bl func_0201e5b8
    ldr r0, [sp, #0x48]
    bl func_02006e1c
    ldr r0, _LIT22
    bl func_02052ecc
    mov r9, r1
    mov r6, r0
    cmp r9, #0x0
    cmpeq r6, #0x0
    mov r7, #0x0
    beq .L_6e8
    mov r5, #0xa
    mov r8, r7
    mov r4, r7
    mov fp, r5
.L_628:
    mov r0, r6
    mov r1, r9
    mov r2, r5
    mov r3, r4
    bl func_020b3814
    ldr r2, [sl, #0x4]
    mov r1, r9
    orr r0, r2, r0, lsl r8
    str r0, [sl, #0x4]
    mov r0, r6
    mov r2, fp
    mov r3, #0x0
    bl func_020b3808
    add r7, r7, #0x1
    mov r6, r0
    mov r9, r1
    add r8, r8, #0x4
    cmp r7, #0x8
    blt .L_628
    mov r7, #0x0
    mov r5, #0xa
    mov r8, r7
    mov r4, r7
    mov fp, r5
.L_688:
    mov r0, r6
    mov r1, r9
    mov r2, r5
    mov r3, r4
    bl func_020b3814
    ldr r2, [sl, #0x8]
    mov r1, r9
    orr r0, r2, r0, lsl r8
    str r0, [sl, #0x8]
    mov r0, r6
    mov r2, fp
    mov r3, #0x0
    bl func_020b3808
    add r7, r7, #0x1
    mov r6, r0
    mov r9, r1
    add r8, r8, #0x4
    cmp r7, #0x4
    blt .L_688
    ldr r0, [sl, #0x8]
    orr r0, r0, #0xff0000
    orr r0, r0, #-16777216
    str r0, [sl, #0x8]
    b .L_6f4
.L_6e8:
    sub r0, r7, #0x1
    str r0, [sl, #0x4]
    str r0, [sl, #0x8]
.L_6f4:
    mvn r0, #0x0
    str r0, [sl, #0xc]
    str r0, [sl, #0x10]
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    mov r0, #0x1
    add sp, sp, #0x70
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov016_021babec
_LIT1: .word 0x0400000c
_LIT2: .word data_ov016_021b921c
_LIT3: .word data_ov016_021b9238
_LIT4: .word 0x00004580
_LIT5: .word data_02102c90
_LIT6: .word 0x000006ba
_LIT7: .word 0x000006b6
_LIT8: .word 0x0000037a
_LIT9: .word data_02104f4c
_LIT10: .word 0x000006b7
_LIT11: .word 0x000003b6
_LIT12: .word 0x00007fff
_LIT13: .word 0x000050e3
_LIT14: .word 0x05000080
_LIT15: .word 0x00001438
_LIT16: .word 0x050000a0
_LIT17: .word 0x0400100c
_LIT18: .word data_ov016_021b9258
_LIT19: .word data_ov016_021b8e14
_LIT20: .word data_ov016_021b927c
_LIT21: .word data_ov016_021b9298
_LIT22: .word data_02105b70
