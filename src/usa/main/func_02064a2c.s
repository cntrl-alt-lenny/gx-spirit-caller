; func_02064a2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045364
        .extern func_020540d4
        .extern func_02054610
        .extern func_02054dfc
        .extern func_020552a8
        .global func_02064a2c
        .arm
func_02064a2c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r4, #0x14]
    ldmneia sp!, {r4, pc}
    ldr r0, [r4]
    bl func_02054dfc
    ldr r0, [r4, #0xc]
    bl func_02054610
    ldr r0, [r4, #0x10]
    bl func_020540d4
    mov r0, r4
    bl func_02045364
    bl func_020552a8
    ldmia sp!, {r4, pc}
