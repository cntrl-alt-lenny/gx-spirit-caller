; func_0209f708 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020927e4
        .extern func_02092800
        .extern func_0209da94
        .extern func_0209dbb4
        .extern func_0209dc3c
        .extern func_0209dd68
        .global func_0209f708
        .arm
func_0209f708:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r6, r1
    mov r5, r2
    bl func_0209dbb4
    mov r4, r0
    mov r0, #0x1
    mov r1, #0x8
    bl func_0209da94
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    add r0, r0, #0x10
    bl func_020927e4
    ldr r0, [r4, #0x4]
    ldr r0, [r0, #0x10]
    cmp r0, #0x1
    addeq sp, sp, #0x4
    moveq r0, #0x3
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    cmp r5, #0x10
    addcc sp, sp, #0x4
    movcc r0, #0x6
    ldmccia sp!, {r4, r5, r6, r7, lr}
    bxcc lr
    cmp r6, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x6
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    mov r0, r6
    mov r1, r5
    bl func_02092800
    mov r1, r7
    mov r0, #0x11
    bl func_0209dd68
    mov r2, r6
    mov r3, r5
    mov r0, #0x11
    mov r1, #0x2
    bl func_0209dc3c
    cmp r0, #0x0
    moveq r0, #0x2
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
