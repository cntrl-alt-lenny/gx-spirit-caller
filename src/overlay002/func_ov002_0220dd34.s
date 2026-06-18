; func_ov002_0220dd34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .global func_ov002_0220dd34
        .arm
func_ov002_0220dd34:
    stmdb sp!, {r3, r4, r5, lr}
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r2, _LIT0
    ldr r0, [r2, #0x484]
    subs r3, r0, #0x1
    bmi .L_6c
    mov r0, #0x18
    mla r4, r3, r0, r2
    mov r1, r0
.L_2c:
    add r0, r4, #0x300
    subs ip, r3, #0x1
    ldrh lr, [r0]
    bmi .L_60
    mla r5, ip, r1, r2
.L_40:
    add r0, r5, #0x300
    ldrh r0, [r0]
    cmp lr, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    sub r5, r5, #0x18
    subs ip, ip, #0x1
    bpl .L_40
.L_60:
    sub r4, r4, #0x18
    subs r3, r3, #0x1
    bpl .L_2c
.L_6c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
