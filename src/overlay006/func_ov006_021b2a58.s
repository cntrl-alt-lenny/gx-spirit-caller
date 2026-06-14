; func_ov006_021b2a58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov006_021cf140
        .extern data_ov006_021cf158
        .extern data_ov006_021cf1b0
        .extern data_ov006_0224f448
        .extern func_020018d4
        .extern func_0200197c
        .extern func_02001d68
        .extern func_020945f4
        .extern func_020a978c
        .extern func_020aaddc
        .extern func_ov005_021ad048
        .extern func_ov006_021b6be0
        .global func_ov006_021b2a58
        .arm
func_ov006_021b2a58:
    stmdb sp!, {r4, lr}
    bl func_ov005_021ad048
    cmp r0, #0x0
    beq .L_104
    ldr r0, _LIT0
    bl func_020aaddc
    ldr r0, _LIT1
    mov r1, #0x2
    mov r2, #0x0
    bl func_ov006_021b6be0
    mov r4, r0
    add r0, r4, #0x1
    mov r1, #0x0
    mov r2, #0x19
    bl func_020945f4
    ldr r1, _LIT0
    add r0, r4, #0x1
    bl func_020a978c
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    strb r0, [r4]
.L_104:
    mov r0, #0xa0
    bl func_020018d4
    ldr r1, _LIT3
    mov r0, #0x4
    mov r2, #0x80000
    bl func_0200197c
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r0, _LIT4
    mov r1, #0x5
    str r1, [r0]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov006_021cf158
_LIT1: .word data_ov006_0224f448
_LIT2: .word data_02104f4c
_LIT3: .word data_ov006_021cf1b0
_LIT4: .word data_ov006_021cf140
