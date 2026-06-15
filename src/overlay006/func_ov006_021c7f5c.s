; func_ov006_021c7f5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
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
        .global func_ov006_021c7f5c
        .arm
func_ov006_021c7f5c:
    stmdb sp!, {r3, lr}
    cmp r1, #0x9
    mov r3, #0x0
    addls pc, pc, r1, lsl #0x2
    b .L_2a0
    b .L_2a0
    b .L_238
    b .L_244
    b .L_250
    b .L_25c
    b .L_268
    b .L_274
    b .L_280
    b .L_28c
    b .L_298
.L_238:
    ldr r3, _LIT0
    mov ip, #0xa
    b .L_2a0
.L_244:
    ldr r3, _LIT1
    mov ip, #0x3
    b .L_2a0
.L_250:
    ldr r3, _LIT2
    mov ip, #0x9
    b .L_2a0
.L_25c:
    ldr r3, _LIT3
    mov ip, #0x4
    b .L_2a0
.L_268:
    ldr r3, _LIT4
    mov ip, #0xa
    b .L_2a0
.L_274:
    ldr r3, _LIT5
    mov ip, #0x16
    b .L_2a0
.L_280:
    ldr r3, _LIT6
    mov ip, #0xa
    b .L_2a0
.L_28c:
    ldr r3, _LIT7
    mov ip, #0x23
    b .L_2a0
.L_298:
    ldr r3, _LIT8
    mov ip, #0x4
.L_2a0:
    cmp r3, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, pc}
    cmp ip, #0x0
    mov lr, #0x0
    ble .L_2dc
.L_2b8:
    mov r1, lr, lsl #0x2
    ldrsh r0, [r3, r1]
    cmp r2, r0
    addeq r0, r3, r1
    ldreqsh r0, [r0, #0x2]
    ldmeqia sp!, {r3, pc}
    add lr, lr, #0x1
    cmp lr, ip
    blt .L_2b8
.L_2dc:
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
