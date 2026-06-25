; func_0203dea0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0203dea0
        .arm
func_0203dea0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldrb r1, [r0, #0xd12]
    mov r3, #0x0
    mov ip, r3
    cmp r1, #0x0
    ble .L_88
    ldr r2, _LIT0
    mov r1, r0
    add r2, r0, r2
.L_28:
    add r4, r0, ip, lsl #0x2
    ldrb r4, [r4, #0x444]
    cmp r4, #0x0
    bne .L_64
    add lr, r1, #0x400
    ldrh r4, [lr, #0xa6]
    ldrb lr, [r2]
    sub r5, r4, #0x1
    mov r4, lr, lsl #0x19
    cmp r5, r4, lsr #0x19
    bicne lr, lr, #0x80
    addne r3, r3, #0x1
    strneb lr, [r2]
    andne r3, r3, #0xff
    bne .L_70
.L_64:
    ldrb lr, [r2]
    orr lr, lr, #0x80
    strb lr, [r2]
.L_70:
    ldrb lr, [r0, #0xd12]
    add ip, ip, #0x1
    add r2, r2, #0x4
    cmp ip, lr
    add r1, r1, #0xc0
    blt .L_28
.L_88:
    mov r0, r3
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0x00000447
