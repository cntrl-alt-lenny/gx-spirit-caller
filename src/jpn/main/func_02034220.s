; func_02034220 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02034134
        .global func_02034220
        .arm
func_02034220:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, r1
    bl func_02034134
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    cmp r5, #0x0
    mov r1, r4, asr #0x4
    beq .L_50
    add r1, r4, r1, lsr #0x1b
    mov r3, r4, lsr #0x1f
    mov ip, r1, asr #0x5
    add lr, r0, #0x440
    rsb r2, r3, r4, lsl #0x1b
    ldr r4, [lr, ip, lsl #0x2]
    add r0, r3, r2, ror #0x1b
    mov r1, #0x1
    orr r0, r4, r1, lsl r0
    str r0, [lr, ip, lsl #0x2]
    ldmia sp!, {r3, r4, r5, pc}
.L_50:
    mov r3, r4, lsr #0x1f
    add r1, r4, r1, lsr #0x1b
    rsb r2, r3, r4, lsl #0x1b
    add ip, r0, #0x440
    mov r4, r1, asr #0x5
    add r0, r3, r2, ror #0x1b
    mov r1, #0x1
    mvn r0, r1, lsl r0
    ldr r1, [ip, r4, lsl #0x2]
    and r0, r1, r0
    str r0, [ip, r4, lsl #0x2]
    ldmia sp!, {r3, r4, r5, pc}
