; func_020a0630 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209db88
        .extern func_0209dca8
        .extern func_0209dcb8
        .extern func_0209de5c
        .global func_020a0630
        .arm
func_020a0630:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_0209dca8
    mov r0, #0x1
    mov r1, #0x2
    bl func_0209db88
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    mov r1, r7
    mov r0, #0x1e
    bl func_0209de5c
    ldrh r2, [sp, #0x20]
    mov r3, #0x1e
    add r0, sp, #0x0
    mov r1, #0xa
    strh r3, [sp]
    strh r6, [sp, #0x2]
    strh r5, [sp, #0x4]
    strh r4, [sp, #0x6]
    strh r2, [sp, #0x8]
    bl func_0209dcb8
    cmp r0, #0x0
    moveq r0, #0x2
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
