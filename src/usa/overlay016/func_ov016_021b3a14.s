; func_ov016_021b3a14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern data_02105a90
        .extern data_ov016_021b8ca8
        .extern data_ov016_021b90bc
        .extern data_ov016_021b90d8
        .extern data_ov016_021b90f8
        .extern data_ov016_021b911c
        .extern data_ov016_021b9138
        .extern data_ov016_021baa8c
        .extern func_02001ba8
        .extern func_02001cec
        .extern func_02004f3c
        .extern func_0200506c
        .extern func_02005488
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_0201e78c
        .extern func_0201ef3c
        .extern func_0202c06c
        .extern func_02052e58
        .extern func_0208de24
        .extern func_0208de78
        .extern func_0208e0e4
        .extern func_02094410
        .extern func_0209445c
        .extern func_020b3714
        .extern func_020b3720
        .global func_ov016_021b3a14
        .arm
func_ov016_021b3a14:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x70
    ldr r1, _LIT0
    mov sl, r0
    mov r0, #0x0
    mov r2, #0x40
    bl func_02094410
    mov r0, #0x3
    str r0, [sl, #0x1c]
    ldr r2, _LIT1
    add r0, sp, #0x48
    ldrh r1, [r2]
    and r1, r1, #0x43
    orr r1, r1, #0x384
    orr r1, r1, #0x4000
    strh r1, [r2]
    bl func_0201d428
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
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
    bl func_0201e564
    ldr r0, [sp, #0x48]
    bl func_02006e00
    add r0, sp, #0x48
    bl func_0201d428
    ldr r0, _LIT3
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
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
    bl func_0201e564
    ldr r0, [sp, #0x48]
    bl func_02006e00
    bl func_0208de78
    add r1, r0, #0x40
    mov r0, #0x0
    mov r2, #0x580
    bl func_02094410
    ldr r0, _LIT5
    mov r1, #0x16
    mov r2, #0x2
    bl func_02001cec
    ldr r0, _LIT6
    bl func_0202c06c
    mov r5, r0
    bl func_0208de78
    mov r4, r0
    ldr r0, _LIT6
    bl func_0202c06c
    mov r1, #0xc
    bl func_02005488
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
    bl func_0200506c
    bl func_0208de24
    add r0, r0, #0x2f40
    add r1, r0, #0x4000
    mov r0, #0x0
    mov r2, #0x780
    bl func_02094410
    ldr r0, _LIT5
    mov r1, #0x14
    mov r2, #0x3
    bl func_02001cec
    ldr r0, _LIT7
    bl func_0202c06c
    mov r4, r0
    bl func_0208de24
    add r2, r0, #0x2f40
    mov r3, #0x6
    mov r1, r4
    str r3, [sp]
    mov r4, #0xc
    ldr r0, _LIT5
    add r2, r2, #0x4000
    mov r3, #0x2
    str r4, [sp, #0x4]
    bl func_02004f3c
    bl func_0208e0e4
    mov r5, #0x0
    ldr r2, _LIT8
    add r4, r0, #0x148
    mov r3, r5
.L_290:
    mov r6, r3
.L_294:
    add r0, r2, #0x1
    mov r1, r6, lsl #0x1
    orr r2, r2, #0x4000
    mov r0, r0, lsl #0x10
    add r6, r6, #0x1
    strh r2, [r4, r1]
    cmp r6, #0x14
    mov r2, r0, lsr #0x10
    blt .L_294
    add r5, r5, #0x1
    cmp r5, #0x3
    add r4, r4, #0x40
    blt .L_290
    bl func_0208de24
    add r0, r0, #0x36c0
    add r1, r0, #0x4000
    mov r0, #0x0
    mov r2, #0x500
    bl func_02094410
    ldr r0, _LIT5
    mov r1, #0x14
    mov r2, #0x2
    bl func_02001cec
    ldr r0, _LIT9
    bl func_0202c06c
    mov r4, r0
    bl func_0208de24
    add r0, r0, #0x36c0
    add r2, r0, #0x4000
    mov r0, #0x4
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT5
    mov r1, r4
    mov r3, #0x2
    bl func_02004f3c
    bl func_0208e0e4
    mov r4, #0x0
    ldr r2, _LIT10
    add r6, r0, #0x388
    mov r3, r4
.L_33c:
    mov r5, r3
.L_340:
    add r0, r2, #0x1
    mov r1, r5, lsl #0x1
    orr r2, r2, #0x5000
    mov r0, r0, lsl #0x10
    add r5, r5, #0x1
    strh r2, [r6, r1]
    cmp r5, #0x14
    mov r2, r0, lsr #0x10
    blt .L_340
    add r4, r4, #0x1
    cmp r4, #0x2
    add r6, r6, #0x40
    blt .L_33c
    ldr r1, _LIT11
    ldr r2, _LIT12
    add r0, sp, #0x28
    bl func_02001ba8
    ldr r1, _LIT13
    add r0, sp, #0x28
    mov r2, #0x20
    bl func_0209445c
    ldr r1, _LIT11
    ldr r2, _LIT14
    add r0, sp, #0x28
    bl func_02001ba8
    ldr r1, _LIT15
    add r0, sp, #0x28
    mov r2, #0x20
    bl func_0209445c
    ldr r2, _LIT16
    add r0, sp, #0x48
    ldrh r1, [r2]
    and r1, r1, #0x43
    orr r1, r1, #0x104
    orr r1, r1, #0x400
    strh r1, [r2]
    bl func_0201d428
    ldr r0, _LIT17
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
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
    bl func_0201e564
    ldr r0, [sp, #0x48]
    bl func_02006e00
    ldr r0, _LIT18
    add r4, sp, #0x18
    ldmia r0, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    bl func_0201e78c
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
    bl func_0201ef3c
    add r0, sp, #0x48
    bl func_0201d428
    ldr r0, _LIT19
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
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
    bl func_0201e564
    ldr r0, [sp, #0x48]
    bl func_02006e00
    add r0, sp, #0x48
    bl func_0201d428
    ldr r0, _LIT20
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
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
    bl func_0201e564
    ldr r0, [sp, #0x48]
    bl func_02006e00
    ldr r0, _LIT21
    bl func_02052e58
    mov r9, r1
    mov r6, r0
    cmp r9, #0x0
    cmpeq r6, #0x0
    mov r7, #0x0
    beq .L_5fc
    mov r5, #0xa
    mov r8, r7
    mov r4, r7
    mov fp, r5
.L_53c:
    mov r0, r6
    mov r1, r9
    mov r2, r5
    mov r3, r4
    bl func_020b3720
    ldr r2, [sl, #0x4]
    mov r1, r9
    orr r0, r2, r0, lsl r8
    str r0, [sl, #0x4]
    mov r0, r6
    mov r2, fp
    mov r3, #0x0
    bl func_020b3714
    add r7, r7, #0x1
    mov r6, r0
    mov r9, r1
    add r8, r8, #0x4
    cmp r7, #0x8
    blt .L_53c
    mov r7, #0x0
    mov r5, #0xa
    mov r8, r7
    mov r4, r7
    mov fp, r5
.L_59c:
    mov r0, r6
    mov r1, r9
    mov r2, r5
    mov r3, r4
    bl func_020b3720
    ldr r2, [sl, #0x8]
    mov r1, r9
    orr r0, r2, r0, lsl r8
    str r0, [sl, #0x8]
    mov r0, r6
    mov r2, fp
    mov r3, #0x0
    bl func_020b3714
    add r7, r7, #0x1
    mov r6, r0
    mov r9, r1
    add r8, r8, #0x4
    cmp r7, #0x4
    blt .L_59c
    ldr r0, [sl, #0x8]
    orr r0, r0, #0xff0000
    orr r0, r0, #-16777216
    str r0, [sl, #0x8]
    b .L_608
.L_5fc:
    sub r0, r7, #0x1
    str r0, [sl, #0x4]
    str r0, [sl, #0x8]
.L_608:
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
_LIT0: .word data_ov016_021baa8c
_LIT1: .word 0x0400000c
_LIT2: .word data_ov016_021b90bc
_LIT3: .word data_ov016_021b90d8
_LIT4: .word 0x00004580
_LIT5: .word data_02102bb0
_LIT6: .word 0x000006ba
_LIT7: .word 0x000006b6
_LIT8: .word 0x0000037a
_LIT9: .word 0x000006b7
_LIT10: .word 0x000003b6
_LIT11: .word 0x00007fff
_LIT12: .word 0x000050e3
_LIT13: .word 0x05000080
_LIT14: .word 0x00001438
_LIT15: .word 0x050000a0
_LIT16: .word 0x0400100c
_LIT17: .word data_ov016_021b90f8
_LIT18: .word data_ov016_021b8ca8
_LIT19: .word data_ov016_021b911c
_LIT20: .word data_ov016_021b9138
_LIT21: .word data_02105a90
