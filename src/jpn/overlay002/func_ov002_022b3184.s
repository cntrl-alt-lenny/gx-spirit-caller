; func_ov002_022b3184 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104e6c
        .extern data_ov002_022cc838
        .extern data_ov002_022cc9a8
        .extern data_ov002_022cc9c8
        .extern data_ov002_022cc9e8
        .extern data_ov002_022cd65c
        .extern func_02006af4
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern OS_SPrintf
        .global func_ov002_022b3184
        .arm
func_ov002_022b3184:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x48
    mov r5, r1
    mov r1, r2
    add r2, r0, r5, lsl #0x2
    str r1, [r2, #0x34]
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    addeq sp, sp, #0x48
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r2, [r2, #0x2c]
    cmp r2, #0x0
    bne .L_b8
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r5, r0
    bne .L_80
    ldr r0, _LIT1
    ldr r3, _LIT2
    ldr r4, [r0, #0xba8]
    ldr r3, [r3, r1, lsl #0x2]
    and r2, r4, #0x3e0
    mov r2, r2, asr #0x5
    and ip, r4, #0x1f
    mov r0, #0xa
    sub r4, r2, #0x1
    mla r2, r4, r0, ip
    ldr r1, _LIT3
    add r0, sp, #0x28
    bl OS_SPrintf
    b .L_cc
.L_80:
    ldr r0, _LIT4
    ldr r3, _LIT2
    ldr r4, [r0, #0xa64]
    ldr r3, [r3, r1, lsl #0x2]
    and r2, r4, #0x3e0
    mov r2, r2, lsr #0x5
    and ip, r4, #0x1f
    mov r0, #0xa
    sub r4, r2, #0x1
    mla r2, r4, r0, ip
    ldr r1, _LIT3
    add r0, sp, #0x28
    bl OS_SPrintf
    b .L_cc
.L_b8:
    ldr r3, _LIT2
    add r0, sp, #0x28
    ldr r3, [r3, r1, lsl #0x2]
    ldr r1, _LIT5
    bl OS_SPrintf
.L_cc:
    add r0, sp, #0x28
    bl func_02006af4
    cmp r0, #0x0
    bne .L_e8
    ldr r1, _LIT6
    add r0, sp, #0x28
    bl OS_SPrintf
.L_e8:
    add r0, sp, #0x28
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r4, r0
    add r0, sp, #0x0
    bl func_0201d428
    ldrh r1, [sp, #0x14]
    ldr r0, _LIT0
    str r4, [sp]
    ldr r0, [r0, #0x4]
    bic r1, r1, #0xf
    cmp r5, r0
    orr r1, r1, #0x4
    moveq r2, #0x400
    strh r1, [sp, #0x14]
    movne r2, #0x1400
    mvn r1, #0x0
    add r0, sp, #0x0
    str r2, [sp, #0xc]
    strh r1, [sp, #0x10]
    bl func_0201e564
    mov r0, r4
    bl func_02006e00
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd65c
_LIT1: .word data_02103fcc
_LIT2: .word data_ov002_022cc838
_LIT3: .word data_ov002_022cc9a8
_LIT4: .word data_02104e6c
_LIT5: .word data_ov002_022cc9c8
_LIT6: .word data_ov002_022cc9e8
