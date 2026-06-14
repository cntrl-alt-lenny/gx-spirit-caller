; func_ov006_021b29b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02104f4c
        .extern data_ov006_021cf140
        .extern data_ov006_021cf158
        .extern data_ov006_021cf1b0
        .extern data_ov006_0224f448
        .extern func_02001ba4
        .extern func_020a978c
        .extern func_ov005_021ad018
        .extern func_ov005_021ad030
        .extern func_ov006_021b6be0
        .global func_ov006_021b29b0
        .arm
func_ov006_021b29b0:
    stmdb sp!, {r3, lr}
    bl func_02001ba4
    ldr r1, _LIT0
    mov r0, #0x0
    mov r2, #0x1c
    bl Fill32
    ldr r0, _LIT1
    mov r1, #0x2
    mov r2, #0x0
    bl func_ov006_021b6be0
    mov r1, r0
    ldrb r0, [r1]
    cmp r0, #0x0
    ldr r0, _LIT2
    moveq r2, #0x1
    ldr r0, [r0, #0x4]
    movne r2, #0x0
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    moveq r0, #0x1
    movne r0, #0x0
    teq r2, r0
    bne .L_68
    ldr r0, _LIT0
    add r1, r1, #0x1
    bl func_020a978c
.L_68:
    ldr r0, _LIT0
    mov r1, #0x1
    bl func_ov005_021ad018
    ldr r0, _LIT3
    mov r1, #0x80000
    bl func_ov005_021ad030
    ldr r0, _LIT4
    mov r1, #0xa
    str r1, [r0]
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov006_021cf158
_LIT1: .word data_ov006_0224f448
_LIT2: .word data_02104f4c
_LIT3: .word data_ov006_021cf1b0
_LIT4: .word data_ov006_021cf140
