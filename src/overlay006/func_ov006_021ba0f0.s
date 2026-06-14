; func_ov006_021ba0f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov006_0225e100
        .extern func_02022234
        .extern func_0202224c
        .extern func_ov006_021ba1f8
        .extern func_ov006_021ba364
        .global func_ov006_021ba0f0
        .arm
func_ov006_021ba0f0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r0, #0x0
    bl func_0202224c
    ldr r1, [r5, #0x38]
    mov r4, r0
    cmp r1, #0x0
    beq .L_22c
    cmp r1, #0x1
    beq .L_254
    cmp r1, #0x2
    beq .L_28c
    b .L_294
.L_22c:
    ldr r0, [r5, #0x3c]
    cmp r0, #0x3
    bne .L_294
    mov r0, r5
    bl func_ov006_021ba1f8
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    b .L_294
.L_254:
    ldr r0, [r5, #0x3c]
    cmp r0, #0xf
    moveq r0, #0x1
    streq r0, [r5, #0x7c]
    mov r0, r5
    bl func_ov006_021ba364
    cmp r0, #0x0
    beq .L_294
    mov r0, #0x2
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    orr r4, r4, #0x1
    b .L_294
.L_28c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_294:
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    orrne r4, r4, #0x2
    biceq r4, r4, #0x2
    mov r1, r4
    mov r0, #0x0
    bl func_02022234
    ldr r0, [r5, #0x74]
    cmp r0, #0x0
    ldrne r0, [r5, #0x7c]
    cmpne r0, #0x0
    beq .L_2dc
    ldr r0, _LIT1
    ldr r1, [r5, #0x68]
    ldr r0, [r0, #0x30]
    add r0, r1, r0
    str r0, [r5, #0x68]
.L_2dc:
    ldr r1, [r5, #0x3c]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x3c]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov006_0225e100
_LIT1: .word data_021040ac
