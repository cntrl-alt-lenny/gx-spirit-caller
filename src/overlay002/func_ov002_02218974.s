; func_ov002_02218974 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021ae664
        .extern func_ov002_021b00d0
        .extern func_ov002_021e104c
        .extern func_ov002_021e276c
        .extern func_ov002_0226b22c
        .global func_ov002_02218974
        .arm
func_ov002_02218974:
    stmdb sp!, {r3, lr}
    ldrh r1, [r0, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7e
    beq .L_a4
    cmp r1, #0x7f
    beq .L_78
    cmp r1, #0x80
    bne .L_10c
    ldrh r1, [r0, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_68
    mov r0, #0x2
    bl func_ov002_021b00d0
    ldr r1, _LIT2
    str r0, [r1, #0xd44]
    b .L_70
.L_68:
    mov r0, #0x38
    bl func_ov002_021ae664
.L_70:
    mov r0, #0x7f
    ldmia sp!, {r3, pc}
.L_78:
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
.L_a4:
    ldr r1, _LIT3
    ldrh r1, [r1, #0xb2]
    cmp r1, #0x0
    beq .L_e8
    ldrh r0, [r0, #0x2]
    ldr r1, _LIT4
    ldr r2, _LIT5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x5
    bcs .L_104
    rsb r1, r1, #0x5
    bl func_ov002_021e104c
    b .L_104
.L_e8:
    ldrh r3, [r0, #0x2]
    ldrh r1, [r0]
    mov r2, #0x21
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021e276c
.L_104:
    mov r0, #0xa
    ldmia sp!, {r3, pc}
.L_10c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd744
_LIT2: .word data_ov002_022d016c
_LIT3: .word data_ov002_022d0e6c
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf178
