; func_ov020_021aae64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208e200
        .global func_ov020_021aae64
        .arm
func_ov020_021aae64:
    stmdb sp!, {r3, lr}
    bl func_0208e200
    mov lr, #0x0
    add r2, r0, #0x44
    mov r3, #0x1
    mov r1, lr
.L_18:
    mov ip, r1
.L_1c:
    orr r0, r3, #0xf000
    add ip, ip, #0x1
    cmp ip, #0x1c
    strh r0, [r2], #0x2
    add r3, r3, #0x1
    blt .L_1c
    add lr, lr, #0x1
    cmp lr, #0x3
    add r2, r2, #0x8
    blt .L_18
    ldmia sp!, {r3, pc}
