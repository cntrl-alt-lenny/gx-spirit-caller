; func_ov002_0229ce5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b7cc
        .extern func_ov002_0229cdb8
        .global func_ov002_0229ce5c
        .arm
func_ov002_0229ce5c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r3, #0x0
    mov r6, r0
    mov r5, r1
    sub r0, r3, #0x20000
    mov r4, r2
    strb r3, [r6]
    tst r5, r0
    bne .L_30
    mov r0, r5
    bl func_0202b7cc
    mov r5, r0
.L_30:
    mov r0, #0x20000
    rsb r0, r0, #0x0
    tst r4, r0
    bne .L_4c
    mov r0, r4
    bl func_0202b7cc
    mov r4, r0
.L_4c:
    cmp r5, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrsb r0, [r5]
    cmp r0, #0x0
    beq .L_a8
.L_60:
    cmp r0, #0x25
    ldreqsb r0, [r5, #0x1]
    cmpeq r0, #0x73
    bne .L_94
    mov r2, #0x0
    mov r0, r6
    mov r1, r4
    strb r2, [r6]
    bl func_ov002_0229cdb8
    mov r0, r6
    add r1, r5, #0x2
    bl func_ov002_0229cdb8
    ldmia sp!, {r4, r5, r6, pc}
.L_94:
    ldrsb r0, [r5]
    strb r0, [r6], #0x1
    ldrsb r0, [r5, #0x1]!
    cmp r0, #0x0
    bne .L_60
.L_a8:
    mov r0, #0x0
    strb r0, [r6]
    ldmia sp!, {r4, r5, r6, pc}
