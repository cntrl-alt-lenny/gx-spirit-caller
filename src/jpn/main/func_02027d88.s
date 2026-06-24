; func_02027d88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern func_0202252c
        .extern func_02027e90
        .global func_02027d88
        .arm
func_02027d88:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0xde]
    bic r1, r1, #0x2
    strh r1, [r4, #0xde]
    bl func_02027e90
    ldrsh r0, [r4, #0xcc]
    cmp r0, #0x0
    blt .L_c98
    bl func_0202252c
    mvn r0, #0x0
    strh r0, [r4, #0xcc]
    ldrb r0, [r4, #0xcf]
    bic r0, r0, #0x1
    strb r0, [r4, #0xcf]
.L_c98:
    ldr r0, [r4, #0xd0]
    cmp r0, #0x0
    beq .L_cb0
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r4, #0xd0]
.L_cb0:
    ldrh r1, [r4, #0xde]
    mov r0, #0x1
    bic r1, r1, #0x1
    strh r1, [r4, #0xde]
    ldmia sp!, {r4, pc}
