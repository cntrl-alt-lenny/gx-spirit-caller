; func_ov002_021e2d94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1ac
        .extern func_ov002_021c9b80
        .extern func_ov002_021d479c
        .global func_ov002_021e2d94
        .arm
func_ov002_021e2d94:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r4, _LIT0
    ldr ip, _LIT1
    and lr, r7, #0x1
    mov r6, r1
    mov r5, #0x14
    mul r5, r6, r5
    mla r4, lr, r4, ip
    ldr r4, [r5, r4]
    mov r5, r2
    mov ip, r4, lsr r5
    mov r4, r3
    and ip, ip, #0x1
    cmp r4, ip
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    bl func_ov002_021c9b80
    cmp r7, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x2a
    mov r0, r0, lsl #0x10
    mov r1, r6, lsl #0x10
    mov r2, r5, lsl #0x10
    mov r3, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d479c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1ac
