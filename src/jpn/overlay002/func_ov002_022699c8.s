; func_ov002_022699c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd888
        .extern func_ov002_02246968
        .extern func_ov002_02269668
        .extern func_ov002_02269784
        .extern func_ov002_022698b4
        .global func_ov002_022699c8
        .arm
func_ov002_022699c8:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, [r0, #0x300]
    mov r0, r1, lsl #0x13
    movs r0, r0, lsr #0x1f
    beq .L_1b18
    bl func_ov002_02269668
    cmp r0, #0x0
    beq .L_1b10
    ldr r0, _LIT0
    ldr r1, [r0, #0x300]
    bic r1, r1, #0x1000
    str r1, [r0, #0x300]
.L_1b10:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_1b18:
    mov r0, r1, lsl #0x15
    movs r0, r0, lsr #0x1f
    beq .L_1b48
    bl func_ov002_02269784
    cmp r0, #0x0
    beq .L_1b40
    ldr r0, _LIT0
    ldr r1, [r0, #0x300]
    bic r1, r1, #0x400
    str r1, [r0, #0x300]
.L_1b40:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_1b48:
    mov r0, r1, lsl #0x1b
    movs r0, r0, lsr #0x1f
    beq .L_1b78
    bl func_ov002_02246968
    cmp r0, #0x0
    beq .L_1b70
    ldr r0, _LIT0
    ldr r1, [r0, #0x300]
    bic r1, r1, #0x10
    str r1, [r0, #0x300]
.L_1b70:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_1b78:
    mov r0, r1, lsl #0x11
    movs r0, r0, lsr #0x1f
    beq .L_1ba8
    bl func_ov002_022698b4
    cmp r0, #0x0
    beq .L_1ba0
    ldr r0, _LIT0
    ldr r1, [r0, #0x300]
    bic r1, r1, #0x4000
    str r1, [r0, #0x300]
.L_1ba0:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_1ba8:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cd888
