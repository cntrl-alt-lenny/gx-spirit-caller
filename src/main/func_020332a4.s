; func_020332a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020945f4
        .global func_020332a4
        .arm
func_020332a4:
    stmdb sp!, {r3, r4, r5, lr}
    add r0, r0, #0x1fc
    add r4, r0, #0xc00
    mov r5, r1
    add r0, r4, #0xc
    mov r1, #0x0
    mov r2, #0x34
    bl func_020945f4
    mov r2, #0x0
.L_24:
    mov r0, r2, lsl #0x1
    ldrh r1, [r5, r0]
    cmp r1, #0x0
    bne .L_44
    add r0, r4, r0
    mov r1, #0x0
    strh r1, [r0, #0xc]
    b .L_58
.L_44:
    add r0, r4, r0
    add r2, r2, #0x1
    strh r1, [r0, #0xc]
    cmp r2, #0x1a
    blt .L_24
.L_58:
    mov r0, #0x0
    strh r0, [r4, #0x3e]
    ldmia sp!, {r3, r4, r5, pc}
