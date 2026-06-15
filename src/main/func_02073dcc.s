; func_02073dcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ef1c
        .extern func_02073e54
        .extern func_02073e68
        .global func_02073dcc
        .arm
func_02073dcc:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r5, #0x1
    ldr r1, [r1]
    mov r6, r0
    mov r4, r5
    mov r2, r5
    mov r0, r5
    cmp r1, #0x0
    beq .L_480
    cmp r6, r1
    movne r0, #0x0
.L_480:
    cmp r0, #0x0
    bne .L_494
    ldr r0, _LIT1
    cmp r6, r0
    movne r2, #0x0
.L_494:
    cmp r2, #0x0
    bne .L_4ac
    mov r0, r6
    bl func_02073e68
    cmp r0, #0x0
    moveq r4, #0x0
.L_4ac:
    cmp r4, #0x0
    bne .L_4c4
    mov r0, r6
    bl func_02073e54
    cmp r0, #0x0
    moveq r5, #0x0
.L_4c4:
    mov r0, r5
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_0219ef1c
_LIT1: .word 0x7f000001
