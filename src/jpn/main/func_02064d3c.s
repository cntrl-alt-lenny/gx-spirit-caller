; func_02064d3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101474
        .extern func_020aace8
        .global func_02064d3c
        .arm
func_02064d3c:
    stmdb sp!, {r4, lr}
    ldr r2, [r0]
    mov r4, r1
    cmp r2, #0x0
    ldreq r2, _LIT0
    moveq r1, #0x0
    streq r2, [r0]
    streq r1, [r4]
    ldmeqia sp!, {r4, pc}
    ldr r1, [r4]
    mvn r0, #0x0
    cmp r1, r0
    ldmneia sp!, {r4, pc}
    mov r0, r2
    bl func_020aace8
    add r0, r0, #0x1
    str r0, [r4]
    ldmia sp!, {r4, pc}
_LIT0: .word data_02101474
