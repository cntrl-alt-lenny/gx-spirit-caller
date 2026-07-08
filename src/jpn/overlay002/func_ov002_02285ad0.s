; func_ov002_02285ad0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd444
        .extern data_ov002_022cf08c
        .extern func_ov002_02259e8c
        .extern func_ov002_0228376c
        .extern func_ov002_02284a2c
        .global func_ov002_02285ad0
        .arm
func_ov002_02285ad0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r0, _LIT0
    ldr r1, _LIT1
    and r2, sl, #0x1
    mla r9, r2, r0, r1
    mov r8, #0x0
    ldr r1, _LIT2
    mov r4, r8
    str r8, [r1, #0x1d0]
    mov r5, r9
    str r8, [r1, #0x1d4]
    mov r2, r8
.L_34:
    ldr r3, [r5, #0x40]
    add r0, r1, r4, lsl #0x2
    bic r3, r3, #0x400000
    add r4, r4, #0x1
    bic r3, r3, #0x800000
    str r3, [r5, #0x40]
    str r2, [r0, #0x1e4]
    cmp r4, #0x5
    add r5, r5, #0x14
    blt .L_34
    mov r0, sl
    bl func_ov002_02259e8c
    cmp r0, #0x0
    beq .L_174
    mov r0, sl
    bl func_ov002_0228376c
    mov r0, sl
    mvn r1, #0x0
    bl func_ov002_02284a2c
    cmp r0, #0x0
    beq .L_174
    rsb r1, sl, #0x1
    ldr r2, _LIT1
    ldr r0, _LIT0
    and r1, r1, #0x1
    mla r0, r1, r0, r2
    ldr r5, _LIT2
    add r7, r9, #0x30
    add r6, r0, #0x30
    mov fp, #0x1
    mvn r4, #0x0
.L_b0:
    ldr r1, [r5, #0x200]
    mov r0, #0x14
    mla r0, r1, r0, r9
    ldr r1, [r0, #0x40]
    mov r1, r1, lsr #0x16
    tst r1, #0x1
    movne r2, #0x17
    ldr r1, [r0, #0x40]
    moveq r2, #0x16
    orr r1, r1, fp, lsl r2
    str r1, [r0, #0x40]
    ldr r0, [r5, #0x208]
    cmp r0, #0x0
    beq .L_10c
    ldr r1, [r5, #0x200]
    mov r0, #0x14
    mul r2, r1, r0
    ldr r0, [r7, r2]
    and r0, r0, r4, lsl #0xd
    str r0, [r7, r2]
    ldr r0, [r5, #0x1d0]
    add r0, r0, #0x1
    str r0, [r5, #0x1d0]
.L_10c:
    ldr r0, [r5, #0x20c]
    cmp r0, #0x0
    beq .L_13c
    ldr r1, [r5, #0x204]
    mov r0, #0x14
    mul r2, r1, r0
    ldr r0, [r6, r2]
    and r0, r0, r4, lsl #0xd
    str r0, [r6, r2]
    ldr r0, [r5, #0x1d4]
    add r0, r0, #0x1
    str r0, [r5, #0x1d4]
.L_13c:
    ldr r1, [r5, #0x214]
    ldr r0, [r5, #0x200]
    add r1, r1, #0x1
    add r0, r5, r0, lsl #0x2
    str r1, [r0, #0x1e4]
    ldr r1, [r5, #0x214]
    mov r0, sl
    add r8, r8, r1
    bl func_ov002_0228376c
    mov r0, sl
    mov r1, r4
    bl func_ov002_02284a2c
    cmp r0, #0x0
    bne .L_b0
.L_174:
    mov r0, r8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cd444
