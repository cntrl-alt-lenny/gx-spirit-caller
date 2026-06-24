; func_020323a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219b1d4
        .global func_020323a0
        .arm
func_020323a0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl OS_DisableIrq
    mov r4, r0
    cmp r6, #0x0
    beq .L_b8
    ldr r0, [r6, #0xc]
    ldr r5, [r6, #0x14]
    cmp r0, #0x0
    beq .L_b0
    blx r5
.L_b0:
    mov r0, r6
    blx r5
.L_b8:
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r2, #0x0
    str r2, [r1]
    bl OS_RestoreIrq
    mov r0, r4
    bl OS_RestoreIrq
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219b1d4
