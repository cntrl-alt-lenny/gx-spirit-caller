; func_02059ca8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100660
        .extern func_020a9828
        .global func_02059ca8
        .arm
func_02059ca8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r8, r1
    mov r9, r0
    cmp r8, #0x0
    mov r7, #0x0
    ble .L_1cd4
    ldr r6, _LIT0
    ldr r5, _LIT1
    ldr r4, _LIT2
.L_1ca4:
    bl func_020a9828
    umull r1, r2, r0, r5
    sub r1, r0, r2
    add r2, r2, r1, lsr #0x1
    mov r2, r2, lsr #0x5
    umull r1, r2, r4, r2
    sub r2, r0, r1
    ldrsb r0, [r6, r2]
    strb r0, [r9, r7]
    add r7, r7, #0x1
    cmp r7, r8
    blt .L_1ca4
.L_1cd4:
    mov r0, #0x0
    strb r0, [r9, r7]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_02100660
_LIT1: .word 0x08421085
_LIT2: .word 0x0000003e
