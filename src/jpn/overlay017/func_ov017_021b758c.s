; func_ov017_021b758c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern func_02001cec
        .extern func_0200506c
        .extern func_02005488
        .extern func_0202c06c
        .extern func_0208de24
        .extern func_02094410
        .global func_ov017_021b758c
        .arm
func_ov017_021b758c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    bl func_0208de24
    add r1, r0, #0xdc0
    mov r0, #0x0
    mov r2, #0x500
    bl func_02094410
    ldr r0, _LIT0
    mov r1, #0x14
    mov r2, #0x2
    mov r4, #0x0
    bl func_02001cec
    ldr r0, [r5, #0x1d4]
    add r0, r0, #0x36c
    add r0, r0, #0x400
    bl func_0202c06c
    mov r1, #0xc
    bl func_02005488
    rsb r0, r0, #0x90
    cmp r0, #0x14
    addge r4, r4, #0x14
    addlt r0, r4, r0
    sublt r4, r0, #0x2
    ldr r0, [r5, #0x1d4]
    add r0, r0, #0x36c
    add r0, r0, #0x400
    bl func_0202c06c
    mov r5, r0
    bl func_0208de24
    mov r3, r0
    mov r2, #0x1
    str r2, [sp]
    mov ip, #0xc
    add r2, r3, #0xdc0
    ldr r0, _LIT0
    mov r1, r5
    add r3, r4, #0x6
    str ip, [sp, #0x4]
    bl func_0200506c
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02102bb0
