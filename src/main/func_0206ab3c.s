; func_0206ab3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206b47c
        .global func_0206ab3c
        .arm
func_0206ab3c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r0, [r5, #0x480]
    mov r4, #0x0
    cmp r0, #0x0
    ble .L_1f4
.L_1d4:
    add r0, r5, r4, lsl #0x2
    ldr r1, [r0, #0x84]
    mov r0, r5
    bl func_0206b47c
    ldr r0, [r5, #0x480]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_1d4
.L_1f4:
    mov r0, #0x0
    str r0, [r5, #0x480]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
