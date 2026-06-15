; func_02034b2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b2e0
        .extern data_0219b36c
        .extern data_0219b384
        .extern data_0219b490
        .extern data_0219d088
        .extern func_02036590
        .extern func_020378c8
        .extern func_020379c4
        .extern func_020379ec
        .extern func_0207d4d0
        .extern func_020871ac
        .extern func_02088d7c
        .extern func_02088d8c
        .extern func_02088e6c
        .extern func_02089920
        .extern func_02091b5c
        .extern func_02092748
        .extern func_020927b8
        .global func_02034b2c
        .arm
func_02034b2c:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    mov r1, #0x0
    bl func_02036590
    mvn r0, #0x0
    mov r1, #0x0
    bl func_020378c8
    bl func_020871ac
    bl func_020379ec
    mov r0, #0x0
    bl func_020379c4
    bl func_02088e6c
    ldr r0, _LIT1
    bl func_020927b8
    ldr r0, _LIT2
    bl func_02091b5c
    ldr r0, _LIT1
    bl func_02092748
    ldr r0, _LIT3
    bl func_020927b8
    ldr r0, _LIT4
    bl func_02091b5c
    ldr r0, _LIT3
    bl func_02092748
.L_108:
    bl func_02088d7c
    cmp r0, #0x0
    bne .L_108
    bl func_02088d8c
    ldr r0, _LIT5
    mov r1, #0x0
    strh r1, [r0, #0x12]
    ldr r0, [r0, #0x50]
    bl func_0207d4d0
    ldr r0, _LIT5
    ldr r0, [r0, #0x30]
    bl func_02089920
    ldmia sp!, {r3, pc}
_LIT0: .word 0x08f00004
_LIT1: .word data_0219b36c
_LIT2: .word data_0219d088
_LIT3: .word data_0219b384
_LIT4: .word data_0219b490
_LIT5: .word data_0219b2e0
