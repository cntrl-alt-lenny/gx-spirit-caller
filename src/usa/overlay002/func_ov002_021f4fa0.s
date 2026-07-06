; func_ov002_021f4fa0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae3dc
        .extern func_ov002_021df690
        .extern func_ov002_0227dd08
        .global func_ov002_021f4fa0
        .arm
func_ov002_021f4fa0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r3, [r4, #0x2]
    ldr r1, _LIT0
    mov r2, r3, lsl #0x11
    ldr r1, [r1, #0x5b4]
    mov r3, r3, lsl #0x1f
    mov r2, r2, lsr #0x1f
    cmp r1, #0x0
    eor ip, r2, r3, lsr #0x1f
    beq .L_38
    cmp r1, #0x1
    beq .L_a4
    b .L_d4
.L_38:
    ldr r1, _LIT1
    and r2, ip, #0x1
    mul r3, r2, r1
    ldr r1, _LIT2
    ldr r1, [r1, r3]
    cmp r1, #0x7d0
    movle r0, #0x1
    ldmleia sp!, {r4, pc}
    ldr r1, _LIT3
    ldr r1, [r1, ip, lsl #0x2]
    cmp r1, #0x1
    bne .L_78
    bl func_ov002_0227dd08
    ldr r1, _LIT4
    str r0, [r1, #0xd44]
    b .L_8c
.L_78:
    ldrh r1, [r4, #0x4]
    mov r0, #0xfa
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x17
    bl func_ov002_021ae3dc
.L_8c:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_a4:
    ldr r0, _LIT4
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    beq .L_c0
    mov r0, ip
    mov r1, #0x7d0
    bl func_ov002_021df690
.L_c0:
    ldr r1, _LIT4
    mov r0, #0x1
    ldr r1, [r1, #0xd44]
    strh r1, [r4, #0xc]
    ldmia sp!, {r4, pc}
.L_d4:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cd664
_LIT4: .word data_ov002_022d008c
