; func_0207e2ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207e2ec
        .arm
func_0207e2ec:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    ldr r1, [r0, #0x4]
    mov r6, #0x0
    add r1, r1, r0
    str r1, [r0, #0x4]
    ldr r1, [r0, #0x8]
    add r1, r1, r0
    str r1, [r0, #0x8]
    ldr r1, [r0, #0xc]
    add r1, r1, r0
    str r1, [r0, #0xc]
    ldrh r1, [r0]
    ldr r4, [r0, #0x4]
    ldr lr, [r0, #0x8]
    cmp r1, #0x0
    ldr ip, [r0, #0xc]
    bls .L_b0
    mov r1, r6
.L_4c:
    add r2, r4, r6, lsl #0x4
    ldr r5, [r2, #0xc]
    mov r3, r6, lsl #0x4
    add r5, lr, r5
    str r5, [r2, #0xc]
    ldrh r7, [r4, r3]
    mov r5, r1
    cmp r7, #0x0
    bls .L_98
.L_70:
    ldr r9, [r2, #0xc]
    add r7, r5, #0x1
    ldr r8, [r9, r5, lsl #0x3]
    mov r7, r7, lsl #0x10
    add r8, ip, r8
    str r8, [r9, r5, lsl #0x3]
    ldrh r8, [r4, r3]
    mov r5, r7, lsr #0x10
    cmp r5, r8
    bcc .L_70
.L_98:
    add r2, r6, #0x1
    mov r2, r2, lsl #0x10
    ldrh r3, [r0]
    mov r6, r2, lsr #0x10
    cmp r6, r3
    bcc .L_4c
.L_b0:
    ldr r1, [r0, #0x14]
    cmp r1, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    add r1, r1, r0
    str r1, [r0, #0x14]
    ldr r1, [r0, #0x14]
    mov ip, #0x0
    add r2, r1, #0x8
    ldr r0, [r2, #0x4]
    add r0, r0, r2
    str r0, [r2, #0x4]
    ldrh r0, [r1, #0x8]
    cmp r0, #0x0
    addls sp, sp, #0x4
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, pc}
    mov r0, ip
    mov r6, ip
.L_f8:
    ldr r5, [r2, #0x4]
    mov r3, r6
    add r1, r5, r0
    ldr r4, [r1, #0x4]
    add r4, r4, r2
    str r4, [r1, #0x4]
    ldr r4, [r1, #0x8]
    add r4, r4, r2
    str r4, [r1, #0x8]
    ldrh r4, [r5, r0]
    cmp r4, #0x0
    bls .L_150
    mov r7, r6
.L_12c:
    ldr r5, [r1, #0x8]
    add r3, r3, #0x1
    ldr r4, [r5, r7]
    add r4, r4, r2
    str r4, [r5, r7]
    ldrh r4, [r1]
    add r7, r7, #0x4
    cmp r3, r4
    bcc .L_12c
.L_150:
    ldrh r1, [r2]
    add ip, ip, #0x1
    add r0, r0, #0xc
    cmp ip, r1
    bcc .L_f8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
