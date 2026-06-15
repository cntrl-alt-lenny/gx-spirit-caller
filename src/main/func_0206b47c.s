; func_0206b47c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101db0
        .extern data_02101e3c
        .extern func_0205442c
        .extern func_020544c8
        .extern func_02068c08
        .extern func_020a6d54
        .global func_0206b47c
        .arm
func_0206b47c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    str r1, [sp]
    bl func_02068c08
    add r1, sp, #0x0
    bl func_0205442c
    movs r4, r0
    bne .L_448
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0xf4
    bl func_020a6d54
.L_448:
    cmp r4, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, pc}
    ldr r0, [r4, #0x4]
    sub r0, r0, #0x1
    str r0, [r4, #0x4]
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, pc}
    mov r0, r5
    bl func_02068c08
    add r1, sp, #0x0
    bl func_020544c8
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_02101e3c
_LIT1: .word data_02101db0
