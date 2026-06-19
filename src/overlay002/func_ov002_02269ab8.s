; func_ov002_02269ab8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd968
        .extern func_ov002_02246a50
        .extern func_ov002_02269758
        .extern func_ov002_02269874
        .extern func_ov002_022699a4
        .global func_ov002_02269ab8
        .arm
func_ov002_02269ab8:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, [r0, #0x300]
    mov r0, r1, lsl #0x13
    movs r0, r0, lsr #0x1f
    beq .L_5c0
    bl func_ov002_02269758
    cmp r0, #0x0
    beq .L_5b8
    ldr r0, _LIT0
    ldr r1, [r0, #0x300]
    bic r1, r1, #0x1000
    str r1, [r0, #0x300]
.L_5b8:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_5c0:
    mov r0, r1, lsl #0x15
    movs r0, r0, lsr #0x1f
    beq .L_5f0
    bl func_ov002_02269874
    cmp r0, #0x0
    beq .L_5e8
    ldr r0, _LIT0
    ldr r1, [r0, #0x300]
    bic r1, r1, #0x400
    str r1, [r0, #0x300]
.L_5e8:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_5f0:
    mov r0, r1, lsl #0x1b
    movs r0, r0, lsr #0x1f
    beq .L_620
    bl func_ov002_02246a50
    cmp r0, #0x0
    beq .L_618
    ldr r0, _LIT0
    ldr r1, [r0, #0x300]
    bic r1, r1, #0x10
    str r1, [r0, #0x300]
.L_618:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_620:
    mov r0, r1, lsl #0x11
    movs r0, r0, lsr #0x1f
    beq .L_650
    bl func_ov002_022699a4
    cmp r0, #0x0
    beq .L_648
    ldr r0, _LIT0
    ldr r1, [r0, #0x300]
    bic r1, r1, #0x4000
    str r1, [r0, #0x300]
.L_648:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_650:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cd968
