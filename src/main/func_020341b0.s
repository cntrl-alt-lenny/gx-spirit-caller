; func_020341b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02032350
        .extern func_0203251c
        .global func_020341b0
        .arm
func_020341b0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r6, r2
    mov r8, r0
    mov r7, r1
    mov r4, #0x0
    cmp r6, #0x8
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r9, _LIT0
.L_20:
    ldrh r0, [r7, r4]
    add r5, r7, r4
    and r0, r0, r9
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_60
    bl func_02032350
    ldrh r3, [r5, #0x4]
    mov r1, r8
    mov r2, r5
    add r3, r3, #0x3
    bic r3, r3, #0x3
    add r3, r3, #0x8
    mov r3, r3, lsl #0x10
    mov r3, r3, lsr #0x10
    bl func_0203251c
.L_60:
    ldrh r0, [r5, #0x4]
    add r0, r0, #0x3
    bic r0, r0, #0x3
    add r0, r0, #0x8
    add r4, r4, r0
    add r0, r4, #0x8
    cmp r0, r6
    bcc .L_20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x000007ff
