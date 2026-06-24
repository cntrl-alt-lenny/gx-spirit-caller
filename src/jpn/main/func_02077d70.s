; func_02077d70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101e94
        .extern func_02077de4
        .extern func_0207835c
        .global func_02077d70
        .arm
func_02077d70:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    mov r0, r4
    add r1, r5, #0x10
    mov r2, #0x8
    bl func_0207835c
    ldr r0, [r5, #0x10]
    ldr r1, _LIT0
    mov r0, r0, lsr #0x3
    and r0, r0, #0x3f
    cmp r0, #0x38
    rsblt r2, r0, #0x38
    rsbge r2, r0, #0x78
    mov r0, r5
    bl func_02077de4
    mov r0, r5
    mov r1, r4
    mov r2, #0x8
    bl func_02077de4
    mov r0, r4
    mov r1, r5
    mov r2, #0x10
    bl func_0207835c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_02101e94
