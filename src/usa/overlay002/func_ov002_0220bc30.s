; func_ov002_0220bc30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bb82c
        .global func_ov002_0220bc30
        .arm
func_ov002_0220bc30:
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x2]
    mov r2, r2, lsl #0x14
    mov r2, r2, lsr #0x1a
    cmp r2, #0x23
    beq .L_8c
    ldrh ip, [r0]
    ldr r3, _LIT0
    cmp ip, r3
    bgt .L_3c
    bge .L_64
    sub r2, r3, #0x5
    cmp ip, r2
    subeq r1, r3, #0x29
    b .L_70
.L_3c:
    ldr r3, _LIT1
    cmp ip, r3
    bgt .L_70
    sub r2, r3, #0x2
    cmp ip, r2
    blt .L_70
    beq .L_6c
    cmp ip, r3
    subeq r1, r3, #0x91
    b .L_70
.L_64:
    sub r1, r3, #0x29
    b .L_70
.L_6c:
    sub r1, r3, #0xe3
.L_70:
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bb82c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
.L_8c:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00001765
_LIT1: .word 0x0000198a
