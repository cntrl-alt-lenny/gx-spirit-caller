; func_02064aa0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020453b4
        .extern func_02054148
        .extern func_02054684
        .extern func_02054e70
        .extern func_0205531c
        .global func_02064aa0
        .arm
func_02064aa0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r4, #0x14]
    ldmneia sp!, {r4, pc}
    ldr r0, [r4]
    bl func_02054e70
    ldr r0, [r4, #0xc]
    bl func_02054684
    ldr r0, [r4, #0x10]
    bl func_02054148
    mov r0, r4
    bl func_020453b4
    bl func_0205531c
    ldmia sp!, {r4, pc}
