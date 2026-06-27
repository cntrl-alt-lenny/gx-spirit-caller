; func_ov002_021bd0b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202e2bc
        .global func_ov002_021bd0b8
        .arm
func_ov002_021bd0b8:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    ldr r1, _LIT1
    and r0, r0, #0x1
    mla r6, r0, r1, r2
    add r5, r6, #0x30
    mov r4, #0x0
.L_184:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r1, [r6, #0x38]
    cmpne r1, #0x0
    beq .L_1ac
    bl func_0202e2bc
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
.L_1ac:
    add r4, r4, #0x1
    cmp r4, #0x5
    add r5, r5, #0x14
    add r6, r6, #0x14
    blt .L_184
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
