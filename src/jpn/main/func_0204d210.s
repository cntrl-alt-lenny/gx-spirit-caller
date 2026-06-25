; func_0204d210 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff8a0
        .extern func_0204987c
        .extern func_0204ea5c
        .extern func_02068944
        .extern func_02068968
        .extern func_020689ac
        .extern func_02068c54
        .extern func_02092fc8
        .global func_0204d210
        .arm
func_0204d210:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r5, r0
    cmp r1, #0x0
    bne .L_33c
    bl func_0204987c
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    bne .L_370
    bl func_0204987c
    ldrh r0, [r0, #0x1a]
    cmp r0, #0x0
    bne .L_370
.L_33c:
    bl func_0204987c
    mov r1, #0x1
    str r1, [r0, #0x1b4]
    bl func_0204987c
    mov r4, r0
    bl func_02092fc8
    str r0, [r4, #0x1b8]
    str r1, [r4, #0x1bc]
    bl func_0204987c
    str r5, [r0, #0xf4]
    add sp, sp, #0x14
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_370:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_3f4
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    mov r1, #0x0
    bl func_02068c54
    mov r6, r0
    bl func_0204987c
    mov r4, r0
    ldr r1, _LIT0
    mov r0, r6
    mov r2, #0x0
    bl func_020689ac
    str r0, [r4, #0xf4]
    bl func_0204987c
    mov r4, r0
    mov r0, r6
    bl func_02068968
    str r0, [r4, #0x24]
    bl func_0204987c
    mov r4, r0
    mov r0, r6
    bl func_02068944
    strh r0, [r4, #0xa4]
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    ldr r0, [r0, #0xf4]
    mov r4, #0x1
    str r0, [r6, #0x1fc]
    b .L_430
.L_3f4:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_40c
    bl func_0204987c
    str r5, [r0, #0xf4]
.L_40c:
    bl func_0204987c
    str r5, [r0, #0x1fc]
    bl func_0204987c
    ldr r0, [r0, #0x1c]
    str r0, [sp, #0xc]
    bl func_0204987c
    ldrh r0, [r0, #0x1a]
    mov r4, #0x3
    str r0, [sp, #0x10]
.L_430:
    bl func_0204987c
    ldr r1, _LIT1
    str r1, [r0, #0x1c0]
    bl func_0204987c
    mov r6, r0
    bl func_02092fc8
    str r0, [r6, #0x1c4]
    str r1, [r6, #0x1c8]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1b4]
    bl func_0204987c
    ldr r0, [r0, #0x200]
    cmp r0, #0x0
    movne r7, #0xb
    moveq r7, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    str r0, [sp, #0x8]
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    add r2, sp, #0x8
    str r2, [sp]
    mov r3, r0
    str r4, [sp, #0x4]
    ldrh r3, [r3, #0xa4]
    ldr r2, [r6, #0x24]
    mov r1, r5
    mov r0, r7
    bl func_0204ea5c
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020ff8a0
_LIT1: .word 0x00001770
