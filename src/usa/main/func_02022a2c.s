; func_02022a2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b377c
        .global func_02022a2c
        .arm
func_02022a2c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r6, r3
    ldr r3, [r6]
    mov r9, r0
    mul r0, r3, r9
    mov r7, r2
    mov r8, r1
    ldr r2, [r7]
    sub r4, r8, r9
    mla r0, r2, r4, r0
    ldr r5, [sp, #0x20]
    bl func_020b377c
    str r0, [r5]
    ldr r0, [r6, #0x4]
    ldr r2, [r7, #0x4]
    mul r1, r0, r9
    mla r0, r2, r4, r1
    mov r1, r8
    bl func_020b377c
    str r0, [r5, #0x4]
    ldr r0, [r6, #0x8]
    ldr r2, [r7, #0x8]
    mul r1, r0, r9
    mla r0, r2, r4, r1
    mov r1, r8
    bl func_020b377c
    str r0, [r5, #0x8]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
