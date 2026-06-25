; func_02037878 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02034a34
        .extern func_02038d20
        .extern func_02038d5c
        .extern func_0203ab4c
        .global func_02037878
        .arm
func_02037878:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    cmp r0, #0x0
    bge .L_508
    mov r5, #0x0
    mov r4, r5
.L_4cc:
    mov r0, r5
    bl func_02038d20
    movs r5, r0
    beq .L_500
    cmp r6, #0x0
    bne .L_4f0
    ldrb r0, [r5, #0x5a]
    cmp r0, #0x0
    bne .L_4cc
.L_4f0:
    mov r0, r5
    str r4, [r5, #0x8]
    bl func_0203ab4c
    b .L_4cc
.L_500:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_508:
    bl func_02034a34
    bl func_02038d5c
    cmp r0, #0x0
    ldrne r1, [r0, #0x8]
    cmpne r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r6, #0x0
    bne .L_538
    ldrb r1, [r0, #0x5a]
    cmp r1, #0x0
    bne .L_54c
.L_538:
    mov r1, #0x0
    str r1, [r0, #0x8]
    bl func_0203ab4c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_54c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
