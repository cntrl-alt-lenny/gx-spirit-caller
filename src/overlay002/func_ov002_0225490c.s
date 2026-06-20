; func_ov002_0225490c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021d90c0
        .extern func_ov002_021df62c
        .extern func_ov002_021df938
        .global func_ov002_0225490c
        .arm
func_ov002_0225490c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r5, #0x0
    str r5, [sp]
.L_7c4:
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr r3, [r0, #0xcec]
    ldr r0, [sp]
    ldr r1, _LIT2
    eor r6, r3, r0
    and r0, r6, #0x1
    mla r1, r0, r1, r2
    ldr r4, _LIT3
    add r8, r1, #0x94
    add r9, r1, #0x64
    rsb sl, r6, #0x1
    mov r7, #0x5
    mov fp, #0x1f4
.L_7fc:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    cmp r4, r0, lsr #0x13
    bne .L_898
    ldr r0, [r9, #0x3c]
    cmp r0, #0x0
    beq .L_898
    mov r0, r6
    mov r1, r7
    mov r2, #0x0
    bl func_ov002_021d90c0
    ldr r1, [r9, #0x40]
    ldrh r2, [r9, #0x38]
    mov r0, r1, lsr #0x6
    and r0, r0, #0x1
    mvn r0, r0
    and r0, r2, r0
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_898
    ldr r2, [r8]
    mov r0, r6
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r2, r1, r2, lsr #0x1f
    mov r1, r7
    bl func_ov002_021df62c
    ldr r3, [r9, #0x3c]
    mov r0, sl
    mul r1, r3, fp
    mov r2, #0x1
    mov r3, r4
    bl func_ov002_021df938
    mov r5, #0x1
.L_898:
    add r7, r7, #0x1
    cmp r7, #0xa
    add r8, r8, #0x14
    add r9, r9, #0x14
    blt .L_7fc
    ldr r0, [sp]
    add r0, r0, #0x1
    str r0, [sp]
    cmp r0, #0x2
    blt .L_7c4
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
_LIT3: .word 0x00001306
