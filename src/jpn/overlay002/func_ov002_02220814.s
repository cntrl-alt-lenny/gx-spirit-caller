; func_ov002_02220814 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202f994
        .global func_ov002_02220814
        .arm
func_ov002_02220814:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldrh r3, [r4, #0x4]
    ldr lr, _LIT0
    mov r2, r0, lsl #0x1f
    mov ip, r2, lsr #0x1f
    mov r2, r0, lsl #0x1a
    ldr r0, _LIT1
    and ip, ip, #0x1
    mla lr, ip, r0, lr
    mov r2, r2, lsr #0x1b
    mov r0, #0x14
    mul r0, r2, r0
    add r2, lr, #0x30
    ldr r2, [r2, r0]
    mov r3, r3, lsl #0x11
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    mov r3, r3, lsr #0x17
    add r0, r0, r2, lsr #0x1f
    cmp r3, r0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    cmp r1, #0x0
    beq .L_3ac
    ldrh r0, [r1]
    bl func_0202f994
    cmp r0, #0x1
    bne .L_3ac
    ldrh r0, [r4, #0x4]
    orr r2, r0, #0x2
    mov r0, r2, lsl #0x1e
    mov r0, r0, lsr #0x1f
    bic r1, r2, #0x4
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1d
    strh r0, [r4, #0x4]
.L_3ac:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
