; func_0201bbfc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_020c5c14
        .extern data_020c5c28
        .extern data_020c5c40
        .extern data_020c5c58
        .extern data_020c5c6c
        .extern data_020c5c80
        .extern data_020c5c98
        .global func_0201bbfc
        .arm
func_0201bbfc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    bl GetSystemWork
    mov r4, r0
    tst r6, #0x4000
    beq .L_2c
    ldr r0, _LIT0
    .word 0xeb065c95
    str r0, [r4, #0x810]
    b .L_d0
.L_2c:
    tst r6, #0x8000
    beq .L_60
    cmp r5, #0x0
    beq .L_48
    ldr r0, _LIT1
    .word 0xeb065c8d
    b .L_50
.L_48:
    ldr r0, _LIT2
    .word 0xeb065c8a
.L_50:
    str r0, [r4, #0x810]
    mov r0, #0x4
    str r0, [r4, #0x918]
    b .L_d0
.L_60:
    tst r6, #0x10000
    beq .L_94
    cmp r5, #0x0
    beq .L_7c
    ldr r0, _LIT3
    .word 0xeb065c80
    b .L_84
.L_7c:
    ldr r0, _LIT4
    .word 0xeb065c7d
.L_84:
    str r0, [r4, #0x810]
    mov r0, #0x3
    str r0, [r4, #0x918]
    b .L_d0
.L_94:
    tst r6, #0x20000
    beq .L_d0
    cmp r5, #0x0
    beq .L_bc
    ldr r0, _LIT5
    .word 0xeb065c73
    str r0, [r4, #0x810]
    mov r0, #0x3
    str r0, [r4, #0x918]
    b .L_d0
.L_bc:
    ldr r0, _LIT6
    .word 0xeb065c6d
    str r0, [r4, #0x810]
    mov r0, #0x4
    str r0, [r4, #0x918]
.L_d0:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020c5c14
_LIT1: .word data_020c5c28
_LIT2: .word data_020c5c40
_LIT3: .word data_020c5c58
_LIT4: .word data_020c5c6c
_LIT5: .word data_020c5c80
_LIT6: .word data_020c5c98
