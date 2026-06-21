; func_ov002_021f9624 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern func_0202b950
        .extern func_0202e234
        .extern func_ov002_02257ab8
        .global func_ov002_021f9624
        .arm
func_ov002_021f9624:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, _LIT0
    mov r4, r0
    ldr r0, [r3, #0x48c]
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r4, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    cmp r1, #0xb
    bne .L_9c
    ldr r0, _LIT1
    ldr r1, _LIT2
    and r3, r4, #0x1
    mla r0, r3, r0, r1
    add r0, r0, r2, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    mov r0, r5
    bl func_0202b950
    ldr r1, _LIT0
    ldr r1, [r1, #0x48c]
    strh r0, [r1, #0xc]
    mov r0, r5
    bl func_0202e234
    cmp r0, #0x0
    beq .L_9c
    ldr r0, _LIT0
    ldr r1, _LIT3
    ldr r0, [r0, #0x48c]
    ldrh r2, [r0, #0xc]
    cmp r2, r1
    beq .L_9c
    rsb r1, r4, #0x1
    bl func_ov002_02257ab8
    cmp r0, #0x0
    movne r0, #0x800
    ldmneia sp!, {r3, r4, r5, pc}
.L_9c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x0000ffff
