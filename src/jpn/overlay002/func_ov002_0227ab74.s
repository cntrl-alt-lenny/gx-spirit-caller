; func_ov002_0227ab74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern func_ov002_021b939c
        .extern func_ov002_021b99c8
        .extern func_ov002_021baf88
        .extern func_ov002_021bc608
        .extern func_ov002_02254944
        .extern func_ov002_0227a80c
        .global func_ov002_0227ab74
        .arm
func_ov002_0227ab74:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl func_ov002_021bc608
    movs r4, r0
    ldmmiia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT0
    bl func_ov002_021baf88
    ldr r3, _LIT1
    cmp r0, #0x0
    ldr r1, [r3]
    movne r6, #0x1
    bic r2, r1, #0x1
    and r1, r8, #0x1
    orr r1, r2, r1
    bic r2, r1, #0x1e
    mov r1, r4, lsl #0x1c
    orr r1, r2, r1, lsr #0x1b
    bic r2, r1, #0x20
    mov r1, r6, lsl #0x1f
    orr r1, r2, r1, lsr #0x1a
    bic r2, r1, #0xc0
    mov r1, r5, lsl #0x1e
    orr r2, r2, r1, lsr #0x18
    mov r0, #0x0
    str r2, [r3]
    strb r0, [r3, #0x9]
    strb r0, [r3, #0x8]
    ldr r0, [r7]
    ldr r1, _LIT2
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    and r2, r2, r1
    mov r0, r0, lsl #0x11
    orr r0, r2, r0, lsr #0x9
    str r0, [r3]
    ldr r4, [r7]
    rsb r1, r1, #0xfe
    mov r2, r4, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r5, r4, lsl #0x12
    mov r4, r2, lsl #0x1
    and r1, r0, r1
    add r0, r4, r5, lsr #0x1f
    orr r5, r1, r0, lsl #0x17
    ldr ip, [sp, #0x18]
    str r5, [r3]
    mov r2, ip, lsl #0x10
    mov r2, r2, lsr #0x10
    ldrh r4, [r3, #0x16]
    orr r0, r2, #0x4
    mov r1, ip, lsr #0x10
    bic r2, r4, #0x700
    orr r2, r2, #0x300
    strh r2, [r3, #0x16]
    strh r0, [r3, #0x4]
    mov r0, r5, lsr #0x17
    strh r1, [r3, #0x6]
    bl func_ov002_021b939c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xe
    bne .L_11c
    ldr r0, _LIT1
    ldrh r1, [r0, #0x4]
    orr r1, r1, #0x20
    strh r1, [r0, #0x4]
.L_11c:
    ldr r1, _LIT1
    mov r0, r8
    ldr r1, [r1]
    mov r1, r1, lsr #0x17
    bl func_ov002_021b99c8
    cmp r0, #0x0
    blt .L_140
    mov r0, r8
    bl func_ov002_02254944
.L_140:
    bl func_ov002_0227a80c
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x0000135d
_LIT1: .word data_ov002_022cd220
_LIT2: .word 0xff8000ff
