; func_02049e84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498dc
        .extern func_020498f0
        .extern func_0204a9b0
        .extern func_0204ed50
        .global func_02049e84
        .arm
func_02049e84:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x1
    bne .L_138
    mov r0, #0x6
    bl func_020498dc
    b .L_158
.L_138:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x6
    beq .L_158
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0xb
    ldmneia sp!, {r4, pc}
.L_158:
    bl func_020498f0
    ldr r0, [r0, #0x180]
    cmp r4, r0
    bne .L_17c
    bl func_020498f0
    ldrb r1, [r0, #0x17c]
    add r1, r1, #0x1
    strb r1, [r0, #0x17c]
    b .L_190
.L_17c:
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x17c]
    bl func_020498f0
    str r4, [r0, #0x180]
.L_190:
    bl func_020498f0
    mov r2, #0x0
    str r2, [r0, #0x184]
    str r2, [r0, #0x188]
    mov r1, r4
    mov r0, #0x1
    bl func_0204ed50
    bl func_0204a9b0
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    bl func_020498f0
    mov r1, #0xff
    strb r1, [r0, #0x3cc]
    ldmia sp!, {r4, pc}
