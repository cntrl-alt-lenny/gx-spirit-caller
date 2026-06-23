; func_ov006_021c7f5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
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
        .global func_ov006_021c7f5c
        .arm
func_ov006_021c7f5c:
    stmdb sp!, {r3, lr}
    cmp r1, #0x9
    mov r3, #0x0
    addls pc, pc, r1, lsl #0x2
    b .L_1b0
    b .L_1b0
    b .L_148
    b .L_154
    b .L_160
    b .L_16c
    b .L_178
    b .L_184
    b .L_190
    b .L_19c
    b .L_1a8
.L_148:
    ldr r3, _LIT0
    mov ip, #0xa
    b .L_1b0
.L_154:
    ldr r3, _LIT1
    mov ip, #0x3
    b .L_1b0
.L_160:
    ldr r3, _LIT2
    mov ip, #0x9
    b .L_1b0
.L_16c:
    ldr r3, _LIT3
    mov ip, #0x4
    b .L_1b0
.L_178:
    ldr r3, _LIT4
    mov ip, #0xa
    b .L_1b0
.L_184:
    ldr r3, _LIT5
    mov ip, #0x16
    b .L_1b0
.L_190:
    ldr r3, _LIT6
    mov ip, #0xa
    b .L_1b0
.L_19c:
    ldr r3, _LIT7
    mov ip, #0x23
    b .L_1b0
.L_1a8:
    ldr r3, _LIT8
    mov ip, #0x4
.L_1b0:
    cmp r3, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, pc}
    cmp ip, #0x0
    mov lr, #0x0
    ble .L_1ec
.L_1c8:
    add r0, r3, lr, lsl #0x2
    ldrsh r0, [r0, #0x2]
    mov r1, lr, lsl #0x2
    cmp r2, r0
    ldreqsh r0, [r3, r1]
    ldmeqia sp!, {r3, pc}
    add lr, lr, #0x1
    cmp lr, ip
    blt .L_1c8
.L_1ec:
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
