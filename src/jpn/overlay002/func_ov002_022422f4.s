; func_ov002_022422f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bc47c
        .global func_ov002_022422f4
        .arm
func_ov002_022422f4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r2
    mov r6, r0
    cmp r4, #0x4
    mov r5, r1
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021bc47c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x6]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x18
    beq .L_2ec
    sub r0, r0, #0x1
    add r0, r6, r0, lsl #0x1
    and r2, r5, #0xff
    and r1, r4, #0xff
    orr r2, r2, r1, lsl #0x8
    ldrh r1, [r0, #0x8]
    mov r0, r2, lsl #0x10
    cmp r1, r0, lsr #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
.L_2ec:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
