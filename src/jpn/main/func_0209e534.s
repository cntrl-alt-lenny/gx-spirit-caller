; func_0209e534 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020927e4
        .extern func_0209da94
        .extern func_0209dbb4
        .global func_0209e534
        .arm
func_0209e534:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    bl func_0209dbb4
    mov r4, r0
    mov r0, #0x2
    mov r1, #0x7
    mov r2, #0x8
    bl func_0209da94
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    ldr r0, [r4, #0x4]
    mov r1, #0x4
    add r0, r0, #0xc
    bl func_020927e4
    ldr r1, [r4, #0x4]
    ldr r0, [r1, #0xc]
    cmp r0, #0x1
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    add r0, r1, #0x188
    mov r1, #0x2
    bl func_020927e4
    ldr r1, [r4, #0x4]
    add r0, r1, #0x100
    ldrh r0, [r0, #0x88]
    cmp r0, #0x0
    moveq r5, #0x1
    add r0, r1, #0x3e
    mov r1, #0x2
    movne r5, #0x0
    bl func_020927e4
    cmp r5, #0x1
    ldr r0, [r4, #0x4]
    addne sp, sp, #0x4
    ldrh r5, [r0, #0x3e]
    addne r0, r5, #0x51
    bicne r0, r0, #0x1f
    movne r0, r0, lsl #0x1
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    add r0, r0, #0xf8
    mov r1, #0x2
    bl func_020927e4
    ldr r0, [r4, #0x4]
    add r1, r5, #0xc
    ldrh r0, [r0, #0xf8]
    mul r0, r1, r0
    add r0, r0, #0x29
    bic r0, r0, #0x1f
    mov r0, r0, lsl #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
