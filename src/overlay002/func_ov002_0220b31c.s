; func_ov002_0220b31c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d0250
        .extern func_0202b878
        .extern func_ov002_021bbbc0
        .global func_ov002_0220b31c
        .arm
func_ov002_0220b31c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    cmp r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x1f
    cmpne r0, #0x20
    cmpne r0, #0x21
    bne .L_1b4
    ldr r3, [r5, #0x14]
    ldr r0, _LIT0
    mov r1, r3, lsl #0x16
    mov r2, r1, lsr #0x1f
    ldr r1, _LIT1
    and r4, r2, #0x1
    mla r2, r4, r0, r1
    mov r0, r3, lsl #0x12
    mov r1, r0, lsr #0x1c
    mov r0, #0x14
    mla r0, r1, r0, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_1b4
    mov r1, r3, lsl #0x17
    ldr r0, _LIT2
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b878
    ldr r1, [r5, #0x14]
    mov r4, r0
    mov r0, r1, lsl #0x16
    movs r0, r0, lsr #0x1f
    moveq r0, r1, lsl #0x12
    moveq r2, r0, lsr #0x1c
    mvnne r2, #0x0
    mov r1, r4
    mov r0, #0x0
    bl func_ov002_021bbbc0
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x14]
    mov r1, r0, lsl #0x16
    mov r1, r1, lsr #0x1f
    cmp r1, #0x1
    moveq r0, r0, lsl #0x12
    moveq r2, r0, lsr #0x1c
    mvnne r2, #0x0
    mov r1, r4
    mov r0, #0x1
    bl func_ov002_021bbbc0
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
.L_1b4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022d0250
