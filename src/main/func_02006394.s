; func_02006394 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern .L_02021018
        .extern data_0210249c
        .extern data_02103da4
        .extern data_02103da8
        .extern data_021040ac
        .extern data_02186afc
        .extern data_021a63d0
        .extern func_02001540
        .extern func_020057dc
        .extern func_02005ee0
        .extern func_020062cc
        .extern func_02006334
        .extern Task_InvokeLockedIrq
        .extern func_02006950
        .extern func_02007ff4
        .extern func_020085b4
        .extern func_0200a994
        .extern func_020318b8
        .extern func_0203192c
        .extern func_0203193c
        .extern func_02034a48
        .extern func_02085054
        .extern func_0208c840
        .extern func_0208c9d4
        .extern func_0208ca04
        .extern func_0208cc90
        .extern func_0208d1e4
        .extern func_0209295c
        .extern func_02092c78
        .extern func_02092c8c
        .extern func_020931f8
        .extern func_0209362c
        .extern func_02093820
        .extern func_0209448c
        .extern func_02094504
        .extern func_02096228
        .extern func_020983b8
        .extern func_0209bcdc
        .extern func_0209bfc8
        .global func_02006394
        .arm
func_02006394:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    mov r0, #0x0
    mov r2, #0xe70
    bl func_0209448c
    bl func_0209295c
    bl func_020931f8
    bl func_0209362c
    bl func_0208c840
    ldr r0, _LIT1
    mov r1, #0x1
    str r1, [r0]
    bl func_0208ca04
    bl func_02096228
    bl func_0209bcdc
    ldr r1, _LIT2
    ldrh r0, [r1]
    bic r0, r0, #0x8000
    strh r0, [r1]
    bl func_02005ee0
    ldr r1, _LIT3
    ldr r0, _LIT4
    ldr r1, [r1, #0x4]
    str r1, [r0]
    bl func_020062cc
    mov r0, #0x2
    bl func_020983b8
    mov r0, #0x4
    bl func_02092c78
    mov r0, #0x4
    bl func_02092c8c
    bl func_0200a994
    bl func_02006950
    bl func_02034a48
    mov r1, #0x0
    ldr r0, _LIT5
    str r1, [r0]
    bl func_020318b8
    ldr r0, _LIT6
    bl func_0203192c
    ldr r0, _LIT7
    bl func_0203193c
    ldr r0, _LIT8
    bl func_020057dc
    bl func_0209bfc8
    ldrb r0, [r0, #0xf]
    cmp r0, #0x45
    beq .L_ec
    cmp r0, #0x4a
    beq .L_dc
    cmp r0, #0x50
    ldreq r0, _LIT4
    moveq r1, #0x2
    streq r1, [r0, #0x33c]
    b .L_f8
.L_dc:
    ldr r0, _LIT4
    mov r1, #0x0
    str r1, [r0, #0x33c]
    b .L_f8
.L_ec:
    ldr r0, _LIT4
    mov r1, #0x1
    str r1, [r0, #0x33c]
.L_f8:
    bl func_02007ff4
    ldr r3, _LIT2
    ldr r0, _LIT9
    ldrh r2, [r3]
    ldr r1, _LIT10
    and r0, r2, r0
    orr r2, r0, #0xe
    orr r2, r2, #0x200
    sub r0, r1, #0xf
    strh r2, [r3]
    bl func_0208d1e4
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02094504
    bl func_0208cc90
    ldr r0, _LIT11
    bl func_02085054
    mov r0, #0x1
    bl func_0208c9d4
    bl func_02093820
    bl func_020085b4
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl .L_02021018
    ldmia sp!, {r3, pc}
_LIT0: .word data_021040ac
_LIT1: .word data_0210249c
_LIT2: .word 0x04000304
_LIT3: .word data_021a63d0
_LIT4: .word data_02103da4
_LIT5: .word data_02186afc
_LIT6: .word func_02006334
_LIT7: .word Task_InvokeLockedIrq
_LIT8: .word func_02001540
_LIT9: .word 0xfffffdf1
_LIT10: .word 0x0000020e
_LIT11: .word data_02103da8
