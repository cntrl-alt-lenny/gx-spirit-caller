; func_ov002_0228598c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0c8
        .extern func_ov002_021bc5e4
        .extern func_ov002_021c83ac
        .extern func_ov002_0229cc4c
        .global func_ov002_0228598c
        .arm
func_ov002_0228598c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r9, r3
    mov r5, #0x0
    str r0, [sp]
    mov sl, r1
    str r2, [sp, #0x4]
    mov r4, r5
    cmp r9, #0x0
    ldr r8, [sp, #0x30]
    ble .L_80
    ldr fp, _LIT0
.L_30:
    mov r0, r4, lsl #0x1
    ldrh r1, [r8, r0]
    mov r0, r1, asr #0x8
    and r6, r1, #0xff
    and r7, r0, #0xff
    mov r0, r6
    mov r1, r7
    bl func_ov002_021c83ac
    ldr r1, _LIT1
    and r2, r6, #0x1
    mla r1, r2, r1, fp
    add r5, r5, r0
    add r1, r1, #0x30
    mov r0, #0x14
    mla r0, r7, r0, r1
    mov r1, #0x14
    bl func_ov002_0229cc4c
    add r4, r4, #0x1
    cmp r4, r9
    blt .L_30
.L_80:
    ldr r0, [sp]
    bl func_ov002_021bc5e4
    cmp r0, #0x0
    addlt sp, sp, #0x8
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, [sp]
    ldr r6, _LIT1
    and r1, r1, #0x1
    mul r3, r1, r6
    mov r4, #0x14
    ldr r1, _LIT0
    mov r7, #0x2000
    add fp, r1, r3
    add r1, r6, #0xb20
    cmp sl, r1
    ldr r9, _LIT2
    mul r2, r0, r4
    add r1, fp, #0x30
    ldr fp, [r1, r2]
    rsb r7, r7, #0x0
    and fp, fp, r7
    and r7, sl, r7, lsr #0x13
    orr r7, fp, r7
    str r7, [r1, r2]
    ldr r8, _LIT3
    add r9, r9, r3
    mov r1, #0x1
    strh r1, [r2, r9]
    ldr r1, [sp, #0x4]
    add r7, r8, r3
    strh r1, [r2, r7]
    addne r1, r4, #0x1640
    cmpne sl, r1
    beq .L_11c
    add r1, r6, #0xe20
    cmp sl, r1
    addne sp, sp, #0x8
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r5, r5, lsl #0x1
.L_11c:
    ldr r1, _LIT4
    add r1, r1, r3
    str r5, [r2, r1]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word data_ov002_022cf0c2
_LIT4: .word data_ov002_022cf0c8
