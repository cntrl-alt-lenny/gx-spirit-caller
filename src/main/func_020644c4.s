; func_020644c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02061e88
        .extern func_02062530
        .extern func_02064aa0
        .global func_020644c4
        .arm
func_020644c4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    ldmneia sp!, {r4, pc}
    mov r1, #0x1
    str r1, [r4, #0x18]
    bl func_02062530
    mov r0, r4
    bl func_02061e88
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_02064aa0
    ldmia sp!, {r4, pc}
