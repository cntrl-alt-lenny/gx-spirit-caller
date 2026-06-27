; func_ov002_02264f2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021b4040
        .extern func_ov002_021d46ac
        .extern func_ov002_021e267c
        .global func_ov002_02264f2c
        .arm
func_ov002_02264f2c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r8, #0x0
    ldr r6, _LIT0
    ldr r4, _LIT1
    mov sl, r0
    mov fp, r8
    mov r5, #0x8000
    mov r7, #0xb
.L_20:
    mov r0, sl
    mov r1, r7
    mov r2, r6
    bl func_ov002_021b4040
    cmp r0, #0x0
    blt .L_8c
    ldr r1, [r4, #0xcf0]
    cmp sl, #0x0
    add r1, r1, #0x1
    sub r9, r1, r0
    movne r0, r5
    moveq r0, fp
    orr r0, r0, #0x3b
    mov r0, r0, lsl #0x10
    mov r3, r9, lsl #0x10
    mov r1, r6
    mov r2, #0x1
    mov r0, r0, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d46ac
    cmp r9, #0x14
    blt .L_8c
    mov r2, #0x1
    mov r0, sl
    mov r1, r6
    mov r3, r2
    bl func_ov002_021e267c
.L_8c:
    add r8, r8, #0x1
    cmp r8, #0x2
    eor sl, sl, #0x1
    blt .L_20
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x0000169c
_LIT1: .word data_ov002_022d008c
