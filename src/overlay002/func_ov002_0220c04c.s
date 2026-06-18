; func_ov002_0220c04c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_022020e0
        .global func_ov002_0220c04c
        .arm
func_ov002_0220c04c:
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x2]
    mov r3, r2, lsl #0x14
    mov r3, r3, lsr #0x1a
    cmp r3, #0x16
    bne .L_64
    ldr r3, [r0, #0x14]
    mov r2, r2, lsl #0x1f
    mov ip, r3, lsl #0x16
    mov ip, ip, lsr #0x1f
    cmp ip, r2, lsr #0x1f
    bne .L_64
    mov r2, r3, lsl #0x12
    mov r2, r2, lsr #0x1c
    cmp r2, #0x4
    bhi .L_64
    mov r2, r3, lsl #0x10
    movs r2, r2, lsr #0x1f
    beq .L_64
    mov r2, r3, lsl #0x9
    mov r2, r2, lsr #0x1c
    cmp r2, #0xe
    bne .L_64
    bl func_ov002_022020e0
    ldmia sp!, {r3, pc}
.L_64:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
