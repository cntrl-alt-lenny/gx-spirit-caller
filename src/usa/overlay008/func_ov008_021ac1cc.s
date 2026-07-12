; func_ov008_021ac1cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2ca0
        .extern func_0208e2f4
        .extern func_02094410
        .global func_ov008_021ac1cc
        .arm
func_ov008_021ac1cc:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    mov r0, #0x0
    mov r2, #0x8
    bl func_02094410
    ldr ip, _LIT1
    mov r1, #0x10
    ldr r0, [ip]
    ldr r2, [ip]
    and r0, r0, #0x1f00
    mov r0, r0, lsr #0x8
    bic r0, r0, #0x2
    bic r2, r2, #0x1f00
    orr r0, r0, #0x8
    orr r3, r2, r0, lsl #0x8
    add r0, ip, #0x50
    sub r2, r1, #0x18
    str r3, [ip]
    bl func_0208e2f4
    ldr ip, _LIT2
    ldr r1, _LIT3
    ldrh r2, [ip]
    sub r3, ip, #0x4a
    mov r0, #0x1
    bic r2, r2, #0x3f00
    orr r2, r2, #0x3000
    strh r2, [ip]
    ldrh r2, [ip]
    bic r2, r2, #0x3f
    orr r2, r2, #0x1f
    strh r2, [ip]
    ldr r2, [r3]
    bic r2, r2, #0xe000
    orr r2, r2, #0x8000
    str r2, [r3]
    ldrh r2, [r1, #0x6]
    bic r2, r2, #0xff
    orr r2, r2, #0x1a
    strh r2, [r1, #0x6]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov008_021b2ca0
_LIT1: .word 0x04001000
_LIT2: .word 0x0400104a
_LIT3: .word data_ov008_021b2ca0
