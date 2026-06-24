; func_020953e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a6674
        .global func_020953e0
        .arm
func_020953e0:
    stmdb sp!, {r4, lr}
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, #0x0
    ldr r1, [r1]
    cmp r1, #0x0
    beq .L_2c
.L_1c:
    ldr r1, [r1]
    add r4, r4, #0x1
    cmp r1, #0x0
    bne .L_1c
.L_2c:
    bl OS_RestoreIrq
    mov r0, r4
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a6674
