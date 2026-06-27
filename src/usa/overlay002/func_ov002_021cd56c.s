; func_ov002_021cd56c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce870
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021c9aa0
        .extern func_ov002_0229acd0
        .global func_ov002_021cd56c
        .arm
func_ov002_021cd56c:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr ip, _LIT1
    ldrh r0, [r0]
    ldr r1, _LIT2
    ldr r2, _LIT0
    tst r0, #0x8000
    movne r0, #0x1
    moveq r0, #0x0
    and r3, r0, #0x1
    mla r1, r3, r1, ip
    ldrh r3, [r2, #0x2]
    add ip, r1, #0x30
    mov r2, #0x14
    and r1, r3, #0xff
    smulbb r3, r1, r2
    ldr r2, [ip, r3]
    add r4, ip, r3
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    beq .L_1c4
    ldr ip, _LIT3
    mov r2, #0x1
    ldr lr, [ip, #0xce8]
    mov r3, #0x0
    add lr, lr, #0x1
    str lr, [ip, #0xce8]
    strh lr, [r4, #0x4]
    bl func_ov002_021c9aa0
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x24
    bl func_ov002_0229acd0
.L_1c4:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022d008c
