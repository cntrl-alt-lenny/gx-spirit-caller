; func_ov004_021dc1cc - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).
; Thumb gap-object mode (brief 406 stretch).

        .text
        .extern func_020b3a7c
        .global func_ov004_021dc1cc
        .thumb
func_ov004_021dc1cc:
    push {r4, r5, r6, r7, lr}
    sub sp, #0x14
    str r0, [sp, #0x0]
    str r1, [sp, #0x4]
    str r2, [sp, #0x8]
    str r3, [sp, #0xc]
    ldr r5, [r0, #0x8]
    mov r0, #0x0
    ldr r1, [sp, #0x0]
    str r0, [r1, #0x4]
    ldr r2, [r1, #0x4]
    str r2, [r1, #0x0]
    lsl r2, r3, #0x0
    str r2, [r1, #0xc]
    lsl r1, r3, #0x0
    cmp r1, #0x0
    bls .L_2c
.L_22:
    strb r0, [r5, r0]
    add r0, r0, #0x1
    ldr r1, [sp, #0xc]
    cmp r0, r1
    bcc .L_22
.L_2c:
    mov r1, #0x0
    add r6, r1, #0x0
    add r4, r1, #0x0
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    bls .L_64
    str r1, [sp, #0x10]
.L_3a:
    ldrb r7, [r5, r4]
    ldr r0, [sp, #0x4]
    ldrb r0, [r0, r6]
    add r0, r1, r0
    add r0, r7, r0
    ldr r1, [sp, #0x0]
    ldr r1, [r1, #0xc]
    bl func_020b3a7c
    ldrb r0, [r5, r1]
    strb r7, [r5, r1]
    strb r0, [r5, r4]
    add r6, r6, #0x1
    ldr r0, [sp, #0x8]
    cmp r6, r0
    bcc .L_5c
    ldr r6, [sp, #0x10]
.L_5c:
    add r4, r4, #0x1
    ldr r0, [sp, #0xc]
    cmp r4, r0
    bcc .L_3a
.L_64:
    add sp, #0x14
    pop {r4, r5, r6, r7}
    pop {r3}
    bx r3
