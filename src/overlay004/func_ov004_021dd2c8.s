; func_ov004_021dd2c8 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).
; Thumb gap-object mode (brief 406 stretch).

        .text
        .extern data_ov004_0220a300
        .extern func_ov004_021dbd08
        .extern func_ov004_021dbe78
        .global func_ov004_021dd2c8
        .thumb
func_ov004_021dd2c8:
    push {r4, r5, r6, r7, lr}
    sub sp, #0xc
    add r5, r0, #0x0
    mov r4, #0x0
    str r4, [sp, #0x4]
    ldr r0, [r5, #0x0]
    str r0, [sp, #0x0]
    cmp r0, #0x0
    bne .L_1c
    mov r0, #0x5
    add sp, #0xc
    pop {r4, r5, r6, r7}
    pop {r3}
    bx r3
.L_1c:
    cmp r0, #0x40
    bls .L_24
    mov r0, #0x40
    str r0, [sp, #0x0]
.L_24:
    mov r7, #0x0
    ldr r0, [sp, #0x0]
    cmp r0, #0x0
    ble .L_68
    add r6, r5, #0x0
    add r6, #0x8
.L_30:
    ldr r1, [r5, #0x54]
    mov r0, #0x1
    and r1, r0
    cmp r1, #0x0
    beq .L_5c
    ldr r0, _LIT0
    bl func_ov004_021dbd08
    ldr r1, [r5, #0x4]
    cmp r1, r0
    bne .L_5c
    ldr r0, _LIT0
    bl func_ov004_021dbd08
    add r2, r0, #0x0
    add r0, r6, #0x0
    ldr r1, _LIT0
    bl func_ov004_021dbe78
    cmp r0, #0x0
    bne .L_5c
    add r4, r4, #0x1
.L_5c:
    add r5, #0x54
    add r6, #0x54
    add r7, r7, #0x1
    ldr r0, [sp, #0x0]
    cmp r7, r0
    blt .L_30
.L_68:
    cmp r4, #0x1
    ble .L_70
    mov r0, #0x4
    str r0, [sp, #0x4]
.L_70:
    cmp r4, #0x0
    bne .L_78
    mov r0, #0x5
    str r0, [sp, #0x4]
.L_78:
    ldr r0, [sp, #0x4]
    add sp, #0xc
    pop {r4, r5, r6, r7}
    pop {r3}
    bx r3
    nop
    .align 2
_LIT0: .word data_ov004_0220a300
