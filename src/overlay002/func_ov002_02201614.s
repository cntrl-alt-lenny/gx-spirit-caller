; func_ov002_02201614 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf288
        .extern data_ov002_022d016c
        .extern func_ov002_021b3ecc
        .extern func_ov002_021ff3bc
        .global func_ov002_02201614
        .arm
func_ov002_02201614:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r3, [r4, #0x2]
    ldr r2, _LIT0
    ldr ip, [r2, #0xcec]
    mov r3, r3, lsl #0x1f
    cmp ip, r3, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r2, [r2, #0xd0]
    tst r2, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    mov r1, r1, lsr #0x19
    tst r1, #0x1
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r2, [r4]
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf288
