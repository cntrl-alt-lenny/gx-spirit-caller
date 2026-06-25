; func_ov002_02294318 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_02280a64
        .extern func_ov002_022942b4
        .global func_ov002_02294318
        .arm
func_ov002_02294318:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r3, #0x1
    mov r4, r1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r1, r0, #0x1
    sub r2, r3, #0x2
    str r3, [sp]
    bl func_ov002_02280a64
    ldr r1, _LIT0
    cmp r0, r1
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_022942b4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000009c4
