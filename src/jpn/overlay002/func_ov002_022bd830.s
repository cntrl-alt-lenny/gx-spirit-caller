; func_ov002_022bd830 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_022bd830
        .arm
func_ov002_022bd830:
    ldr r1, [r0, #0xc60]
    cmp r1, #0x0
    beq .L_45d8
    cmp r1, #0x1
    beq .L_45ec
    cmp r1, #0x2
    beq .L_460c
    b .L_4624
.L_45d8:
    mov r1, #0x1
    str r1, [r0, #0xc60]
    mov r1, #0x0
    str r1, [r0, #0xc64]
    b .L_4624
.L_45ec:
    ldr r1, [r0, #0xc64]
    cmp r1, #0x96
    blt .L_4624
    mov r1, #0x2
    str r1, [r0, #0xc60]
    mov r1, #0x0
    str r1, [r0, #0xc64]
    b .L_4624
.L_460c:
    mov r1, #0xc
    str r1, [r0, #0xcc8]
    mov r1, #0x0
    str r1, [r0, #0xc54]
    mov r0, r1
    bx lr
.L_4624:
    ldr r1, [r0, #0xc64]
    add r1, r1, #0x1
    str r1, [r0, #0xc64]
    mov r0, #0x1
    bx lr
