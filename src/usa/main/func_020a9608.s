; func_020a9608 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a8c5c
        .extern func_020a94ac
        .global func_020a9608
        .arm
func_020a9608:
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
    bl func_020a8c5c
    cmp r5, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, pc}
    cmp r0, r4
    movcc r1, #0x0
    addcc sp, sp, #0xc
    strccb r1, [r5, r0]
    ldmccia sp!, {r4, r5, pc}
    cmp r4, #0x0
    addne r1, r5, r4
    movne r2, #0x0
    strneb r2, [r1, #-1]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
_LIT0: .word func_020a94ac
