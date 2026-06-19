; func_ov002_022b9544 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cce28
        .global func_ov002_022b9544
        .arm
func_ov002_022b9544:
    stmdb sp!, {r3, r4, r5, lr}
    add r3, r0, r1, lsl #0x2
    mov ip, #0x0
    ldr r5, [r3, #0xd5c]
    ldr r4, _LIT0
    mov lr, ip
.L_1d4:
    ldrsh r3, [r4, #0x2]
    cmp r3, r5
    bne .L_1f4
    add r0, r0, r1, lsl #0x2
    ldr r0, [r0, #0xd64]
    add r0, r4, r0, lsl #0x2
    ldr ip, [r0, #0xc]
    b .L_204
.L_1f4:
    add lr, lr, #0x1
    cmp lr, #0x12
    add r4, r4, #0x18
    blt .L_1d4
.L_204:
    cmp ip, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r1, #0x0
.L_214:
    mov r0, r1, lsl #0x1
    ldrsh r0, [ip, r0]
    cmp r0, #0x0
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
    cmp r2, r0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    add r1, r1, #0x1
    b .L_214
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cce28
