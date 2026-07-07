; func_ov002_022390e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021c1008
        .extern func_ov002_021de588
        .extern func_ov002_021e267c
        .global func_ov002_022390e8
        .arm
func_ov002_022390e8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldrh r3, [r4, #0x2]
    mov r1, r3, lsl #0x12
    mov r1, r1, lsr #0x1e
    cmp r1, #0x1
    bne .L_f8
    mov r1, r3, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r2, _LIT0
    and r5, r1, #0x1
    mov ip, r3, lsl #0x1a
    mul r3, r5, r2
    ldr r2, _LIT1
    ldrh r5, [r4, #0x4]
    add r6, r2, r3
    mov r2, ip, lsr #0x1b
    mov ip, #0x14
    mov lr, r5, lsl #0x11
    add r5, r6, #0x30
    mul ip, r2, ip
    ldr r5, [r5, ip]
    mov r6, lr, lsr #0x17
    mov lr, r5, lsl #0x2
    mov lr, lr, lsr #0x18
    mov r5, r5, lsl #0x12
    mov lr, lr, lsl #0x1
    add r5, lr, r5, lsr #0x1f
    cmp r6, r5
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr lr, _LIT2
    add r3, lr, r3
    ldrh r3, [ip, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r3, #0x2000
    bl func_ov002_021de588
    cmp r0, #0x0
    beq .L_f8
    ldrh r0, [r4, #0x2]
    mov r2, #0x1
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021c1008
    ldrh r1, [r4, #0x4]
    ldrh r2, [r4, #0x2]
    mov r0, r0, lsl #0x2
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x17
    add r0, r0, r1, lsl #0x3
    add r0, r0, #0x1
    mov r3, r2, lsl #0x1f
    mov r2, r0, lsl #0x10
    mov r0, r3, lsr #0x1f
    mov r3, r2, lsr #0x10
    ldrh r1, [r4]
    mov r2, #0x21
    bl func_ov002_021e267c
.L_f8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
