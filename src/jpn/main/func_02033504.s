; func_02033504 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02033438
        .extern func_02033464
        .extern func_0204524c
        .global func_02033504
        .arm
func_02033504:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xe80]
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
    bl func_02033438
    b .L_4c
.L_40:
    bl func_02033438
    mov r0, r4
    bl func_02033464
.L_4c:
    mov r0, #0x0
    str r0, [r4, #0xe78]
    str r0, [r4, #0xe7c]
    str r0, [r4, #0xe80]
    bl func_0204524c
    ldmia sp!, {r4, pc}
