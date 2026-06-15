; func_02087918 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02095218
        .global func_02087918
        .arm
func_02087918:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    movs r5, r0
    mov r4, r1
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    ldrb r0, [r5, #0x2e]
    cmp r4, r0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    ldrb r0, [r5, #0x3c]
    bl func_02095218
    strb r4, [r5, #0x2e]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
