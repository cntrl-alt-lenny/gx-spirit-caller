; func_02065788 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054e70
        .extern func_02065fa8
        .global func_02065788
        .arm
func_02065788:
    stmdb sp!, {r4, lr}
    bl func_02065fa8
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4]
    mvn r1, #0x0
    cmp r0, r1
    beq .L_9fc
    bl func_02054e70
.L_9fc:
    mvn r0, #0x0
    str r0, [r4]
    mov r0, #0x4
    str r0, [r4, #0x10]
    ldmia sp!, {r4, pc}
