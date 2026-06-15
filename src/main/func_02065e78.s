; func_02065e78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e968
        .extern func_02053eb4
        .extern func_020540d0
        .extern func_02054140
        .global func_02065e78
        .arm
func_02065e78:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r6, r0
    ldr r0, [r1]
    mov r5, #0x0
    bl func_02054140
    cmp r0, #0x0
    ldmleia sp!, {r4, r5, r6, pc}
    ldr r4, _LIT0
.L_5c:
    ldr r0, [r4]
    mov r1, r5
    bl func_020540d0
    cmp r6, r0
    bne .L_84
    ldr r0, _LIT0
    mov r1, r5
    ldr r0, [r0]
    bl func_02053eb4
    ldmia sp!, {r4, r5, r6, pc}
.L_84:
    ldr r0, [r4]
    add r5, r5, #0x1
    bl func_02054140
    cmp r5, r0
    blt .L_5c
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219e968
