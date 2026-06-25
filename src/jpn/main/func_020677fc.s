; func_020677fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02067844
        .global func_020677fc
        .arm
func_020677fc:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r5, r2
    cmp r5, #0x0
    mov r7, r0
    mov r6, r1
    mov r4, #0x0
    addle sp, sp, #0x4
    ldmleia sp!, {r4, r5, r6, r7, pc}
.L_24:
    ldrb r1, [r6, r4]
    mov r0, r7
    bl func_02067844
    strb r0, [r6, r4]
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_24
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
