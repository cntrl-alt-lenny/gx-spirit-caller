; func_ov002_02255d70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021b3618
        .extern func_ov002_021baca8
        .extern func_ov002_021de480
        .global func_ov002_02255d70
        .arm
func_ov002_02255d70:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r7, _LIT0
    ldr r8, _LIT1
    mov fp, #0x0
.L_3e8:
    ldr r0, _LIT2
    ldr r5, _LIT3
    ldr r0, [r0, #0xcec]
    ldr r6, _LIT4
    mov sl, #0x0
    eor r9, r0, fp
    mov r4, #0x14
.L_404:
    mov r0, r9
    mov r1, sl
    mov r2, r8
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_488
    mov r0, r9
    mov r1, sl
    bl func_ov002_021b3618
    cmp r0, r6
    beq .L_488
    and r1, r0, #0xff
    and r1, r1, #0x1
    mla r2, r1, r5, r7
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    mla r1, r0, r4, r2
    ldr r0, [r1, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_488
    ldrh r0, [r1, #0x38]
    cmp r0, #0x0
    bne .L_488
    mov r2, #0x0
    mov r0, r9
    mov r1, sl
    mov r3, r2
    bl func_ov002_021de480
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_488:
    add sl, sl, #0x1
    cmp sl, #0x4
    ble .L_404
    add fp, fp, #0x1
    cmp fp, #0x2
    blt .L_3e8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x000014fc
_LIT2: .word data_ov002_022d016c
_LIT3: .word 0x00000868
_LIT4: .word 0x0000ffff
