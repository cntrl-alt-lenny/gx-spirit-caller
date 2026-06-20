; func_ov002_02263c64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_0202e2c8
        .extern func_0202ed04
        .extern func_ov002_021b9ecc
        .extern func_ov002_021e30b4
        .global func_ov002_02263c64
        .arm
func_ov002_02263c64:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov fp, r0
    ldr r0, _LIT0
    str r1, [sp]
    ldr r3, [r0, #0xd28]
    cmp r3, #0xa
    bcs .L_150
.L_1c:
    ldr r0, _LIT1
    umull r0, r7, r3, r0
    mov r7, r7, lsr #0x2
    mov r0, #0x5
    umull r1, r2, r0, r7
    ldr r0, _LIT1
    sub r7, r3, r1
    umull r0, r1, r3, r0
    eor r6, fp, r1, lsr #0x2
    ldr r1, _LIT2
    ldr r0, _LIT3
    and r2, r6, #0x1
    mla r9, r2, r1, r0
    mov r0, #0x14
    mul sl, r7, r0
    add r5, r9, #0x30
    ldr r1, [r5, sl]
    mov r0, r6
    mov r1, r1, lsl #0x13
    mov r8, r1, lsr #0x13
    mov r1, r7
    bl func_ov002_021b9ecc
    mov r4, r0
    mov r0, r8
    bl func_0202e2c8
    cmp r0, #0x0
    beq .L_134
    mov r0, r4
    bl func_0202ed04
    cmp r0, #0x0
    beq .L_134
    add r0, r9, sl
    ldr r2, [r0, #0x40]
    ldrh r1, [r0, #0x38]
    mov r0, r2, lsr #0x6
    and r0, r0, #0x1
    mvn r0, r0
    and r1, r1, r0
    mov r0, r2, lsr #0x2
    orr r0, r0, r2, lsr #0x1
    and r0, r0, #0x1
    mvn r0, r0
    tst r1, r0
    beq .L_134
    ldr r1, [r5, sl]
    mov r2, r6, lsl #0x1f
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    and r3, r2, #-2147483648
    mov r2, r7, lsl #0x10
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    mov r1, r0, lsl #0x10
    orr r3, r3, #0xa200000
    and r2, r2, #0x1f0000
    orr r3, r3, r2
    mov r0, r4, lsl #0x10
    ldr r2, [sp]
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
    cmp r0, #0x0
    beq .L_134
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd28]
    add r2, r2, #0x1
    str r2, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_134:
    ldr r0, _LIT0
    ldr r0, [r0, #0xd28]
    add r3, r0, #0x1
    ldr r0, _LIT0
    cmp r3, #0xa
    str r3, [r0, #0xd28]
    bcc .L_1c
.L_150:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0xcccccccd
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf16c
