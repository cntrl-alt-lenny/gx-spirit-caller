; func_0204f8f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc94
        .extern func_020498f0
        .extern func_020945f4
        .global func_0204f8f0
        .arm
func_0204f8f0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    bl func_020498f0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT0
    mov r1, #0x0
    mov r2, #0x20
    bl func_020945f4
    mov r6, #0x0
    bl func_020498f0
    ldrb r0, [r0, #0xe]
    cmp r0, #0x0
    blt .L_1e4
    ldr r5, _LIT0
    mov r4, #0x1
.L_19c:
    bl func_020498f0
    mov r8, r0
    bl func_020498f0
    add r0, r0, r6
    ldrb r0, [r0, #0x2d0]
    ldr r1, [r8, #0x2f0]
    mov r0, r4, lsl r0
    ands r0, r1, r0
    beq .L_1e4
    bl func_020498f0
    add r0, r0, r6
    ldrb r0, [r0, #0x2d0]
    add r6, r6, #0x1
    strb r0, [r5], #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xe]
    cmp r6, r0
    ble .L_19c
.L_1e4:
    ldr r0, _LIT0
    str r0, [r7]
    bl func_020498f0
    ldrb r0, [r0, #0xe]
    add r0, r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0219dc94
