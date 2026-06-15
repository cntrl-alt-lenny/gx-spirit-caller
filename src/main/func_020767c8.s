; func_020767c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02077e58
        .extern func_02077ecc
        .extern func_02077f8c
        .extern func_02078498
        .extern func_0207850c
        .extern func_020785cc
        .extern func_020aaddc
        .global func_020767c8
        .arm
func_020767c8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r5, r2
    add r4, r5, #0x348
    mov r7, r0
    mov r6, r1
    mov r0, r4
    bl func_020785cc
    mov r0, r6
    bl func_020aaddc
    mov r2, r0
    mov r1, r6
    mov r0, r4
    bl func_0207850c
    mov r0, r4
    mov r1, r5
    mov r2, #0x30
    bl func_0207850c
    mov r0, r4
    add r1, r5, #0x34
    mov r2, #0x40
    bl func_0207850c
    mov r0, r4
    add r1, sp, #0x0
    bl func_02078498
    add r4, r5, #0x3fc
    mov r0, r4
    bl func_02077f8c
    mov r1, r5
    mov r0, r4
    mov r2, #0x30
    bl func_02077ecc
    mov r0, r4
    add r1, sp, #0x0
    mov r2, #0x14
    bl func_02077ecc
    mov r0, r4
    mov r1, r7
    bl func_02077e58
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
