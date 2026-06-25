; func_ov002_021e898c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern func_ov002_021c1d64
        .extern func_ov002_021c1e10
        .global func_ov002_021e898c
        .arm
func_ov002_021e898c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r2
    mov r8, r0
    cmp r6, #0x5
    mov r7, r1
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r3, [r8, #0x2]
    mov r3, r3, lsl #0x1f
    cmp r7, r3, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r4, _LIT0
    and ip, r7, #0x1
    mul r5, ip, r4
    mov r3, #0x14
    mul r4, r6, r3
    ldr ip, _LIT1
    add r3, ip, r5
    add r3, r3, r4
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_ov002_021c1e10
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl func_ov002_021c1d64
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT2
    add r0, r0, r5
    ldrh r0, [r4, r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c2
