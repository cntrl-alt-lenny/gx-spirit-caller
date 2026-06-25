; func_ov002_0229ce00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b778
        .extern func_ov002_0229cca8
        .extern func_ov002_0229ccd8
        .global func_ov002_0229ce00
        .arm
func_ov002_0229ce00:
    stmdb sp!, {r4, r5, r6, lr}
    mov r3, #0x0
    mov r6, r0
    mov r5, r1
    sub r0, r3, #0x20000
    mov r4, r2
    strb r3, [r6]
    tst r5, r0
    bne .L_e4
    mov r0, r5
    bl func_0202b778
    mov r5, r0
.L_e4:
    ldrsb r0, [r5]
    cmp r0, #0x0
    beq .L_138
.L_f0:
    cmp r0, #0x25
    ldreqsb r0, [r5, #0x1]
    cmpeq r0, #0x64
    bne .L_124
    mov r2, #0x0
    mov r0, r6
    mov r1, r4
    strb r2, [r6]
    bl func_ov002_0229ccd8
    mov r0, r6
    add r1, r5, #0x2
    bl func_ov002_0229cca8
    ldmia sp!, {r4, r5, r6, pc}
.L_124:
    ldrsb r0, [r5]
    strb r0, [r6], #0x1
    ldrsb r0, [r5, #0x1]!
    cmp r0, #0x0
    bne .L_f0
.L_138:
    mov r0, #0x0
    strb r0, [r6]
    ldmia sp!, {r4, r5, r6, pc}
