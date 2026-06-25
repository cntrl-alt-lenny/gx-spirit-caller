; func_ov002_021bcf50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022bdec8
        .extern func_ov002_021baf88
        .extern func_ov002_021bbdcc
        .extern func_ov002_021bcf04
        .global func_ov002_021bcf50
        .arm
func_ov002_021bcf50:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r0, _LIT0
    bl func_ov002_021baf88
    cmp r0, #0x0
    beq .L_2c
    mov r0, r7
    bl func_ov002_021bbdcc
    cmp r0, #0x5
    mvnge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
.L_2c:
    ldr r5, _LIT1
    mov r6, #0x0
.L_34:
    ldr r4, [r5, r6, lsl #0x2]
    mov r0, r7
    add r1, r4, #0x5
    bl func_ov002_021bcf04
    cmp r0, #0x0
    addne r0, r4, #0x5
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    add r6, r6, #0x1
    cmp r6, #0x5
    blt .L_34
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x000016df
_LIT1: .word data_ov002_022bdec8
