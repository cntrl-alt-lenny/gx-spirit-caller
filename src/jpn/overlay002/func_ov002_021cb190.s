; func_ov002_021cb190 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce870
        .extern data_ov002_022d008c
        .extern func_ov002_021c0f30
        .extern func_ov002_0229acd0
        .global func_ov002_021cb190
        .arm
func_ov002_021cb190:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldrh r0, [r0]
    ldr r1, _LIT0
    ldr r3, [r2, #0xd0c]
    tst r0, #0x8000
    movne r0, #0x1
    moveq r0, #0x0
    ldrh r1, [r1, #0x2]
    cmp r3, #0x0
    beq .L_44
    ldr r3, [r2, #0xcec]
    ldr r2, _LIT2
    ldr r2, [r2, r3, lsl #0x2]
    cmp r2, #0x2
    beq .L_58
.L_44:
    ldr r2, _LIT1
    mov r3, #0xb
    str r3, [r2, #0xd2c]
    mov r3, #0x0
    str r3, [r2, #0xd30]
.L_58:
    bl func_ov002_021c0f30
    mov r1, #0x0
    ldr ip, _LIT1
    mov r2, r1
    ldr r0, [ip, #0xd0]
    mov r3, r1
    bic lr, r0, #0x2
    mov r0, #0x24
    str lr, [ip, #0xd0]
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022cd664
