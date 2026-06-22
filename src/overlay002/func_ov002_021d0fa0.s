; func_ov002_021d0fa0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022ce950
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf198
        .extern data_ov002_022d016c
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021d0fa0
        .arm
func_ov002_021d0fa0:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r3, #0x1
    ldr r2, [r0, #0x810]
    moveq r3, #0x0
    ldrh r1, [r0, #0x2]
    cmp r2, #0x0
    bne .L_c8
    ldr r0, _LIT1
    ldr ip, [r0, #0x4]
    eor lr, ip, #0x1
    cmp r3, lr
    bne .L_78
    cmp r1, #0x1
    beq .L_54
    cmp r1, #0x2
    moveq r1, #0x1
    b .L_58
.L_54:
    mov r1, #0x2
.L_58:
    ldr r0, _LIT2
    ldr r2, _LIT0
    str r1, [r0, #0xd00]
    ldrh r3, [r2, #0x4]
    ldr r0, _LIT3
    ldrh r2, [r2, #0x6]
    str r3, [r0, #0x2c]
    str r2, [r0, #0x894]
.L_78:
    ldr r0, _LIT4
    cmp r1, #0x2
    andne r2, ip, #0x1
    mulne r3, r2, r0
    ldrne r0, _LIT5
    bne .L_9c
    and r2, lr, #0x1
    mul r3, r2, r0
    ldr r0, _LIT5
.L_9c:
    ldr r2, [r0, r3]
    ldr ip, _LIT1
    mov r0, #0x2
    mov r3, #0x0
    str r2, [ip, #0x228]
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, pc}
.L_c8:
    mov r0, #0x2
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word data_ov002_022cd73c
_LIT2: .word data_ov002_022d016c
_LIT3: .word data_ov002_022cf16c
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf198
