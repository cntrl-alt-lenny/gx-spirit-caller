; func_ov000_021adfc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov000_021b56b4
        .extern data_ov000_021c758c
        .extern data_ov000_021c75c4
        .extern func_02001cd0
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02001e94
        .extern func_02005374
        .extern func_0201d4b4
        .extern func_0201d530
        .extern func_02094504
        .extern func_020a6afc
        .extern func_ov000_021ab4bc
        .extern func_ov000_021add24
        .extern func_ov000_021adf18
        .global func_ov000_021adfc4
        .arm
func_ov000_021adfc4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x48
    ldr r2, _LIT0
    ldr r5, _LIT1
    ldr r4, [r2, #0x2a4]
    ldr r3, [r2, #0x2a0]
    mov r2, r4, lsl #0x9
    mov r4, r2, lsr #0x1e
    mov r2, #0x28
    mla r6, r4, r2, r5
    ldr r5, _LIT2
    mov r8, r0
    cmp r3, #0x0
    ldrne r0, [r5, #0x268]
    mov sl, r1
    addne r7, r0, #0x100
    mov r0, #0x2
    moveq r7, #0x20
    bl func_0201d4b4
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    mov r0, #0x2
    bl func_0201d530
    add r1, r7, r0
    mov r0, #0x0
    mov r2, #0x2800
    bl func_02094504
    cmp r8, #0x0
    beq .L_38c
    mov r0, #0x2
    bl func_0201d530
    mov r4, r0
    add r0, r5, #0x1e0
    mov r1, #0x20
    mov r2, #0x2
    bl func_02001d0c
    ldr r0, _LIT3
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    add r0, r5, #0x1e0
    mov r1, #0xf
    mov r2, #0x5
    bl func_02001cd0
    mov r0, r8
    mov r1, #0xc
    mov r2, #0x100
    bl func_ov000_021add24
    mov r1, r8
    add r2, r7, r4
    mov r3, r0
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    add r0, r5, #0x1e0
    bl func_02005374
    mov r0, #0x2
    bl func_0201d4b4
    mov r1, r0
    add r0, r5, #0x1e0
    mov r2, r7, asr #0x5
    mov r3, #0xd
    bl func_02001e94
.L_38c:
    cmp sl, #0x0
    beq .L_4b0
    add r4, r7, #0x800
    mov r0, #0x2
    bl func_0201d530
    add r7, r4, r0
    mov r1, sl
    add r0, r5, #0x9c
    bl func_020a6afc
    ldr r0, [r5, #0x26c]
    mov r8, #0x0
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1e
    adds r0, r0, #0x2
    beq .L_4b0
    mov r9, r4, asr #0x5
    add r4, sp, #0x8
    mov fp, #0xc
.L_3d4:
    add r0, r5, #0x214
    mov r1, #0x20
    mov r2, #0x2
    bl func_02001d0c
    ldr r0, _LIT3
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    add r0, r5, #0x214
    mov r1, #0xf
    mov r2, #0x5
    bl func_02001cd0
    mov r0, sl
    mov r1, r8
    mov r2, r4
    bl func_ov000_021adf18
    mov r0, r4
    mov r1, #0xc
    mov r2, #0x100
    bl func_ov000_021add24
    mov r3, r0
    add r0, r6, r8, lsl #0x3
    ldrsh r2, [r0, #0xa]
    add r0, r5, #0x214
    mov r1, r4
    and r2, r2, #0x7
    add r2, r2, #0x1
    stmia sp, {r2, fp}
    mov r2, r7
    bl func_02005374
    mov r0, #0x2
    bl func_0201d4b4
    add r2, r6, r8, lsl #0x3
    ldrsh r3, [r2, #0xa]
    ldrsh r1, [r2, #0x8]
    mov r2, r9
    add r3, r3, #0x7
    mov r3, r3, asr #0x3
    add r1, r1, #0x7
    mov r3, r3, lsl #0x5
    add r1, r3, r1, asr #0x3
    add r1, r0, r1, lsl #0x1
    add r0, r5, #0x214
    mov r3, #0xd
    bl func_02001e94
    ldr r0, [r5, #0x26c]
    add r8, r8, #0x1
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1e
    add r0, r0, #0x2
    add r7, r7, #0x800
    add r9, r9, #0x40
    cmp r8, r0
    bcc .L_3d4
.L_4b0:
    mov r0, #0x0
    mov r1, #0x4
    bl func_ov000_021ab4bc
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov000_021c758c
_LIT1: .word data_ov000_021b56b4
_LIT2: .word data_ov000_021c75c4
_LIT3: .word data_02104f4c
