; func_02068ab4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101d68
        .extern data_02101d70
        .extern func_0205442c
        .extern func_020a6d54
        .global func_02068ab4
        .arm
func_02068ab4:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    movs r6, r0
    mov r5, r1
    mov r4, r2
    bne .L_fc
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x97
    bl func_020a6d54
.L_fc:
    cmp r6, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    str r5, [sp]
    ldr r0, [r6, #0x18]
    add r1, sp, #0x0
    bl func_0205442c
    cmp r0, #0x0
    ldrne r4, [r0, #0x4]
    mov r0, r4
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02101d68
_LIT1: .word data_02101d70
