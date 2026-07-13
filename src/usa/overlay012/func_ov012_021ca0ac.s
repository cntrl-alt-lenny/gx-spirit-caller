; func_ov012_021ca0ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov012_021cbf8c
        .extern data_ov012_021cbfc4
        .extern data_ov012_021cc5c0
        .extern data_ov012_021cc5fc
        .extern func_ov012_021cadc8
        .global func_ov012_021ca0ac
        .arm
func_ov012_021ca0ac:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x24
    ldr r0, _LIT0
    ldr r5, _LIT1
    add r4, sp, #0x16
    mov r3, #0x6
.L_418:
    ldrb r2, [r5]
    ldrb r1, [r5, #0x1]
    add r5, r5, #0x2
    strb r2, [r4]
    strb r1, [r4, #0x1]
    add r4, r4, #0x2
    subs r3, r3, #0x1
    bne .L_418
    ldr r2, _LIT2
    ldr r1, _LIT3
    ldrb r5, [r2, #0x24]
    ldr r1, [r1, #0x19c]
    ldrb r4, [r2, #0x25]
    ldrb lr, [r2, #0x26]
    ldrb ip, [r2, #0x27]
    ldrb r3, [r2, #0x28]
    ldrb r2, [r2, #0x29]
    mov r1, r1, lsl #0x1c
    movs r1, r1, lsr #0x1c
    strb r5, [sp, #0x10]
    strb r4, [sp, #0x11]
    strb lr, [sp, #0x12]
    strb ip, [sp, #0x13]
    strb r3, [sp, #0x14]
    strb r2, [sp, #0x15]
    addeq sp, sp, #0x24
    sub r1, r1, #0x1
    ldmeqia sp!, {r4, r5, pc}
    ldr r3, [r0, #0x164]
    mov r2, r3, lsl #0x18
    movs r2, r2, lsr #0x18
    addeq sp, sp, #0x24
    ldmeqia sp!, {r4, r5, pc}
    cmp r2, #0xff
    bcs .L_4b8
    add r2, r2, #0x1
    bic r3, r3, #0xff
    and r2, r2, #0xff
    orr r2, r3, r2
    str r2, [r0, #0x164]
.L_4b8:
    add r2, sp, #0x16
    ldrb r3, [r2, r1, lsl #0x1]
    add r0, sp, #0x17
    ldrb r2, [r0, r1, lsl #0x1]
    mov ip, r3, lsl #0xc
    add r0, sp, #0x10
    mov r3, r2, lsl #0xc
    ldrb r0, [r0, r1]
    str r3, [sp, #0xc]
    mov r2, #0x0
    add r1, sp, #0x8
    str ip, [sp, #0x8]
    str r1, [sp]
    sub r1, r2, #0x1
    mov r3, #0x10
    str r2, [sp, #0x4]
    bl func_ov012_021cadc8
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_ov012_021cc5fc
_LIT1: .word data_ov012_021cbfc4
_LIT2: .word data_ov012_021cbf8c
_LIT3: .word data_ov012_021cc5c0
