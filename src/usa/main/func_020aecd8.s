; func_020aecd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020ae380
        .extern func_020aec70
        .global func_020aecd8
        .arm
func_020aecd8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    mov r4, r1
    mov ip, #0x0
    ldr r0, _LIT0
    add r1, sp, #0x0
    str r5, [sp]
    str r4, [sp, #0x4]
    str ip, [sp, #0x8]
    bl func_020ae380
    cmp r0, #0x0
    addlt sp, sp, #0xc
    ldmltia sp!, {r4, r5, pc}
    cmp r0, r4
    bcs .L_54
    mov r1, r0, lsl #0x1
    mov r2, #0x0
    add sp, sp, #0xc
    strh r2, [r5, r1]
    ldmia sp!, {r4, r5, pc}
.L_54:
    mov r1, #0x0
    add r0, r5, r4, lsl #0x1
    strh r1, [r0, #-2]
    sub r0, r1, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
_LIT0: .word func_020aec70
