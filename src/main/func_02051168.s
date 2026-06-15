; func_02051168 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498f0
        .extern func_020673dc
        .extern func_02067608
        .global func_02051168
        .arm
func_02051168:
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    bl func_02067608
    ldr r0, [r4, #0xb4]
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    beq .L_1068
    cmp r0, #0x1
    beq .L_1068
    cmp r0, #0x2
    beq .L_10bc
    ldmia sp!, {r4, pc}
.L_1068:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0xb
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r4, pc}
    ldmia sp!, {r4, pc}
    b .L_10ac
    b .L_10ac
    b .L_10ac
    b .L_10ac
    ldmia sp!, {r4, pc}
    b .L_10ac
    ldmia sp!, {r4, pc}
    ldmia sp!, {r4, pc}
    ldmia sp!, {r4, pc}
    ldmia sp!, {r4, pc}
    b .L_10ac
.L_10ac:
    bl func_020498f0
    ldr r0, [r0, #0x10]
    bl func_020673dc
    ldmia sp!, {r4, pc}
.L_10bc:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0xb
    ldmneia sp!, {r4, pc}
    bl func_020498f0
    ldr r0, [r0, #0x10]
    bl func_020673dc
    ldmia sp!, {r4, pc}
