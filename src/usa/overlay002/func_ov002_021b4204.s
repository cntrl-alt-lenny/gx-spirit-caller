; func_ov002_021b4204 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c6
        .extern data_ov002_022d0570
        .global func_ov002_021b4204
        .arm
func_ov002_021b4204:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr ip, _LIT0
    mov lr, #0x14
    ldr r5, _LIT1
    and r6, r0, #0x1
    mul r4, r1, lr
    mla r0, r6, ip, r5
    ldrh r5, [r4, r0]
    mov r8, r2
    mov r7, r3
    cmp r5, #0x0
    beq .L_d0
    ldr r4, _LIT2
.L_a8:
    add r6, r4, r5, lsl #0x3
    ldrh r5, [r6, #0x6]
    mov r0, r6
    mov r1, r7
    blx r8
    cmp r0, #0x0
    movne r0, r6
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r5, #0x0
    bne .L_a8
.L_d0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c6
_LIT2: .word data_ov002_022d0570
