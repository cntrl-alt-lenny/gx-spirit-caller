; func_ov006_021ca158 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fbc70
        .extern data_02104e6c
        .extern data_ov006_021ceae4
        .extern func_02021174
        .extern func_02021428
        .extern func_ov006_021ca2f4
        .extern func_ov006_021ca350
        .extern func_ov006_021ca3ac
        .extern func_ov006_021ca40c
        .extern func_ov006_021ca464
        .extern func_ov006_021ca56c
        .extern func_ov006_021ca5e8
        .global func_ov006_021ca158
        .arm
func_ov006_021ca158:
    stmdb sp!, {r4, lr}
    ldr r3, _LIT0
    mov r4, r0
    ldr r0, [r3, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    ldreq r3, _LIT1
    str r1, [r4, #0x4c]
    ldrne r3, _LIT2
    mov r0, #0x14
    mla r3, r1, r0, r3
    str r2, [r4, #0x50]
    mov r0, #0x0
    str r0, [r4, #0x54]
    ldrb r1, [r3, #0x6]
    str r1, [r4, #0x58]
    ldrb r1, [r3, #0x7]
    str r1, [r4, #0x5c]
    str r0, [r4, #0x68]
    str r0, [r4, #0x6c]
    ldr r1, [r4, #0x68]
    str r1, [r4, #0x70]
    ldr r1, [r4, #0x6c]
    str r1, [r4, #0x74]
    ldr r1, [r4, #0x58]
    mov r1, r1, lsl #0x3
    add r1, r1, r1, lsr #0x1f
    mov r1, r1, asr #0x1
    rsb r1, r1, #0x80
    str r1, [r4, #0x78]
    ldr r1, [r4, #0x5c]
    mov r1, r1, lsl #0x3
    add r1, r1, r1, lsr #0x1f
    mov r1, r1, asr #0x1
    rsb r1, r1, #0x60
    str r1, [r4, #0x7c]
    ldrsh r1, [r3]
    cmp r1, #0x1
    beq .L_410
    cmp r1, #0x2
    beq .L_424
    b .L_434
.L_410:
    mov r0, #0x2
    str r0, [r4, #0x60]
    mov r0, #0x1
    str r0, [r4, #0x64]
    b .L_43c
.L_424:
    mov r0, #0x1
    str r0, [r4, #0x60]
    str r0, [r4, #0x64]
    b .L_43c
.L_434:
    str r0, [r4, #0x60]
    str r0, [r4, #0x64]
.L_43c:
    mov r0, r4
    bl func_ov006_021ca3ac
    mov r0, r4
    bl func_ov006_021ca40c
    mov r0, r4
    bl func_ov006_021ca56c
    mov r0, r4
    bl func_ov006_021ca464
    mov r0, r4
    bl func_ov006_021ca5e8
    mov r0, r4
    mov r1, #0x1
    bl func_ov006_021ca2f4
    mov r0, r4
    mov r1, #0x1
    bl func_ov006_021ca350
    ldr r0, _LIT3
    bl func_02021174
    str r0, [r4]
    bl func_02021428
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_02104e6c
_LIT1: .word data_ov006_021ceae4+0x6
_LIT2: .word data_ov006_021ceae4+0x24a
_LIT3: .word data_020fbc70
