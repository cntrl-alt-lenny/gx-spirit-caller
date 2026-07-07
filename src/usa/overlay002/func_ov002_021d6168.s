; func_ov002_021d6168 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c6
        .extern data_ov002_022d0570
        .extern func_ov002_021d59c4
        .extern func_ov002_021de390
        .extern func_ov002_021deb3c
        .global func_ov002_021d6168
        .arm
func_ov002_021d6168:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r9, r0
    ldr r4, _LIT0
    ldr r2, _LIT1
    and r3, r9, #0x1
    mov r8, r1
    mov r0, #0x14
    mul r1, r8, r0
    mla r0, r3, r4, r2
    ldrh r6, [r1, r0]
    cmp r6, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr sl, _LIT2
    ldr r5, _LIT3
    ldr fp, _LIT4
.L_288:
    add r1, r5, r6, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh r6, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0xd
    addls pc, pc, r0, lsl #0x2
    b .L_350
    b .L_350
    b .L_350
    b .L_350
    b .L_350
    b .L_350
    b .L_350
    b .L_2e0
    b .L_350
    b .L_350
    b .L_350
    b .L_320
    b .L_320
    b .L_320
    b .L_320
.L_2e0:
    ldrh r1, [r1]
    and r0, r1, #0xff
    and r2, r0, #0x1
    mla r3, r2, r4, sl
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    mov r2, #0x14
    mla r2, r1, r2, r3
    ldr r2, [r2, #0x30]
    mov r2, r2, lsl #0x13
    cmp fp, r2, lsr #0x13
    bne .L_350
    mov r2, #0x0
    mov r3, r2
    bl func_ov002_021deb3c
    b .L_350
.L_320:
    ldrh r7, [r1]
    mov r0, r9
    mov r1, r8
    mov r2, r7
    mov r3, #0x0
    bl func_ov002_021d59c4
    mov r1, r7, asr #0x8
    mov r2, #0x0
    and r0, r7, #0xff
    and r1, r1, #0xff
    mov r3, r2
    bl func_ov002_021de390
.L_350:
    cmp r6, #0x0
    bne .L_288
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c6
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022d0570
_LIT4: .word 0x000019ed
