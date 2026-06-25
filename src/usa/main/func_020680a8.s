; func_020680a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e310
        .extern func_02054e18
        .extern func_020552ac
        .extern func_020682f4
        .global func_020680a8
        .arm
func_020680a8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    cmp r3, #0x0
    bne .L_28
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
.L_28:
    bl func_020552ac
    str r4, [r6]
    mov r0, #0x2
    str r5, [r6, #0x4]
    mov r2, #0x0
    ldr r3, [sp, #0x10]
    str r2, [r6, #0x40]
    ldr r1, [sp, #0x14]
    str r3, [r6, #0x44]
    str r1, [r6, #0x48]
    mov r1, r0
    str r2, [r6, #0x28]
    bl func_02054e18
    str r0, [r6, #0x20]
    add r0, r6, #0x14
    bl func_020682f4
    add r0, r6, #0x8
    bl func_020682f4
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219e310
