; func_02052e30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02053190
        .extern func_02053600
        .extern func_020536b4
        .extern func_020945f4
        .global func_02052e30
        .arm
func_02052e30:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r1
    mov r5, r0
    mov r0, r4
    mov r1, #0x0
    mov r2, #0xc
    bl func_020945f4
    mov r0, r5
    bl func_02053190
    cmp r0, #0x0
    addeq r0, r5, #0x4
    ldmeqia r0, {r0, r1, r2}
    addeq sp, sp, #0x4
    stmeqia r4, {r0, r1, r2}
    ldmeqia sp!, {r4, r5, pc}
    ldr r1, [r5, #0x1c]
    mov r0, r4
    bl func_020536b4
    mov r0, r4
    mov r1, #0x3
    bl func_02053600
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
