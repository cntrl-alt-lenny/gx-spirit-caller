; func_0206c4b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02070ce0
        .extern func_02070e54
        .extern func_02070f78
        .extern func_02092748
        .extern func_020927b8
        .global func_0206c4b0
        .arm
func_0206c4b0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r4, [r6, #0x4]
    ldr r5, [r4, #0x64]
    add r0, r5, #0xe0
    bl func_020927b8
    mov r1, #0x0
    ldrh r0, [r6, #0x10]
    mov r2, r1
    bl func_02070f78
    bl func_02070e54
    mov r2, #0x0
    add r0, sp, #0x0
    add r1, sp, #0x4
    str r2, [r5, #0xf8]
    bl func_02070ce0
    ldrh r2, [sp]
    ldr r1, [r6, #0x14]
    strh r2, [r1]
    ldr r1, [r6, #0x18]
    str r0, [r1]
    ldrsh r1, [r4, #0x70]
    add r0, r5, #0xe0
    orr r1, r1, #0x4
    strh r1, [r4, #0x70]
    bl func_02092748
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
