; func_0209f8c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a66a4
        .global func_0209f8c8
        .arm
func_0209f8c8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov ip, #0x1
    mov r3, ip, lsl r3
    sub r3, r3, #0x1
    mov r5, r0
    and r0, r1, r3
    mov r4, r2
    bl func_020a66a4
    add r1, r5, #0x800
    ldrh r1, [r1, #0x10]
    mla r0, r1, r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
