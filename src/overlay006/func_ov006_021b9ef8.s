; func_ov006_021b9ef8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_021040ac
        .extern data_02104f54
        .extern data_ov006_0225c4dc
        .global func_ov006_021b9ef8
        .arm
func_ov006_021b9ef8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r5, r2
    mov r4, r0
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r0, #0x0
    bl Fill32
    mov r0, #0x0
    str r0, [r4, #0x38]
    str r0, [r4, #0x3c]
    cmp r6, #0x1
    movne r5, r0
    str r6, [r4, #0x40]
    str r5, [r4, #0x74]
    cmp r5, #0x0
    beq .L_60
    ldr r0, _LIT2
    mov r1, #0x0
    ldr r2, [r0, #0x38]
    mov r0, #0xb4
    str r2, [r4, #0x64]
    str r1, [r4, #0x68]
    str r0, [r4, #0x6c]
.L_60:
    mov r1, #0x1
    str r1, [r4, #0x48]
    ldr r0, [r4, #0x40]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_b0
    b .L_b0
    b .L_b0
    b .L_94
    b .L_a4
    b .L_b0
    b .L_94
    b .L_94
.L_94:
    mov r0, #0x0
    str r0, [r4, #0x4c]
    str r0, [r4, #0x50]
    b .L_c0
.L_a4:
    str r1, [r4, #0x4c]
    str r1, [r4, #0x50]
    b .L_c0
.L_b0:
    mov r0, #0x0
    str r0, [r4, #0x4c]
    mov r0, #0x1
    str r0, [r4, #0x50]
.L_c0:
    mov r1, #0x1
    mov ip, #0x0
    ldr r3, _LIT3
    add lr, r4, #0xa0
    mov r0, r1
    mov r7, r1
    mov r2, ip
.L_dc:
    str r2, [lr]
    str r2, [lr, #0x4]
    str r2, [lr, #0x8]
    ldr r5, [r4, #0x40]
    cmp r5, #0x5
    bne .L_11c
    ldrb r5, [r3, #0x1]
    ldr r6, [lr, #0x20]
    tst r5, r1, lsl ip
    movne r5, r1
    moveq r5, r2
    and r5, r5, #0x1
    bic r6, r6, #0x1
    orr r5, r6, r5
    str r5, [lr, #0x20]
    b .L_170
.L_11c:
    cmp r5, #0x6
    bne .L_14c
    ldrb r5, [r3, #0x2]
    ldr r6, [lr, #0x20]
    tst r5, r0, lsl ip
    movne r5, r0
    moveq r5, r2
    and r5, r5, #0x1
    bic r6, r6, #0x1
    orr r5, r6, r5
    str r5, [lr, #0x20]
    b .L_170
.L_14c:
    ldrb r5, [r3]
    ldr r6, [lr, #0x20]
    tst r5, r7, lsl ip
    movne r5, r7
    moveq r5, r2
    and r5, r5, #0x1
    bic r6, r6, #0x1
    orr r5, r6, r5
    str r5, [lr, #0x20]
.L_170:
    add ip, ip, #0x1
    cmp ip, #0x5
    add lr, lr, #0x24
    blt .L_dc
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov006_0225c4dc
_LIT1: .word 0x00000674
_LIT2: .word data_021040ac
_LIT3: .word data_02104f54
