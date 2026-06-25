; func_0208a968 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209445c
        .global func_0208a968
        .arm
func_0208a968:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    movs r5, r2, lsr #0x1
    mov r4, #0x0
    beq .L_3c
.L_14:
    mov lr, r4, lsl #0x1
    ldrsh ip, [r0, lr]
    ldrsh r3, [r1, lr]
    add r4, r4, #0x1
    cmp r4, r5
    add r3, ip, r3
    add r3, r3, #0x1
    mov r3, r3, asr #0x1
    strh r3, [r0, lr]
    bcc .L_14
.L_3c:
    bl func_0209445c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
