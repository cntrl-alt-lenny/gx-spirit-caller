; func_ov006_021c7e50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021ce154
        .extern data_ov006_021ce17c
        .extern data_ov006_021ce18c
        .extern data_ov006_021ce26a
        .extern data_ov006_021ce28e
        .extern data_ov006_021ce2b6
        .extern data_ov006_021ce2de
        .extern data_ov006_021ce44c
        .extern data_ov006_021ce4a4
        .global func_ov006_021c7e50
        .arm
func_ov006_021c7e50:
    stmdb sp!, {r3, lr}
    cmp r1, #0x9
    mov r3, #0x0
    addls pc, pc, r1, lsl #0x2
    b .L_a4
    b .L_a4
    b .L_3c
    b .L_48
    b .L_54
    b .L_60
    b .L_6c
    b .L_78
    b .L_84
    b .L_90
    b .L_9c
.L_3c:
    ldr r3, _LIT0
    mov ip, #0xa
    b .L_a4
.L_48:
    ldr r3, _LIT1
    mov ip, #0x3
    b .L_a4
.L_54:
    ldr r3, _LIT2
    mov ip, #0x9
    b .L_a4
.L_60:
    ldr r3, _LIT3
    mov ip, #0x4
    b .L_a4
.L_6c:
    ldr r3, _LIT4
    mov ip, #0xa
    b .L_a4
.L_78:
    ldr r3, _LIT5
    mov ip, #0x16
    b .L_a4
.L_84:
    ldr r3, _LIT6
    mov ip, #0xa
    b .L_a4
.L_90:
    ldr r3, _LIT7
    mov ip, #0x23
    b .L_a4
.L_9c:
    ldr r3, _LIT8
    mov ip, #0x4
.L_a4:
    cmp r3, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, pc}
    cmp ip, #0x0
    mov lr, #0x0
    ble .L_e0
.L_bc:
    mov r1, lr, lsl #0x2
    ldrsh r0, [r3, r1]
    cmp r2, r0
    addeq r0, r3, r1
    ldreqsh r0, [r0, #0x2]
    ldmeqia sp!, {r3, pc}
    add lr, lr, #0x1
    cmp lr, ip
    blt .L_bc
.L_e0:
    mvn r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov006_021ce2de
_LIT1: .word data_ov006_021ce154
_LIT2: .word data_ov006_021ce26a
_LIT3: .word data_ov006_021ce17c
_LIT4: .word data_ov006_021ce2b6
_LIT5: .word data_ov006_021ce44c
_LIT6: .word data_ov006_021ce28e
_LIT7: .word data_ov006_021ce4a4
_LIT8: .word data_ov006_021ce18c
