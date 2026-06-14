; func_ov011_021cd1fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d32d8
        .extern data_ov011_021d334a
        .extern data_ov011_021d4000
        .global func_ov011_021cd1fc
        .arm
func_ov011_021cd1fc:
    ldr r2, _LIT0
    mov r1, #0x72
    ldr r3, [r2, #0x2a4]
    ldr r2, _LIT1
    mov r3, r3, lsl #0x17
    mov r3, r3, lsr #0x1c
    mul ip, r3, r1
    ldrb r1, [r2, ip]
    mov r3, #0x0
    cmp r1, #0x0
    ble .L_178
    ldr r1, _LIT2
    add ip, r1, ip
    ldrb r1, [ip, #-114]
.L_158:
    ldrb r2, [ip, #-40]
    cmp r0, r2
    moveq r0, r3
    bxeq lr
    add r3, r3, #0x1
    cmp r3, r1
    add ip, ip, #0x1
    blt .L_158
.L_178:
    mvn r0, #0x0
    bx lr
_LIT0: .word data_ov011_021d4000
_LIT1: .word data_ov011_021d32d8
_LIT2: .word data_ov011_021d334a
