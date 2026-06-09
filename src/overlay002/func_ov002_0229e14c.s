; func_ov002_0229e14c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0229d2c8
        .global func_ov002_0229e14c
        .arm
func_ov002_0229e14c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r6
    mov r4, #0x0
.L_10:
    mov r0, r5
    bl func_ov002_0229d2c8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    add r4, r4, #0x1
    cmp r4, #0x8
    add r5, r5, #0x14
    blt .L_10
    ldr r0, [r6, #0xb4]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
