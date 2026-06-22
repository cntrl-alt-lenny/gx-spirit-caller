; func_ov002_021cb0ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce950
        .extern data_ov002_022cf282
        .extern data_ov002_022d016c
        .extern func_ov002_021b212c
        .extern func_ov002_021b2ab4
        .extern func_ov002_0229ade0
        .global func_ov002_021cb0ac
        .arm
func_ov002_021cb0ac:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, [r0, #0xd0c]
    ldrh r3, [r1, #0x2]
    cmp r2, #0x0
    beq .L_30
    ldr r1, [r0, #0xcec]
    ldr r0, _LIT2
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x2
    beq .L_74
.L_30:
    cmp r3, #0x0
    beq .L_60
    ldr r1, _LIT0
    ldr r0, _LIT3
    ldr r2, [r1, #0xcec]
    ldr r1, _LIT4
    and r2, r2, #0x1
    mul r0, r2, r0
    ldrh r0, [r1, r0]
    ldr r1, _LIT5
    mov r2, #0x1
    bl func_ov002_021b212c
.L_60:
    ldr r0, _LIT0
    mov r1, #0xc
    str r1, [r0, #0xd2c]
    mov r1, #0x0
    str r1, [r0, #0xd30]
.L_74:
    ldr r0, _LIT0
    ldr r1, [r0, #0xd0]
    bic r1, r1, #0x2
    bic r1, r1, #0x1
    str r1, [r0, #0xd0]
    bl func_ov002_021b2ab4
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x24
    bl func_ov002_0229ade0
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022ce950
_LIT2: .word data_ov002_022cd744
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf282
_LIT5: .word 0x000011ed
