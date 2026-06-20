; func_ov002_02293790 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022c9508
        .extern data_ov002_022cd524
        .extern data_ov002_022cf16c
        .extern func_0202b878
        .extern func_ov002_021c2f24
        .extern func_ov002_021fc3e8
        .global func_ov002_02293790
        .arm
func_ov002_02293790:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x18
    mov r9, r0
    add r4, sp, #0x0
    mov r5, r9
    mov r7, r4
    ldmia r5!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldmia r5, {r0, r1}
    stmia r4, {r0, r1}
    ldrh r2, [r9, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    mov r8, #0x0
    cmp r0, #0x7d0
    addle sp, sp, #0x18
    movle r0, r8
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r6, _LIT2
    ldr sl, _LIT3
    mov r4, r8
    mov r5, r8
.L_6c:
    ldr r0, [r6, r8, lsl #0x3]
    strh r0, [sp]
    ldrh r0, [sp]
    bl func_0202b878
    cmp r0, #0x16
    bne .L_ec
    ldrh r0, [r9, #0x2]
    ldrh r1, [sp]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021c2f24
    cmp r0, #0x0
    beq .L_ec
    add r0, r6, r8, lsl #0x3
    ldr r2, [r0, #0x4]
    mov r0, r7
    mov r1, r5
    blx r2
    cmp r0, #0x0
    beq .L_ec
    mov r0, r7
    mov r1, r4
    bl func_ov002_021fc3e8
    cmp r0, #0x0
    beq .L_ec
    ldrh r2, [sp]
    ldr r1, _LIT4
    add sp, sp, #0x18
    str r2, [r1, #0x10]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_ec:
    add r8, r8, #0x1
    ldr r0, [r6, r8, lsl #0x3]
    cmp r0, sl
    bne .L_6c
    mov r0, #0x0
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022c9508
_LIT3: .word 0x00001379
_LIT4: .word data_ov002_022cd524
