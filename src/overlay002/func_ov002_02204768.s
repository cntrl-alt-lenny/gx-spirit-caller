; func_ov002_02204768 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1ac
        .extern func_ov002_021ca2b8
        .extern func_ov002_022536e8
        .global func_ov002_02204768
        .arm
func_ov002_02204768:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r2, [r4, #0x2]
    ldr r1, _LIT0
    ldr ip, _LIT1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, r2, lsl #0x1a
    and lr, r0, #0x1
    mov r3, r2, lsr #0x1b
    mov r2, #0x14
    mul r2, r3, r2
    mla r1, lr, r1, ip
    ldr r1, [r2, r1]
    mov r1, r1, lsr #0x12
    tst r1, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r1, [r4]
    mov r2, #0x0
    bl func_ov002_022536e8
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1ac
