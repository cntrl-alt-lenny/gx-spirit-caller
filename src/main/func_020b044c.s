; func_020b044c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b0390
        .extern func_020b03fc
        .global func_020b044c
        .arm
func_020b044c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    cmp r4, #0x0
    ldmleia sp!, {r3, r4, r5, pc}
    ldrb r2, [r5, #0x4]
    cmp r4, r2
    ldmgeia sp!, {r3, r4, r5, pc}
    bl func_020b0390
    strb r4, [r5, #0x4]
    cmp r0, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_020b03fc
    ldmia sp!, {r3, r4, r5, pc}
