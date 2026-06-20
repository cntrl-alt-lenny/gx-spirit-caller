; func_ov002_0228130c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202b878
        .extern func_0202b8c0
        .extern func_ov002_02281920
        .global func_ov002_0228130c
        .arm
func_ov002_0228130c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    bl func_0202b8c0
    cmp r0, #0x2
    bne .L_44
    ldr r0, _LIT0
    ldr r1, _LIT1
    and r2, r5, #0x1
    mla r0, r2, r0, r1
    ldr r0, [r0, #0xf8]
    mov r0, r0, lsl #0x13
    cmp r4, r0, lsr #0x13
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_44:
    mov r0, r4
    bl func_0202b8c0
    cmp r0, #0x4
    bne .L_98
    mov r0, r4
    bl func_0202b878
    cmp r0, #0x17
    bne .L_80
    ldr r1, _LIT2
    mov r0, r5
    bl func_ov002_02281920
    cmp r0, #0x0
    beq .L_98
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_80:
    ldr r1, _LIT3
    mov r0, r5
    bl func_ov002_02281920
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
.L_98:
    ldr r2, _LIT1
    ldr r0, _LIT0
    and r1, r5, #0x1
    mla r0, r1, r0, r2
    add r2, r0, #0x94
    mov r1, #0x5
.L_b0:
    ldr r0, [r2]
    mov r0, r0, lsl #0x13
    cmp r4, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    add r1, r1, #0x1
    cmp r1, #0xa
    add r2, r2, #0x14
    blt .L_b0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x000019a3
_LIT3: .word 0x000019a4
