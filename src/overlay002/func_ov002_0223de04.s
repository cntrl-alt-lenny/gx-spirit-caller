; func_ov002_0223de04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021d86fc
        .extern func_ov002_0223dc14
        .global func_ov002_0223de04
        .arm
func_ov002_0223de04:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldrh r4, [r7, #0x6]
    mov r6, r1
    mov r5, r2
    mov r4, r4, lsl #0x18
    mov ip, r4, lsr #0x18
    mov r4, r3
    cmp ip, #0x5
    bcs .L_174
    bl func_ov002_0223dc14
    b .L_188
.L_174:
    bne .L_188
    ldr r0, _LIT0
    add r1, r7, ip, lsl #0x1
    ldr r0, [r0, #0x494]
    strh r0, [r1, #0x8]
.L_188:
    ldrh r2, [r7, #0x6]
    mov r0, r6
    mov r1, r5
    mov r3, r2, lsl #0x18
    mov r2, r4
    mov r3, r3, lsr #0x18
    bl func_ov002_021d86fc
    ldrh r1, [r7, #0x6]
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0
    strh r0, [r7, #0x6]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce288
