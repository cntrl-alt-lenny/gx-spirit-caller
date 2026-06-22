; func_ov002_0222fcb0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021ae664
        .extern func_ov002_021b00d0
        .extern func_ov002_021de4b0
        .extern func_ov002_0226b22c
        .global func_ov002_0222fcb0
        .arm
func_ov002_0222fcb0:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7e
    beq .L_58c
    cmp r1, #0x7f
    beq .L_560
    cmp r1, #0x80
    bne .L_5e4
    ldrh r1, [r0, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_550
    mov r0, #0x2
    bl func_ov002_021b00d0
    ldr r1, _LIT2
    str r0, [r1, #0xd44]
    b .L_558
.L_550:
    mov r0, #0x38
    bl func_ov002_021ae664
.L_558:
    mov r0, #0x7f
    ldmia sp!, {r3, pc}
.L_560:
    ldrh r1, [r0, #0x2]
    ldr r0, _LIT2
    mov r2, #0x1
    mov ip, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    ldr r3, [r0, #0xd44]
    mov r0, ip, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_0226b22c
    mov r0, #0x7e
    ldmia sp!, {r3, pc}
.L_58c:
    ldr r1, _LIT3
    ldrh r1, [r1, #0xb2]
    cmp r1, #0x0
    beq .L_5dc
    ldrh r3, [r0, #0x2]
    ldr r2, _LIT4
    ldr r1, [r2]
    mov ip, r3, lsl #0x1f
    cmp r1, ip, lsr #0x1f
    ldreq ip, [r2, #0x1c]
    moveq r3, r3, lsl #0x1a
    cmpeq ip, r3, lsr #0x1b
    bne .L_5d0
    ldr r1, [r2, #0x4]
    ldr r2, [r2, #0x20]
    bl func_ov002_021de4b0
    b .L_5dc
.L_5d0:
    ldr r2, _LIT4
    ldr r2, [r2, #0x1c]
    bl func_ov002_021de4b0
.L_5dc:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_5e4:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd744
_LIT2: .word data_ov002_022d016c
_LIT3: .word data_ov002_022d0e6c
_LIT4: .word data_ov002_022cd3f4
