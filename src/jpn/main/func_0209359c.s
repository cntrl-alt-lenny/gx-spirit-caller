; func_0209359c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209053c
        .extern func_020905a8
        .extern func_02092fc8
        .extern func_020931ac
        .global func_0209359c
        .arm
func_0209359c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r0
    bl func_02092fc8
    ldr r3, _LIT0
    mov r2, #0x0
    strh r2, [r3]
    ldr ip, [r4, #0xc]
    ldr r3, [r4, #0x10]
    subs r5, ip, r0
    sbc r4, r3, r1
    ldr r1, _LIT1
    mov r0, #0x1
    bl func_020905a8
    mov r2, #0x0
    subs r0, r5, r2
    sbcs r0, r4, r2
    ldrlt r2, _LIT2
    blt .L_64
    mov r0, #0x10000
    subs r0, r5, r0
    sbcs r0, r4, r2
    mvnlt r0, r5
    movlt r0, r0, lsl #0x10
    movlt r2, r0, lsr #0x10
.L_64:
    ldr r0, _LIT3
    ldr r1, _LIT0
    strh r2, [r0]
    mov r2, #0xc1
    mov r0, #0x10
    strh r2, [r1]
    bl func_0209053c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word 0x04000106
_LIT1: .word func_020931ac
_LIT2: .word 0x0000fffe
_LIT3: .word 0x04000104
