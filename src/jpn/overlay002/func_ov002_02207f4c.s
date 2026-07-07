; func_ov002_02207f4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_ov002_02253600
        .global func_ov002_02207f4c
        .arm
func_ov002_02207f4c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    ldrh r0, [r7, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    beq .L_c8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r8, _LIT0
    and r1, r0, #0x1
    mul r2, r1, r8
    ldr r1, _LIT1
    mov r5, #0x0
    ldr r1, [r1, r2]
    cmp r1, #0x0
    bls .L_c0
    ldr r4, _LIT2
    mov r6, r5
.L_4c:
    and r1, r0, #0x1
    mla r2, r1, r8, r4
    add r1, r2, #0x120
    ldr r3, [r1, r6]
    ldrh r1, [r7, #0x4]
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    mov r1, r1, lsl #0x11
    cmp r2, r1, lsr #0x17
    beq .L_98
    ldrh r1, [r7]
    mov r2, r5
    bl func_ov002_02253600
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_98:
    ldrh r0, [r7, #0x2]
    add r5, r5, #0x1
    add r6, r6, #0x4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r8, r4
    ldr r1, [r1, #0xc]
    cmp r5, r1
    bcc .L_4c
.L_c0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_c8:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cf08c
