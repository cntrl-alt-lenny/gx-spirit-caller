; func_ov004_021d9134 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern func_02005b38
        .extern func_02005dac
        .extern func_02006110
        .extern func_020061ac
        .extern func_0208b0f0
        .extern func_020944a4
        .global func_ov004_021d9134
        .arm
func_ov004_021d9134:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x20
    ldr r1, [r0, #0xc]
    ldr r2, [r0]
    rsb r1, r1, #0xc0
    add r1, r1, r1, lsr #0x1f
    mov r1, r1, asr #0x1
    ldr r3, [r0, #0x10]
    sub r1, r1, #0x8
    cmp r2, #0x2
    add r4, r3, r1
    mov r8, #0x38
    bne .L_6e0
    ldr r1, [r0, #0x18]
    ldr r6, [r0, #0x8]
    and r1, r1, #0xf
    sub r0, r1, #0x2
    cmp r0, #0x1
    bhi .L_5c8
    cmp r1, #0x3
    bne .L_488
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    cmp r0, #0x1
    movhi r9, #0x1
    bhi .L_48c
.L_488:
    mov r9, #0x0
.L_48c:
    cmp r9, #0x0
    movne r8, #0x4c
    add r0, r8, r8, lsr #0x1f
    mov r2, r0, asr #0x1
    add r0, sp, #0xc
    add r1, sp, #0x8
    rsb r6, r2, #0x80
    add r5, r4, #0x5
    bl func_02006110
    ldr r2, [sp, #0xc]
    mov r7, #0x0
    cmp r2, r6
    ldrge r1, [sp, #0x8]
    cmpge r1, r5
    blt .L_4dc
    add r0, r6, r8
    cmp r2, r0
    addlt r0, r5, #0x18
    cmplt r1, r0
    movlt r7, #0x1
.L_4dc:
    mov r5, #0x400
    bl func_020061ac
    cmp r0, #0x0
    cmpne r7, #0x0
    movne r5, #0x800
    sub r0, r4, #0x2
    and r1, r0, #0xff
    mov r0, r5, asr #0x6
    sub r2, r6, #0x4
    orr r1, r1, #0x4000
    add r0, r5, r0, lsr #0x19
    mov r0, r0, asr #0x7
    orr r0, r0, #0x400
    mov r2, r2, lsl #0x17
    orr r1, r1, #-1073741824
    orr r1, r1, r2, lsr #0x7
    str r1, [sp]
    strh r0, [sp, #0x4]
    cmp r9, #0x0
    beq .L_5a8
    ldr r1, _LIT1
    add r0, sp, #0x10
    mov r2, #0x1000
    bl func_0208b0f0
    mov r0, #0x2
    mov r1, #0x1f
    bl func_02005b38
    ldr r1, [sp, #0x10]
    sub r2, r4, #0x12
    mov r1, r1, asr #0x4
    strh r1, [r0, #0x6]
    ldr r3, [sp, #0x14]
    ldr r1, _LIT2
    mov r3, r3, asr #0x4
    strh r3, [r0, #0xe]
    ldr r4, [sp, #0x18]
    and r3, r2, #0xff
    mov r2, r4, asr #0x4
    strh r2, [r0, #0x16]
    ldr r4, [sp, #0x1c]
    ldr r2, _LIT3
    mov r4, r4, asr #0x4
    strh r4, [r0, #0x1e]
    ldr r0, [sp]
    and r0, r0, r1
    orr r0, r0, r3
    orr r0, r0, #0x400000
    and r0, r0, r2
    orr r0, r0, #0x300
    orr r0, r0, #0x3e000000
    str r0, [sp]
.L_5a8:
    mov r0, #0x2
    mov r1, #0x0
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x6
    bl func_020944a4
    b .L_6e0
.L_5c8:
    cmp r1, #0x4
    bne .L_6e0
    add r0, sp, #0xc
    add r1, sp, #0x8
    add r9, r4, #0x5
    bl func_02006110
    sub r0, r4, #0x2
    and r0, r0, #0xff
    orr fp, r0, #0x4000
    mov r5, #0x0
    mov r7, r5
    orr fp, fp, #-1073741824
    add r4, r9, #0x18
.L_5fc:
    cmp r6, #0x0
    mov r8, #0x0
    beq .L_64c
    ldr r1, [sp, #0xc]
    cmp r1, #0xa0
    ldrge r0, [sp, #0x8]
    cmpge r0, r9
    blt .L_628
    cmp r1, #0xd8
    cmplt r0, r4
    movlt r8, #0x1
.L_628:
    add r0, r7, r7, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb sl, r0, #0x400
    bl func_020061ac
    cmp r0, #0x0
    cmpne r8, #0x0
    movne sl, #0x800
    mov r0, #0x9c
    b .L_68c
.L_64c:
    ldr r1, [sp, #0xc]
    cmp r1, #0x30
    ldrge r0, [sp, #0x8]
    cmpge r0, r9
    blt .L_66c
    cmp r1, #0x68
    cmplt r0, r4
    movlt r8, #0x1
.L_66c:
    add r0, r7, r7, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb sl, r0, #0x400
    bl func_020061ac
    cmp r0, #0x0
    cmpne r8, #0x0
    movne sl, #0x800
    mov r0, #0x2c
.L_68c:
    sub r0, r0, #0x4
    mov r0, r0, lsl #0x17
    orr r0, fp, r0, lsr #0x7
    str r0, [sp]
    mov r0, sl, asr #0x6
    add r0, sl, r0, lsr #0x19
    mov r0, r0, asr #0x7
    orr r0, r0, #0x400
    strh r0, [sp, #0x4]
    mov r0, #0x2
    mov r1, #0x0
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x6
    bl func_020944a4
    add r5, r5, #0x1
    rsb r6, r6, #0x1
    add r7, r7, #0x800
    cmp r5, #0x2
    blt .L_5fc
.L_6e0:
    mov r0, #0x1
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02104f4c
_LIT1: .word 0x00000bbb
_LIT2: .word 0xfe00ff00
_LIT3: .word 0xc1fffcff
