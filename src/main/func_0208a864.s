; func_0208a864 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208a7c8
        .extern func_0208b0a4
        .global func_0208a864
        .arm
func_0208a864:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r3, [r4, #0x110]
    mov r2, r1
    mov r1, r3, lsl #0x1e
    movs r1, r1, asr #0x1f
    bne .L_1d0
    bl func_0208a7c8
    ldmia sp!, {r4, pc}
.L_1d0:
    cmp r2, #0x0
    bne .L_1e0
    bl func_0208a7c8
    ldmia sp!, {r4, pc}
.L_1e0:
    add r0, r4, #0xe8
    mov r1, #0x0
    bl func_0208b0a4
    ldr r1, [r4, #0x110]
    mov r0, #0x0
    orr r1, r1, #0x8
    str r1, [r4, #0x110]
    str r0, [r4, #0x150]
    ldmia sp!, {r4, pc}
