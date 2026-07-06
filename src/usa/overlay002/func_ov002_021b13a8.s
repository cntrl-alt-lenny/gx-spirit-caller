; func_ov002_021b13a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdb88
        .global func_ov002_021b13a8
        .arm
func_ov002_021b13a8:
    cmp r0, #0x1f
    addls pc, pc, r0, lsl #0x2
    bx lr
    bx lr
    bx lr
    b .L_8c
    b .L_8c
    bx lr
    bx lr
    bx lr
    b .L_8c
    b .L_8c
    bx lr
    bx lr
    bx lr
    b .L_8c
    b .L_8c
    b .L_8c
    b .L_8c
    b .L_8c
    b .L_8c
    bx lr
    bx lr
    bx lr
    b .L_8c
    bx lr
    b .L_8c
    b .L_8c
    b .L_8c
    b .L_8c
    b .L_8c
    b .L_8c
    b .L_8c
    b .L_8c
    b .L_8c
.L_8c:
    cmp r1, #0x0
    beq .L_bc
    ldr r2, _LIT0
    ldr r1, [r2]
    mov r0, r1, lsl #0xd
    mov r0, r0, asr #0x1c
    add r0, r0, #0x1
    bic r1, r1, #0x78000
    mov r0, r0, lsl #0x1c
    orr r0, r1, r0, lsr #0xd
    str r0, [r2]
    bx lr
.L_bc:
    ldr r2, _LIT0
    ldr r1, [r2]
    mov r0, r1, lsl #0xd
    mov r0, r0, asr #0x1c
    sub r0, r0, #0x1
    bic r1, r1, #0x78000
    mov r0, r0, lsl #0x1c
    orr r0, r1, r0, lsr #0xd
    str r0, [r2]
    bx lr
_LIT0: .word data_ov002_022cdb88
