; func_020338a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02046a74
        .global func_020338a8
        .arm
func_020338a8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, #0x1
    bl OS_DisableIrq
    ldr r1, [r4, #0xeac]
    mov r4, r0
    tst r1, #0x2000
    movne r0, r5
    moveq r0, #0x0
    cmp r0, #0x0
    moveq r5, #0x0
    beq .L_3c
    bl func_02046a74
    cmp r0, #0x1
    movle r5, #0x0
.L_3c:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
