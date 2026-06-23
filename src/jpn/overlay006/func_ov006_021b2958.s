; func_ov006_021b2958 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov006_021cf020
        .extern data_ov006_021cf038
        .extern data_ov006_021cf090
        .extern data_ov006_0224f328
        .extern func_020018b4
        .extern func_0200195c
        .extern func_02001d48
        .extern func_02094500
        .extern func_020a9698
        .extern func_020aace8
        .extern func_ov005_021acf40
        .extern func_ov006_021b6ae0
        .global func_ov006_021b2958
        .arm
func_ov006_021b2958:
    stmdb sp!, {r4, lr}
    bl func_ov005_021acf40
    cmp r0, #0x0
    beq .L_104
    ldr r0, _LIT0
    bl func_020aace8
    ldr r0, _LIT1
    mov r1, #0x2
    mov r2, #0x0
    bl func_ov006_021b6ae0
    mov r4, r0
    add r0, r4, #0x1
    mov r1, #0x0
    mov r2, #0x19
    bl func_02094500
    ldr r1, _LIT0
    add r0, r4, #0x1
    bl func_020a9698
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    strb r0, [r4]
.L_104:
    mov r0, #0xa0
    bl func_020018b4
    ldr r1, _LIT3
    mov r0, #0x4
    mov r2, #0x80000
    bl func_0200195c
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    ldr r0, _LIT4
    mov r1, #0x5
    str r1, [r0]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov006_021cf038
_LIT1: .word data_ov006_0224f328
_LIT2: .word data_02104e6c
_LIT3: .word data_ov006_021cf090
_LIT4: .word data_ov006_021cf020
