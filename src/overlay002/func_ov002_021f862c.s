; func_ov002_021f862c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021d71e0
        .extern func_ov002_021e278c
        .extern func_ov002_021f4a84
        .extern func_ov002_022107b4
        .extern func_ov002_022592ec
        .extern func_ov002_022593f4
        .extern func_ov002_02290500
        .global func_ov002_021f862c
        .arm
func_ov002_021f862c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5b4]
    cmp r2, #0xa
    beq .L_40
    cmp r2, #0xb
    beq .L_a0
    bl func_ov002_021f4a84
    cmp r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    mov r1, #0xa
    str r1, [r0, #0x5b4]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_40:
    ldrh r0, [r4, #0x2]
    mov r1, #0x4c
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_80
    ldr r2, _LIT2
    mov r1, #0x2
    bl func_ov002_02290500
    b .L_88
.L_80:
    ldr r0, _LIT2
    bl func_ov002_022592ec
.L_88:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, pc}
.L_a0:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_104
    ldr r1, _LIT3
    ldr r3, _LIT4
    ldr r4, [r1, #0xd70]
    ldr r0, _LIT5
    and r2, r4, #0x1
    mla r0, r2, r0, r3
    ldr r5, [r1, #0xd78]
    add r0, r0, #0x120
    ldr r2, [r0, r5, lsl #0x2]
    mov r0, r4
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021e278c
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_ov002_021d71e0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_104:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd744
_LIT2: .word func_ov002_022107b4
_LIT3: .word data_ov002_022d016c
_LIT4: .word data_ov002_022cf16c
_LIT5: .word 0x00000868
