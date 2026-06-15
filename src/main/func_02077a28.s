; func_02077a28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020aaf40
        .global func_02077a28
        .arm
func_02077a28:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r4, [r0, #0x818]
    mov r7, r1
    cmp r4, #0x0
    mov r6, #0x0
    ble .L_9e4
    ldr r5, [r0, #0x814]
.L_9b4:
    ldr r0, [r5, r6, lsl #0x2]
    mov r1, r7
    ldr r0, [r0]
    bl func_020aaf40
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldreq r0, [r5, r6, lsl #0x2]
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    add r6, r6, #0x1
    cmp r6, r4
    blt .L_9b4
.L_9e4:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
