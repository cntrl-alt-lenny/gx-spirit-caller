; func_02065ee0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e968
        .extern func_0205407c
        .extern func_020540d0
        .extern func_02054140
        .extern func_020541b8
        .extern func_02065f78
        .global func_02065ee0
        .arm
func_02065ee0:
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
    bne .L_fc
    ldr r2, _LIT1
    mov r0, #0x40
    mov r1, #0x4
    bl func_020541b8
    ldr r1, _LIT0
    str r0, [r1]
.L_fc:
    ldr r0, _LIT0
    add r1, sp, #0x0
    ldr r0, [r0]
    bl func_0205407c
    ldr r0, _LIT0
    ldr r0, [r0]
    bl func_02054140
    ldr r2, _LIT0
    sub r1, r0, #0x1
    ldr r0, [r2]
    bl func_020540d0
    add sp, sp, #0x44
    ldmfd sp!, {pc}
_LIT0: .word data_0219e968
_LIT1: .word func_02065f78
