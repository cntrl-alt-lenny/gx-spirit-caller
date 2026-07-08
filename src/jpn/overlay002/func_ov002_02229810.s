; func_ov002_02229810 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021afa94
        .extern func_ov002_021d7c1c
        .extern func_ov002_021d8198
        .extern func_ov002_021e277c
        .extern func_ov002_022535a4
        .extern func_ov002_0226af64
        .global func_ov002_02229810
        .arm
func_ov002_02229810:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    ldrh r5, [r4, #0xc]
    cmp r0, #0x78
    bgt .L_2c
    bge .L_100
    cmp r0, #0x64
    beq .L_11c
    b .L_134
.L_2c:
    cmp r0, #0x80
    bgt .L_134
    cmp r0, #0x7f
    blt .L_134
    beq .L_b4
    cmp r0, #0x80
    bne .L_134
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022535a4
    cmp r0, #0x0
    bne .L_90
    cmp r5, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x15
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, pc}
.L_90:
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r3, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, #0x6
    bl func_ov002_021af8f0
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_b4:
    cmp r5, #0x1
    bne .L_dc
    bl func_ov002_021afa94
    ldrh r2, [r4, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d8198
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, pc}
.L_dc:
    bl func_ov002_021afa94
    ldrh r1, [r4, #0x2]
    mov r2, r0
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021d7c1c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_100:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226af64
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, pc}
.L_11c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e277c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_134:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
