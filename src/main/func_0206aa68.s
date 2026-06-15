; func_0206aa68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020453b4
        .extern func_02054e70
        .extern func_0206aacc
        .extern func_0206ab3c
        .global func_0206aa68
        .arm
func_0206aa68:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x7c]
    cmp r0, #0x0
    beq .L_fc
    bl func_020453b4
.L_fc:
    mov r0, #0x0
    str r0, [r4, #0x7c]
    str r0, [r4, #0x80]
    ldr r0, [r4, #0x4b0]
    mvn r1, #0x0
    cmp r0, r1
    beq .L_11c
    bl func_02054e70
.L_11c:
    mvn r1, #0x0
    mov r0, r4
    str r1, [r4, #0x4b0]
    mov r1, #0x1
    str r1, [r4]
    bl func_0206aacc
    mvn r1, #0x0
    mov r0, r4
    str r1, [r4, #0x484]
    bl func_0206ab3c
    ldmia sp!, {r4, pc}
