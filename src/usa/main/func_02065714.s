; func_02065714 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054dfc
        .extern func_02065f34
        .global func_02065714
        .arm
func_02065714:
    stmdb sp!, {r4, lr}
    bl func_02065f34
    movs r4, r0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4]
    mvn r1, #0x0
    cmp r0, r1
    beq .L_9fc
    bl func_02054dfc
.L_9fc:
    mvn r0, #0x0
    str r0, [r4]
    mov r0, #0x4
    str r0, [r4, #0x10]
    ldmia sp!, {r4, pc}
