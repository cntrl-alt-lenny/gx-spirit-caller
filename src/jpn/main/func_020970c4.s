; func_020970c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02091924
        .extern func_02096634
        .extern func_02097958
        .extern func_020979fc
        .global func_020970c4
        .arm
func_020970c4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r0, [r4, #0x1c]
    mov r6, r1
    ands r0, r0, #0x100
    beq .L_4c
    ldr r2, [r4, #0x1c]
    ldr r0, [r4, #0x24]
    bic r2, r2, #0x100
    str r2, [r4, #0x1c]
    bl func_02096634
    mov r0, r4
    bl func_020979fc
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    bl func_02097958
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_4c:
    ldr r5, [r4, #0x24]
    bl OS_DisableIrq
    str r6, [r5, #0x14]
    ldr r1, [r4, #0x1c]
    mov r5, r0
    bic r1, r1, #0x200
    add r0, r4, #0xc
    str r1, [r4, #0x1c]
    bl func_02091924
    mov r0, r5
    bl OS_RestoreIrq
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
