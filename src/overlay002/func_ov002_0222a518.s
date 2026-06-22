; func_ov002_0222a518 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern func_ov002_021c10e8
        .extern func_ov002_021de64c
        .extern func_ov002_021e276c
        .global func_ov002_0222a518
        .arm
func_ov002_0222a518:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldrh r3, [r5, #0x2]
    mov r1, r3, lsl #0x12
    mov r1, r1, lsr #0x1e
    cmp r1, #0x3
    bne .L_3c8
    mov r1, r3, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r2, _LIT0
    and r4, r1, #0x1
    mov r6, r3, lsl #0x1a
    mul r3, r4, r2
    ldr r2, _LIT1
    ldrh ip, [r5, #0x4]
    add lr, r2, r3
    mov r2, r6, lsr #0x1b
    mov r6, ip, lsl #0x11
    mov r4, #0x14
    mul ip, r2, r4
    add r4, lr, #0x30
    ldr lr, [r4, ip]
    mov r6, r6, lsr #0x17
    mov r4, lr, lsl #0x2
    mov r4, r4, lsr #0x18
    mov lr, lr, lsl #0x12
    mov r4, r4, lsl #0x1
    add r4, r4, lr, lsr #0x1f
    cmp r6, r4
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r4, _LIT2
    add r3, r4, r3
    ldrh r3, [ip, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r3, #0x0
    bl func_ov002_021de64c
    cmp r0, #0x0
    beq .L_3c8
    ldrh r1, [r5, #0x2]
    ldr r2, _LIT0
    ldr ip, _LIT3
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    and lr, r0, #0x1
    mov r1, r1, lsr #0x1b
    mov r3, #0x14
    mul r4, r1, r3
    mla r3, lr, r2, ip
    mov r2, #0x1
    ldrh r4, [r4, r3]
    bl func_ov002_021c10e8
    ldrh r1, [r5, #0x4]
    ldrh r2, [r5, #0x2]
    mov r0, r0, lsl #0x2
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x17
    add r0, r0, r1, lsl #0x3
    add r0, r0, r4, lsl #0x1
    add r0, r0, #0x1
    mov r3, r2, lsl #0x1f
    mov r2, r0, lsl #0x10
    mov r0, r3, lsr #0x1f
    mov r3, r2, lsr #0x10
    ldrh r1, [r5]
    mov r2, #0x1
    bl func_ov002_021e276c
.L_3c8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word data_ov002_022cf1a2
