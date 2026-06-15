; func_0209f070 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209dca8
        .extern func_0209dd30
        .extern func_0209de5c
        .extern func_0209e0f0
        .global func_0209f070
        .arm
func_0209f070:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r1
    mov r1, r2
    bl func_0209e0f0
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r4, lr}
    bxne lr
    mov r1, r4
    mov r0, #0x0
    bl func_0209de5c
    bl func_0209dca8
    mov r3, r0
    ldr r1, [r3, #0x10]
    mov r0, #0x0
    str r1, [sp]
    ldr r2, [r3]
    ldr r3, [r3, #0x4]
    mov r1, #0x3
    bl func_0209dd30
    cmp r0, #0x0
    moveq r0, #0x2
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
