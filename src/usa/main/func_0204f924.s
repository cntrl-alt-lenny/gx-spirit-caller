; func_0204f924 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204987c
        .global func_0204f924
        .arm
func_0204f924:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204987c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_0204987c
    add r0, r0, #0x2c8
    str r0, [r4]
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    add r0, r0, #0x1
    ldmia sp!, {r4, pc}
