; func_ov002_021f9ae0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf098
        .extern func_ov002_021d792c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .global func_ov002_021f9ae0
        .arm
func_ov002_021f9ae0:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r0, [r2, #0x5b4]
    mov r4, r1
    cmp r0, #0x0
    beq .L_280
    cmp r0, #0x1
    beq .L_29c
    b .L_304
.L_280:
    bl func_ov002_021e2a4c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, pc}
.L_29c:
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    beq .L_2d4
    mov r1, #0x0
    bl func_ov002_021d792c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_2d4:
    bl func_ov002_021e2b6c
    ldrh r1, [r4]
    ldr r0, _LIT3
    cmp r1, r0
    ldreqh r0, [r4, #0xc]
    ldr r1, _LIT0
    streqh r0, [r5, #0xc]
    ldr r2, [r1, #0x5b4]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, pc}
.L_304:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
_LIT3: .word 0x000014e0
