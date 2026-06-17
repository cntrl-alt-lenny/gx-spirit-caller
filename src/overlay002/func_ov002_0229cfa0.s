; func_ov002_0229cfa0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b7cc
        .global func_ov002_0229cfa0
        .arm
func_ov002_0229cfa0:
    stmdb sp!, {r4, lr}
    mov r2, #0x0
    mov r4, r0
    sub r0, r2, #0x20000
    strb r2, [r4]
    tst r1, r0
    bne .L_16c
    mov r0, r1
    bl func_0202b7cc
    mov r1, r0
.L_16c:
    cmp r1, #0x0
    ldmeqia sp!, {r4, pc}
    ldrsb r0, [r1]
    cmp r0, #0x0
    beq .L_1b4
.L_180:
    cmp r0, #0x40
    bne .L_1a0
    ldrsb r0, [r1, #0x1]
    cmp r0, #0x30
    blt .L_1a0
    cmp r0, #0x39
    addle r1, r1, #0x2
    ble .L_1a8
.L_1a0:
    ldrsb r0, [r1], #0x1
    strb r0, [r4], #0x1
.L_1a8:
    ldrsb r0, [r1]
    cmp r0, #0x0
    bne .L_180
.L_1b4:
    mov r0, #0x0
    strb r0, [r4]
    ldmia sp!, {r4, pc}
