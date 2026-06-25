; func_ov002_022ae8f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0e4c
        .extern func_020371b8
        .extern func_ov002_022ae2d8
        .global func_ov002_022ae8f4
        .arm
func_ov002_022ae8f4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r0, [r4, #0x3c]
    mov r6, r1
    cmp r0, #0x0
    ldmleia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0xd0]
    ldr r5, [r0, #0xd4]
    mov r0, #0x3a
    cmp r5, #0x6
    ldr ip, _LIT0
    movlt r5, #0x6
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    str r5, [ip, #0xd4]
    bl func_020371b8
    sub r0, r6, #0x1
    str r0, [r4, #0x2c]
    mov r0, #0x4
    str r0, [r4, #0x28]
    mov r0, #0x2
    str r0, [r4, #0x30]
    ldr r0, [r4, #0x3c]
    mov r5, #0x0
    cmp r0, #0x0
    ldmleia sp!, {r4, r5, r6, pc}
.L_74:
    add r0, r4, r5, lsl #0x2
    ldr r2, [r0, #0x1c]
    mov r0, r4
    mov r1, r5
    bl func_ov002_022ae2d8
    ldr r0, [r4, #0x3c]
    add r5, r5, #0x1
    cmp r5, r0
    blt .L_74
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022d0e4c
