; func_ov002_021e7418 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cd318
        .extern data_ov002_022ce288
        .extern func_ov002_021e3dac
        .extern func_ov002_021e4ba8
        .extern func_ov002_021e72a8
        .extern func_ov002_022465d4
        .global func_ov002_021e7418
        .arm
func_ov002_021e7418:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r2, [r1, #0x18]
    mov r0, r2, lsl #0x10
    mov r3, r0, lsr #0x18
    cmp r3, #0x4
    addls pc, pc, r3, lsl #0x2
    b .L_158
    b .L_34
    b .L_60
    b .L_9c
    b .L_e0
    b .L_11c
.L_34:
    ldr r0, _LIT1
    ldr r0, [r0, #0x688]
    cmp r0, #0x0
    beq .L_4c
    bl func_ov002_022465d4
    ldmia sp!, {r3, pc}
.L_4c:
    add r0, r3, #0x1
    bic r2, r2, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r2, r0, lsr #0x10
    str r0, [r1, #0x18]
.L_60:
    ldr r0, _LIT1
    ldr r0, [r0, #0x5a0]
    cmp r0, #0x0
    beq .L_78
    bl func_ov002_021e4ba8
    ldmia sp!, {r3, pc}
.L_78:
    ldr r2, _LIT2
    ldr r1, [r2]
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r1, r1, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x10
    str r0, [r2]
.L_9c:
    ldr r0, _LIT1
    ldr r1, [r0, #0x598]
    cmp r1, #0x0
    bne .L_bc
    ldr r0, [r0, #0x490]
    cmp r0, #0x0
    beq .L_bc
    bl func_ov002_021e72a8
.L_bc:
    ldr r2, _LIT2
    ldr r1, [r2]
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r1, r1, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x10
    str r0, [r2]
.L_e0:
    ldr r0, _LIT1
    ldr r0, [r0, #0x598]
    cmp r0, #0x0
    beq .L_f8
    bl func_ov002_021e3dac
    ldmia sp!, {r3, pc}
.L_f8:
    ldr r2, _LIT2
    ldr r1, [r2]
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r1, r1, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x10
    str r0, [r2]
.L_11c:
    ldr r0, _LIT1
    ldr r0, [r0, #0x5a0]
    cmp r0, #0x0
    beq .L_134
    bl func_ov002_021e4ba8
    ldmia sp!, {r3, pc}
.L_134:
    ldr r2, _LIT2
    ldr r1, [r2]
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r1, r1, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x10
    str r0, [r2]
.L_158:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word data_ov002_022ce288
_LIT2: .word data_ov002_022cd318
