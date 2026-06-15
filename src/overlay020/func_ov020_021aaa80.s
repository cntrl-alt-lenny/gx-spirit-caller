; func_ov020_021aaa80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov020_021ae060
        .extern data_ov020_021ae0a8
        .extern func_020944a4
        .extern func_020b3870
        .extern func_ov020_021add24
        .global func_ov020_021aaa80
        .arm
func_ov020_021aaa80:
    stmdb sp!, {r4, r5, r6, lr}
    mov r1, #0x28
    mul r3, r0, r1
    ldr r2, _LIT0
    add r5, r3, #0x18
    ldr r2, [r2, #0x8d0]
    ldr r4, _LIT1
    cmp r2, #0x0
    ble .L_64
    ldr r3, [r4, #0x89c]
    ldr r2, [r4, #0x88c]
    sub r0, r3, r0
    mul r3, r0, r1
    subs r0, r2, #0x1000
    str r0, [r4, #0x88c]
    movmi r0, #0x0
    strmi r0, [r4, #0x88c]
    ldr r6, [r4, #0x88c]
    ldr r1, [r4, #0x888]
    mul r0, r3, r6
    bl func_020b3870
    cmp r6, #0x0
    add r5, r5, r0
    moveq r0, #0x0
    streq r0, [r4, #0x888]
.L_64:
    ldr r0, _LIT2
    rsb r1, r5, #0x0
    and r1, r0, r1, lsl #0x10
    ldr r0, _LIT3
    orr r1, r1, #0x1fc
    str r1, [r0]
    ldr r0, [r4, #0xa50]
    mov r0, r0, lsl #0x17
    movs r0, r0, lsr #0x1f
    bne .L_a0
    ldr r1, _LIT4
    add r0, r4, #0x8a0
    mov r2, #0x20
    bl func_020944a4
    ldmia sp!, {r4, r5, r6, pc}
.L_a0:
    ldr r0, [r4, #0x8c0]
    subs r0, r0, #0x1000
    str r0, [r4, #0x8c0]
    ldrmi r0, [r4, #0x8c4]
    strmi r0, [r4, #0x8c0]
    ldr r1, [r4, #0x8c0]
    mov r0, #0x168
    mul r0, r1, r0
    ldr r1, [r4, #0x8c4]
    bl func_020b3870
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r0, lsl #0x10
    ldr r1, _LIT4
    add r0, r4, #0x8a0
    orr r2, r2, #0x10
    bl func_ov020_021add24
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov020_021ae060
_LIT1: .word data_ov020_021ae0a8
_LIT2: .word 0x01ff0000
_LIT3: .word 0x04000018
_LIT4: .word 0x05000180
