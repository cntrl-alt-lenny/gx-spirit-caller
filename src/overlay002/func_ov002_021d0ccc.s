; func_ov002_021d0ccc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern data_ov002_022cf17c
        .extern data_ov002_022d016c
        .extern func_ov002_021ba230
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021d0ccc
        .arm
func_ov002_021d0ccc:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldr r1, _LIT0
    ldrh r0, [r0]
    ldrh r3, [r1, #0x2]
    ldrh r2, [r1, #0x4]
    tst r0, #0x8000
    movne r4, #0x1
    ldr r0, [r1, #0x810]
    moveq r4, #0x0
    cmp r0, #0x0
    orr r5, r3, r2, lsl #0x10
    beq .L_1178
    cmp r0, #0x1
    beq .L_11c4
    ldmia sp!, {r3, r4, r5, pc}
.L_1178:
    ldr r0, _LIT1
    and r2, r4, #0x1
    mul r3, r2, r0
    ldr r0, _LIT2
    ldr r0, [r0, r3]
    cmp r0, #0x2
    movcc r0, #0x0
    strcc r0, [r1, #0x80c]
    ldmccia sp!, {r3, r4, r5, pc}
    mov r2, #0x0
    mov r1, r4
    mov r3, r2
    mov r0, #0x13
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, pc}
.L_11c4:
    mov r0, #0x13
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT3
    mov r0, r4
    str r5, [r1, #0xce4]
    bl func_ov002_021ba230
    mov r1, r4
    mov r0, #0x14
    mov r2, #0xd
    mov r3, #0x0
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf17c
_LIT3: .word data_ov002_022d016c
