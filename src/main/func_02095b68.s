; func_02095b68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8220
        .global func_02095b68
        .arm
func_02095b68:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r3, _LIT0
    and r2, r0, #0xff
    mov r1, #0xc
    mla r3, r2, r1, r3
    mov r1, r0, asr #0x8
    ldrb r0, [r3, #0x8]
    and r1, r1, #0xff
    cmp r1, r0
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    ldr r1, [r3]
    cmp r1, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {lr}
    bxeq lr
    ldr r0, [r3, #0x4]
    blx r1
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a8220
