; func_02046880 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219da0c
        .extern func_02045948
        .extern func_02045c10
        .extern func_020463f0
        .extern func_020503dc
        .extern func_0205063c
        .extern func_02062494
        .extern func_02062728
        .extern func_0206277c
        .extern func_02064f10
        .global func_02046880
        .arm
func_02046880:
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
    bl func_02045948
    add r0, r0, #0xc000
    mov r1, r0, lsl #0x10
    ldr r3, _LIT0
    mov r0, #0x0
    mov r2, r0
    mov r1, r1, lsr #0x10
    ldr r4, [r3]
    bl func_02064f10
    ldr r1, _LIT1
    ldr r2, _LIT0
    str r1, [sp]
    mov r1, r0
    ldr r0, [r2]
    ldr r2, [r4, #0x14]
    ldr r3, [r4, #0x18]
    bl func_0206277c
    mov r4, r0
    bl func_020463f0
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, r4
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT0
    ldr r1, _LIT2
    ldr r0, [r0]
    ldr r0, [r0]
    bl func_02062728
    ldr r0, _LIT0
    ldr r1, _LIT3
    ldr r0, [r0]
    ldr r0, [r0]
    bl func_02062494
    mov r0, r4
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219da0c
_LIT1: .word func_02045c10
_LIT2: .word func_020503dc
_LIT3: .word func_0205063c
