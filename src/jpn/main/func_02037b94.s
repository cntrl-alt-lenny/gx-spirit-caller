; func_02037b94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02037b08
        .global func_02037b94
        .arm
func_02037b94:
    stmdb sp!, {r3, lr}
    bl func_02037b08
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldrh r1, [r0, #0x68]
    tst r1, #0x1
    beq .L_c8
    tst r1, #0x400
    bne .L_c8
    ldrb r0, [r0, #0x70]
    cmp r0, #0x3
    moveq r0, #0x40
    movne r0, #0x20
    ldmia sp!, {r3, pc}
.L_c8:
    tst r1, #0x2000
    movne r0, #0x4
    ldmneia sp!, {r3, pc}
    tst r1, #0x4000
    movne r0, #0x8
    ldmneia sp!, {r3, pc}
    tst r1, #0x800
    movne r0, #0x1
    ldmneia sp!, {r3, pc}
    mov r0, #0x3
    tst r1, #0x400
    orrne r0, r0, #0x10
    ldmia sp!, {r3, pc}
