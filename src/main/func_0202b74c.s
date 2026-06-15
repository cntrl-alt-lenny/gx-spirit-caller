; func_0202b74c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_020b4768
        .extern data_020c6a88
        .extern func_02006c0c
        .extern func_0202b0e0
        .global func_0202b74c
        .arm
func_0202b74c:
    stmdb sp!, {r4, r5, r6, lr}
    movs r6, r0
    mvn r4, #0x0
    moveq r0, r4
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldr r1, _LIT1
    mov r5, r0
    ldr r2, [r1]
    mov r0, #0x1
    cmp r2, #0x1
    ble .L_c8
.L_a4:
    ldr r1, [r5, r0, lsl #0x2]
    cmp r6, r1
    bne .L_bc
    bl func_0202b0e0
    mov r4, r0
    b .L_c8
.L_bc:
    add r0, r0, #0x1
    cmp r0, r2
    blt .L_a4
.L_c8:
    cmp r5, #0x0
    beq .L_d8
    mov r0, r5
    bl Task_InvokeLocked
.L_d8:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020c6a88
_LIT1: .word data_020b4768
