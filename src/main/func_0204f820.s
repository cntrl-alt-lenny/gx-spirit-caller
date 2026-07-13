; func_0204f820 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff968
        .extern data_020ff9c4
        .extern data_020ffa58
        .extern data_020ffa5c
        .extern func_02045c34
        .extern func_02045c7c
        .extern func_02049038
        .extern func_020498f0
        .extern func_0209150c
        .global func_0204f820
        .arm
func_0204f820:
    stmfd sp!, {lr}
    sub sp, sp, #0x2c
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    addne sp, sp, #0x2c
    movne r0, #0x0
    ldmnefd sp!, {pc}
    bl func_020498f0
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
    bl func_02045c7c
    bl func_020498f0
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
    bl func_02045c34
    ldr r2, _LIT0
    add r0, sp, #0x0
    mov r1, #0xc
    mov r3, #0x3
    bl func_0209150c
    ldr r0, _LIT3
    add r1, sp, #0x0
    add r2, sp, #0xc
    mov r3, #0x2f
    bl func_02045c34
    mov r0, #0x6
    add r1, sp, #0xc
    mov r2, #0x0
    bl func_02049038
    add sp, sp, #0x2c
    ldmfd sp!, {pc}
_LIT0: .word data_020ff968
_LIT1: .word data_020ffa58
_LIT2: .word data_020ffa5c
_LIT3: .word data_020ff9c4+0x4
