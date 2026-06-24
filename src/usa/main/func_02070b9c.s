; func_02070b9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02072288
        .extern func_0207229c
        .extern func_020917e8
        .global func_02070b9c
        .arm
func_02070b9c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020917e8
    ldrb r1, [r4, #0x8]
    add r0, r1, #0xfd
    and r0, r0, #0xff
    cmp r0, #0x1
    bhi .L_3c
    mov r0, r4
    mov r1, #0x19
    bl func_02072288
    mov r0, #0x7
    strb r0, [r4, #0x8]
    ldmia sp!, {r4, lr}
    bx lr
.L_3c:
    cmp r1, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    mov r0, r4
    mov r1, #0x1a
    bl func_0207229c
    ldmia sp!, {r4, lr}
    bx lr
