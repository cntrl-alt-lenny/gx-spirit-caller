; func_ov006_021b45fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_0224f170
        .extern data_ov006_0225ca98
        .extern data_ov006_0225df48
        .extern func_ov006_021b44f8
        .extern func_ov006_021c18d8
        .extern func_ov006_021c9de8
        .global func_ov006_021b45fc
        .arm
func_ov006_021b45fc:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r4, [r1, #0x50]
    ldr r5, [r1, #0x54]
    bl func_ov006_021c9de8
    ldr r0, _LIT0
    bl func_ov006_021c18d8
    bl func_ov006_021b44f8
    cmp r4, #0x5
    addls pc, pc, r4, lsl #0x2
    b .L_bc
    b .L_bc
    b .L_bc
    b .L_bc
    b .L_48
    b .L_74
    b .L_a0
.L_48:
    mov r0, r5, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r5, lsl #0x10
    ldr r2, _LIT2
    mov r0, r0, lsr #0x10
    str r0, [r2, #0x14]
    mov r0, r1, lsr #0x10
    str r0, [r2, #0x18]
    mov r0, #0x5
    str r0, [r2]
    b .L_c8
.L_74:
    mov r0, r5, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r5, lsl #0x10
    ldr r2, _LIT2
    mov r0, r0, lsr #0x10
    str r0, [r2, #0x14]
    mov r0, r1, lsr #0x10
    str r0, [r2, #0x18]
    mov r0, #0x1
    str r0, [r2]
    b .L_c8
.L_a0:
    ldr r0, _LIT2
    mvn r1, #0x0
    str r1, [r0, #0x14]
    str r1, [r0, #0x18]
    mov r1, #0x1
    str r1, [r0]
    b .L_c8
.L_bc:
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0]
.L_c8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov006_0225ca98
_LIT1: .word data_ov006_0225df48
_LIT2: .word data_ov006_0224f170
