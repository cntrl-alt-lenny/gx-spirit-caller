; func_020259bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202252c
        .global func_020259bc
        .arm
func_020259bc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    add r0, r7, #0x3
    add r6, r0, #0x100
    mov r5, #0x0
    mvn r4, #0x0
.L_164:
    add r0, r7, r5, lsl #0x4
    add r0, r0, #0x100
    ldrsh r0, [r0]
    cmp r0, #0x0
    blt .L_194
    bl func_0202252c
    add r0, r7, r5, lsl #0x4
    add r0, r0, #0x100
    strh r4, [r0]
    ldrb r0, [r6]
    bic r0, r0, #0x1
    strb r0, [r6]
.L_194:
    add r5, r5, #0x1
    cmp r5, #0x6
    add r6, r6, #0x10
    blt .L_164
    add r1, r7, #0x100
    ldrh r2, [r1, #0x6a]
    mov r0, #0x1
    bic r2, r2, #0x1
    strh r2, [r1, #0x6a]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
