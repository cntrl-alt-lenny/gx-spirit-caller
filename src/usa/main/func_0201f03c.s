; func_0201f03c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201ecb4
        .extern func_0207e2d4
        .extern func_0207fc78
        .global func_0201f03c
        .arm
func_0201f03c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    ldrh r0, [r6]
    mov r5, r1
    mov r4, r2
    mov r8, #0x0
    cmp r0, #0x0
    ldmleia sp!, {r4, r5, r6, r7, r8, pc}
    mov r7, #0x1
.L_124:
    mov r0, r7
    bl func_0201ecb4
    mov r1, r8, lsl #0x10
    str r0, [r4, r8, lsl #0x2]
    mov r0, r6
    mov r1, r1, lsr #0x10
    bl func_0207e2d4
    mov r1, r0
    ldr r0, [r4, r8, lsl #0x2]
    mov r2, r5
    bl func_0207fc78
    ldrh r0, [r6]
    add r8, r8, #0x1
    cmp r8, r0
    blt .L_124
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
