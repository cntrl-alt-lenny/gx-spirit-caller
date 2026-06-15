; func_02032370 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219b2b4
        .extern func_02032344
        .extern func_020945f4
        .global func_02032370
        .arm
func_02032370:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    movs r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bne .L_38
    mov r0, #0x18
    mov r1, #0x4
    blx r6
    movs r7, r0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r1, #0x0
    mov r2, #0x18
    bl func_020945f4
.L_38:
    bl OS_DisableIrq
    ldr r1, _LIT0
    str r7, [r1]
    bl OS_RestoreIrq
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_02032344
    str r4, [r7, #0x8]
    ldr r2, [r7, #0x10]
    mov r0, r4
    mov r1, #0x20
    blx r2
    str r0, [r7, #0xc]
    ldr r2, [r7, #0x8]
    mov r1, #0x0
    bl func_020945f4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_0219b2b4
