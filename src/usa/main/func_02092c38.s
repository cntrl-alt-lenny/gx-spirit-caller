; func_02092c38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6548
        .extern func_0209294c
        .extern func_02092960
        .extern func_02092974
        .extern func_02092a60
        .global func_02092c38
        .arm
func_02092c38:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    ldr r0, [r1]
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    mov r2, #0x1
    mov r0, #0x0
    str r2, [r1]
    bl func_02092a60
    mov r1, r0
    mov r0, #0x0
    bl func_02092960
    mov r0, #0x0
    bl func_02092974
    mov r1, r0
    mov r0, #0x0
    bl func_0209294c
    mov r0, #0x2
    mov r1, #0x0
    bl func_0209294c
    mov r0, #0x2
    mov r1, #0x0
    bl func_02092960
    mov r0, #0x3
    bl func_02092a60
    mov r1, r0
    mov r0, #0x3
    bl func_02092960
    mov r0, #0x3
    bl func_02092974
    mov r1, r0
    mov r0, #0x3
    bl func_0209294c
    mov r0, #0x4
    bl func_02092a60
    mov r1, r0
    mov r0, #0x4
    bl func_02092960
    mov r0, #0x4
    bl func_02092974
    mov r1, r0
    mov r0, #0x4
    bl func_0209294c
    mov r0, #0x5
    bl func_02092a60
    mov r1, r0
    mov r0, #0x5
    bl func_02092960
    mov r0, #0x5
    bl func_02092974
    mov r1, r0
    mov r0, #0x5
    bl func_0209294c
    mov r0, #0x6
    bl func_02092a60
    mov r1, r0
    mov r0, #0x6
    bl func_02092960
    mov r0, #0x6
    bl func_02092974
    mov r1, r0
    mov r0, #0x6
    bl func_0209294c
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6548
