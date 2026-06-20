; func_ov002_022baf44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d1410
        .extern data_ov002_022d28fc
        .extern func_02037208
        .extern func_ov002_022a6324
        .extern func_ov002_022bdb88
        .global func_ov002_022baf44
        .arm
func_ov002_022baf44:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, [r4, #0xc60]
    cmp r0, #0x0
    beq .L_18c
    cmp r0, #0x1
    beq .L_204
    cmp r0, #0x2
    beq .L_258
    b .L_270
.L_18c:
    add r0, r4, #0xc00
    ldrh ip, [r0, #0x68]
    ldr r0, _LIT0
    mov r1, ip, lsl #0x1f
    mov r2, ip, lsl #0x1a
    mov r3, ip, lsl #0x12
    mov r1, r1, lsr #0x1f
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x18
    strh ip, [sp, #0x4]
    bl func_ov002_022a6324
    mov r1, #0x0
    str r1, [sp]
    ldrh r1, [r0, #0xa]
    ldr r0, _LIT1
    add r3, r4, #0xc80
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x1f
    mov r1, #0x1c
    bl func_ov002_022bdb88
    mov r0, #0x92
    sub r1, r0, #0x93
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    mov r0, #0x1
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_270
.L_204:
    ldr r2, _LIT1
    mov r1, #0x0
.L_20c:
    ldr r0, [r2]
    cmp r0, #0x0
    beq .L_228
    ldr r0, [r2, #0x4]
    cmp r0, #0x1c
    moveq r0, #0x1
    beq .L_23c
.L_228:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r2, r2, #0x8
    blt .L_20c
    mov r0, #0x0
.L_23c:
    cmp r0, #0x0
    bne .L_270
    mov r0, #0x2
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_270
.L_258:
    mov r0, #0xc
    str r0, [r4, #0xcc8]
    mov r0, #0x0
    add sp, sp, #0x8
    str r0, [r4, #0xc54]
    ldmia sp!, {r4, pc}
.L_270:
    ldr r1, [r4, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4, #0xc64]
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d1410
_LIT1: .word data_ov002_022d28fc
