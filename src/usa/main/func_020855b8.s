; func_020855b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02084d24
        .global func_020855b8
        .arm
func_020855b8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4]
    ands r0, r1, #0x4
    bne .L_44
    ands r0, r1, #0x2
    bne .L_30
    add r1, r4, #0x28
    mov r0, #0x19
    mov r2, #0xc
    bl func_02084d24
    b .L_5c
.L_30:
    add r1, r4, #0x4c
    mov r0, #0x1c
    mov r2, #0x3
    bl func_02084d24
    b .L_5c
.L_44:
    ands r0, r1, #0x2
    bne .L_5c
    add r1, r4, #0x28
    mov r0, #0x1a
    mov r2, #0x9
    bl func_02084d24
.L_5c:
    ldr r0, [r4]
    ands r0, r0, #0x1
    ldmneia sp!, {r4, pc}
    add r1, r4, #0x4
    mov r0, #0x1b
    mov r2, #0x3
    bl func_02084d24
    ldmia sp!, {r4, pc}
