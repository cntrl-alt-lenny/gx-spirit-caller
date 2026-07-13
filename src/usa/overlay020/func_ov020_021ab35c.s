; func_ov020_021ab35c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208e0e4
        .global func_ov020_021ab35c
        .arm
func_ov020_021ab35c:
    stmdb sp!, {r4, lr}
    mov r4, r1
    bl func_0208e0e4
    add r1, r4, r4, lsl #0x2
    add r1, r1, #0x4
    mov r1, r1, lsl #0x5
    add r2, r1, #0x5
    mov r3, #0x1
    mov r1, #0x64
    mla r3, r4, r1, r3
    mov ip, #0x0
    add r2, r0, r2, lsl #0x1
    mov r1, ip
.L_34:
    mov r4, r1
.L_38:
    orr r0, r3, #0xe000
    add r4, r4, #0x1
    cmp r4, #0x19
    strh r0, [r2], #0x2
    add r3, r3, #0x1
    blt .L_38
    add ip, ip, #0x1
    cmp ip, #0x4
    add r2, r2, #0xe
    blt .L_34
    ldmia sp!, {r4, pc}
