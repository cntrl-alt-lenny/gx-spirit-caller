; func_ov002_022bb9d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ccfd8
        .extern data_ov002_022ccfec
        .extern data_ov002_022d1af8
        .extern data_ov002_022d28fc
        .extern func_02037208
        .extern func_020a978c
        .extern func_ov002_022bdb88
        .global func_ov002_022bb9d8
        .arm
func_ov002_022bb9d8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0xc60]
    cmp r0, #0x0
    beq .L_c1c
    cmp r0, #0x1
    beq .L_c74
    cmp r0, #0x2
    beq .L_ce8
    b .L_d10
.L_c1c:
    mov r2, #0x0
    ldr r0, _LIT0
    str r2, [sp]
    add r3, r4, #0xc80
    mov r1, #0x33
    bl func_ov002_022bdb88
    add r0, r4, #0x124
    ldr r2, [r4, #0xc5c]
    ldr r1, _LIT1
    add r0, r0, #0x800
    bl func_020a978c
    add r0, r4, #0x14c
    ldr r1, _LIT2
    add r0, r0, #0x800
    bl func_020a978c
    ldr r0, _LIT3
    mov r1, #0x0
    str r1, [r0, #0x4]
    mov r0, #0x1
    str r0, [r4, #0xc60]
    str r1, [r4, #0xc64]
    b .L_d10
.L_c74:
    ldr r0, [r4, #0xc64]
    ldr r5, _LIT0
    cmp r0, #0xf
    bne .L_c98
    mov r0, #0x34
    sub r1, r0, #0x35
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_c98:
    mov r1, #0x0
.L_c9c:
    ldr r0, [r5]
    cmp r0, #0x0
    beq .L_cb8
    ldr r0, [r5, #0x4]
    cmp r0, #0x33
    moveq r0, #0x1
    beq .L_ccc
.L_cb8:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r5, r5, #0x8
    blt .L_c9c
    mov r0, #0x0
.L_ccc:
    cmp r0, #0x0
    bne .L_d10
    mov r0, #0x2
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_d10
.L_ce8:
    ldr r0, _LIT3
    mov r1, #0x1
    str r1, [r0, #0x4]
    mov r0, #0xc
    str r0, [r4, #0xcc8]
    mov r0, #0x3
    str r0, [r4, #0xcd0]
    mov r0, #0x0
    str r0, [r4, #0xc54]
    ldmia sp!, {r3, r4, r5, pc}
.L_d10:
    ldr r1, [r4, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4, #0xc64]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d28fc
_LIT1: .word data_ov002_022ccfd8
_LIT2: .word data_ov002_022ccfec
_LIT3: .word data_ov002_022d1af8
