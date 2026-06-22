; func_ov002_021f8a14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern func_0202b878
        .extern func_ov002_021c23ac
        .extern func_ov002_021c8940
        .extern func_ov002_021ca5bc
        .global func_ov002_021f8a14
        .arm
func_ov002_021f8a14:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, _LIT0
    mov r6, r1
    ldr r3, [r3, #0x48c]
    mov r5, r0
    ldrh r1, [r3, #0x2]
    mov r4, r2
    mov r1, r1, lsl #0x1f
    cmp r5, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    cmp r6, #0x4
    bgt .L_6c
    add r1, r6, r4
    bl func_ov002_021c23ac
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r5
    add r1, r6, r4
    bl func_ov002_021c8940
    cmp r0, #0xb
    cmpne r0, #0xc
    cmpne r0, #0x10
    bne .L_d8
    mov r0, #0x800
    ldmia sp!, {r4, r5, r6, pc}
.L_6c:
    cmp r6, #0xb
    bne .L_d8
    ldr r2, _LIT1
    ldr r0, _LIT2
    and r1, r5, #0x1
    mla r0, r1, r0, r2
    add r5, r0, #0x120
    ldr r1, [r5, r4, lsl #0x2]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bl func_ov002_021ca5bc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r5, r4, lsl #0x2]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b878
    cmp r0, #0xb
    cmpne r0, #0xc
    cmpne r0, #0x10
    bne .L_d8
    mov r0, #0x800
    ldmia sp!, {r4, r5, r6, pc}
.L_d8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
