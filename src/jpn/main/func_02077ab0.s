; func_02077ab0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a063c
        .extern func_020a734c
        .global func_02077ab0
        .arm
func_02077ab0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r4, r0
    bl OS_DisableIrq
    ldr r6, _LIT0
    mov r7, r0
    mov r8, #0x0
    add r5, r4, #0x74
    mov r4, #0x20
.L_20:
    ldrb r0, [r6, #0x5a]
    cmp r0, #0x0
    beq .L_4c
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_020a734c
    cmp r0, #0x0
    moveq r0, #0x0
    streqb r0, [r6, #0x5a]
    beq .L_5c
.L_4c:
    add r8, r8, #0x1
    cmp r8, #0x4
    add r6, r6, #0x5c
    blt .L_20
.L_5c:
    mov r0, r7
    bl OS_RestoreIrq
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_021a063c
