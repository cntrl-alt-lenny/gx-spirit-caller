; func_ov002_022bacd4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02021584
        .extern func_020221e0
        .extern func_020221f8
        .extern func_020371b8
        .global func_ov002_022bacd4
        .arm
func_ov002_022bacd4:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r0, [r5, #0xc60]
    cmp r0, #0x0
    beq .L_18cc
    cmp r0, #0x1
    beq .L_1978
    cmp r0, #0x2
    beq .L_19c4
    b .L_19e8
.L_18cc:
    add r0, r5, #0xc00
    ldrh r3, [r0, #0x68]
    mov ip, #0x0
    add r0, r5, #0x74
    mov r2, r3, lsl #0x1f
    mov r1, r3, lsl #0x1a
    strh r3, [sp]
    mov r4, ip
    add r3, r0, #0xc00
    mov r2, r2, lsr #0x1f
    mov lr, r1, lsr #0x1b
.L_18f8:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0xd50]
    cmp r0, #0x0
    beq .L_1924
    ldrh r0, [r3]
    mov r1, r0, lsl #0x1f
    cmp r2, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    cmpeq lr, r0, lsr #0x1b
    moveq ip, #0x1
    beq .L_1934
.L_1924:
    add r4, r4, #0x1
    cmp r4, #0x2
    add r3, r3, #0x2
    blt .L_18f8
.L_1934:
    cmp ip, #0x0
    beq .L_19e8
    cmp r4, #0x0
    moveq r6, #0x1
    movne r6, #0x2
    mov r0, #0x14
    bl func_020221f8
    orr r1, r6, r0
    mov r0, #0x14
    bl func_020221e0
    str r4, [r5, #0xd58]
    mov r0, #0x1
    str r0, [r5, #0xd3c]
    str r0, [r5, #0xc60]
    mov r0, #0x0
    str r0, [r5, #0xc64]
    b .L_19e8
.L_1978:
    ldr r0, [r5, #0xc64]
    cmp r0, #0x18
    bne .L_1998
    mov r0, #0x44
    sub r1, r0, #0x45
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_1998:
    ldr r0, [r5, #0xd58]
    add r0, r5, r0, lsl #0x2
    ldr r0, [r0, #0xd50]
    bl func_02021584
    cmp r0, #0x0
    bne .L_19e8
    mov r0, #0x2
    str r0, [r5, #0xc60]
    mov r0, #0x0
    str r0, [r5, #0xc64]
    b .L_19e8
.L_19c4:
    mov r0, #0x0
    str r0, [r5, #0xd3c]
    str r0, [r5, #0xd44]
    str r0, [r5, #0xcf8]
    mov r1, #0xc
    str r1, [r5, #0xcc8]
    add sp, sp, #0x4
    str r0, [r5, #0xc54]
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_19e8:
    ldr r1, [r5, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r5, #0xc64]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
