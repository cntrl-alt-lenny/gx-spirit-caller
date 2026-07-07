; func_ov002_0222f58c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021afa94
        .extern func_ov002_021e19fc
        .extern func_ov002_021e267c
        .extern func_ov002_021e277c
        .extern func_ov002_022535a4
        .global func_ov002_0222f58c
        .arm
func_ov002_0222f58c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7e
    beq .L_8c
    cmp r0, #0x7f
    beq .L_68
    cmp r0, #0x80
    bne .L_104
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022535a4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x5e
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_68:
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, #0x6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af8f0
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_8c:
    bl func_ov002_021afa94
    mov r5, r0
    bl func_ov002_021afa94
    ldr r0, [r0]
    ldr r2, [r5]
    mov r1, r0, lsl #0x2
    ldrh r0, [r4, #0x2]
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r5, r1, r2, lsr #0x1f
    mov r0, r0, lsl #0x1f
    mov r1, r5
    mov r0, r0, lsr #0x1f
    mov r2, #0x0
    bl func_ov002_021e19fc
    mov r0, r5, lsl #0x10
    mov r3, r0, lsr #0x10
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x41
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e267c
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e277c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_104:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
