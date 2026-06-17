; func_ov002_0228d95c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_0202e2f8
        .extern func_ov002_0227d400
        .global func_ov002_0228d95c
        .arm
func_ov002_0228d95c:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    and r3, r0, #0x1
    mov r0, #0x14
    mul ip, r3, r2
    ldr r3, _LIT1
    ldr r2, _LIT2
    mul lr, r1, r0
    add r0, r3, ip
    add r1, r0, lr
    add r0, r2, ip
    ldr r1, [r1, #0x30]
    ldrh r0, [lr, r0]
    mov r1, r1, lsl #0x13
    mov r4, r1, lsr #0x13
    cmp r0, #0x0
    beq .L_114c
    ldr r0, _LIT3
    cmp r4, r0
    moveq r0, #0x3
    ldmeqia sp!, {r4, pc}
.L_114c:
    mov r0, r4
    bl func_0202e2f8
    cmp r0, #0x0
    movne r0, #0x2
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl func_ov002_0227d400
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word 0x0000118a
