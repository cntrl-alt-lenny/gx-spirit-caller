; func_0209e61c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020927e4
        .extern func_0209da94
        .extern func_0209dbb4
        .global func_0209e61c
        .arm
func_0209e61c:
    stmdb sp!, {r4, lr}
    bl func_0209dbb4
    mov r4, r0
    mov r0, #0x2
    mov r1, #0x7
    mov r2, #0x8
    bl func_0209da94
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, lr}
    bxne lr
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    add r0, r0, #0xc
    bl func_020927e4
    ldr r1, [r4, #0x4]
    ldr r0, [r1, #0xc]
    cmp r0, #0x1
    moveq r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    add r0, r1, #0x3c
    mov r1, #0x4
    bl func_020927e4
    ldr r0, [r4, #0x4]
    ldrh r0, [r0, #0x3c]
    add r0, r0, #0x1f
    bic r0, r0, #0x1f
    ldmia sp!, {r4, lr}
    bx lr
