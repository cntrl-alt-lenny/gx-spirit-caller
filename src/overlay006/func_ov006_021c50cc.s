; func_ov006_021c50cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_0225dc14
        .extern data_ov006_0225deb4
        .extern func_020215d8
        .extern func_02022234
        .extern func_0202224c
        .extern func_ov006_021c52b8
        .extern func_ov006_021c53bc
        .extern func_ov006_021c5d98
        .extern func_ov006_021c6640
        .extern func_ov006_021c6d8c
        .extern func_ov006_021c6e40
        .extern func_ov006_021c6f7c
        .extern func_ov006_021c6f88
        .extern func_ov006_021c6f94
        .global func_ov006_021c50cc
        .arm
func_ov006_021c50cc:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, r0
    mov r0, #0x0
    bl func_0202224c
    ldr r1, [r5, #0x3c]
    mov r4, r0
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_194
    b .L_34
    b .L_5c
    b .L_14c
    b .L_18c
.L_34:
    ldr r0, [r5, #0x40]
    cmp r0, #0x3
    bne .L_194
    mov r0, r5
    bl func_ov006_021c52b8
    mov r0, #0x1
    str r0, [r5, #0x3c]
    mov r0, #0x0
    str r0, [r5, #0x40]
    b .L_194
.L_5c:
    ldr r0, [r5, #0x40]
    cmp r0, #0x3
    bne .L_ec
    ldr r0, [r5, #0x4c]
    add r7, r5, #0x7c
    add r0, r5, r0, lsl #0x4
    ldr r2, [r0, #0x70]
    ldr r1, [r0, #0x6c]
    ldr r0, _LIT0
    add r6, r2, r1
    add r8, r7, r6, lsl #0x4
    mov r1, #0x1
    bl func_ov006_021c6d8c
    ldr r1, [r8, #0x4]
    ldr r0, _LIT0
    bl func_ov006_021c6f7c
    ldr r1, [r8, #0x8]
    ldr r0, _LIT0
    bl func_ov006_021c6f88
    ldr r0, [r7, r6, lsl #0x4]
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, _LIT0
    movne r1, #0x0
    bl func_ov006_021c6f94
    ldr r1, [r8]
    ldr r0, _LIT0
    mov r2, #0x0
    bl func_ov006_021c6e40
    mov r0, r5
    mov r1, #0x1
    bl func_ov006_021c5d98
    mov r0, r5
    mov r1, #0x1
    bl func_ov006_021c6640
    b .L_f8
.L_ec:
    cmp r0, #0xf
    moveq r0, #0x1
    streq r0, [r5, #0x50]
.L_f8:
    mov r0, r5
    bl func_ov006_021c53bc
    cmp r0, #0x0
    beq .L_194
    ldr r0, _LIT1
    mov r2, #0x2
    ldr r3, [r0, #0x6c]
    mov r1, #0x0
    str r3, [r0, #0xc]
    ldr r3, [r0, #0x8c]
    orr r4, r4, #0x1
    str r3, [r0, #0x10]
    ldr r3, [r0, #0x90]
    str r3, [r0, #0x14]
    ldr r3, [r0, #0x94]
    str r3, [r0, #0x18]
    ldr r3, [r0, #0x98]
    str r3, [r0, #0x1c]
    str r2, [r5, #0x3c]
    str r1, [r5, #0x40]
    b .L_194
.L_14c:
    ldr r0, [r5, #0x40]
    cmp r0, #0xc
    bne .L_164
    mov r0, r5
    mov r1, #0x0
    bl func_ov006_021c6640
.L_164:
    ldr r0, [r5, #0x4]
    bl func_020215d8
    cmp r0, #0x0
    bne .L_194
    mov r1, #0x0
    str r1, [r5, #0x4]
    mov r0, #0x3
    str r0, [r5, #0x3c]
    str r1, [r5, #0x40]
    b .L_194
.L_18c:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_194:
    ldr r0, [r5, #0x4c]
    add r0, r5, r0, lsl #0x4
    ldr r1, [r0, #0x70]
    ldr r0, [r0, #0x6c]
    add r0, r1, r0
    add r0, r5, r0, lsl #0x4
    ldr r0, [r0, #0x7c]
    cmp r0, #0x0
    orreq r4, r4, #0x40
    bicne r4, r4, #0x40
    mov r1, r4
    mov r0, #0x0
    bl func_02022234
    ldr r1, [r5, #0x40]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x40]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov006_0225deb4
_LIT1: .word data_ov006_0225dc14
