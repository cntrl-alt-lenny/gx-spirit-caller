; func_ov006_021c8068 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021ce274
        .extern data_ov006_021ce29c
        .extern data_ov006_021ce2ac
        .extern data_ov006_021ce38a
        .extern data_ov006_021ce3ae
        .extern data_ov006_021ce3d6
        .extern data_ov006_021ce3fe
        .extern data_ov006_021ce56c
        .extern data_ov006_021ce5c4
        .global func_ov006_021c8068
        .arm
func_ov006_021c8068:
    stmdb sp!, {r3, lr}
    cmp r1, #0x9
    mov r3, #0x0
    addls pc, pc, r1, lsl #0x2
    b .L_3ac
    b .L_3ac
    b .L_344
    b .L_350
    b .L_35c
    b .L_368
    b .L_374
    b .L_380
    b .L_38c
    b .L_398
    b .L_3a4
.L_344:
    ldr r3, _LIT0
    mov ip, #0xa
    b .L_3ac
.L_350:
    ldr r3, _LIT1
    mov ip, #0x3
    b .L_3ac
.L_35c:
    ldr r3, _LIT2
    mov ip, #0x9
    b .L_3ac
.L_368:
    ldr r3, _LIT3
    mov ip, #0x4
    b .L_3ac
.L_374:
    ldr r3, _LIT4
    mov ip, #0xa
    b .L_3ac
.L_380:
    ldr r3, _LIT5
    mov ip, #0x16
    b .L_3ac
.L_38c:
    ldr r3, _LIT6
    mov ip, #0xa
    b .L_3ac
.L_398:
    ldr r3, _LIT7
    mov ip, #0x23
    b .L_3ac
.L_3a4:
    ldr r3, _LIT8
    mov ip, #0x4
.L_3ac:
    cmp r3, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, pc}
    cmp ip, #0x0
    mov lr, #0x0
    ble .L_3e8
.L_3c4:
    add r0, r3, lr, lsl #0x2
    ldrsh r0, [r0, #0x2]
    mov r1, lr, lsl #0x2
    cmp r2, r0
    ldreqsh r0, [r3, r1]
    ldmeqia sp!, {r3, pc}
    add lr, lr, #0x1
    cmp lr, ip
    blt .L_3c4
.L_3e8:
    mvn r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov006_021ce3fe
_LIT1: .word data_ov006_021ce274
_LIT2: .word data_ov006_021ce38a
_LIT3: .word data_ov006_021ce29c
_LIT4: .word data_ov006_021ce3d6
_LIT5: .word data_ov006_021ce56c
_LIT6: .word data_ov006_021ce3ae
_LIT7: .word data_ov006_021ce5c4
_LIT8: .word data_ov006_021ce2ac
