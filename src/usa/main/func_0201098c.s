; func_0201098c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0200fbb8
        .extern func_0200fd68
        .extern func_02010024
        .global func_0201098c
        .arm
func_0201098c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r6, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r5, [r6, #0x18]
    cmp r5, #0x0
    beq .L_61c
    ldr r0, [r6, #0x24]
    mov r4, #0x0
    cmp r0, #0x0
    ble .L_61c
    mov r7, r4
    mov r8, #0x1
.L_5d4:
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    beq .L_608
    ldr r0, [r6, #0x26c]
    tst r0, r8, lsl r4
    bne .L_608
    mov r0, r5
    bl func_0200fbb8
    movs r1, r0
    beq .L_608
    mov r0, r5
    mov r2, r7
    bl func_02010024
.L_608:
    ldr r0, [r6, #0x24]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x20
    blt .L_5d4
.L_61c:
    ldr r4, [r6, #0x1c]
    cmp r4, #0x0
    beq .L_688
    ldr r0, [r6, #0x28]
    mov r5, #0x0
    cmp r0, #0x0
    ble .L_688
    mov r7, #0x1
    mov r8, r7
.L_640:
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_674
    ldr r0, [r6, #0x270]
    tst r0, r8, lsl r5
    bne .L_674
    mov r0, r4
    bl func_0200fd68
    movs r1, r0
    beq .L_674
    mov r0, r4
    mov r2, r7
    bl func_02010024
.L_674:
    ldr r0, [r6, #0x28]
    add r5, r5, #0x1
    cmp r5, r0
    add r4, r4, #0xc
    blt .L_640
.L_688:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
