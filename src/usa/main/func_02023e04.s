; func_02023e04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202252c
        .global func_02023e04
        .arm
func_02023e04:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    add r5, r6, #0xa7
    mov r4, #0x0
    mvn r7, #0x0
.L_e4:
    add r0, r6, r4, lsl #0x4
    ldrsh r0, [r0, #0xa4]
    cmp r0, #0x0
    blt .L_10c
    bl func_0202252c
    add r0, r6, r4, lsl #0x4
    strh r7, [r0, #0xa4]
    ldrb r0, [r5]
    bic r0, r0, #0x1
    strb r0, [r5]
.L_10c:
    add r4, r4, #0x1
    cmp r4, #0x3
    add r5, r5, #0x10
    blt .L_e4
    ldrh r1, [r6, #0xce]
    mov r0, #0x1
    bic r1, r1, #0x1
    strh r1, [r6, #0xce]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
