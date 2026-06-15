; func_0206aacc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020540d0
        .extern func_02054140
        .extern func_02054148
        .extern func_0206b47c
        .global func_0206aacc
        .arm
func_0206aacc:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    mov r4, #0x0
    bl func_02054140
    cmp r0, #0x0
    ble .L_1a0
.L_174:
    ldr r0, [r5, #0x8]
    mov r1, r4
    bl func_020540d0
    ldr r1, [r0]
    mov r0, r5
    bl func_0206b47c
    ldr r0, [r5, #0x8]
    add r4, r4, #0x1
    bl func_02054140
    cmp r4, r0
    blt .L_174
.L_1a0:
    ldr r0, [r5, #0x8]
    bl func_02054148
    mov r0, #0x0
    str r0, [r5, #0x8]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
