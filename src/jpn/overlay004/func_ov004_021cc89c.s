; func_ov004_021cc89c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b2a0
        .extern data_ov004_02291388
        .extern func_0201cffc
        .extern func_0201d310
        .extern func_0201d330
        .extern func_02020418
        .extern func_020371b8
        .extern func_0208dfb8
        .extern func_02094410
        .global func_ov004_021cc89c
        .arm
func_ov004_021cc89c:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    mov r0, #0x0
    str r0, [r4, #0x9c]
    str r0, [r4, #0xa0]
    bl func_02020418
    cmp r0, #0x0
    beq .L_1f0
    bl func_0201d310
    mov r0, #0x0
    bl func_0201cffc
    b .L_1f4
.L_1f0:
    bl func_0201d330
.L_1f4:
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_23c
    bl func_02020418
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r4, #0x54]
    moveq r0, #0xb
    streq r0, [r4, #0x48]
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_23c:
    ldr r0, [r4, #0x94]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_0208dfb8
    add r1, r0, #0x200
    mov r0, #0x0
    mov r2, #0x280
    bl func_02094410
    mov r0, #0x0
    str r0, [r4, #0x94]
    str r0, [r4, #0x74]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word data_ov004_02291388
