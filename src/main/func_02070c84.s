; func_02070c84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02072370
        .extern func_02072384
        .extern func_020918d0
        .global func_02070c84
        .arm
func_02070c84:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020918d0
    ldrb r1, [r4, #0x8]
    add r0, r1, #0xfd
    and r0, r0, #0xff
    cmp r0, #0x1
    bhi .L_1054
    mov r0, r4
    mov r1, #0x19
    bl func_02072370
    mov r0, #0x7
    strb r0, [r4, #0x8]
    ldmia sp!, {r4, lr}
    bx lr
.L_1054:
    cmp r1, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    mov r0, r4
    mov r1, #0x1a
    bl func_02072384
    ldmia sp!, {r4, lr}
    bx lr
