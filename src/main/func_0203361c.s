; func_0203361c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02032d70
        .extern func_020334cc
        .extern func_0204717c
        .global func_0203361c
        .arm
func_0203361c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xeb4]
    tst r1, #0x1
    ldmeqia sp!, {r4, pc}
    bl func_020334cc
    cmp r0, #0x0
    bne .L_28
    mov r0, r4
    bl func_02032d70
.L_28:
    bl func_0204717c
    mov r0, r4
    bl func_020334cc
    ldmia sp!, {r4, pc}
