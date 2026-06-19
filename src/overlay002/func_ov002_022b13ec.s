; func_ov002_022b13ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ca59c
        .extern data_ov002_022ca59e
        .extern data_ov002_022d016c
        .extern func_020b3870
        .extern func_ov002_022b0484
        .global func_ov002_022b13ec
        .arm
func_ov002_022b13ec:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0xd00]
    cmp r0, #0x1
    beq .L_28
    cmp r0, #0x2
    cmpne r0, #0x3
    beq .L_44
    b .L_50
.L_28:
    ldr r0, [r1, #0xd04]
    cmp r0, #0x3
    bne .L_50
    cmp r4, #0x0
    ble .L_50
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_44:
    cmp r4, #0x5
    movgt r0, #0x0
    ldmgtia sp!, {r4, pc}
.L_50:
    mov r0, r4
    bl func_ov002_022b0484
    ldr r1, _LIT1
    mov r2, r4, lsl #0x2
    ldrsh r1, [r1, r2]
    cmp r0, r1
    blt .L_94
    ldr r1, _LIT2
    ldrsh r1, [r1, r2]
    cmp r1, #0x0
    mulgt r1, r0, r1
    bgt .L_8c
    rsb r1, r1, #0x0
    bl func_020b3870
    mov r1, r0
.L_8c:
    mov r0, r1
    ldmia sp!, {r4, pc}
.L_94:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022ca59c
_LIT2: .word data_ov002_022ca59e
