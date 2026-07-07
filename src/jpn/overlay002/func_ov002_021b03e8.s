; func_ov002_021b03e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022cd664
        .extern data_ov002_022cf0b8
        .extern data_ov002_022d008c
        .extern func_ov002_021b02a8
        .global func_ov002_021b03e8
        .arm
func_ov002_021b03e8:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r1, [r0, #0xd0c]
    cmp r1, #0x0
    beq .L_16c
    ldr r1, [r0, #0xcec]
    ldr r0, _LIT1
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x2
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_16c:
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    bl func_ov002_021b02a8
    ldr r1, _LIT2
    mov r4, r0
    ldr r0, [r1, #0x4]
    eor r0, r0, #0x1
    bl func_ov002_021b02a8
    cmp r4, #0x0
    cmpeq r0, #0x0
    ldreq r1, _LIT0
    ldreq r1, [r1, #0xe0]
    cmpeq r1, #0x0
    beq .L_22c
    ldr r2, _LIT2
    ldr r1, _LIT3
    ldr r2, [r2, #0x4]
    ldr r3, _LIT4
    and ip, r2, #0x1
    eor r2, r2, #0x1
    mul lr, ip, r1
    and r2, r2, #0x1
    mul r1, r2, r1
    str r4, [r3, lr]
    str r0, [r3, r1]
    cmp r4, #0x0
    beq .L_1f0
    cmp r0, #0x0
    bne .L_1f0
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0xd00]
    b .L_21c
.L_1f0:
    cmp r4, #0x0
    bne .L_210
    cmp r0, #0x0
    beq .L_210
    ldr r0, _LIT0
    mov r1, #0x2
    str r1, [r0, #0xd00]
    b .L_21c
.L_210:
    ldr r0, _LIT0
    mov r1, #0x3
    str r1, [r0, #0xd00]
.L_21c:
    ldr r1, _LIT0
    mov r0, #0x1
    str r0, [r1, #0xe0]
    ldmia sp!, {r4, pc}
.L_22c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022cd65c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf0b8
