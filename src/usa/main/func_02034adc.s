; func_02034adc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b200
        .extern data_0219b28c
        .extern data_0219b2a4
        .extern data_0219b3b0
        .extern data_0219cfa8
        .extern func_02036540
        .extern func_02037878
        .extern func_02037974
        .extern func_0203799c
        .extern func_0207d3e8
        .extern func_020870c4
        .extern func_02088c94
        .extern func_02088ca4
        .extern func_02088d84
        .extern func_02089838
        .extern func_02091a74
        .extern func_02092660
        .extern func_020926d0
        .global func_02034adc
        .arm
func_02034adc:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    mov r1, #0x0
    bl func_02036540
    mvn r0, #0x0
    mov r1, #0x0
    bl func_02037878
    bl func_020870c4
    bl func_0203799c
    mov r0, #0x0
    bl func_02037974
    bl func_02088d84
    ldr r0, _LIT1
    bl func_020926d0
    ldr r0, _LIT2
    bl func_02091a74
    ldr r0, _LIT1
    bl func_02092660
    ldr r0, _LIT3
    bl func_020926d0
    ldr r0, _LIT4
    bl func_02091a74
    ldr r0, _LIT3
    bl func_02092660
.L_60:
    bl func_02088c94
    cmp r0, #0x0
    bne .L_60
    bl func_02088ca4
    ldr r0, _LIT5
    mov r1, #0x0
    strh r1, [r0, #0x12]
    ldr r0, [r0, #0x50]
    bl func_0207d3e8
    ldr r0, _LIT5
    ldr r0, [r0, #0x30]
    bl func_02089838
    ldmia sp!, {r3, pc}
_LIT0: .word 0x08f00004
_LIT1: .word data_0219b28c
_LIT2: .word data_0219cfa8
_LIT3: .word data_0219b2a4
_LIT4: .word data_0219b3b0
_LIT5: .word data_0219b200
