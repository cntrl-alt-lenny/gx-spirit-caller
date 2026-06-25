; func_ov002_021bd120 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021c921c
        .global func_ov002_021bd120
        .arm
func_ov002_021bd120:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r7, #0x1
    mla r6, r1, r0, r2
    add r5, r6, #0x30
    mov r4, #0x0
.L_20:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r6, #0x38]
    cmpne r0, #0x0
    beq .L_50
    mov r0, r7
    mov r1, r4
    bl func_ov002_021c921c
    tst r0, #0x46
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
.L_50:
    add r4, r4, #0x1
    cmp r4, #0x5
    add r5, r5, #0x14
    add r6, r6, #0x14
    blt .L_20
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
