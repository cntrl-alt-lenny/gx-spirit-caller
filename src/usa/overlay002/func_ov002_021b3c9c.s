; func_ov002_021b3c9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0570
        .global func_ov002_021b3c9c
        .arm
func_ov002_021b3c9c:
    stmdb sp!, {r3, r4, r5, lr}
    cmp r0, #0x0
    mov r5, #0x0
    beq .L_168
    ldr lr, _LIT0
.L_134:
    add r4, lr, r0, lsl #0x3
    ldrh r3, [r4, #0x2]
    ldrh r0, [r4, #0x6]
    mov r3, r3, lsl #0x1c
    mov ip, r3, lsr #0x1c
    cmp ip, #0x6
    bcs .L_160
    ldrh r3, [r4]
    cmp r3, r1
    cmpeq ip, r2
    addeq r5, r5, #0x1
.L_160:
    cmp r0, #0x0
    bne .L_134
.L_168:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d0570
