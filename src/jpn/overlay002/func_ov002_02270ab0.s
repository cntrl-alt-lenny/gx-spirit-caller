; func_ov002_02270ab0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cf08c
        .extern func_ov002_021bc1a8
        .extern func_ov002_021bc538
        .extern func_ov002_022706c8
        .global func_ov002_02270ab0
        .arm
func_ov002_02270ab0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r5, r2
    add r4, r6, r5
    mov r7, r0
    cmp r4, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT0
    ldr r1, _LIT1
    and r2, r7, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, r4, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r3, _LIT2
    ldrb r1, [r3, #0x8]
    cmp r1, #0x0
    bne .L_20ec
    ldr r0, [r3]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    bne .L_212c
    ldr r0, _LIT2
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    cmp r7, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    mov r1, r4
    bl func_ov002_021bc1a8
    cmp r0, #0x0
    bne .L_212c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_20ec:
    cmp r1, #0x0
    mov r0, #0x0
    ble .L_212c
    and ip, r7, #0xff
    and r2, r4, #0xff
    orr r2, ip, r2, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r4, r2, lsr #0x10
.L_210c:
    add r2, r3, r0, lsl #0x1
    ldrh r2, [r2, #0x10]
    cmp r4, r2
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    add r0, r0, #0x1
    cmp r0, r1
    blt .L_210c
.L_212c:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_ov002_022706c8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cd220
