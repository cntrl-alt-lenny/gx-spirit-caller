; func_020622c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02062ba4
        .extern func_02064db0
        .global func_020622c8
        .arm
func_020622c8:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x0
    str r0, [r4, #0x14]
    ldr r0, [r4, #0xc]
    cmp r0, #0x4
    ldmneia sp!, {r4, lr}
    addne sp, sp, #0x10
    bxne lr
    add r0, sp, #0xc
    add r1, sp, #0x10
    bl func_02064db0
    ldr r1, [sp, #0xc]
    ldr r2, [sp, #0x10]
    mov r0, r4
    bl func_02062ba4
    mov r0, #0x6
    str r0, [r4, #0xc]
    ldmia sp!, {r4, lr}
    add sp, sp, #0x10
    bx lr
