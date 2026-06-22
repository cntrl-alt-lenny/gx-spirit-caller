; func_ov002_02215080 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021bc618
        .extern func_ov002_021ca2b8
        .extern func_ov002_021ca3f0
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_0227ac64
        .global func_ov002_02215080
        .arm
func_ov002_02215080:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca3f0
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT1
    ldr r0, [r0, #0x5a8]
    cmp r0, #0x7e
    beq .L_11c
    cmp r0, #0x7f
    beq .L_98
    cmp r0, #0x80
    bne .L_12c
    bl func_ov002_021e2b3c
    add sp, sp, #0x8
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_98:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x7e
    ldmeqia sp!, {r4, pc}
    mov r2, #0x0
    sub r0, r2, #0x2000
    and r0, r0, #0x0
    add r1, sp, #0x4
    orr r3, r0, #0xf8
    str r2, [r1]
    orr r3, r3, #0x1400
    str r3, [sp, #0x4]
    ldrh r0, [r4, #0x2]
    bic r3, r3, #0x2000
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r0, r0, lsl #0x1f
    orr r0, r3, r0, lsr #0x12
    str r0, [sp, #0x4]
    str r2, [sp]
    ldrh r0, [r4, #0x2]
    mov r3, r2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0227ac64
    add sp, sp, #0x8
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_11c:
    bl func_ov002_021e2c5c
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_12c:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word 0x000014f8
_LIT1: .word data_ov002_022ce288
