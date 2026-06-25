; func_02077940 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020aae4c
        .global func_02077940
        .arm
func_02077940:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r4, [r0, #0x818]
    mov r7, r1
    cmp r4, #0x0
    mov r6, #0x0
    ble .L_50
    ldr r5, [r0, #0x814]
.L_20:
    ldr r0, [r5, r6, lsl #0x2]
    mov r1, r7
    ldr r0, [r0]
    bl func_020aae4c
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldreq r0, [r5, r6, lsl #0x2]
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    add r6, r6, #0x1
    cmp r6, r4
    blt .L_20
.L_50:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
