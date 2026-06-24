; func_0203d690 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203d298
        .extern func_0203e1b4
        .extern func_020aaf60
        .global func_0203d690
        .arm
func_0203d690:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov sl, r0
    ldrb r2, [sl, #0xd13]
    ldrb r1, [sl, #0xd0c]
    add r3, sl, #0x470
    mov r0, #0xc0
    mla r9, r2, r0, r3
    mov r0, r1, lsl #0x18
    movs r0, r0, lsr #0x1e
    mov r0, #0x0
    str r0, [sp]
    bne .L_124
    ldrh r0, [r9, #0xa]
    ldr r7, [sp]
    cmp r0, #0x20
    bne .L_64
    mov r0, r9
    bl func_0203d298
    cmp r0, #0x0
    str r0, [sp]
    movle r0, #0x0
    addgt r7, r7, #0x1
    strle r0, [sp]
    b .L_88
.L_64:
    cmp r0, #0x8
    bne .L_88
    mov r0, r9
    bl func_0203e1b4
    cmp r0, #0x0
    str r0, [sp]
    moveq r0, #0x0
    addne r7, r7, #0x1
    streq r0, [sp]
.L_88:
    ldrb r0, [sl, #0xd10]
    mov r8, #0x0
    cmp r0, #0x0
    ble .L_194
    mov r6, sl
    add r5, sl, #0x304
    add r4, sl, #0x300
    ldr r0, _LIT0
    add fp, sl, r0
.L_ac:
    ldrh r2, [r9, #0xa]
    ldrb r0, [r6, #0x303]
    cmp r2, r0
    bne .L_104
    mov r1, r5
    add r0, r9, #0xc
    bl func_020aaf60
    cmp r0, #0x0
    bne .L_104
    cmp r7, #0x0
    ldreqb r0, [r6, #0x301]
    streq r0, [sp]
    beq .L_100
    ldrb r0, [r4]
    bic r0, r0, #0xf0
    orr r0, r0, #0x10
    strb r0, [r4]
    ldrb r0, [fp]
    bic r0, r0, #0xc0
    orr r0, r0, #0x40
    strb r0, [fp]
.L_100:
    add r7, r7, #0x1
.L_104:
    ldrb r0, [sl, #0xd10]
    add r8, r8, #0x1
    add r6, r6, #0x24
    cmp r8, r0
    add r5, r5, #0x24
    add r4, r4, #0x24
    blt .L_ac
    b .L_194
.L_124:
    ldrb r0, [sl, #0xd10]
    ldr r2, [sp]
    mov r3, r2
    cmp r0, #0x0
    ble .L_184
    mov r4, sl
    add r5, sl, #0x300
.L_140:
    ldrb r0, [r5]
    mov r1, r0, lsl #0x18
    mov r1, r1, lsr #0x1c
    cmp r1, #0x1
    bne .L_16c
    cmp r3, #0x0
    biceq r0, r0, #0xf0
    streqb r0, [r5]
    ldreqb r0, [r4, #0x301]
    add r3, r3, #0x1
    streq r0, [sp]
.L_16c:
    ldrb r0, [sl, #0xd10]
    add r2, r2, #0x1
    add r5, r5, #0x24
    cmp r2, r0
    add r4, r4, #0x24
    blt .L_140
.L_184:
    cmp r3, #0x1
    ldreqb r0, [sl, #0xd0c]
    biceq r0, r0, #0xc0
    streqb r0, [sl, #0xd0c]
.L_194:
    ldr r0, [sp]
    and r0, r0, #0xff
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000d0c
