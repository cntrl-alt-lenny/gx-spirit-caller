; func_ov002_022b1434 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4634
        .extern data_02102bb0
        .extern data_02103fcc
        .extern data_02104e6c
        .extern data_ov002_022ca418
        .extern data_ov002_022cc7b4
        .extern data_ov002_022cc7d0
        .extern func_02001a14
        .extern func_02001ba8
        .extern func_02001cec
        .extern func_02001d48
        .extern func_0200506c
        .extern func_02005488
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_0202c06c
        .extern func_02034734
        .extern func_02094410
        .extern func_0209445c
        .extern func_ov002_022b1358
        .global func_ov002_022b1434
        .arm
func_ov002_022b1434:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x5c
    str r0, [sp, #0x8]
    add r0, sp, #0x34
    bl func_0201d428
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldr r2, _LIT1
    ldrh r1, [sp, #0x48]
    str r0, [sp, #0x34]
    str r2, [sp, #0x40]
    bic r0, r1, #0xf
    orr r3, r0, #0x9
    mov r1, #0x140
    add r0, sp, #0x34
    strh r3, [sp, #0x48]
    strh r1, [sp, #0x44]
    bl func_0201e564
    ldr r0, [sp, #0x34]
    bl func_02006e00
    add r0, sp, #0x34
    bl func_0201d428
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp, #0x34]
    mov r0, #0x160
    ldr r1, _LIT3
    ldrh r2, [sp, #0x48]
    strh r0, [sp, #0x44]
    str r1, [sp, #0x40]
    bic r0, r2, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x48]
    add r0, sp, #0x34
    bl func_0201e564
    ldr r0, [sp, #0x34]
    bl func_02006e00
    ldr r0, _LIT4
    ldr r1, _LIT5
    mov r2, #0x20
    bl func_0209445c
    ldr r1, _LIT6
    add r0, sp, #0x12
    mov r2, #0x0
    bl func_02001ba8
    ldr r1, _LIT7
    add r0, sp, #0x12
    mov r2, #0x20
    bl func_0209445c
    ldr r1, _LIT8
    add r0, sp, #0x12
    mov r2, #0x20
    bl func_0209445c
    ldr r1, _LIT9
    add r0, sp, #0x12
    mov r2, #0x0
    bl func_02001ba8
    ldr r1, _LIT10
    add r0, sp, #0x12
    mov r2, #0x20
    bl func_0209445c
    ldr r1, _LIT11
    add r0, sp, #0x12
    mov r2, #0x20
    bl func_0209445c
    ldr r2, _LIT6
    add r0, sp, #0x12
    mov r1, #0x0
    bl func_02001ba8
    ldr r1, _LIT12
    add r0, sp, #0x12
    mov r2, #0x20
    bl func_0209445c
    ldr r2, _LIT9
    add r0, sp, #0x12
    mov r1, #0x0
    bl func_02001ba8
    ldr r1, _LIT13
    add r0, sp, #0x12
    mov r2, #0x20
    bl func_0209445c
    mov r0, #0x6600000
    add r0, r0, #0x900
    add r8, r0, #0x10000
    mov r0, #0x0
    mov r1, r8
    mov r2, #0x500
    bl func_02094410
    mov r0, #0x0
    bl func_02001d48
    ldr r0, _LIT14
    mov r9, #0x0
    ldrb r2, [r0, #0x3]
    ldrb r1, [r0, #0x4]
    ldrb r0, [r0, #0x5]
    ldr r4, _LIT15
    mov sl, r9
    strb r2, [sp, #0xc]
    strb r1, [sp, #0xd]
    strb r0, [sp, #0xe]
    and r7, r2, #0xff
    and r6, r1, #0xff
    and r5, r0, #0xff
    mov fp, #0x2
.L_1b0:
    and r0, r6, #0xff
    add r0, r0, r9
    mov r1, #0x2
    strb r0, [sp, #0x10]
    mov r0, r4
    strb r7, [sp, #0xf]
    strb r5, [sp, #0x11]
    mov r2, r1
    bl func_02001cec
    str fp, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    mov r0, r4
    add r1, sp, #0xf
    add r2, r8, sl
    mov r3, #0x1
    bl func_0200506c
    add r9, r9, #0x1
    add sl, sl, #0x80
    cmp r9, #0xa
    blt .L_1b0
    mov r0, #0x26
    bl func_02001a14
    ldr r0, _LIT16
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    ldr r0, _LIT17
    bl func_0202c06c
    ldr r1, _LIT18
    mov r2, #0xc
    bl func_ov002_022b1358
    ldr r0, _LIT17
    bl func_0202c06c
    mov r1, #0xc
    bl func_02005488
    ldr r1, [sp, #0x8]
    str r0, [r1, #0x5c]
    bl func_02034734
    cmp r0, #0x2
    bne .L_26c
    ldr r0, _LIT19
    ldr r0, [r0, #0xbac]
    cmp r0, #0x0
    movlt r0, #0x1
    blt .L_270
.L_26c:
    mov r0, #0x0
.L_270:
    add r0, r0, #0xc6
    add r0, r0, #0x600
    bl func_0202c06c
    ldr r1, _LIT20
    mov r2, #0xa
    bl func_ov002_022b1358
    ldr r0, _LIT16
    ldr r0, [r0, #0xa64]
    and r0, r0, #0x1f00000
    movs r0, r0, lsr #0x14
    beq .L_2b0
    ldr r0, _LIT21
    bl func_0202c06c
    ldr r1, _LIT22
    mov r2, #0xa
    bl func_ov002_022b1358
.L_2b0:
    ldr r0, _LIT23
    bl func_0202c06c
    ldr r1, _LIT24
    mov r2, #0xc
    bl func_ov002_022b1358
    add sp, sp, #0x5c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cc7b4
_LIT1: .word 0x0000f980
_LIT2: .word data_ov002_022cc7d0
_LIT3: .word 0x00010300
_LIT4: .word data_020b4634
_LIT5: .word 0x050006e0
_LIT6: .word 0x000003ff
_LIT7: .word 0x05000700
_LIT8: .word 0x05000420
_LIT9: .word 0x000027e0
_LIT10: .word 0x05000720
_LIT11: .word 0x05000440
_LIT12: .word 0x05000460
_LIT13: .word 0x05000480
_LIT14: .word data_ov002_022ca418
_LIT15: .word data_02102bb0
_LIT16: .word data_02104e6c
_LIT17: .word 0x00000835
_LIT18: .word 0x00010500
_LIT19: .word data_02103fcc
_LIT20: .word 0x00010e00
_LIT21: .word 0x000008b6
_LIT22: .word 0x00011600
_LIT23: .word 0x00000836
_LIT24: .word 0x00011200
