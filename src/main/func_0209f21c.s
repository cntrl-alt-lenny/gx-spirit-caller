; func_0209f21c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020928cc
        .extern func_0209db88
        .extern func_0209dca8
        .extern func_0209dd30
        .extern func_0209de5c
        .global func_0209f21c
        .arm
func_0209f21c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl func_0209dca8
    mov r4, r0
    mov r0, #0x2
    mov r1, #0x9
    mov r2, #0xa
    bl func_0209db88
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    add r0, r0, #0xc
    bl func_020928cc
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x3
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    mov r1, r5
    mov r0, #0x10
    bl func_0209de5c
    mov r0, #0x10
    mov r1, #0x0
    bl func_0209dd30
    cmp r0, #0x0
    moveq r0, #0x2
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
