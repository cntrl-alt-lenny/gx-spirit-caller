; func_020a071c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209dc30
        .extern func_0209dd30
        .extern func_0209de5c
        .global func_020a071c
        .arm
func_020a071c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    bl func_0209dc30
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    cmp r4, #0x0
    beq .L_12c
    cmp r4, #0x1
    addne sp, sp, #0x4
    movne r0, #0x6
    ldmneia sp!, {r4, r5, lr}
    bxne lr
.L_12c:
    mov r1, r5
    mov r0, #0x19
    bl func_0209de5c
    mov r2, r4
    mov r0, #0x19
    mov r1, #0x1
    bl func_0209dd30
    cmp r0, #0x0
    moveq r0, #0x2
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
