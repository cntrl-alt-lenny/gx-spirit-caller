; func_ov006_021b3218 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_0224f090
        .extern data_ov006_0225c3bc
        .extern data_ov006_0225ca3c
        .extern data_ov006_0225dd50
        .extern data_ov006_0225de1c
        .extern data_ov006_0225df48
        .extern data_ov006_0225dfe0
        .extern data_ov006_0225e018
        .extern func_ov006_021b30d0
        .extern func_ov006_021b9f90
        .extern func_ov006_021c1490
        .extern func_ov006_021c6884
        .extern func_ov006_021c7470
        .extern func_ov006_021c9de8
        .extern func_ov006_021cab24
        .extern func_ov006_021caf94
        .global func_ov006_021b3218
        .arm
func_ov006_021b3218:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r4, [r1, #0x44]
    bl func_ov006_021caf94
    ldr r0, _LIT2
    bl func_ov006_021cab24
    ldr r0, _LIT3
    bl func_ov006_021c9de8
    ldr r0, _LIT4
    bl func_ov006_021c7470
    ldr r0, _LIT5
    bl func_ov006_021c6884
    ldr r0, _LIT6
    bl func_ov006_021c1490
    ldr r0, _LIT0
    bl func_ov006_021b9f90
    bl func_ov006_021b30d0
    cmp r4, #0x0
    beq .L_74
    cmp r4, #0x2
    cmpne r4, #0x3
    bne .L_74
    ldr r0, _LIT7
    mov r1, #0x0
    str r1, [r0, #0xc]
    mov r1, #0x1
    str r1, [r0]
    b .L_84
.L_74:
    ldr r0, _LIT7
    mov r1, #0x1
    str r1, [r0, #0xc]
    str r1, [r0]
.L_84:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov006_0225c3bc
_LIT1: .word data_ov006_0225e018
_LIT2: .word data_ov006_0225dfe0
_LIT3: .word data_ov006_0225df48
_LIT4: .word data_ov006_0225de1c
_LIT5: .word data_ov006_0225dd50
_LIT6: .word data_ov006_0225ca3c
_LIT7: .word data_ov006_0224f090
