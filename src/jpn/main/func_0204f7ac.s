; func_0204f7ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff888
        .extern data_020ff8e8
        .extern data_020ff978
        .extern data_020ff97c
        .extern func_02045b8c
        .extern func_02045bd4
        .extern func_02048fc4
        .extern func_0204987c
        .extern func_0209150c
        .global func_0204f7ac
        .arm
func_0204f7ac:
    stmfd sp!, {lr}
    sub sp, sp, #0x2c
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    addne sp, sp, #0x2c
    movne r0, #0x0
    ldmnefd sp!, {pc}
    bl func_0204987c
    ldrb r1, [r0, #0x16]
    ldr r2, _LIT0
    add r0, sp, #0x0
    add r3, r1, #0x1
    mov r1, #0xc
    bl func_0209150c
    ldr r0, _LIT1
    add r1, sp, #0x0
    add r2, sp, #0xc
    mov r3, #0x2f
    bl func_02045bd4
    bl func_0204987c
    ldrb r2, [r0, #0xd]
    add r0, sp, #0x0
    mov r1, #0xc
    add r3, r2, #0x1
    ldr r2, _LIT0
    bl func_0209150c
    ldr r0, _LIT2
    add r1, sp, #0x0
    add r2, sp, #0xc
    mov r3, #0x2f
    bl func_02045b8c
    ldr r2, _LIT0
    add r0, sp, #0x0
    mov r1, #0xc
    mov r3, #0x3
    bl func_0209150c
    ldr r0, _LIT3
    add r1, sp, #0x0
    add r2, sp, #0xc
    mov r3, #0x2f
    bl func_02045b8c
    mov r0, #0x6
    add r1, sp, #0xc
    mov r2, #0x0
    bl func_02048fc4
    add sp, sp, #0x2c
    ldmfd sp!, {pc}
_LIT0: .word data_020ff888
_LIT1: .word data_020ff978
_LIT2: .word data_020ff97c
_LIT3: .word data_020ff8e8
