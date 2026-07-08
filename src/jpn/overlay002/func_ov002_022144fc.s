; func_ov002_022144fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021afa84
        .extern func_ov002_021afa94
        .extern func_ov002_021d8198
        .extern func_ov002_021e277c
        .extern func_ov002_022535a4
        .extern func_ov002_0226af64
        .global func_ov002_022144fc
        .arm
func_ov002_022144fc:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x64
    bgt .L_20
    beq .L_10c
    b .L_124
.L_20:
    sub r0, r0, #0x78
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_124
    b .L_f0
    b .L_124
    b .L_124
    b .L_124
    b .L_124
    b .L_124
    b .L_d0
    b .L_94
    b .L_54
.L_54:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022535a4
    cmp r0, #0x0
    movne r0, #0x7f
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x15
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x78
    ldmia sp!, {r4, pc}
.L_94:
    ldrh r2, [r4]
    ldr r0, _LIT1
    cmp r2, r0
    bne .L_c0
    ldrh r0, [r4, #0x2]
    mov r1, #0x6
    mov r3, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021af8f0
    b .L_c8
.L_c0:
    mov r0, #0x0
    bl func_ov002_021afa84
.L_c8:
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_d0:
    bl func_ov002_021afa94
    ldrh r2, [r4, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d8198
    mov r0, #0x64
    ldmia sp!, {r4, pc}
.L_f0:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226af64
    mov r0, #0x64
    ldmia sp!, {r4, pc}
.L_10c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e277c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_124:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x0000139d
