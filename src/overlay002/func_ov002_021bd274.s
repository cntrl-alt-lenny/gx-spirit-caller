; func_ov002_021bd274 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202b878
        .extern func_ov002_021b8fcc
        .global func_ov002_021bd274
        .arm
func_ov002_021bd274:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r8, #0x1
    mla r7, r1, r0, r2
    mov r5, #0x0
    mov r4, r5
    add r6, r7, #0x30
.L_98:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r7, #0x38]
    cmpne r0, #0x0
    beq .L_e4
    cmp r4, #0x5
    bge .L_cc
    mov r0, r8
    mov r1, r4
    bl func_ov002_021b8fcc
    cmp r0, #0x0
    beq .L_e4
.L_cc:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b878
    cmp r0, #0x17
    addeq r5, r5, #0x1
.L_e4:
    add r4, r4, #0x1
    cmp r4, #0xa
    add r6, r6, #0x14
    add r7, r7, #0x14
    blt .L_98
    mov r0, r5
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
