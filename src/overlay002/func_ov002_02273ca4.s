; func_ov002_02273ca4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_ov002_021d7a1c
        .extern func_ov002_02271ab4
        .global func_ov002_02273ca4
        .arm
func_ov002_02273ca4:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, [r0, #0x18]
    mov r2, r1, lsl #0x18
    movs r2, r2, lsr #0x18
    beq .L_134
    cmp r2, #0xf
    beq .L_168
    b .L_140
.L_134:
    bic r1, r1, #0xff
    orr r1, r1, #0xa
    str r1, [r0, #0x18]
.L_140:
    bl func_ov002_02271ab4
    cmp r0, #0x1
    ldmneia sp!, {r3, pc}
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x18]
    bic r2, r2, #0xff
    orr r2, r2, #0xf
    str r2, [r1, #0x18]
    ldmia sp!, {r3, pc}
.L_168:
    ldr r1, [r0]
    ldr r2, _LIT1
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul ip, r3, r2
    ldr r2, _LIT2
    ldr r2, [r2, ip]
    cmp r2, #0x1
    bls .L_1c8
    ldr r2, _LIT3
    add r2, r2, ip
    ldr r3, [r2, #0x120]
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    cmp r2, r1, lsr #0x17
    moveq r1, #0x1
    movne r1, #0x0
    bl func_ov002_021d7a1c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_1c8:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
_LIT3: .word data_ov002_022cf16c
