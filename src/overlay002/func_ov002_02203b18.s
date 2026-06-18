; func_ov002_02203b18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c2624
        .global func_ov002_02203b18
        .arm
func_ov002_02203b18:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r4, _LIT0
    ldr r9, _LIT1
    mov r6, #0x0
    mov r5, #0x5
.L_14:
    and r0, r6, #0x1
    mla r1, r0, r9, r4
    mov r7, r5
    add r8, r1, #0x94
.L_24:
    ldr r1, [r8]
    mov r0, r6
    mov r2, r1, lsl #0x13
    mov r1, r7
    mov r2, r2, lsr #0x13
    bl func_ov002_021c2624
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    add r7, r7, #0x1
    cmp r7, #0xa
    add r8, r8, #0x14
    blt .L_24
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_14
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
