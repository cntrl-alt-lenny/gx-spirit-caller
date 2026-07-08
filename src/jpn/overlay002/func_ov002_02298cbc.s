; func_ov002_02298cbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd444
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021bc920
        .extern func_ov002_021c9d34
        .extern func_ov002_02271988
        .extern func_ov002_0227aaac
        .extern func_ov002_0227d608
        .extern func_ov002_0227d7d4
        .extern func_ov002_02298988
        .global func_ov002_02298cbc
        .arm
func_ov002_02298cbc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    mov sl, r0
    ldr r3, _LIT0
    ldr r4, _LIT1
    and r5, sl, #0x1
    mla r3, r5, r3, r4
    add r3, r3, #0x120
    str r3, [sp, #0x10]
    ldr r3, [r3, r1, lsl #0x2]
    str r1, [sp, #0x4]
    mov r1, r3, lsl #0x2
    mov r4, r3, lsl #0x13
    mov r1, r1, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r3, lsr #0x1f
    str r2, [sp, #0x8]
    mov r5, r4, lsr #0x13
    bl func_ov002_0227d7d4
    mov r6, r0
    mov r0, sl
    bl func_ov002_021c9d34
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0x8]
    cmp r6, #0x0
    mov r8, #0x0
    ble .L_46c
    add r4, sp, #0x14
    mvn fp, #0x0
.L_3b0:
    mov r0, sl
    mov r1, r5
    mov r2, #0x0
    mov r3, r8
    str r4, [sp]
    bl func_ov002_0227d608
    mov r7, r0
    cmp r7, fp
    addeq sp, sp, #0x1c
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    and r9, r7, #0xff
    cmp sl, r9
    bne .L_428
    mov r0, r7, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    str r0, [sp, #0xc]
    ldr r1, [sp, #0xc]
    mov r0, sl
    bl func_ov002_02298988
    cmp r0, #0x0
    beq .L_428
    ldr r1, [sp, #0xc]
    mov r0, sl
    bl func_ov002_0227aaac
    add sp, sp, #0x1c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_428:
    mov r0, r7, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x8
    and r3, r1, #0xff
    mov r0, sl
    mov r2, r9
    mov r1, r5
    bl func_ov002_021bc920
    cmp r0, #0x0
    movne r0, r8, lsl #0x1
    addne r8, r8, #0x1
    strneh r7, [r4, r0]
    mov r0, r8, lsl #0x1
    add r8, r8, #0x1
    strh r7, [r4, r0]
    cmp r8, r6
    blt .L_3b0
.L_46c:
    ldr r2, _LIT2
    ldr r0, [sp, #0x8]
    str sl, [r2, #0xd6c]
    cmp r0, #0x0
    ldr r1, [sp, #0x10]
    ldr r0, [sp, #0x4]
    str sl, [r2, #0xd70]
    ldr r1, [r1, r0, lsl #0x2]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    str r0, [r2, #0xd60]
    moveq r0, #0x1
    movne r0, #0x0
    mov r1, #0x0
    mov r2, #0x1
    bl func_ov002_02271988
    ldr r0, _LIT3
    mov r1, #0x0
    str r1, [r0, #0x1cc]
    mov r0, #0x1
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022d008c
_LIT3: .word data_ov002_022cd444
