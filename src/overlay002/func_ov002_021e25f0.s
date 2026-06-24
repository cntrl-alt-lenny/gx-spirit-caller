; func_ov002_021e25f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202b878
        .extern func_0202b8c0
        .extern func_ov002_021bd030
        .extern func_ov002_021d479c
        .extern func_ov002_021de480
        .extern func_ov002_02244fe4
        .extern func_ov002_02254a2c
        .global func_ov002_021e25f0
        .arm
func_ov002_021e25f0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x4
    mov sl, r0
    mov r9, r1
    mov r8, r2
    bl func_ov002_021bd030
    ldr r1, _LIT0
    ldr r2, _LIT1
    and r6, sl, #0x1
    mla r7, r6, r1, r2
    add r1, r7, r9, lsl #0x2
    ldr r1, [r1, #0x120]
    mov r4, r0
    mov r0, r1, lsl #0x13
    mov r5, r0, lsr #0x13
    mov r0, r5
    bl func_0202b878
    cmp r0, #0x16
    bne .L_84
    mov r0, r5
    bl func_0202b8c0
    cmp r0, #0x2
    bne .L_84
    ldr r0, [r7, #0xf8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_80
    mov r2, #0x0
    mov r0, sl
    mov r3, r2
    mov r1, #0xa
    bl func_ov002_021de480
.L_80:
    mov r4, #0xa
.L_84:
    mov r0, sl
    bl func_ov002_02254a2c
    ldr r3, _LIT1
    ldr r1, _LIT0
    cmp sl, #0x0
    mla r1, r6, r1, r3
    add r1, r1, #0x120
    movne r0, #0x8000
    moveq r0, #0x0
    mov r2, r4, lsl #0x1b
    ldr r1, [r1, r9, lsl #0x2]
    orr r3, r0, #0x50
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov ip, r8, lsl #0x1f
    orr r2, r6, r2, lsr #0x1a
    orr r6, r2, ip, lsr #0x11
    mov r2, r3, lsl #0x10
    mov r3, r5, lsl #0x10
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    mov r5, r6, lsl #0x10
    mov r6, r0, lsl #0x10
    mov r0, r2, lsr #0x10
    mov r1, r3, lsr #0x10
    mov r2, r5, lsr #0x10
    mov r3, r6, lsr #0x10
    bl func_ov002_021d479c
    cmp r8, #0x0
    bne .L_168
    add r0, r7, #0x120
    ldr r2, [r0, r9, lsl #0x2]
    mov r0, #0x200
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    ldr r3, [sp]
    rsb r0, r0, #0x0
    add r1, r1, r2, lsr #0x1f
    and r2, r3, r0
    and r0, r1, r0, lsr #0x17
    orr r0, r2, r0
    bic r1, r0, #0x200
    mov r0, sl, lsl #0x1f
    orr r0, r1, r0, lsr #0x16
    bic r1, r0, #0x3c00
    mov r0, r9, lsl #0x1c
    orr r0, r1, r0, lsr #0x12
    bic r0, r0, #0x4000
    bic r0, r0, #0x8000
    bic r0, r0, #0x10000
    bic r1, r0, #0x20000
    mov r0, #0xa
    str r1, [sp]
    bl func_ov002_02244fe4
.L_168:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
