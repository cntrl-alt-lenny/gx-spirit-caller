; func_ov002_021b3cf0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0570
        .global func_ov002_021b3cf0
        .arm
func_ov002_021b3cf0:
    stmdb sp!, {r4, lr}
    cmp r0, #0x0
    mov r4, #0x0
    beq .L_4c
    ldr ip, _LIT0
.L_14:
    add lr, ip, r0, lsl #0x3
    ldrh r3, [lr, #0x2]
    ldrh r0, [lr, #0x6]
    mov r3, r3, lsl #0x1c
    mov r3, r3, lsr #0x1c
    cmp r3, #0x6
    bcs .L_44
    ldrh r3, [lr]
    cmp r3, r1
    ldreqh r3, [lr, #0x4]
    cmpeq r3, r2
    addeq r4, r4, #0x1
.L_44:
    cmp r0, #0x0
    bne .L_14
.L_4c:
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d0570
