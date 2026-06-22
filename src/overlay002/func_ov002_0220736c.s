; func_ov002_0220736c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1ac
        .extern func_ov002_021b4054
        .extern func_ov002_021ff320
        .global func_ov002_0220736c
        .arm
func_ov002_0220736c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldrh r6, [r5, #0x2]
    ldr ip, _LIT0
    ldr r2, _LIT1
    mov r0, r6, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r4, r0, #0x1
    mla lr, r4, r2, ip
    ldrh r3, [r5, #0x4]
    mov r2, r6, lsl #0x1a
    mov r4, r1
    mov ip, r3, lsl #0x11
    mov r1, r2, lsr #0x1b
    mov r2, #0x14
    mul r2, r1, r2
    add r3, lr, #0x30
    ldr r3, [r3, r2]
    mov ip, ip, lsr #0x17
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    cmp ip, r2
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r2, _LIT2
    mov r3, #0x2
    bl func_ov002_021b4054
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldrh r1, [r5, #0x2]
    ldr r0, _LIT1
    ldr r3, _LIT3
    mov r2, r1, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and ip, r2, #0x1
    mov r1, r1, lsl #0x1a
    mov r2, r1, lsr #0x1b
    mov r1, #0x14
    mul r1, r2, r1
    mla r0, ip, r0, r3
    ldr r0, [r1, r0]
    mov r0, r0, lsr #0x17
    tst r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ff320
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word 0x000016cb
_LIT3: .word data_ov002_022cf1ac
