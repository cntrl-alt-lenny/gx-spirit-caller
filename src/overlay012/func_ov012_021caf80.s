; func_ov012_021caf80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov000_021ac760
        .extern func_ov012_021caea8
        .global func_ov012_021caf80
        .arm
func_ov012_021caf80:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r0, [r5]
    mov r4, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x17
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x8]
    ldr r0, [r5]
    mov r0, r0, lsl #0x7
    mov r0, r0, lsr #0x17
    mov r0, r0, lsl #0xc
    str r0, [sp, #0xc]
    ldr r0, [r5]
    mov r0, r0, lsl #0x19
    mov r0, r0, lsr #0x1c
    cmp r0, #0x1
    mov r0, r5
    moveq r4, #0x1
    bl func_ov000_021ac760
    cmp r0, #0x0
    mov r2, #0x2
    mov r3, #0x10
    beq .L_94
    add r1, sp, #0x8
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r0, [r5, #0x4]
    mov r1, r0
    mov r0, r0, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    mov r1, r1, asr #0x18
    bl func_ov012_021caea8
    b .L_fc
.L_94:
    cmp r4, #0x0
    beq .L_d4
    ldr r1, [sp, #0xc]
    add r0, sp, #0x8
    add r1, r1, #0x1000
    str r1, [sp, #0xc]
    str r0, [sp]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r5, #0x4]
    mov r1, r0
    mov r0, r0, lsl #0x8
    mov r0, r0, lsr #0x18
    mov r1, r1, asr #0x18
    bl func_ov012_021caea8
    b .L_fc
.L_d4:
    add r1, sp, #0x8
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r0, [r5, #0x4]
    mov r1, r0
    mov r0, r0, lsl #0x8
    mov r0, r0, lsr #0x18
    mov r1, r1, asr #0x18
    bl func_ov012_021caea8
.L_fc:
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
