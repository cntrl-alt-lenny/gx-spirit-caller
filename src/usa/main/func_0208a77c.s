; func_0208a77c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208a6e0
        .extern func_0208afbc
        .global func_0208a77c
        .arm
func_0208a77c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r3, [r4, #0x110]
    mov r2, r1
    mov r1, r3, lsl #0x1e
    movs r1, r1, asr #0x1f
    bne .L_124
    bl func_0208a6e0
    ldmia sp!, {r4, pc}
.L_124:
    cmp r2, #0x0
    bne .L_134
    bl func_0208a6e0
    ldmia sp!, {r4, pc}
.L_134:
    add r0, r4, #0xe8
    mov r1, #0x0
    bl func_0208afbc
    ldr r1, [r4, #0x110]
    mov r0, #0x0
    orr r1, r1, #0x8
    str r1, [r4, #0x110]
    str r0, [r4, #0x150]
    ldmia sp!, {r4, pc}
