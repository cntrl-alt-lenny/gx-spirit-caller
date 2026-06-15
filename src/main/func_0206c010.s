; func_0206c010 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ecd8
        .extern data_0219ed1c
        .extern data_0219ed20
        .global func_0206c010
        .arm
func_0206c010:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r1, [r0, #0x1c]
    ldr r0, [r0, #0x14]
    cmp r1, r0
    addlt sp, sp, #0x4
    mvnlt r0, #0x0
    ldmltfd sp!, {lr}
    bxlt lr
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r2, [r0]
    ldr r0, [r1]
    ldr r1, [r2, #0x1c]
    blx r1
    ldr r1, _LIT2
    mov r0, #0x0
    str r0, [r1]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_0219ed20
_LIT1: .word data_0219ecd8
_LIT2: .word data_0219ed1c
