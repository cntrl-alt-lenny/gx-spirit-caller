; func_020a3de4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a3de4
        .arm
func_020a3de4:
    ldr r3, _LIT0
    cmp r0, r3
    bhi .L_3cc
    cmp r0, #0xe4
    bcs .L_3d4
.L_3cc:
    mov r0, #0x0
    bx lr
.L_3d4:
    cmp r1, #0x10
    bhi .L_3e4
    cmp r1, #0x8
    bcs .L_3ec
.L_3e4:
    mov r0, #0x0
    bx lr
.L_3ec:
    add r1, r1, #0x20
    mov r3, r1, lsl #0x2
    ldr r1, _LIT1
    add r0, r0, #0x26
    add r1, r1, r0, lsl #0x2
    add r0, r3, #0x70
    mla r1, r2, r0, r1
    ldr r0, _LIT2
    cmp r1, r0
    movlt r0, #0x1
    movge r0, #0x0
    bx lr
_LIT0: .word 0x000001fe
_LIT1: .word 0x0000014a
_LIT2: .word 0x000015e0
