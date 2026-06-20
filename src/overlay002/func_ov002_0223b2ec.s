; func_ov002_0223b2ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021e104c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_0226ad5c
        .global func_ov002_0223b2ec
        .arm
func_ov002_0223b2ec:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    ldr r2, _LIT1
    ldr r3, [r1, #0x5a8]
    ldr ip, [r2, #0xcec]
    sub r2, r3, #0x7d
    ldr r3, [r1, #0x5ac]
    mov r4, r0
    cmp r2, #0x3
    eor r0, ip, r3
    addls pc, pc, r2, lsl #0x2
    b .L_d0
    b .L_b0
    b .L_88
    b .L_74
    b .L_40
.L_40:
    ldrh r0, [r4, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e104c
    ldrh r0, [r4, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e104c
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_74:
    mov r0, #0x0
    str r0, [r1, #0x5ac]
    bl func_ov002_021e2b3c
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_88:
    ldrh r1, [r4, #0x2]
    mov r2, #0x0
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    movne r3, #0x1
    moveq r3, #0x0
    mov r1, #0x1
    bl func_ov002_0226ad5c
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_b0:
    add r0, r3, #0x1
    str r0, [r1, #0x5ac]
    cmp r0, #0x2
    movlt r0, #0x7e
    ldmltia sp!, {r4, pc}
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_d0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d016c
