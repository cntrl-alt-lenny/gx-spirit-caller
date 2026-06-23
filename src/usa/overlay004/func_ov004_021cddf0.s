; func_ov004_021cddf0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104b98
        .extern data_02104b9a
        .extern data_02104e6c
        .extern data_0210586c
        .extern data_021058a9
        .extern data_ov004_02209aa8
        .extern data_ov004_02209ab0
        .extern data_ov004_02209ad0
        .extern data_ov004_02209aec
        .extern data_ov004_02209b08
        .extern data_ov004_0220b2a0
        .extern func_02001ba8
        .extern func_02001d48
        .extern func_02006af4
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_0202c06c
        .extern func_020347f4
        .extern func_02091554
        .extern func_0209445c
        .extern func_020a9698
        .extern func_ov004_021cdc58
        .global func_ov004_021cddf0
        .arm
func_ov004_021cddf0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x88
    movs r6, r0
    ldr r4, _LIT0
    bne .L_34
    ldr r1, _LIT1
    ldr r2, _LIT2
    add r0, sp, #0x68
    bl func_02001ba8
    ldr r1, _LIT3
    add r0, sp, #0x68
    mov r2, #0x20
    bl func_0209445c
.L_34:
    add r0, r4, r6, lsl #0x2
    ldr r0, [r0, #0x68]
    cmp r0, #0x0
    addgt sp, sp, #0x88
    ldmgtia sp!, {r4, r5, r6, pc}
    cmp r6, #0x0
    bne .L_74
    ldr r0, _LIT4
    ldrb r0, [r0, #0xa3c]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    ldr r1, _LIT5
    mov r0, #0x0
    bl func_ov004_021cdc58
    b .L_9c
.L_74:
    bl func_020347f4
    ldr r1, _LIT6
    ldrsb r0, [r1, r0]
    bl func_02001d48
    bl func_020347f4
    ldr r2, _LIT7
    mov r1, #0x1a
    mla r1, r0, r1, r2
    mov r0, #0x1
    bl func_ov004_021cdc58
.L_9c:
    ldr r0, _LIT4
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    ldr r0, [r4, #0x40]
    cmp r0, #0x0
    beq .L_fc
    ldr r0, [r4, #0x4c]
    cmp r0, #0x1
    bne .L_fc
    cmp r6, #0x0
    ldrne r0, _LIT8
    ldrne r5, [r0, #0xba4]
    ldreq r0, _LIT9
    ldreqh r5, [r0, #0x58]
    ldr r0, _LIT10
    bl func_0202c06c
    mov r2, r0
    ldr r1, _LIT11
    add r0, sp, #0x48
    mov r3, r5
    bl func_020a9698
    b .L_12c
.L_fc:
    cmp r6, #0x0
    ldrne r0, _LIT8
    ldrne r5, [r0, #0xba4]
    ldreq r0, _LIT9
    ldreqh r5, [r0, #0x52]
    ldr r0, _LIT12
    bl func_0202c06c
    mov r2, r0
    ldr r1, _LIT11
    add r0, sp, #0x48
    mov r3, r5
    bl func_020a9698
.L_12c:
    add r1, sp, #0x48
    add r0, r6, #0x2
    bl func_ov004_021cdc58
    ldr r0, _LIT0
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    beq .L_1b0
    cmp r6, #0x0
    bne .L_180
    ldr r0, _LIT4
    mov r1, #0xa
    ldr r3, [r0, #0xa64]
    add r0, sp, #0x28
    and r2, r3, #0x3e0
    mov r2, r2, lsr #0x5
    and r5, r3, #0x1f
    sub r3, r2, #0x1
    mla r2, r3, r1, r5
    ldr r1, _LIT13
    bl func_02091554
    b .L_210
.L_180:
    bl func_020347f4
    ldr r1, _LIT6
    ldrsb r0, [r1, r0]
    cmp r0, #0x0
    add r0, sp, #0x28
    bne .L_1a4
    ldr r1, _LIT14
    bl func_02091554
    b .L_210
.L_1a4:
    ldr r1, _LIT15
    bl func_02091554
    b .L_210
.L_1b0:
    cmp r6, #0x0
    mov r1, #0xa
    bne .L_1e8
    ldr r0, _LIT4
    ldr r3, [r0, #0xa64]
    add r0, sp, #0x28
    and r2, r3, #0x3e0
    mov r2, r2, lsr #0x5
    and r5, r3, #0x1f
    sub r3, r2, #0x1
    mla r2, r3, r1, r5
    ldr r1, _LIT13
    bl func_02091554
    b .L_210
.L_1e8:
    ldr r0, _LIT8
    ldr r3, [r0, #0xba8]
    add r0, sp, #0x28
    and r2, r3, #0x3e0
    mov r2, r2, asr #0x5
    and r5, r3, #0x1f
    sub r3, r2, #0x1
    mla r2, r3, r1, r5
    ldr r1, _LIT13
    bl func_02091554
.L_210:
    add r0, sp, #0x28
    bl func_02006af4
    cmp r0, #0x0
    bne .L_22c
    ldr r1, _LIT16
    add r0, sp, #0x28
    bl func_02091554
.L_22c:
    add r0, sp, #0x28
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r5, r0
    add r0, sp, #0x0
    bl func_0201d428
    mov r0, r6, lsl #0xc
    add r1, r0, #0x1400
    ldrh r2, [sp, #0x14]
    str r1, [sp, #0xc]
    cmp r6, #0x0
    bic r0, r2, #0xf
    orr r0, r0, #0x4
    strh r0, [sp, #0x14]
    ldrh r0, [sp, #0x14]
    mvnne r1, #0x0
    moveq r1, #0x400
    orr r0, r0, #0x10
    strh r0, [sp, #0x14]
    add r0, sp, #0x0
    str r5, [sp]
    strh r1, [sp, #0x10]
    bl func_0201e564
    mov r0, r5
    bl func_02006e00
    add r0, r4, r6, lsl #0x2
    mov r1, #0x10
    str r1, [r0, #0x68]
    add sp, sp, #0x88
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word 0x00007fff
_LIT2: .word 0x00001ce7
_LIT3: .word 0x05000300
_LIT4: .word data_02104e6c
_LIT5: .word data_021058a9
_LIT6: .word data_02104b98
_LIT7: .word data_02104b9a
_LIT8: .word data_02103fcc
_LIT9: .word data_0210586c
_LIT10: .word 0x000006c7
_LIT11: .word data_ov004_02209aa8
_LIT12: .word 0x000006c6
_LIT13: .word data_ov004_02209ab0
_LIT14: .word data_ov004_02209ad0
_LIT15: .word data_ov004_02209aec
_LIT16: .word data_ov004_02209b08
