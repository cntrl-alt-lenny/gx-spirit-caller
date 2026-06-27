; func_ov002_021ffeb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b3878
        .extern func_ov002_021bcf50
        .extern func_ov002_021ff230
        .global func_ov002_021ffeb8
        .arm
func_ov002_021ffeb8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r4, r1
    mov r1, r0, lsl #0x1f
    mov r6, r1, lsr #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r6
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b3878
    ldr r1, _LIT0
    cmp r0, r1
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r6
    bl func_ov002_021bcf50
    mvn r1, #0x0
    cmp r0, r1
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ff230
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x0000ffff
