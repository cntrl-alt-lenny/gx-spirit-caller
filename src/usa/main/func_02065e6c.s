; func_02065e6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e888
        .extern func_02054008
        .extern func_0205405c
        .extern func_020540cc
        .extern func_02054144
        .extern func_02065f04
        .global func_02065e6c
        .arm
func_02065e6c:
    stmfd sp!, {lr}
    sub sp, sp, #0x44
    mov r0, #0x0
    add r2, sp, #0x0
    mov r1, r0
    stmia r2!, {r0, r1}
    stmia r2!, {r0, r1}
    stmia r2!, {r0, r1}
    stmia r2!, {r0, r1}
    stmia r2!, {r0, r1}
    stmia r2!, {r0, r1}
    stmia r2!, {r0, r1}
    stmia r2, {r0, r1}
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    bne .L_5c
    ldr r2, _LIT1
    mov r0, #0x40
    mov r1, #0x4
    bl func_02054144
    ldr r1, _LIT0
    str r0, [r1]
.L_5c:
    ldr r0, _LIT0
    add r1, sp, #0x0
    ldr r0, [r0]
    bl func_02054008
    ldr r0, _LIT0
    ldr r0, [r0]
    bl func_020540cc
    ldr r2, _LIT0
    sub r1, r0, #0x1
    ldr r0, [r2]
    bl func_0205405c
    add sp, sp, #0x44
    ldmfd sp!, {pc}
_LIT0: .word data_0219e888
_LIT1: .word func_02065f04
