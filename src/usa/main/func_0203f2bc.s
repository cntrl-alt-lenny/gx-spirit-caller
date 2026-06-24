; func_0203f2bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0203f2bc
        .arm
func_0203f2bc:
    cmp r0, #0x41
    bcc .L_28c
    cmp r0, #0x5a
    subls r0, r0, #0x41
    bxls lr
.L_28c:
    cmp r0, #0x61
    bcc .L_2a4
    cmp r0, #0x7a
    subls r0, r0, #0x61
    addls r0, r0, #0x1a
    bxls lr
.L_2a4:
    cmp r0, #0x30
    bcc .L_2bc
    cmp r0, #0x39
    subls r0, r0, #0x30
    addls r0, r0, #0x34
    bxls lr
.L_2bc:
    cmp r0, #0x2b
    moveq r0, #0x3e
    bxeq lr
    cmp r0, #0x2f
    moveq r0, #0x3f
    bxeq lr
    cmp r0, #0x3d
    movne r0, #0x1
    moveq r0, #0x0
    rsb r0, r0, #0x0
    bx lr
