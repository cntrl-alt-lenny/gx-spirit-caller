; func_ov000_021acb78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bee8c
        .extern data_ov000_021c74ac
        .extern func_020193f8
        .extern func_0201e910
        .global func_ov000_021acb78
        .arm
func_ov000_021acb78:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x28
    mov r5, r0
    ldr r1, [r5, #0x98]
    mov r0, r1, lsl #0x4
    movs r0, r0, lsr #0x1f
    addeq sp, sp, #0x28
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r5, #0x80]
    mov r3, r1, lsl #0x14
    add r2, r0, #0x80000
    str r2, [sp, #0x20]
    ldr r1, [r5, #0x84]
    ldr r0, _LIT0
    mov r3, r3, lsr #0x1c
    add r1, r1, #0x60000
    str r1, [sp, #0x24]
    cmp r2, r0
    add r4, r3, r3, lsl #0x1
    addge sp, sp, #0x28
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    rsb r0, r0, #0x100000
    cmp r2, r0
    addle sp, sp, #0x28
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r5, #0x98]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    bl func_020193f8
    cmp r0, #0x0
    beq .L_220
    ldr r3, _LIT1
    ldr r2, _LIT2
    ldrb r7, [r3]
    ldr r6, _LIT3
    ldr r0, [sp, #0x24]
    rsb r8, r7, r7, lsl #0x10
    smull r1, r9, r2, r8
    add r2, r7, #0x1
    add r9, r8, r9
    mov r1, r8, lsr #0x1f
    add r9, r1, r9, asr #0x7
    mov r1, r9, asr #0x4
    mov r1, r1, lsl #0x2
    ldrsh r1, [r6, r1]
    strb r2, [r3]
    add r0, r0, r1, lsl #0x3
    str r0, [sp, #0x24]
.L_220:
    add r9, r4, #0x3
    cmp r4, r9
    addge sp, sp, #0x28
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r8, #0x0
    mov r7, #0x2
    add r6, sp, #0x20
.L_23c:
    add r0, r5, r4, lsl #0x2
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    beq .L_2a4
    str r8, [sp]
    str r8, [sp, #0x4]
    ldr r0, [r5, #0x98]
    mov r3, r4, lsl #0x10
    mov r0, r0, lsl #0x8
    mov r0, r0, lsr #0x1b
    str r0, [sp, #0x8]
    ldr r2, [r5, #0x98]
    mov r0, r7
    mov r2, r2, lsl #0xd
    mov r2, r2, lsr #0x1e
    str r2, [sp, #0xc]
    ldr ip, [r5, #0x78]
    mov r2, r6
    str ip, [sp, #0x10]
    ldr ip, [r5, #0x7c]
    mov r3, r3, lsr #0x10
    str ip, [sp, #0x14]
    str r8, [sp, #0x18]
    str r8, [sp, #0x1c]
    ldr r1, [r1, #0x2c]
    bl func_0201e910
.L_2a4:
    add r4, r4, #0x1
    cmp r4, r9
    blt .L_23c
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x0017f000
_LIT1: .word data_ov000_021c74ac
_LIT2: .word 0x80808081
_LIT3: .word data_020bee8c
