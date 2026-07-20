; Ov013_SlotToCell — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global Ov013_SlotToCell
        .arm
Ov013_SlotToCell:
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_6c
    b .L_2c
    b .L_34
    b .L_3c
    b .L_44
    b .L_4c
    b .L_54
    b .L_5c
    b .L_64
.L_2c:
    mov r0, #0x8
    bx lr
.L_34:
    mov r0, #0x4
    bx lr
.L_3c:
    mov r0, #0x3
    bx lr
.L_44:
    mov r0, #0x5
    bx lr
.L_4c:
    mov r0, #0x6
    bx lr
.L_54:
    mov r0, #0x46
    bx lr
.L_5c:
    mov r0, #0x9
    bx lr
.L_64:
    mov r0, #0xa
    bx lr
.L_6c:
    mov r0, #0x0
    bx lr
