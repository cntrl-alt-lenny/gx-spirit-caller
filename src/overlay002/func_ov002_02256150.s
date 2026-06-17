; func_ov002_02256150 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_02256150
        .arm
func_ov002_02256150:
    ldrh r1, [r0, #0x2]
    mov r2, r1, lsl #0x1c
    mov r2, r2, lsr #0x1c
    cmp r2, #0xb
    addls pc, pc, r2, lsl #0x2
    b .L_84
    b .L_84
    b .L_84
    b .L_48
    b .L_84
    b .L_84
    b .L_84
    b .L_68
    b .L_68
    b .L_84
    b .L_84
    b .L_60
    b .L_60
.L_48:
    ldrh r1, [r0]
    ldr r0, _LIT0
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_60:
    mov r0, #0x1
    bx lr
.L_68:
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x1c
    and r0, r0, #0x1
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    bx lr
.L_84:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001598
