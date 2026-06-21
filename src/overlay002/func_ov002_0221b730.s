; func_ov002_0221b730 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022d016c
        .extern func_ov002_021d59cc
        .global func_ov002_0221b730
        .arm
func_ov002_0221b730:
    stmdb sp!, {r3, r4, r5, lr}
    mov ip, r0
    ldrh r2, [ip, #0x2]
    ldr r1, _LIT0
    ldr r4, _LIT1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mov r5, r2, lsl #0x1a
    mul r2, r3, r1
    add r4, r4, r2
    mov r1, r5, lsr #0x1b
    mov r3, #0x14
    ldrh lr, [ip, #0x4]
    mul r3, r1, r3
    add r4, r4, #0x30
    mov r5, lr, lsl #0x11
    ldr r4, [r4, r3]
    mov r5, r5, lsr #0x17
    mov lr, r4, lsl #0x2
    mov lr, lr, lsr #0x18
    mov r4, r4, lsl #0x12
    mov lr, lr, lsl #0x1
    add r4, lr, r4, lsr #0x1f
    cmp r5, r4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr lr, _LIT2
    add r2, lr, r2
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    beq .L_bc
    ldr r2, _LIT3
    mov r3, #0x0
    ldr r2, [r2, #0xcec]
    cmp r2, r0
    moveq r2, #0x1
    movne r2, #0x0
    add r2, r2, #0x1
    and r2, r2, #0xff
    mov r2, r2, lsl #0x4
    str r3, [sp]
    orr r2, r2, #0x2
    mov r3, r2, lsl #0x10
    ldrh r2, [ip]
    mov r3, r3, lsr #0x10
    bl func_ov002_021d59cc
.L_bc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word data_ov002_022d016c
