; func_ov002_021d8904 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021d479c
        .extern func_ov002_021d899c
        .global func_ov002_021d8904
        .arm
func_ov002_021d8904:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r6, r0
    mov r4, r2
    cmp r5, #0xa
    bgt .L_120
    ldr ip, _LIT0
    ldr r2, _LIT1
    and r3, r6, #0x1
    mla ip, r3, r2, ip
    mov r2, #0x14
    mul r2, r5, r2
    add r3, ip, #0x30
    ldr r3, [r3, r2]
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    cmp r4, r2
    bne .L_120
    mov r2, #0x1
    bl func_ov002_021d899c
.L_120:
    cmp r6, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x43
    mov r0, r0, lsl #0x10
    mov r1, r5, lsl #0x10
    mov r2, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021d479c
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
