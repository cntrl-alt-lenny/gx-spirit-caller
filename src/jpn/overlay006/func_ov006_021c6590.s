; func_ov006_021c6590 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cb6d4
        .extern data_ov006_021cb6f4
        .extern func_02001cec
        .extern func_02001e74
        .extern func_0208dcb4
        .extern func_0208deac
        .extern func_0208fe9c
        .extern func_02094410
        .global func_ov006_021c6590
        .arm
func_ov006_021c6590:
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
    add r0, r4, #0x8
    mov r1, #0x20
    mov r2, #0x3
    bl func_02001cec
    bl func_0208deac
    mov r1, r0
    add r0, r4, #0x8
    mov r2, #0x2
    mov r3, #0x4
    bl func_02001e74
    add r0, r4, #0x8
    mov r1, #0x20
    mov r2, #0x12
    bl func_02001cec
    bl func_0208deac
    mov r1, r0
    add r0, r4, #0x8
    add r1, r1, #0xc0
    mov r2, #0x62
    mov r3, #0x5
    bl func_02001e74
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
    ldr r0, _LIT1
    mov r1, #0x80
    mov r2, #0x20
    bl func_0208fe9c
    ldr r0, _LIT2
    mov r1, #0xa0
    mov r2, #0x20
    bl func_0208fe9c
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0400100e
_LIT1: .word data_ov006_021cb6d4
_LIT2: .word data_ov006_021cb6f4
