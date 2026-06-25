; func_020a05bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209db3c
        .extern func_0209dc3c
        .extern func_0209dd68
        .global func_020a05bc
        .arm
func_020a05bc:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_0209db3c
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    mov r1, r7
    mov r0, #0x1d
    bl func_0209dd68
    ldrh ip, [sp, #0x20]
    str r4, [sp]
    mov r2, r6
    mov r3, r5
    mov r0, #0x1d
    mov r1, #0x4
    str ip, [sp, #0x4]
    bl func_0209dc3c
    cmp r0, #0x0
    moveq r0, #0x2
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
