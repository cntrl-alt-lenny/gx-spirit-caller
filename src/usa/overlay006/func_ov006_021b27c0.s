; func_ov006_021b27c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cf020
        .extern data_ov006_0225ca98
        .extern data_ov006_0225df48
        .extern func_ov006_021b2520
        .extern func_ov006_021c18d8
        .extern func_ov006_021c9de8
        .global func_ov006_021b27c0
        .arm
func_ov006_021b27c0:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r4, [r1, #0x50]
    ldr r5, [r1, #0x54]
    bl func_ov006_021c9de8
    ldr r0, _LIT0
    bl func_ov006_021c18d8
    bl func_ov006_021b2520
    cmp r4, #0x3
    addls pc, pc, r4, lsl #0x2
    b .L_90
    b .L_90
    b .L_40
    b .L_50
    b .L_64
.L_40:
    ldr r0, _LIT2
    mov r1, #0x8
    str r1, [r0]
    b .L_9c
.L_50:
    ldr r0, _LIT2
    mov r1, #0xb
    str r5, [r0, #0x14]
    str r1, [r0]
    b .L_9c
.L_64:
    mov r0, r5, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r5, lsl #0x10
    ldr r2, _LIT2
    mov r0, r0, lsr #0x10
    str r0, [r2, #0x10]
    mov r0, r1, lsr #0x10
    str r0, [r2, #0x14]
    mov r0, #0xe
    str r0, [r2]
    b .L_9c
.L_90:
    ldr r0, _LIT2
    mov r1, #0x2
    str r1, [r0]
.L_9c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov006_0225ca98
_LIT1: .word data_ov006_0225df48
_LIT2: .word data_ov006_021cf020
