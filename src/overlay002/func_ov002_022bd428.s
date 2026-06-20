; func_ov002_022bd428 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d1af8
        .extern data_ov002_022d28fc
        .extern func_02037208
        .extern func_ov002_022bdb88
        .global func_ov002_022bd428
        .arm
func_ov002_022bd428:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0xc60]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_2c4
    b .L_190
    b .L_1b0
    b .L_1e8
    b .L_280
    b .L_2a0
.L_190:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x4]
    str r1, [r4, #0xc48]
    mov r0, #0x1
    str r0, [r4, #0xc60]
    str r1, [r4, #0xc64]
    b .L_2c4
.L_1b0:
    ldr r0, [r4, #0xc64]
    cmp r0, #0xf
    blt .L_2c4
    mov r3, #0x0
    str r3, [sp]
    ldr r2, [r4, #0xc58]
    ldr r0, _LIT1
    mov r1, #0x7
    bl func_ov002_022bdb88
    mov r0, #0x2
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_2c4
.L_1e8:
    ldr r0, [r4, #0xc64]
    ldr r5, _LIT1
    cmp r0, #0x4b
    cmpne r0, #0x5a
    bne .L_214
    mov r0, #0x3b
    sub r1, r0, #0x3c
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_230
.L_214:
    cmp r0, #0x9b
    bne .L_230
    mov r0, #0x4a
    sub r1, r0, #0x4b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_230:
    mov r1, #0x0
.L_234:
    ldr r0, [r5]
    cmp r0, #0x0
    beq .L_250
    ldr r0, [r5, #0x4]
    cmp r0, #0x7
    moveq r0, #0x1
    beq .L_264
.L_250:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r5, r5, #0x8
    blt .L_234
    mov r0, #0x0
.L_264:
    cmp r0, #0x0
    bne .L_2c4
    mov r0, #0x3
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_2c4
.L_280:
    ldr r0, [r4, #0xc64]
    cmp r0, #0xf
    blt .L_2c4
    mov r0, #0x4
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_2c4
.L_2a0:
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0x4]
    str r1, [r4, #0xc48]
    mov r0, #0xc
    str r0, [r4, #0xcc8]
    mov r0, #0x0
    str r0, [r4, #0xc54]
    ldmia sp!, {r3, r4, r5, pc}
.L_2c4:
    ldr r1, [r4, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4, #0xc64]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d1af8
_LIT1: .word data_ov002_022d28fc
