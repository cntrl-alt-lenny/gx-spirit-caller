; func_0200afc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .global func_0200afc8
        .arm
func_0200afc8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r8, r0
    beq .L_140
    ldr r6, [r8]
    mov r7, #0x0
    cmp r6, #0x0
    ble .L_128
    mov r4, r7
.L_c4:
    mov r5, r4
.L_c8:
    ldr r0, [r8, #0x4]
    ldr r0, [r0, r7, lsl #0x2]
    ldr r0, [r0, #0x8]
    ldr r0, [r0, r5, lsl #0x2]
    cmp r0, #0x0
    beq .L_e4
    bl Task_InvokeLocked
.L_e4:
    add r5, r5, #0x1
    cmp r5, #0x5
    blt .L_c8
    ldr r0, [r8, #0x4]
    ldr r0, [r0, r7, lsl #0x2]
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_108
    bl Task_InvokeLocked
.L_108:
    ldr r0, [r8, #0x4]
    ldr r0, [r0, r7, lsl #0x2]
    cmp r0, #0x0
    beq .L_11c
    bl Task_InvokeLocked
.L_11c:
    add r7, r7, #0x1
    cmp r7, r6
    blt .L_c4
.L_128:
    ldr r0, [r8, #0x4]
    bl Task_InvokeLocked
    mov r0, r8
    bl Task_InvokeLocked
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_140:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
