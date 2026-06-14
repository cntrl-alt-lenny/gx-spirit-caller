; func_ov011_021cc4c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov000_021ac760
        .extern func_ov011_021cc424
        .global func_ov011_021cc4c8
        .arm
func_ov011_021cc4c8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldmia r4, {r0, r1}
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x17
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x8]
    ldr r0, [r4]
    mov r2, r1, asr #0x18
    mov r0, r0, lsl #0x7
    mov r0, r0, lsr #0x17
    mov r0, r0, lsl #0xc
    str r0, [sp, #0xc]
    ldr r1, [r4]
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x19
    mov r1, r1, lsr #0x1c
    cmp r1, #0x1
    mov r1, r0, lsr #0x10
    mov r0, #0x0
    moveq r0, #0x1
    add r2, sp, #0x8
    cmp r0, #0x0
    str r2, [sp]
    mov r0, #0x0
    mov r2, #0x2
    beq .L_90
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x4]
    add r1, r1, #0x1
    mov r0, r0, lsl #0x8
    mov r0, r0, lsr #0x18
    mov r3, #0x10
    bl func_ov011_021cc424
    b .L_a8
.L_90:
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x4]
    mov r3, #0x10
    mov r0, r0, lsl #0x8
    mov r0, r0, lsr #0x18
    bl func_ov011_021cc424
.L_a8:
    mov r0, r4
    bl func_ov000_021ac760
    cmp r0, #0x0
    beq .L_f0
    ldr r0, [r4, #0x4]
    mov r4, #0x0
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x18
    movne r1, #0x1
    add r0, sp, #0x8
    str r0, [sp]
    moveq r1, #0x0
    add r0, r1, #0x5
    sub r1, r4, #0x1
    mov r2, #0x2
    mov r3, #0x10
    str r4, [sp, #0x4]
    bl func_ov011_021cc424
.L_f0:
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
