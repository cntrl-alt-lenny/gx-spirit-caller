; func_ov002_02288838 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021c1d64
        .extern func_ov002_02215f14
        .global func_ov002_02288838
        .arm
func_ov002_02288838:
    stmdb sp!, {r3, r4, r5, lr}
    add r1, sp, #0x0
    mov r5, r0
    bl func_ov002_02215f14
    ldrh r1, [sp]
    mov r4, r0
    mov r0, r5
    mov r2, r1, asr #0x8
    and r1, r1, #0xff
    and r2, r2, #0xff
    bl func_ov002_021c1d64
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT0
    ldr ip, _LIT1
    mov r0, r0, lsl #0x1f
    mov r3, r0, lsr #0x1f
    and r0, r3, #0x1
    mul r2, r0, r1
    ldr r2, [ip, r2]
    add r0, r4, r4, lsr #0x1f
    cmp r2, r0, asr #0x1
    movle r0, #0x0
    ldmleia sp!, {r3, r4, r5, pc}
    rsb r3, r3, #0x1
    and r2, r3, #0x1
    mul r1, r2, r1
    ldr r1, [ip, r1]
    cmp r1, r0, asr #0x1
    movle r0, #0x1
    ldmleia sp!, {r3, r4, r5, pc}
    ldrh r0, [sp]
    and r0, r0, #0xff
    cmp r0, r3
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
