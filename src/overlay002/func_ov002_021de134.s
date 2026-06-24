; func_ov002_021de134 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_0202e2c8
        .extern func_ov002_021b30ac
        .extern func_ov002_021b3ecc
        .extern func_ov002_021ca51c
        .extern func_ov002_021dbf14
        .extern func_ov002_021dbf98
        .extern func_ov002_021dd950
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_021fe3d4
        .global func_ov002_021de134
        .arm
func_ov002_021de134:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x18
    ldr r6, _LIT0
    mov fp, r3
    mov r5, r0
    ldr r0, [r6, #0xd4]
    mov r4, r2
    ands r7, fp, #0x2
    movne r3, #0x1
    str r0, [sp, #0x10]
    moveq r3, #0x0
    mov r0, r5
    mov r2, r4
    bl func_ov002_021dbf14
    mov r8, r0
    cmp r7, #0x0
    mov r9, #0x0
    beq .L_8e8
    str r9, [sp, #0x14]
.L_830:
    ldr r0, _LIT0
    mov r7, #0x0
    ldr r1, [r0, #0xcec]
    ldr r0, [sp, #0x14]
    eor r6, r1, r0
    mov sl, r6, lsl #0x4
    str sl, [sp, #0xc]
.L_84c:
    mov r0, #0x1
    tst r8, r0, lsl sl
    beq .L_874
    ldr r2, _LIT1
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b30ac
    cmp r0, #0x0
    movne r0, #0x1
    orrne r9, r9, r0, lsl sl
.L_874:
    add sl, sl, #0x1
    add r7, r7, #0x1
    cmp r7, #0x4
    ble .L_84c
    ldrh r0, [r5]
    cmp r0, #0x0
    beq .L_8d4
    ldr r0, [sp, #0xc]
    mov sl, #0x5
    add r7, r0, #0x5
.L_89c:
    mov r0, #0x1
    tst r8, r0, lsl r7
    beq .L_8c4
    ldr r2, _LIT2
    mov r0, r6
    mov r1, sl
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x1
    orrne r9, r9, r0, lsl r7
.L_8c4:
    add r7, r7, #0x1
    add sl, sl, #0x1
    cmp sl, #0xa
    ble .L_89c
.L_8d4:
    ldr r0, [sp, #0x14]
    add r0, r0, #0x1
    str r0, [sp, #0x14]
    cmp r0, #0x2
    blt .L_830
.L_8e8:
    mov r0, #0x0
    str r0, [sp, #0x4]
.L_8f0:
    ldr r0, _LIT0
    mov sl, #0x0
    ldr r1, [r0, #0xcec]
    ldr r0, [sp, #0x4]
    eor r7, r1, r0
    mov r6, r7, lsl #0x4
.L_908:
    mov r0, #0x1
    tst r8, r0, lsl r6
    beq .L_940
    ldrh r0, [r5, #0x2]
    mov r1, sl
    mov r2, fp
    mov r0, r0, lsl #0x1f
    cmp r7, r0, lsr #0x1f
    movne r0, #0x1
    moveq r0, #0x0
    str r0, [sp]
    ldrh r3, [r5]
    mov r0, r7
    bl func_ov002_021dbf98
.L_940:
    add r6, r6, #0x1
    add sl, sl, #0x1
    cmp sl, #0xa
    ble .L_908
    ldr r0, [sp, #0x4]
    add r0, r0, #0x1
    str r0, [sp, #0x4]
    cmp r0, #0x2
    blt .L_8f0
    ldr r0, _LIT0
    ldr r0, [r0, #0xd4]
    cmp r0, #0x0
    beq .L_a8c
    bl func_ov002_021fe3d4
    bl func_ov002_021ca51c
    ldr r1, _LIT0
    str r0, [r1, #0xd8]
    bl func_ov002_021e2b3c
    ldr r0, [sp, #0x10]
    eor r2, r8, r9
    ldr r1, _LIT0
    orr r0, r0, r2
    str r0, [r1, #0xd4]
    mov r0, #0x0
    str r0, [sp, #0x8]
.L_9a4:
    ldr r0, _LIT0
    ldr r2, _LIT3
    ldr r3, [r0, #0xcec]
    ldr r0, [sp, #0x8]
    ldr r1, _LIT4
    eor r9, r3, r0
    and r0, r9, #0x1
    mla r1, r0, r1, r2
    mov r6, r9, lsl #0x4
    add r7, r1, #0x30
    mov sl, #0x0
.L_9d0:
    mov r0, #0x1
    tst r8, r0, lsl r6
    beq .L_a60
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2c8
    cmp r0, #0x0
    beq .L_a04
    cmp r4, #0xb
    cmpne r4, #0xd
    moveq r2, #0xc
    beq .L_a08
.L_a04:
    mov r2, r4
.L_a08:
    ldr r0, _LIT0
    ldr r1, [r0, #0xd4]
    mov r0, #0x1
    mvn r0, r0, lsl r6
    and r1, r1, r0
    ldr r0, _LIT0
    str r1, [r0, #0xd4]
    ldrh r0, [r5, #0x2]
    ldrh ip, [r5]
    mov r1, r0, lsl #0x1f
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x1f
    eor r0, r0, r1, lsr #0x1f
    cmp r9, r0
    movne r0, #0x1
    moveq r0, #0x0
    add r0, fp, r0
    add r3, r0, #0x10000
    mov r0, r9
    mov r1, sl
    str ip, [sp]
    bl func_ov002_021dd950
.L_a60:
    add r6, r6, #0x1
    add r7, r7, #0x14
    add sl, sl, #0x1
    cmp sl, #0xa
    ble .L_9d0
    ldr r0, [sp, #0x8]
    add r0, r0, #0x1
    str r0, [sp, #0x8]
    cmp r0, #0x2
    blt .L_9a4
    bl func_ov002_021e2c5c
.L_a8c:
    ldr r0, _LIT0
    ldr r1, [r0, #0xd4]
    ldr r0, [sp, #0x10]
    eor r0, r1, r0
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00001825
_LIT2: .word 0x00001513
_LIT3: .word data_ov002_022cf16c
_LIT4: .word 0x00000868
