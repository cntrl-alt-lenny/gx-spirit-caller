; func_02067b94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02068120
        .extern func_02068378
        .global func_02067b94
        .arm
func_02067b94:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    add r4, r5, #0x14
    b .L_88
.L_74:
    mov r0, r4
    bl func_02068378
    mov r1, r0
    mov r0, r5
    bl func_02068120
.L_88:
    ldr r1, [r5, #0x10]
    ldr r0, [r5, #0x4]
    cmp r1, r0
    addge sp, sp, #0x4
    ldmgeia sp!, {r4, r5, pc}
    ldr r0, [r5, #0x1c]
    cmp r0, #0x0
    bgt .L_74
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
