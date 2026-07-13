; func_ov017_021b60dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern func_02001cec
        .extern func_02004f3c
        .extern func_0202c06c
        .extern func_0208de24
        .extern func_02094410
        .global func_ov017_021b60dc
        .arm
func_ov017_021b60dc:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    bl func_0208de24
    add r1, r0, #0x12c0
    mov r0, #0x0
    mov r2, #0x12c0
    bl func_02094410
    ldr r0, _LIT0
    mov r1, #0x1c
    mov r2, #0x5
    bl func_02001cec
    ldr r1, [r4, #0x10]
    ldr r0, [r4, #0xc]
    add r1, r4, r1
    add r0, r1, r0
    ldrb r0, [r0, #0x20]
    add r0, r0, #0x9f
    add r0, r0, #0x700
    bl func_0202c06c
    mov r4, r0
    bl func_0208de24
    add r2, r0, #0x12c0
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    mov r1, r4
    mov r3, #0x1
    bl func_02004f3c
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_02102bb0
