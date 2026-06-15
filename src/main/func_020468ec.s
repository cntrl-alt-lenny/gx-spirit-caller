; func_020468ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219daec
        .extern func_020459f0
        .extern func_02045cb8
        .extern func_02046498
        .extern func_02050450
        .extern func_020506b0
        .extern func_02062508
        .extern func_0206279c
        .extern func_020627f0
        .extern func_02064f84
        .global func_020468ec
        .arm
func_020468ec:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0]
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, #0x4000
    bl func_020459f0
    add r0, r0, #0xc000
    mov r1, r0, lsl #0x10
    ldr r3, _LIT0
    mov r0, #0x0
    mov r2, r0
    mov r1, r1, lsr #0x10
    ldr r4, [r3]
    bl func_02064f84
    ldr r1, _LIT1
    ldr r2, _LIT0
    str r1, [sp]
    mov r1, r0
    ldr r0, [r2]
    ldr r2, [r4, #0x14]
    ldr r3, [r4, #0x18]
    bl func_020627f0
    mov r4, r0
    bl func_02046498
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, r4
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT0
    ldr r1, _LIT2
    ldr r0, [r0]
    ldr r0, [r0]
    bl func_0206279c
    ldr r0, _LIT0
    ldr r1, _LIT3
    ldr r0, [r0]
    ldr r0, [r0]
    bl func_02062508
    mov r0, r4
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219daec
_LIT1: .word func_02045cb8
_LIT2: .word func_02050450
_LIT3: .word func_020506b0
