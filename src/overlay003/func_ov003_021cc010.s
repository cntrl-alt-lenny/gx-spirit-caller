; func_ov003_021cc010 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208e200
        .extern func_0208e220
        .global func_ov003_021cc010
        .arm
func_ov003_021cc010:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r5, r0
    bl func_0208e220
    mov r4, r0
    bl func_0208e200
    ldr r1, [r5, #0xc]
    mov r2, #0x17
    cmp r1, #0x40
    movlt r3, #0x1
    ldr r1, [r5, #0xc]
    movge r3, #0x0
    add r1, r1, r3
    str r1, [r5, #0xc]
    mov ip, #0x2e0
    mov r1, #0x0
.L_1c0:
    rsb lr, r2, #0x17
    mov r6, lr, lsl #0x5
    add r9, r4, r6, lsl #0x1
    mov r3, r1
    add r6, r0, ip, lsl #0x1
.L_1d4:
    ldr r7, [r5, #0xc]
    rsb sl, lr, r7, asr #0x1
    cmp sl, #0x0
    ble .L_1fc
    cmp sl, #0x8
    bgt .L_1fc
    add r7, sl, #0x2
    orr r8, r7, #0x2800
    mov r7, r3, lsl #0x1
    strh r8, [r7, r9]
.L_1fc:
    cmp sl, #0x0
    ble .L_21c
    cmp sl, #0x8
    bgt .L_21c
    add r7, sl, #0x2
    orr r8, r7, #0x2000
    mov r7, r3, lsl #0x1
    strh r8, [r7, r6]
.L_21c:
    add r3, r3, #0x1
    cmp r3, #0x20
    blt .L_1d4
    sub ip, ip, #0x20
    subs r2, r2, #0x1
    bpl .L_1c0
    ldr r0, [r5, #0xc]
    cmp r0, #0x40
    mov r0, #0x0
    strge r0, [r5, #0xc]
    movge r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
