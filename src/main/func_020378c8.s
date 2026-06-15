; func_020378c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02034a84
        .extern func_02038d70
        .extern func_02038dac
        .extern func_0203ab9c
        .global func_020378c8
        .arm
func_020378c8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    cmp r0, #0x0
    bge .L_550
    mov r5, #0x0
    mov r4, r5
.L_514:
    mov r0, r5
    bl func_02038d70
    movs r5, r0
    beq .L_548
    cmp r6, #0x0
    bne .L_538
    ldrb r0, [r5, #0x5a]
    cmp r0, #0x0
    bne .L_514
.L_538:
    mov r0, r5
    str r4, [r5, #0x8]
    bl func_0203ab9c
    b .L_514
.L_548:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_550:
    bl func_02034a84
    bl func_02038dac
    cmp r0, #0x0
    ldrne r1, [r0, #0x8]
    cmpne r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r6, #0x0
    bne .L_580
    ldrb r1, [r0, #0x5a]
    cmp r1, #0x0
    bne .L_594
.L_580:
    mov r1, #0x0
    str r1, [r0, #0x8]
    bl func_0203ab9c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_594:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
