; func_02068888 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bed80
        .extern func_020aae4c
        .global func_02068888
        .arm
func_02068888:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    add r4, sp, #0x0
    ldr r2, [r1]
    ldr r1, [r1, #0x4]
    mov r6, r0
    str r2, [sp]
    str r1, [sp, #0x4]
    mov r5, #0x0
.L_35c:
    ldr r1, [r4, r5, lsl #0x2]
    mov r0, r6
    bl func_020aae4c
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    add r5, r5, #0x1
    cmp r5, #0x2
    bcc .L_35c
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020bed80
