; func_0209ee20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209db88
        .extern func_0209dca8
        .extern func_0209dd30
        .extern func_0209de5c
        .global func_0209ee20
        .arm
func_0209ee20:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    mov r0, #0x1
    mov r1, #0x2
    bl func_0209db88
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    bl func_0209dca8
    add r1, r0, #0x100
    mov r2, #0x0
    strh r2, [r1, #0x50]
    str r2, [r0, #0x14c]
    mov r1, r5
    mov r0, #0x8
    bl func_0209de5c
    mov r2, r4
    mov r0, #0x8
    mov r1, #0x1
    bl func_0209dd30
    cmp r0, #0x0
    moveq r0, #0x2
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
