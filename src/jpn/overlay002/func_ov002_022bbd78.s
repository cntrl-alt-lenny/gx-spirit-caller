; func_ov002_022bbd78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d1330
        .extern data_ov002_022d1a18
        .extern data_ov002_022d281c
        .extern func_020371b8
        .extern func_ov002_022a61e8
        .extern func_ov002_022bda78
        .global func_ov002_022bbd78
        .arm
func_ov002_022bbd78:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r7, r0
    ldr r0, [r7, #0xc60]
    cmp r0, #0x0
    beq .L_2c
    cmp r0, #0x1
    beq .L_12c
    cmp r0, #0x2
    beq .L_1e8
    b .L_20c
.L_2c:
    ldr r0, [r7, #0xc64]
    cmp r0, #0xf
    blt .L_20c
    ldr r2, [r7, #0xc58]
    mov r0, r2, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, r2, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    and r6, r0, #0xff
    add r0, r7, #0xc00
    ldrh ip, [r0, #0x68]
    and r4, r1, #0xff
    mov r1, r1, asr #0x8
    and r5, r1, #0xff
    mov r1, ip, lsl #0x1f
    mov r2, ip, lsl #0x1a
    mov r3, ip, lsl #0x12
    cmp r4, #0x63
    movgt r4, #0x63
    cmp r6, #0x63
    ldr r0, _LIT0
    mov r1, r1, lsr #0x1f
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x18
    movgt r6, #0x63
    movgt r4, #0x0
    strh ip, [sp, #0x4]
    bl func_ov002_022a61e8
    ldrh r1, [r0, #0xa]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x1f
    movne r2, #0x200
    moveq r2, #0x0
    cmp r5, #0x0
    movne r1, #0x100
    moveq r1, #0x0
    orr r1, r4, r1
    ldr r5, [r7, #0xd0c]
    mov r4, #0x0
    cmp r5, #0x2
    moveq r3, #0x400
    movne r3, #0x0
    orr r1, r1, r2
    orr r2, r3, r1
    mov r1, r6, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r1, lsr #0x10
    mov r1, r2, lsr #0x10
    orr r2, r1, r3, lsl #0x10
    cmp r5, #0x0
    moveq r1, #0xf
    movne r1, #0x3f
    add r3, r7, #0xc80
    str r4, [sp]
    bl func_ov002_022bda78
    ldr r0, _LIT2
    mov r1, r4
    str r1, [r0, #0x4]
    mov r0, #0x1
    str r0, [r7, #0xc60]
    str r1, [r7, #0xc64]
    b .L_20c
.L_12c:
    ldr r0, [r7, #0xc58]
    ldr r4, _LIT1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    tst r0, #0xff
    ldr r0, [r7, #0xc64]
    beq .L_16c
    cmp r0, #0x1b
    bne .L_188
    mov r0, #0x58
    sub r1, r0, #0x59
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_188
.L_16c:
    cmp r0, #0x48
    bne .L_188
    mov r0, #0x59
    sub r1, r0, #0x5a
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_188:
    ldr r0, [r7, #0xd0c]
    mov r1, #0x0
    cmp r0, #0x0
    moveq r2, #0xf
    movne r2, #0x3f
.L_19c:
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_1b8
    ldr r0, [r4, #0x4]
    cmp r0, r2
    moveq r0, #0x1
    beq .L_1cc
.L_1b8:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r4, r4, #0x8
    blt .L_19c
    mov r0, #0x0
.L_1cc:
    cmp r0, #0x0
    bne .L_20c
    mov r0, #0x2
    str r0, [r7, #0xc60]
    mov r0, #0x0
    str r0, [r7, #0xc64]
    b .L_20c
.L_1e8:
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0x4]
    mov r0, #0xc
    str r0, [r7, #0xcc8]
    mov r0, #0x0
    add sp, sp, #0x8
    str r0, [r7, #0xc54]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_20c:
    ldr r1, [r7, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r7, #0xc64]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022d1330
_LIT1: .word data_ov002_022d281c
_LIT2: .word data_ov002_022d1a18
