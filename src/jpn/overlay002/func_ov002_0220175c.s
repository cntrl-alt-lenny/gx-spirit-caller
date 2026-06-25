; func_ov002_0220175c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021baf88
        .extern func_ov002_021ff05c
        .global func_ov002_0220175c
        .arm
func_ov002_0220175c:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r0, _LIT0
    bl func_ov002_021baf88
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x23
    beq .L_70
    mov r3, #0x0
    str r3, [sp]
    ldrh r2, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    mov r1, #0x2
    mov ip, r2, lsl #0x1f
    mov r2, r0, lsl #0x11
    mov r0, ip, lsr #0x1f
    mov r2, r2, lsr #0x17
    bl func_ov002_021ff05c
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, pc}
.L_70:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word 0x0000135d
