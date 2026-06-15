; func_02052f04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020534b4
        .extern func_020534d4
        .extern func_02053688
        .extern func_02053704
        .extern func_0205370c
        .global func_02052f04
        .arm
func_02052f04:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r1
    mov r6, r0
    mov r0, r4
    bl func_02053688
    cmp r0, #0x1
    beq .L_ac
    cmp r0, #0x2
    beq .L_68
    cmp r0, #0x3
    beq .L_a0
    b .L_b4
.L_68:
    mov r0, r4
    bl func_0205370c
    ldr r2, [r6, #0x24]
    mov r4, r0
    mov r5, r1
    bl func_020534d4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r2, [r6, #0x24]
    mov r0, r4
    mov r1, r5
    bl func_020534b4
    ldmia sp!, {r4, r5, r6, pc}
.L_a0:
    mov r0, r4
    bl func_02053704
    ldmia sp!, {r4, r5, r6, pc}
.L_ac:
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_b4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
