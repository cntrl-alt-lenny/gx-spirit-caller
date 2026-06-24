; func_020a1e88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c353c
        .global func_020a1e88
        .arm
func_020a1e88:
    ldr r3, _LIT0
    ldr r0, [r3, r0, lsl #0x2]
    cmp r0, #0x0
    beq .L_158
    cmp r0, #0x1
    beq .L_174
    cmp r0, #0x2
    bne .L_1a8
    ldr r0, _LIT1
    cmp r1, r0
    bcc .L_1b0
    ldr r0, _LIT2
    add r1, r1, r2
    cmp r1, r0
    bhi .L_1b0
    mov r0, #0x1
    bx lr
.L_158:
    cmp r1, #0x2000000
    bcc .L_1b0
    add r0, r1, r2
    cmp r0, #0x22c0000
    bhi .L_1b0
    mov r0, #0x1
    bx lr
.L_174:
    cmp r1, #0x22c0000
    bcc .L_18c
    add r0, r1, r2
    cmp r0, #0x2300000
    movls r0, #0x1
    bxls lr
.L_18c:
    cmp r1, #0x2000000
    bcc .L_1b0
    add r0, r1, r2
    cmp r0, #0x2300000
    bhi .L_1b0
    mov r0, #0x1
    bx lr
.L_1a8:
    mov r0, #0x0
    bx lr
.L_1b0:
    mov r0, #0x0
    bx lr
_LIT0: .word data_020c353c
_LIT1: .word 0x027ffe00
_LIT2: .word 0x027fff60
