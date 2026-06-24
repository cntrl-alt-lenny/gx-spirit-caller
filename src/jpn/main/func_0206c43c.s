; func_0206c43c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02070bf8
        .extern func_02070d6c
        .extern func_02070e90
        .extern func_02092660
        .extern func_020926d0
        .global func_0206c43c
        .arm
func_0206c43c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r4, [r6, #0x4]
    ldr r5, [r4, #0x64]
    add r0, r5, #0xe0
    bl func_020926d0
    mov r1, #0x0
    ldrh r0, [r6, #0x10]
    mov r2, r1
    bl func_02070e90
    bl func_02070d6c
    mov r2, #0x0
    add r0, sp, #0x0
    add r1, sp, #0x4
    str r2, [r5, #0xf8]
    bl func_02070bf8
    ldrh r2, [sp]
    ldr r1, [r6, #0x14]
    strh r2, [r1]
    ldr r1, [r6, #0x18]
    str r0, [r1]
    ldrsh r1, [r4, #0x70]
    add r0, r5, #0xe0
    orr r1, r1, #0x4
    strh r1, [r4, #0x70]
    bl func_02092660
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
