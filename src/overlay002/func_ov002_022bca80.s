; func_ov002_022bca80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ccc48
        .extern data_ov002_022ccfd8
        .extern data_ov002_022d0f2c
        .extern data_ov002_022d1af8
        .extern data_ov002_022d28fc
        .extern func_02037208
        .extern func_02037dc0
        .extern func_020a978c
        .extern func_ov002_022bdb88
        .global func_ov002_022bca80
        .arm
func_ov002_022bca80:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r0, [r4, #0xc60]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_a0c
    b .L_800
    b .L_81c
    b .L_8c8
    b .L_988
    b .L_9c8
    b .L_9e8
.L_800:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x4]
    mov r0, #0x1
    str r0, [r4, #0xc60]
    str r1, [r4, #0xc64]
    b .L_a0c
.L_81c:
    ldr r0, [r4, #0xc64]
    cmp r0, #0x8
    bne .L_83c
    ldr r0, _LIT1
    mov r1, #0x0
    ldr r0, [r0, #0xd8]
    mov r2, #0x1e
    bl func_02037dc0
.L_83c:
    ldr r0, [r4, #0xc64]
    cmp r0, #0x27
    bne .L_85c
    mov r0, #0x2d
    sub r1, r0, #0x2e
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_85c:
    ldr r0, [r4, #0xc64]
    cmp r0, #0x2d
    blt .L_a0c
    mov r2, #0x0
    ldr r0, _LIT2
    mov r3, r2
    mov r1, #0x15
    str r2, [sp]
    bl func_ov002_022bdb88
    add r0, r4, #0x124
    ldr r6, _LIT3
    ldr r5, _LIT4
    add r8, r0, #0x800
    mov r7, #0x0
.L_894:
    ldr r2, [r5, r7, lsl #0x2]
    mov r0, r8
    mov r1, r6
    bl func_020a978c
    add r7, r7, #0x1
    cmp r7, #0x5
    add r8, r8, #0x28
    blt .L_894
    mov r0, #0x2
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_a0c
.L_8c8:
    ldr r0, [r4, #0xc64]
    ldr r5, _LIT2
    cmp r0, #0x37
    cmpne r0, #0x46
    cmpne r0, #0x55
    cmpne r0, #0x64
    cmpne r0, #0x73
    bne .L_8fc
    mov r0, #0x52
    sub r1, r0, #0x53
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_8fc:
    ldr r0, [r4, #0xc64]
    cmp r0, #0xbe
    bne .L_91c
    mov r0, #0x50
    sub r1, r0, #0x51
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_91c:
    mov r2, r5
    mov r1, #0x0
.L_924:
    ldr r0, [r2]
    cmp r0, #0x0
    beq .L_940
    ldr r0, [r2, #0x4]
    cmp r0, #0x15
    moveq r0, #0x1
    beq .L_954
.L_940:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r2, r2, #0x8
    blt .L_924
    mov r0, #0x0
.L_954:
    cmp r0, #0x0
    bne .L_a0c
    mov r2, #0x0
    mov r0, r5
    mov r3, r2
    mov r1, #0x16
    str r2, [sp]
    bl func_ov002_022bdb88
    mov r0, #0x3
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_a0c
.L_988:
    ldr r0, [r4, #0xc64]
    cmp r0, #0xe1
    bne .L_9a8
    mov r0, #0x51
    sub r1, r0, #0x52
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_9a8:
    ldr r0, [r4, #0xc64]
    cmp r0, #0x12c
    blt .L_a0c
    mov r0, #0x4
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_a0c
.L_9c8:
    ldr r0, [r4, #0xc64]
    cmp r0, #0xf
    blt .L_a0c
    mov r0, #0x5
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_a0c
.L_9e8:
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0x4]
    mov r0, #0xc
    str r0, [r4, #0xcc8]
    mov r0, #0x0
    add sp, sp, #0x4
    str r0, [r4, #0xc54]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_a0c:
    ldr r1, [r4, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4, #0xc64]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022d1af8
_LIT1: .word data_ov002_022d0f2c
_LIT2: .word data_ov002_022d28fc
_LIT3: .word data_ov002_022ccfd8
_LIT4: .word data_ov002_022ccc48
