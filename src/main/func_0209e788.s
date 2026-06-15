; func_0209e788 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020928cc
        .extern func_02094550
        .extern func_0209dc8c
        .extern func_0209dca8
        .global func_0209e788
        .arm
func_0209e788:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl func_0209dca8
    mov r4, r0
    bl func_0209dc8c
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    cmp r5, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x6
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldr r0, [r4, #0x4]
    mov r1, #0x7c0
    bl func_020928cc
    ldr r0, [r4, #0x4]
    mov r1, r5
    mov r2, #0x7c0
    bl func_02094550
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
