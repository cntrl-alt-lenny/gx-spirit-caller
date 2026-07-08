; func_ov002_022bae34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d1330
        .extern data_ov002_022d281c
        .extern func_020371b8
        .extern func_ov002_022a61e8
        .extern func_ov002_022bda78
        .global func_ov002_022bae34
        .arm
func_ov002_022bae34:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, [r4, #0xc60]
    cmp r0, #0x0
    beq .L_1a2c
    cmp r0, #0x1
    beq .L_1aa4
    cmp r0, #0x2
    beq .L_1af8
    b .L_1b10
.L_1a2c:
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
    bl func_ov002_022a61e8
    mov r1, #0x0
    str r1, [sp]
    ldrh r1, [r0, #0xa]
    ldr r0, _LIT1
    add r3, r4, #0xc80
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x1f
    mov r1, #0x1c
    bl func_ov002_022bda78
    mov r0, #0x92
    sub r1, r0, #0x93
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x1
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_1b10
.L_1aa4:
    ldr r2, _LIT1
    mov r1, #0x0
.L_1aac:
    ldr r0, [r2]
    cmp r0, #0x0
    beq .L_1ac8
    ldr r0, [r2, #0x4]
    cmp r0, #0x1c
    moveq r0, #0x1
    beq .L_1adc
.L_1ac8:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r2, r2, #0x8
    blt .L_1aac
    mov r0, #0x0
.L_1adc:
    cmp r0, #0x0
    bne .L_1b10
    mov r0, #0x2
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_1b10
.L_1af8:
    mov r0, #0xc
    str r0, [r4, #0xcc8]
    mov r0, #0x0
    add sp, sp, #0x8
    str r0, [r4, #0xc54]
    ldmia sp!, {r4, pc}
.L_1b10:
    ldr r1, [r4, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4, #0xc64]
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d1330
_LIT1: .word data_ov002_022d281c
