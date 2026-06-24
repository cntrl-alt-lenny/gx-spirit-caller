; func_0206a9f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045364
        .extern func_02054dfc
        .extern func_0206aa58
        .extern func_0206aac8
        .global func_0206a9f4
        .arm
func_0206a9f4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x7c]
    cmp r0, #0x0
    beq .L_18
    bl func_02045364
.L_18:
    mov r0, #0x0
    str r0, [r4, #0x7c]
    str r0, [r4, #0x80]
    ldr r0, [r4, #0x4b0]
    mvn r1, #0x0
    cmp r0, r1
    beq .L_38
    bl func_02054dfc
.L_38:
    mvn r1, #0x0
    mov r0, r4
    str r1, [r4, #0x4b0]
    mov r1, #0x1
    str r1, [r4]
    bl func_0206aa58
    mvn r1, #0x0
    mov r0, r4
    str r1, [r4, #0x484]
    bl func_0206aac8
    ldmia sp!, {r4, pc}
