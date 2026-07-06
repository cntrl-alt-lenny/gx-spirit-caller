; func_ov002_02256638 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021bb1ec
        .extern func_ov002_021de390
        .global func_ov002_02256638
        .arm
func_ov002_02256638:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov fp, #0x0
.L_164:
    ldr r0, _LIT0
    ldr r6, _LIT1
    ldr r1, [r0, #0xcec]
    ldr r2, _LIT2
    eor r7, r1, fp
    ldr r0, _LIT3
    and r1, r7, #0x1
    mla r0, r1, r0, r2
    add r9, r0, #0x94
    add sl, r0, #0x64
    mov r8, #0x5
    add r4, r6, #0x29
    add r5, r6, #0x24
.L_198:
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    cmp r0, r5
    cmpne r0, r4
    bne .L_210
    ldr r3, [sl, #0x40]
    ldrh r0, [sl, #0x38]
    mov r2, r3, lsr #0x6
    mov r1, r3, lsr #0x2
    and r2, r2, #0x1
    orr r1, r1, r3, lsr #0x1
    mvn r2, r2
    and r1, r1, #0x1
    and r2, r0, r2
    mvn r0, r1
    tst r2, r0
    beq .L_210
    mov r0, r7
    mov r1, r6
    bl func_ov002_021bb1ec
    cmp r0, #0x0
    bne .L_210
    mov r2, #0x0
    mov r0, r7
    mov r1, r8
    mov r3, r2
    bl func_ov002_021de390
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_210:
    add r8, r8, #0x1
    cmp r8, #0xa
    add r9, r9, #0x14
    add sl, sl, #0x14
    blt .L_198
    add fp, fp, #0x1
    cmp fp, #0x2
    blt .L_164
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x0000173c
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00000868
