; func_ov002_02299f94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0e4c
        .global func_ov002_02299f94
        .arm
func_ov002_02299f94:
    ldr r0, _LIT0
    ldr r2, [r0, #0x88]
    cmp r2, #0x0
    beq .L_38
    ldr r3, _LIT1
    mov r1, #0x0
    str r2, [r3]
    ldr r2, [r0, #0x8c]
    str r2, [r3, #0x4]
    ldr r2, [r0, #0x90]
    str r2, [r3, #0x8]
    ldr r2, [r0, #0x94]
    str r2, [r3, #0xc]
    str r1, [r0, #0x88]
.L_38:
    ldr r0, _LIT0
    ldr r2, [r0, #0x98]
    cmp r2, #0x0
    beq .L_70
    ldr r3, _LIT2
    mov r1, #0x0
    str r2, [r3]
    ldr r2, [r0, #0x9c]
    str r2, [r3, #0x4]
    ldr r2, [r0, #0xa0]
    str r2, [r3, #0x8]
    ldr r2, [r0, #0xa4]
    str r2, [r3, #0xc]
    str r1, [r0, #0x98]
.L_70:
    ldr r0, _LIT0
    ldr r2, [r0, #0xa8]
    cmp r2, #0x0
    beq .L_a8
    ldr r3, _LIT3
    mov r1, #0x0
    str r2, [r3]
    ldr r2, [r0, #0xac]
    str r2, [r3, #0x4]
    ldr r2, [r0, #0xb0]
    str r2, [r3, #0x8]
    ldr r2, [r0, #0xb4]
    str r2, [r3, #0xc]
    str r1, [r0, #0xa8]
.L_a8:
    ldr r0, _LIT0
    ldr r2, [r0, #0xb8]
    cmp r2, #0x0
    bxeq lr
    ldr r3, _LIT4
    mov r1, #0x0
    str r2, [r3]
    ldr r2, [r0, #0xbc]
    str r2, [r3, #0x4]
    ldr r2, [r0, #0xc0]
    str r2, [r3, #0x8]
    ldr r2, [r0, #0xc4]
    str r2, [r3, #0xc]
    str r1, [r0, #0xb8]
    bx lr
_LIT0: .word data_ov002_022d0e4c
_LIT1: .word 0x04000020
_LIT2: .word 0x04000030
_LIT3: .word 0x04001020
_LIT4: .word 0x04001030
