; func_ov003_021cbdb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02036540
        .extern func_0208e118
        .extern func_0208e138
        .extern func_02094410
        .global func_ov003_021cbdb8
        .arm
func_ov003_021cbdb8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r4, r0
    bl func_0208e138
    mov r5, r0
    bl func_0208e118
    ldr r1, [r4, #0xc]
    mov r6, r0
    cmp r1, #0x0
    bne .L_1c14
    mov r0, #0x8f00000
    mov r1, #0x20
    bl func_02036540
.L_1c14:
    ldr r0, [r4, #0xc]
    mov r3, #0x17
    cmp r0, #0x40
    movlt r1, #0x1
    ldr r0, [r4, #0xc]
    movge r1, #0x0
    add r0, r0, r1
    str r0, [r4, #0xc]
    mov lr, #0x2e0
    mov r1, #0x0
.L_1c3c:
    rsb r7, r3, #0x17
    mov r2, r7, lsl #0x5
    mov ip, r1
    add r0, r5, lr, lsl #0x1
    add r8, r6, r2, lsl #0x1
.L_1c50:
    ldr r2, [r4, #0xc]
    rsb r2, r7, r2, asr #0x1
    cmp r2, #0x0
    ble .L_1c78
    cmp r2, #0x8
    bgt .L_1c78
    rsb r9, r2, #0xa
    orr sl, r9, #0x2800
    mov r9, ip, lsl #0x1
    strh sl, [r9, r0]
.L_1c78:
    cmp r2, #0x0
    ble .L_1c98
    cmp r2, #0x8
    bgt .L_1c98
    rsb r2, r2, #0xa
    orr r9, r2, #0x2000
    mov r2, ip, lsl #0x1
    strh r9, [r2, r8]
.L_1c98:
    add ip, ip, #0x1
    cmp ip, #0x20
    blt .L_1c50
    sub lr, lr, #0x20
    subs r3, r3, #0x1
    bpl .L_1c3c
    ldr r0, [r4, #0xc]
    cmp r0, #0x40
    mov r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r1, r5
    mov r2, #0x800
    bl func_02094410
    mov r1, r6
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094410
    mov r0, #0x0
    str r0, [r4, #0xc]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
