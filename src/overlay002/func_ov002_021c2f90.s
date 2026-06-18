; func_ov002_021c2f90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .global func_ov002_021c2f90
        .arm
func_ov002_021c2f90:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    and r0, r0, #0x1
    mul r3, r0, r2
    ldr r2, _LIT1
    mov r0, #0x0
    ldr r2, [r2, r3]
    mov lr, r0
    cmp r2, #0x0
    ldmlsia sp!, {r4, pc}
    ldr r2, _LIT2
    add r3, r2, r3
    add r2, r3, #0x18
    add r4, r2, #0x400
    ldr r2, [r3, #0x14]
.L_3c:
    ldr r3, [r4]
    mov ip, r3, lsl #0x13
    cmp r1, ip, lsr #0x13
    bne .L_58
    mov r3, r3, lsl #0xa
    movs r3, r3, lsr #0x1f
    addeq r0, r0, #0x1
.L_58:
    add lr, lr, #0x1
    cmp lr, r2
    add r4, r4, #0x4
    bcc .L_3c
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf180
_LIT2: .word data_ov002_022cf16c
