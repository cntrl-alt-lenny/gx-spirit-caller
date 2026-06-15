; func_ov002_021bbbc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c8940
        .global func_ov002_021bbbc0
        .arm
func_ov002_021bbbc0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov sl, r0
    ldr r4, _LIT0
    ldr r0, _LIT1
    and r3, sl, #0x1
    mla r7, r3, r0, r4
    mov r5, #0x0
    mov r9, r1
    mov r8, r2
    mov r4, r5
    add r6, r7, #0x30
.L_238:
    cmp r4, r8
    beq .L_280
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r7, #0x38]
    cmpne r0, #0x0
    beq .L_280
    ldr r1, [r7, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_280
    mov r0, sl
    mov r1, r4
    bl func_ov002_021c8940
    cmp r9, r0
    addeq r5, r5, #0x1
.L_280:
    add r4, r4, #0x1
    cmp r4, #0x5
    add r6, r6, #0x14
    add r7, r7, #0x14
    blt .L_238
    mov r0, r5
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
