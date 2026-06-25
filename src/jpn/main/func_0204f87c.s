; func_0204f87c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dbb4
        .extern func_0204987c
        .extern func_02094500
        .global func_0204f87c
        .arm
func_0204f87c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    bl func_0204987c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT0
    mov r1, #0x0
    mov r2, #0x20
    bl func_02094500
    mov r6, #0x0
    bl func_0204987c
    ldrb r0, [r0, #0xe]
    cmp r0, #0x0
    blt .L_15c
    ldr r5, _LIT0
    mov r4, #0x1
.L_114:
    bl func_0204987c
    mov r8, r0
    bl func_0204987c
    add r0, r0, r6
    ldrb r0, [r0, #0x2c8]
    ldr r1, [r8, #0x2e8]
    mov r0, r4, lsl r0
    ands r0, r1, r0
    beq .L_15c
    bl func_0204987c
    add r0, r0, r6
    ldrb r0, [r0, #0x2c8]
    add r6, r6, #0x1
    strb r0, [r5], #0x1
    bl func_0204987c
    ldrb r0, [r0, #0xe]
    cmp r6, r0
    ble .L_114
.L_15c:
    ldr r0, _LIT0
    str r0, [r7]
    bl func_0204987c
    ldrb r0, [r0, #0xe]
    add r0, r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0219dbb4
