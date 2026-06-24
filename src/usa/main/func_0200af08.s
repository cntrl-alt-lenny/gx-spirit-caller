; func_0200af08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .global func_0200af08
        .arm
func_0200af08:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r8, r0
    beq .L_9c
    ldr r6, [r8]
    mov r7, #0x0
    cmp r6, #0x0
    ble .L_84
    mov r4, r7
.L_20:
    mov r5, r4
.L_24:
    ldr r0, [r8, #0x4]
    ldr r0, [r0, r7, lsl #0x2]
    ldr r0, [r0, #0xc]
    ldr r0, [r0, r5, lsl #0x2]
    cmp r0, #0x0
    beq .L_40
    bl Task_InvokeLocked
.L_40:
    add r5, r5, #0x1
    cmp r5, #0xd
    blt .L_24
    ldr r0, [r8, #0x4]
    ldr r0, [r0, r7, lsl #0x2]
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    beq .L_64
    bl Task_InvokeLocked
.L_64:
    ldr r0, [r8, #0x4]
    ldr r0, [r0, r7, lsl #0x2]
    cmp r0, #0x0
    beq .L_78
    bl Task_InvokeLocked
.L_78:
    add r7, r7, #0x1
    cmp r7, r6
    blt .L_20
.L_84:
    ldr r0, [r8, #0x4]
    bl Task_InvokeLocked
    mov r0, r8
    bl Task_InvokeLocked
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_9c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
