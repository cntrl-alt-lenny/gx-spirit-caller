; func_02033554 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02033488
        .extern func_020334b4
        .extern func_0204529c
        .global func_02033554
        .arm
func_02033554:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xe88]
    cmp r1, #0x7
    addls pc, pc, r1, lsl #0x2
    b .L_4c
    b .L_4c
    b .L_4c
    b .L_4c
    b .L_38
    b .L_4c
    b .L_4c
    b .L_40
    b .L_4c
.L_38:
    bl func_02033488
    b .L_4c
.L_40:
    bl func_02033488
    mov r0, r4
    bl func_020334b4
.L_4c:
    mov r0, #0x0
    str r0, [r4, #0xe80]
    str r0, [r4, #0xe84]
    str r0, [r4, #0xe88]
    bl func_0204529c
    ldmia sp!, {r4, pc}
