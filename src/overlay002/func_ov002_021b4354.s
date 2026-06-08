; func_ov002_021b4354 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0650
        .global func_ov002_021b4354
        .arm
func_ov002_021b4354:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldrh r5, [r0, #0xa]
    mov r8, r1
    mov r7, r2
    cmp r5, #0x0
    beq .L_128
    ldr r4, _LIT0
.L_100:
    add r6, r4, r5, lsl #0x3
    ldrh r5, [r6, #0x6]
    mov r0, r6
    mov r1, r7
    blx r8
    cmp r0, #0x0
    movne r0, r6
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r5, #0x0
    bne .L_100
.L_128:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022d0650
