; func_02053460 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a6660
        .extern func_020a67ec
        .global func_02053460
        .arm
func_02053460:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x108
    mov r4, r1
    and r3, r4, #0x0
    mov r1, #0x0
    and ip, r0, #-2147483648
    cmp r3, r1
    cmpeq ip, r1
    addne sp, sp, #0x108
    movne r0, r1
    ldmneia sp!, {r4, pc}
    str r0, [sp]
    add r0, sp, #0x8
    mov r1, #0x7
    str r2, [sp, #0x4]
    bl func_020a67ec
    add r0, sp, #0x8
    add r1, sp, #0x0
    mov r2, #0x8
    bl func_020a6660
    and r2, r0, #0x7f
    mov r1, r2, asr #0x1f
    mov r0, #0x0
    cmp r1, r0
    cmpeq r2, r4
    moveq r0, #0x1
    add sp, sp, #0x108
    ldmia sp!, {r4, pc}
