; func_020689e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02068ab4
        .extern func_020ac45c
        .global func_020689e4
        .arm
func_020689e4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r2
    mov r2, #0x0
    mov r4, r3
    bl func_02068ab4
    cmp r0, #0x0
    beq .L_2c
    bl func_020ac45c
    mov r5, r0
    mov r4, r1
.L_2c:
    mov r0, r5
    mov r1, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
