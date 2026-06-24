; func_020123e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02012180
        .global func_020123e4
        .arm
func_020123e4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x108
    add lr, sp, #0x0
    mov r4, r0
    mov ip, #0x10
.L_890:
    ldmia r4!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne .L_890
    ldmia r4, {r0, r1}
    stmia lr, {r0, r1}
    add r0, sp, #0x0
    bl func_02012180
    add sp, sp, #0x108
    ldmia sp!, {r4, pc}
