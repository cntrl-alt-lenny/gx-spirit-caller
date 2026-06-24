; func_0200b0ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .global func_0200b0ac
        .arm
func_0200b0ac:
    stmdb sp!, {r4, r5, r6, lr}
    movs r6, r0
    beq .L_54
    ldr r5, [r6]
    mov r4, #0x0
    cmp r5, #0x0
    ble .L_3c
.L_1c:
    ldr r0, [r6, #0x4]
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x0
    beq .L_30
    bl Task_InvokeLocked
.L_30:
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_1c
.L_3c:
    ldr r0, [r6, #0x4]
    bl Task_InvokeLocked
    mov r0, r6
    bl Task_InvokeLocked
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_54:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
