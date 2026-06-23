; func_0204fc28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204987c
        .extern func_0204cbac
        .global func_0204fc28
        .arm
func_0204fc28:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204987c
    ldrb r0, [r0, #0x1a0]
    cmp r0, #0x2
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_0204cbac
    ldmia sp!, {r4, pc}
