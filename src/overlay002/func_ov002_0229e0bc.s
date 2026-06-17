; func_ov002_0229e0bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0229e0bc
        .arm
func_ov002_0229e0bc:
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldmeqia sp!, {r3, pc}
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov lr, r1, lsl #0x1f
    mov r3, r0
    mov r2, #0x0
    mov r1, #0x8
.L_65c:
    ldr ip, [r0, #0xa4]
    cmp r2, ip
    bge .L_690
    ldrh ip, [r3, #0xa]
    bic ip, ip, #0x4000
    orr ip, ip, lr, lsr #0x11
    strh ip, [sp]
    ldrh ip, [sp]
    bic ip, ip, #0x8000
    strh ip, [sp]
    ldrh ip, [sp]
    strh ip, [r3, #0xa]
    strh r1, [r3, #0x4]
.L_690:
    add r2, r2, #0x1
    cmp r2, #0x8
    add r3, r3, #0x14
    blt .L_65c
    ldmia sp!, {r3, pc}
