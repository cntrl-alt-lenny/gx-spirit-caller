; func_ov002_022410f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b3618
        .extern func_ov002_021b3ac0
        .extern func_ov002_021c1ef0
        .extern func_ov002_0223de94
        .global func_ov002_022410f0
        .arm
func_ov002_022410f0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r1
    mov r9, r0
    mov r1, #0x0
    mov r7, r2
    bl func_ov002_0223de94
    and r5, r0, #0xff
    mov r0, r9
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r6, r0, #0xff
    mov r0, r5
    mov r1, r6
    bl func_ov002_021b3618
    mov r4, r0
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT0
    cmp r4, r0
    beq .L_210
    and r1, r8, #0xff
    and r0, r7, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    cmp r4, r0, lsr #0x10
    beq .L_210
    mov r0, r5
    mov r1, r6
    mov r2, r8
    mov r3, r7
    bl func_ov002_021b3ac0
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_210:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x0000ffff
