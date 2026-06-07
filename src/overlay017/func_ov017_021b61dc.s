; func_ov017_021b61dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c90
        .extern func_02001d0c
        .extern func_02004f58
        .extern func_0202c0c0
        .extern func_0208df0c
        .extern func_02094504
        .global func_ov017_021b61dc
        .arm
func_ov017_021b61dc:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    bl func_0208df0c
    add r1, r0, #0x12c0
    mov r0, #0x0
    mov r2, #0x12c0
    bl func_02094504
    ldr r0, _LIT0
    mov r1, #0x1c
    mov r2, #0x5
    bl func_02001d0c
    ldr r1, [r4, #0x10]
    ldr r0, [r4, #0xc]
    add r1, r4, r1
    add r0, r1, r0
    ldrb r0, [r0, #0x20]
    add r0, r0, #0x9f
    add r0, r0, #0x700
    bl func_0202c0c0
    mov r4, r0
    bl func_0208df0c
    add r2, r0, #0x12c0
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    mov r1, r4
    mov r3, #0x1
    bl func_02004f58
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_02102c90
