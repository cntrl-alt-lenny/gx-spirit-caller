; func_ov002_02254d94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021d90c0
        .extern func_ov002_021df62c
        .extern func_ov002_021df938
        .global func_ov002_02254d94
        .arm
func_ov002_02254d94:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r8, #0x0
    str r8, [sp]
.L_c:
    ldr r6, _LIT0
    ldr r0, [sp]
    ldr r3, [r6, #0xcec]
    ldr r2, _LIT1
    eor r9, r3, r0
    ldr r1, _LIT2
    and r0, r9, #0x1
    mla r1, r0, r1, r2
    ldr r7, _LIT3
    add r4, r1, #0x94
    add r5, r1, #0x64
    mov sl, #0x5
    mov fp, #0x12c
.L_40:
    ldr r0, [r4]
    mov r0, r0, lsl #0x13
    cmp r7, r0, lsr #0x13
    bne .L_128
    ldr r0, [r5, #0x3c]
    cmp r0, #0x0
    beq .L_128
    mov r0, r9
    mov r1, sl
    mov r2, #0x0
    bl func_ov002_021d90c0
    ldr r1, [r5, #0x40]
    ldrh r2, [r5, #0x38]
    mov r0, r1, lsr #0x6
    and r0, r0, #0x1
    mvn r0, r0
    and r0, r2, r0
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_128
    ldr r3, [r4]
    ldr r8, [r6, #0xcec]
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r0, r9
    mov r1, sl
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df62c
    ldr r3, [r5, #0x3c]
    mov r1, r8, lsl #0x3
    mov r1, r3, lsr r1
    and r3, r1, #0xff
    mul r1, r3, fp
    cmp r8, r9
    movne r2, #0x1
    moveq r2, #0x0
    mov r0, r8
    mov r3, r7
    bl func_ov002_021df938
    eor r8, r8, #0x1
    cmp r8, r9
    movne r2, #0x1
    mov r0, r8
    mov r1, r8, lsl #0x3
    ldr r8, [r5, #0x3c]
    moveq r2, #0x0
    mov r1, r8, lsr r1
    and r8, r1, #0xff
    mov r1, #0x12c
    mul r1, r8, r1
    mov r3, r7
    bl func_ov002_021df938
    mov r8, #0x1
.L_128:
    add r4, r4, #0x14
    add r5, r5, #0x14
    add sl, sl, #0x1
    cmp sl, #0xa
    blt .L_40
    ldr r0, [sp]
    add r0, r0, #0x1
    str r0, [sp]
    cmp r0, #0x2
    blt .L_c
    mov r0, r8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
_LIT3: .word 0x00001361
