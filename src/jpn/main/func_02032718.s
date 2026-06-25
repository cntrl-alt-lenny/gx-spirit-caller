; func_02032718 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020530fc
        .extern func_02053530
        .global func_02032718
        .arm
func_02032718:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0xea4]
    mov r4, #0x0
    cmp r0, #0x0
    ldmleia sp!, {r4, r5, r6, pc}
    mov r5, r4
.L_1c:
    ldr r0, [r6, #0xe74]
    add r0, r0, r5
    bl func_020530fc
    cmp r0, #0x1
    bne .L_3c
    ldr r0, [r6, #0xe74]
    add r0, r0, r5
    bl func_02053530
.L_3c:
    ldr r0, [r6, #0xea4]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0xc
    blt .L_1c
    ldmia sp!, {r4, r5, r6, pc}
