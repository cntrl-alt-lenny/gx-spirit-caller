; func_ov002_02237ad0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0c8
        .extern func_ov002_021d58dc
        .extern func_ov002_021d8fd0
        .global func_ov002_02237ad0
        .arm
func_ov002_02237ad0:
    stmdb sp!, {r3, r4, r5, lr}
    mov ip, r0
    ldrh r2, [ip, #0x2]
    ldr r1, _LIT0
    ldr r5, _LIT1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mov lr, r2, lsl #0x1a
    mul r2, r3, r1
    add r5, r5, r2
    mov r1, lr, lsr #0x1b
    mov r3, #0x14
    ldrh r4, [ip, #0x4]
    mul r3, r1, r3
    add r5, r5, #0x30
    mov lr, r4, lsl #0x11
    ldr r5, [r5, r3]
    mov lr, lr, lsr #0x17
    mov r4, r5, lsl #0x2
    mov r4, r4, lsr #0x18
    mov r5, r5, lsl #0x12
    mov r4, r4, lsl #0x1
    add r4, r4, r5, lsr #0x1f
    cmp lr, r4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r4, _LIT2
    add r4, r4, r2
    ldrh r4, [r3, r4]
    cmp r4, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r4, _LIT3
    ldr lr, _LIT4
    add r2, r4, r2
    ldr r5, [r3, r2]
    ldr r4, _LIT5
    umull r3, r2, r5, lr
    mov r2, r2, lsr #0x3
    cmp r2, r4
    bne .L_2ec
    mov r2, #0x0
    str r2, [sp]
    ldrh r2, [ip]
    mov r3, #0x3
    bl func_ov002_021d58dc
    b .L_2f0
.L_2ec:
    bl func_ov002_021d8fd0
.L_2f0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word data_ov002_022cf0c8
_LIT4: .word 0xcccccccd
_LIT5: .word 0x000018c3
