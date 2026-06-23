; func_ov006_021c47d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cb5cc
        .extern data_ov006_021cb60c
        .extern data_ov006_021cb62c
        .extern data_ov006_021cb64c
        .extern data_ov006_021cb68c
        .extern data_ov006_021cdd0c
        .extern func_02001cec
        .extern func_02001e74
        .extern func_0208dcb4
        .extern func_0208deac
        .extern func_0208fe9c
        .extern func_02094410
        .global func_ov006_021c47d4
        .arm
func_ov006_021c47d4:
    stmdb sp!, {r4, lr}
    ldr r3, _LIT0
    mov r4, r0
    ldrh r2, [r3]
    mov r1, #0x0
    bic r0, r2, #0x3
    orr r0, r0, #0x2
    strh r0, [r3]
    ldrh r0, [r3]
    and r0, r0, #0x43
    orr r0, r0, #0x218
    orr r0, r0, #0x400
    strh r0, [r3]
    str r1, [r3, #0xe]
    bl func_0208deac
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094410
    add r0, r4, #0x10
    mov r1, #0x20
    mov r2, #0x3
    bl func_02001cec
    bl func_0208deac
    mov r1, r0
    add r0, r4, #0x10
    mov r2, #0x2
    mov r3, #0x4
    bl func_02001e74
    add r0, r4, #0x10
    mov r1, #0x20
    mov r2, #0x12
    bl func_02001cec
    bl func_0208deac
    add r1, r0, #0xc0
    add r0, r4, #0x10
    mov r2, #0x62
    mov r3, #0x5
    bl func_02001e74
    add r0, r4, #0x10
    mov r1, #0x20
    mov r2, #0x3
    bl func_02001cec
    bl func_0208deac
    add r1, r0, #0x540
    ldr r2, _LIT1
    add r0, r4, #0x10
    mov r3, #0x6
    bl func_02001e74
    ldr r1, [r4, #0x58]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x2
    ldrsh r0, [r0, r1]
    mov r2, #0x3
    cmp r0, #0x2
    moveq r0, #0x2
    movne r0, #0x1
    cmp r0, #0x2
    add r0, r4, #0x10
    bne .L_144
    mov r1, #0x10
    bl func_02001cec
    bl func_0208deac
    mov r1, r0
    ldr r2, _LIT3
    add r0, r4, #0x10
    add r1, r1, #0x480
    mov r3, #0x7
    bl func_02001e74
    add r0, r4, #0x10
    mov r1, #0x10
    mov r2, #0x3
    bl func_02001cec
    bl func_0208deac
    mov r1, r0
    ldr r2, _LIT4
    add r0, r4, #0x10
    add r1, r1, #0x4a0
    mov r3, #0x8
    bl func_02001e74
    b .L_168
.L_144:
    mov r1, #0x20
    bl func_02001cec
    bl func_0208deac
    mov r1, r0
    ldr r2, _LIT3
    add r0, r4, #0x10
    add r1, r1, #0x480
    mov r3, #0x7
    bl func_02001e74
.L_168:
    bl func_0208dcb4
    add r1, r0, #0x40
    mov r0, #0x0
    mov r2, #0xc00
    bl func_02094410
    bl func_0208dcb4
    add r1, r0, #0xc40
    mov r0, #0x0
    mov r2, #0x4800
    bl func_02094410
    bl func_0208dcb4
    add r0, r0, #0x1440
    add r1, r0, #0x4000
    mov r0, #0x0
    mov r2, #0xc00
    bl func_02094410
    bl func_0208dcb4
    add r0, r0, #0x2040
    add r1, r0, #0x4000
    mov r0, #0x0
    mov r2, #0xc00
    bl func_02094410
    ldr r0, _LIT5
    mov r1, #0x80
    mov r2, #0x20
    bl func_0208fe9c
    ldr r0, _LIT6
    mov r1, #0xa0
    mov r2, #0x20
    bl func_0208fe9c
    ldr r0, _LIT7
    mov r1, #0xc0
    mov r2, #0x20
    bl func_0208fe9c
    ldr r0, _LIT8
    mov r1, #0xe0
    mov r2, #0x20
    bl func_0208fe9c
    ldr r0, _LIT9
    mov r1, #0x100
    mov r2, #0x20
    bl func_0208fe9c
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0400100e
_LIT1: .word 0x000002a2
_LIT2: .word data_ov006_021cdd0c
_LIT3: .word 0x00000302
_LIT4: .word 0x00000332
_LIT5: .word data_ov006_021cb60c
_LIT6: .word data_ov006_021cb62c
_LIT7: .word data_ov006_021cb68c
_LIT8: .word data_ov006_021cb5cc
_LIT9: .word data_ov006_021cb64c
