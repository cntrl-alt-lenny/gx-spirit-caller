; func_0208a4fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02087e4c
        .extern func_02087ee0
        .extern func_02087ef8
        .extern func_020890b0
        .extern func_02089308
        .global func_0208a4fc
        .arm
func_0208a4fc:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    bl func_02089308
    mov r5, #0x0
    mov r7, r5
.L_14:
    mov r0, r5
    bl func_020890b0
    movs r4, r0
    beq .L_8c
    ldrb r1, [r4]
    mov r0, r5
    bl func_02087ef8
    ldrh r1, [r4, #0x2]
    mov r0, r5
    bl func_02087ee0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_8c
    cmp r6, #0x0
    beq .L_8c
    ldrb r0, [r4]
    mov r8, r7
    cmp r0, #0x0
    ble .L_8c
.L_60:
    ldr r2, [r4, #0x4]
    mov r0, r5
    mov r1, r6
    bl func_02087e4c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrb r0, [r4]
    add r8, r8, #0x1
    cmp r8, r0
    blt .L_60
.L_8c:
    add r5, r5, #0x1
    cmp r5, #0x20
    blt .L_14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
