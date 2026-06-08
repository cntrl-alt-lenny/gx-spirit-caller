; func_ov002_0223b16c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021b99b4
        .extern func_ov002_0221d288
        .extern func_ov002_0223def4
        .global func_ov002_0223b16c
        .arm
func_ov002_0223b16c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r2, [r2, #0x5a8]
    mov r4, r1
    cmp r2, #0x80
    bne .L_864
    mov r1, #0x0
    bl func_ov002_0223def4
    ldrh r2, [r5, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b99b4
    cmp r0, #0x0
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
.L_864:
    mov r0, r5
    mov r1, r4
    bl func_ov002_0221d288
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
