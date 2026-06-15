; func_02064500 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020540d0
        .extern func_02054140
        .extern func_02064790
        .global func_02064500
        .arm
func_02064500:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r0, [r5, #0x10]
    bl func_02054140
    subs r4, r0, #0x1
    addmi sp, sp, #0x4
    ldmmiia sp!, {r4, r5, pc}
.L_5c:
    ldr r0, [r5, #0x10]
    mov r1, r4
    bl func_020540d0
    ldr r0, [r0]
    bl func_02064790
    subs r4, r4, #0x1
    bpl .L_5c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
