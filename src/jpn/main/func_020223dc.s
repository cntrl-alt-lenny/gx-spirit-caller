; func_020223dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202246c
        .global func_020223dc
        .arm
func_020223dc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    mov r1, #0x1
    mov r4, r3
    bl func_0202246c
    tst r5, #0x1
    beq .L_1b8
    cmp r0, r4
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
.L_1b8:
    tst r5, #0x2
    cmpne r0, r4
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    tst r5, #0x4
    beq .L_1dc
    cmp r0, r4
    movgt r0, #0x1
    ldmgtia sp!, {r3, r4, r5, pc}
.L_1dc:
    tst r5, #0x8
    beq .L_1f0
    cmp r0, r4
    movlt r0, #0x1
    ldmltia sp!, {r3, r4, r5, pc}
.L_1f0:
    tst r5, #0x10
    beq .L_204
    tst r0, r4
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
.L_204:
    tst r5, #0x20
    beq .L_218
    tst r0, r4
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
.L_218:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
