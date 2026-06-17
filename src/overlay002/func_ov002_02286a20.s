; func_ov002_02286a20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cf1a2
        .global func_ov002_02286a20
        .arm
func_ov002_02286a20:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    ldmia r2, {r4, r5}
    cmp r4, r5
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r3, [r2, #0x1c]
    mov r1, #0x14
    ldr r0, _LIT1
    ldr lr, _LIT2
    and r4, r4, #0x1
    mul ip, r3, r1
    mla r3, r4, r0, lr
    ldrh r3, [ip, r3]
    cmp r3, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r2, [r2, #0x20]
    and r3, r5, #0x1
    mul r1, r2, r1
    mla r0, r3, r0, lr
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a2
