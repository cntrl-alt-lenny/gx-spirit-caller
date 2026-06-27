; func_ov002_022b12b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ca48c
        .extern data_ov002_022ca48e
        .extern data_ov002_022d008c
        .extern func_020b377c
        .extern func_ov002_022b0348
        .global func_ov002_022b12b0
        .arm
func_ov002_022b12b0:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0xd00]
    cmp r0, #0x1
    beq .L_f90
    cmp r0, #0x2
    cmpne r0, #0x3
    beq .L_fac
    b .L_fb8
.L_f90:
    ldr r0, [r1, #0xd04]
    cmp r0, #0x3
    bne .L_fb8
    cmp r4, #0x0
    ble .L_fb8
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_fac:
    cmp r4, #0x5
    movgt r0, #0x0
    ldmgtia sp!, {r4, pc}
.L_fb8:
    mov r0, r4
    bl func_ov002_022b0348
    ldr r1, _LIT1
    mov r2, r4, lsl #0x2
    ldrsh r1, [r1, r2]
    cmp r0, r1
    blt .L_ffc
    ldr r1, _LIT2
    ldrsh r1, [r1, r2]
    cmp r1, #0x0
    mulgt r1, r0, r1
    bgt .L_ff4
    rsb r1, r1, #0x0
    bl func_020b377c
    mov r1, r0
.L_ff4:
    mov r0, r1
    ldmia sp!, {r4, pc}
.L_ffc:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022ca48c
_LIT2: .word data_ov002_022ca48e
