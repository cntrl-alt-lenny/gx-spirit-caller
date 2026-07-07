; func_ov002_02239ef0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd340
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021b3538
        .extern func_ov002_021de3c0
        .global func_ov002_02239ef0
        .arm
func_ov002_02239ef0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r0, _LIT0
    ldrh r1, [r7, #0x2]
    ldr r6, [r0, #0xcec]
    ldr r5, _LIT1
    mov r0, r1, lsl #0x1f
    mov r2, #0x38
    mov r1, r1, lsl #0x1a
    rsb r3, r6, #0x1
    mla r4, r6, r2, r5
    mla r5, r3, r2, r5
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b3538
    ldr r1, _LIT2
    mov r6, r0
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldmia r4, {r1, r2}
    and r0, r2, #0xff
    and r3, r1, #0xff
    orr r0, r3, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    cmp r6, r0, lsr #0x10
    beq .L_b8
    ldr ip, _LIT3
    ldr r0, _LIT4
    and r3, r1, #0x1
    mla ip, r3, r0, ip
    mov r0, #0x14
    mul r0, r2, r0
    add r3, ip, #0x30
    ldr r3, [r3, r0]
    ldr r4, [r4, #0xc]
    mov r0, r3, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r3, lsr #0x1f
    cmp r4, r0
    bne .L_b8
    mov r0, r7
    bl func_ov002_021de3c0
.L_b8:
    ldmia r5, {r1, r2}
    and r0, r2, #0xff
    and r3, r1, #0xff
    orr r0, r3, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    cmp r6, r0, lsr #0x10
    beq .L_11c
    ldr r4, _LIT3
    ldr r0, _LIT4
    and r3, r1, #0x1
    mla r4, r3, r0, r4
    mov r0, #0x14
    mul r0, r2, r0
    add r3, r4, #0x30
    ldr r3, [r3, r0]
    ldr r4, [r5, #0xc]
    mov r0, r3, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r3, lsr #0x1f
    cmp r4, r0
    bne .L_11c
    mov r0, r7
    bl func_ov002_021de3c0
.L_11c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cd340
_LIT2: .word data_ov002_022cd314
_LIT3: .word data_ov002_022cf08c
_LIT4: .word 0x00000868
