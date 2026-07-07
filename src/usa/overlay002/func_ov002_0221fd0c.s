; func_ov002_0221fd0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021afa94
        .extern func_ov002_021e1780
        .extern func_ov002_021e277c
        .extern func_ov002_02244efc
        .extern func_ov002_022535a4
        .extern func_ov002_0226af64
        .global func_ov002_0221fd0c
        .arm
func_ov002_0221fd0c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    sub r0, r0, #0x7d
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_1040
    b .L_101c
    b .L_1000
    b .L_fbc
    b .L_f60
.L_f60:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022535a4
    cmp r0, #0x0
    ldrh r0, [r4, #0x2]
    bne .L_f9c
    mov r0, r0, lsl #0x1f
    mov r1, #0xd
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_f9c:
    ldrh r2, [r4]
    mov r0, r0, lsl #0x1f
    mov r1, #0x6
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af8f0
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_fbc:
    bl func_ov002_021afa94
    mov r5, r0
    bl func_ov002_021afa94
    ldr r0, [r0]
    ldrh r2, [r4, #0x2]
    mov r0, r0, lsl #0x2
    ldr r1, [r5]
    mov r3, r2, lsl #0x1f
    mov r0, r0, lsr #0x18
    mov r2, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r0, r3, lsr #0x1f
    mov r2, #0x0
    bl func_ov002_021e1780
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, pc}
.L_1000:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226af64
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, pc}
.L_101c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e277c
    mov r0, #0x24
    mov r1, #0x0
    bl func_ov002_02244efc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_1040:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
