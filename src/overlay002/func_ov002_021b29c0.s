; func_ov002_021b29c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d0658
        .extern func_ov002_021b1d84
        .global func_ov002_021b29c0
        .arm
func_ov002_021b29c0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r6, _LIT0
    ldr r0, _LIT1
    ldr sl, _LIT2
    ldr fp, _LIT3
    ldr r8, _LIT4
    ldr r7, _LIT5
    mov r9, #0x1
    add r4, r6, #0x2b
    rsb r5, r0, #0x21c0
.L_1f0:
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x8
    bne .L_28c
    ldrh r3, [sl]
    and r0, r3, #0xff
    and r1, r0, #0x1
    ldr r0, _LIT1
    mla r2, r1, r0, fp
    mov r0, r3, asr #0x8
    and r1, r0, #0xff
    mov r0, #0x14
    mla r0, r1, r0, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    cmp r8, r0, lsr #0x13
    mov r1, r0, lsr #0x13
    bcc .L_264
    cmp r1, r8
    bcs .L_284
    cmp r1, r7
    bhi .L_254
    beq .L_284
    b .L_28c
.L_254:
    ldr r0, _LIT6
    cmp r1, r0
    beq .L_284
    b .L_28c
.L_264:
    cmp r1, r6
    bhi .L_27c
    bcs .L_284
    cmp r1, r5
    beq .L_284
    b .L_28c
.L_27c:
    cmp r1, r4
    bne .L_28c
.L_284:
    mov r0, r9
    bl func_ov002_021b1d84
.L_28c:
    add r9, r9, #0x1
    cmp r9, #0x100
    add sl, sl, #0x8
    blt .L_1f0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00001a4e
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022d0658
_LIT3: .word data_ov002_022cf16c
_LIT4: .word 0x00001843
_LIT5: .word 0x00001505
_LIT6: .word 0x00001644
