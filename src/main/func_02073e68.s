; func_02073e68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219eee8
        .extern func_02073ed8
        .global func_02073e68
        .arm
func_02073e68:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, #0x0
    bl func_02073ed8
    cmp r0, #0x0
    beq .L_34
    ldr r0, _LIT0
    ldr r0, [r0]
    mvn r1, r0
    and r0, r1, r5
    cmp r1, r0
    moveq r4, #0x1
.L_34:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_0219eee8
